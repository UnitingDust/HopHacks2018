<!DOCTYPE html>


<html>
  <head>
    <title>Login</title>
    
    <link rel="stylesheet" href="main.css">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="bootstrap.min.css"/>
    <style>
      html, body {
        background-color: #656363; 
        height: 100%;
        overflow: hidden;
      }
      
      #form_container { 
		margin-top: 350px;
    	margin-left: 500px;
    	padding: 10px;
	}
    </style>
    <script src="bootstrap.min.js"></script>
  </head>
  
  <body>
  
  <nav class="navbar navbar-expand-sm navbar-light fixed-top shadow-sm" style="background-color: #E05B22;">TF
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item active">
          <a class="nav-link" href="/main">TrafficFlag <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-about">
          <a class="nav-link" href="/about">About Us</a>
        </li>
        <% if(request.getSession().getAttribute("user") == null){ %>
        <li class="nav-about">
          <a class="nav-link" href="/register">Register</a>
        </li>
        <% } %>
      </ul>
    </div>
  </nav>
  
  <div id="form_container">  
  
   	<% if(request.getAttribute("error") != null){ %>
   		<h2 style="color:red"><%= request.getAttribute("error") %></h2>
  	<% } %>
  
  <form class="main-form" action="/login" method="POST">
    <input type="text" name="username" id="username" placeholder="Username">
    <input type="password" name="password" id="password" placeholder="Password">
    <button type="submit">Login</button>
  </form>
  
  </div>
  
  </body>

</html>