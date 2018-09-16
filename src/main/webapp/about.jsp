<!doctype html>
<html lang=en>
  <head>
    <title>About</title>
    <link rel="stylesheet" href="main.css">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="bootstrap.min.css"/>
    <style>
    #textBox {
        margin: auto;
        margin-top: 10%;
        height: 50%;
        width: 50%;
        text-align: center;
        color: white;
      }
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
          <a class="nav-link" href="/about">About</a>
        </li>
        <% if(request.getSession().getAttribute("user") == null){ %>
        <li class="nav-about">
          <a class="nav-link" href="/register">Register</a>
        </li>
        <% } %>
      </ul>
    </div>
  </nav>
  
  <div id="textBox">
    About The Project <br />

    The purpose of Traffic Flag is to improve efficiency of police presence in Baltimore. Through clean and organized view of previous citation data, officers can have a good understanding of hot spots around the city and focus on such areas with future patrols. With data presented in a visually easing manner, it enables a much easier experience for officials to analyze and conclude patrol routes and prevention plans.<br />
    <br />
    About Us <br />

	A team comprised of juniors studying at Lehigh University. We hail from all different fields of study. From all sorts of computer science and engineering, to industrial systems and even business. Our diverse expertise allow us to be flexible and approach situations from a variety of angles. We believe our solutions are thorough and practical, containing value past just a technological application. <br />
  </div>

    
  </body>
</html>
