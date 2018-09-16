<% String hotspots = (String) request.getAttribute("hotspots"); %>

<!doctype html>
<html lang=en>
  <head>
    <title>Traffic Flagger</title>
    <link rel="stylesheet" href="main.css">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    
    <jsp:include page="trafficMap.jsp"/>
    
    

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="bootstrap.min.css"/>
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 80%;
        width: 70%;
        margin-top: 20px;
        margin-left: 20px;
        margin-right: 20px;
        margin-bottom: 20px;
        border-style: solid;
        border-color: white;
        float: left;
        box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
      }

      #sidebar {
        float: right;
        margin-right: 30px;
      }
      #points {
        font-family: "Trebuchet MS", Helvetica, sans-serif;
        margin-top: -20px;
        height: 640px;
        width: 350px;
        float: right;
        box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
        overflow-y:hidden;
        background-color: lightgray;
        box-sizing: border-box;
      }

      #filters {
        font-family: "Trebuchet MS", Helvetica, sans-serif;
        margin-left: 20px;
        margin-top: 60px;
      }

      #notes_filter {
        float: left;
      }

      #date_filter {
        display: flex;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        background-color: #656363;
        height: 100%;
        overflow-y:hidden;
        /* overflow: hidden; */
      }
    </style>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="bootstrap.min.js"></script>
  </head>



  <body>
    <nav class="navbar navbar-expand-md navbar-light fixed-top shadow-sm rounded" style="background-color: #E05B22;">TrafficFlag</nav>
    <div id="filters">
      <div id="notes_filter">
        <select id="notes_select" onchange="filterPointsByNotes(event)">
        </select>
      </div>
      <div id="date_filter">
        <select id="date_select" onchange="filterPointsByDate(event)">
          <option value="all">All Data</option>
          <option value="oneweek">Past Week</option>
          <option value="twoweeks">Past 2 Weeks</option>
          <option value="onemonth">Past Month</option>
          <option value="threemonths">Past 3 Months</option>
          <option value="sixmonths">Past 6 Months</option>
        </select>
      </div>
    </div>
    <div id="map"></div>
    <div id="sidebar">
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
