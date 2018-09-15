/*
 * Copyright 2016 Google Inc. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package myapp;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import java.util.*;
import data.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;


public class MainServlet extends HttpServlet {
	
	private static ArrayList<Incident> incidents;
	private static ArrayList<Hotspot> hotspots;
	
	private static double radiusThreshold = 0.0144;
	
  @Override
  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {
	  
	  Gson gson = new Gson();
	  incidents = new ArrayList<Incident>();
	  hotspots = new ArrayList<Hotspot>();
	  
	  	try {
			parseJSONFile();
		} catch (ParseException e) {
			e.printStackTrace();
		}
	  	
	  	findHotspots();
	  	String json = gson.toJson(hotspots);
	  	
	  	
	  	request.setAttribute("hotspots", json);
	    request.getRequestDispatcher("/main.jsp").forward(request, response);
	    
	    
  }
  
  @Override
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	  
	  System.out.println(request.getParameter("value"));
	  
	  response.sendRedirect("/main");
	  
	  
  }
  
  public static void parseJSONFile() throws FileNotFoundException, IOException, ParseException {
	  JSONParser parser = new JSONParser(); 
	  Object json = parser.parse(new FileReader("parking-citation.json"));
	  
	  JSONObject result = (JSONObject)json;
	  JSONArray array = (JSONArray) result.get("results");
	  
	for (Object entry : array) {

		JSONObject incident = (JSONObject)entry;
		JSONObject data = (JSONObject)incident.get("data");
		
		String ID = (String)data.get("id");		
		String notes = (String)data.get("notes");
		String address = (String)data.get("address");
		String date = (String)data.get("issuedAt");
		
		JSONObject location = (JSONObject)data.get("location");
		JSONArray coordinates = (JSONArray)location.get("coordinates");
		double x = (double)coordinates.get(0);
		double y = (double)coordinates.get(1);
		
		Incident report = new Incident(ID, address, date, notes, new Point(x, y));
		incidents.add(report);
	}
  }
  
  public static void findHotspots() {
	  	  
	  // Group up the reports that are close to each other
	  for (Incident incident : incidents) {
		  Point coordinate = incident.getCoordinate();
		  boolean found = false;
		  
		  for (Hotspot hotspot : hotspots) {
			  Point radiusPoint = hotspot.getLocation();
			  
			  if (isPointWithinRadius(radiusPoint, coordinate)) {
				  found = true;
				  hotspot.addIncident(incident);
			  }
		  }
		  
		  if (!found) {
			  ArrayList<Incident> newIncidentList = new ArrayList<Incident>();
			  newIncidentList.add(incident);
			  
			  hotspots.add(new Hotspot(newIncidentList, coordinate));
		  }
	  }
	  

	  ArrayList<Hotspot> validHotspots = new ArrayList<Hotspot>();
	  
	  for (Hotspot hotspot : hotspots) {
		  if (hotspot.getIncidents().size() >= 2) {
			  hotspot.setNumOfIncidents();
			  validHotspots.add(hotspot);
			  //System.out.println("Hotspot had " + hotspot.getIncidents().size());
		  }
	  }
	  
	  hotspots = validHotspots;
  }
  
  public static boolean isPointWithinRadius(Point radiusPoint, Point toCheck) {
	  double diff = Math.hypot(radiusPoint.getX() - toCheck.getX(), radiusPoint.getY() - toCheck.getY());
	  
	  if (diff > radiusThreshold)
		  return false;
	  
	  else
		  return true;
  }

}
