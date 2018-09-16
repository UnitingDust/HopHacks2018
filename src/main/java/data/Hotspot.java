package data;

import java.util.ArrayList;

public class Hotspot {
	private int numofIncidents;
	private ArrayList<Incident> incidents;
	private Point location;
	
	public Hotspot(ArrayList<Incident> incidents, Point location) {
		this.numofIncidents = 0;
		this.incidents = incidents;
		this.location = location;
	}
	
	public void addIncident(Incident incident) {
		this.incidents.add(incident);
	}
	
	public Point getLocation() {
		return this.location;
	}
	
	public void setNumOfIncidents() {
		this.numofIncidents = this.incidents.size();
	}
	
	public ArrayList<Incident> getIncidents() {
		return this.incidents;
	}
	
	public void setIncidents(ArrayList<Incident> incidents) {
		this.incidents = incidents;
	}
	
	public void setLocation(Point location) {
		this.location = location;
	}
}
