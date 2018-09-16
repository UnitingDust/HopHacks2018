<% String hotspots = (String) request.getAttribute("hotspots"); %>

<!doctype html>
<html lang=en>
  <head>
    <title>Traffic Flag</title>
    <link rel="stylesheet" href="main.css">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    
    <% if(request.getSession().getAttribute("user") != null){ %>
    	<jsp:include page="trafficMap.jsp"/>
    <% } %>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="bootstrap.min.css"/>
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 85%;
        width: 94%;
        margin: 20px;
        border-style: solid;
        border-color: white;
        float: left;
        box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
      }

      .bottom-section {
        display: flex;
        margin-top: 60px;
        height: 100%;
      }

      .right-column {
        width: 40%;
        max-width: 500px;
        min-width: 350px;
        padding-right: 20px;
      }

      #sidebar {
        width: 100%;
        height: 91%;
        box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
        background-color: lightgray;
        padding-top: 20px;
        overflow: scroll;

      }
      #points {
        font-family: "Trebuchet MS", Helvetica, sans-serif;
        overflow-y:scroll;
        box-sizing: border-box;
      }

      .left-column {
        flex-grow: 1;
      }

      #filters {
        font-family: "Trebuchet MS", Helvetica, sans-serif;
        margin-left: 20px;
        display: flex;
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
        overflow: hidden;
      }
    </style>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="bootstrap.min.js"></script>
  </head>



  <body>

  
  <% if(request.getSession().getAttribute("user") != null){ %>
  <nav class="navbar navbar-expand-sm navbar-light fixed-top shadow-sm" style="background-color: #E05B22;">TF
    <%-- <a class="navbar-brand" href="#">TrafficFlag</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button> --%>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item active">
          <a class="nav-link" href="/main">TrafficFlag <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-about">
          <a class="nav-link" href="/about">About Us</a>
        </li>
      </ul>

    </div>
  </nav>
    <div class="bottom-section">
      <div class="left-column">
        <div id="filters">
          <div id="notes_filter">
            <select id="notes_select" onchange="filterPointsByNotes()">
            </select>
          </div>
          <div id="date_filter">
            <select id="date_select" onchange="filterPointsByDate()">
              <option value="all">All Data</option>
              <option value="oneweek">Past Week</option>
              <option value="twoweeks">Past 2 Weeks</option>
              <option value="onemonth">Past Month</option>
              <option value="threemonths">Past 3 Months</option>
              <option value="sixmonths">Past 6 Months</option>
            </select>
          </div>
          <div id="visibility_filter">
            <select id="visibility_select" onchange="filterPointsByVisibility()">
              <option value="both">Both Points and Areas</option>
              <option value="points">Points only</option>
              <option value="areas">Areas only</option>
            </select>
          </div>
        </div>
        <div id="map"></div>
      </div>
      <div class="right-column">
        <div id="sidebar">
          <div id="header">
            <h2>Incidents</h2>
          </div>
          <div id="points">
          </div>
        </div>
      </div>
    </div>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA6FmCtk90VMm4FhOXopMObmK9ZeTSfzHI&callback=initMap">
    </script>
    
	<% } else { %>
	  <h2 style="color:red">You are not logged in</h2>
	<% } %>
	
  </body>
</html>
