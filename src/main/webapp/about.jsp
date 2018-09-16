<!doctype html>
<html lang=en>
  <head>
    <title>About</title>
    <link rel="stylesheet" href="main.css">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

    <jsp:include page="trafficMap.jsp"/>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="bootstrap.min.css"/>
    <style>
      /* Optional: Makes the sample page fill the window. */
      html, body {
        /*background-color: #656363;*/
        height: 100%;
        overflow: hidden;
      }
    </style>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="bootstrap.min.js"></script>
  </head>



  <body>
  <nav class="navbar navbar-expand-sm navbar-light fixed-top shadow-sm" style="background-color: #E05B22;">TF
    <%-- <a class="navbar-brand" href="#">TrafficFlag</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button> --%>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item active">
          <a class="nav-link" href="#">TrafficFlag <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-about">
          <a class="nav-link" href="#">About Us</a>
        </li>
      </ul>
    </div>
  </nav>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA6FmCtk90VMm4FhOXopMObmK9ZeTSfzHI&callback=initMap">
    </script>
  </body>
</html>
