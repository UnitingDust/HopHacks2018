<% String hotspots = (String) request.getAttribute("hotspots"); %>

<!doctype html>
<html>
  <head>
    <title>Traffic Flagger</title>
    <link rel="stylesheet" href="main.css">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    
   <jsp:include page="trafficMap.jsp"/>
    
  </head>
  
  <body>
    <div id="map"></div>
    <div id="sidebar">
      <div id="filters">
        <div id="notes_filter">
        	<select id="notes_select" onchange="filterPointsByNotes(event)">
        	</select>
        </div>
        <div id="date_filter">
          <select onchange="filterPointsByDate(event)">
            <option value="all">All Data</option>
            <option value="oneweek">Past Week</option>
            <option value="twoweeks">Past 2 Weeks</option>
            <option value="onemonth">Past Month</option>
            <option value="threemonths">Past 3 Months</option>
            <option value="sixmonths">Past 6 Months</option>
          </select>
        </div>
      </div>
      <div id="header">
      </div>
      <div id="points">
      </div>
    </div>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA6FmCtk90VMm4FhOXopMObmK9ZeTSfzHI&callback=initMap">
    </script>
    
	
	
  </body>
</html>
