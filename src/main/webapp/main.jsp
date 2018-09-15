<% String test = "Testing the JS!!!"; %>

<!doctype html>
<html>
  <head>
    <title>Traffic Flagger</title>
    
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 50%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
    
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    
    <script>console.log('<%=test%>')</script>
    <script src="trafficMap.js"></script> 
  </head>
  
  <body>
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
