<!DOCTYPE html>
<html>

<head>
 <title>Login</title>
</head>

<body>
 
  <% if(request.getAttribute("error") != null){ %>
     <h2 style="color:black"><%= request.getAttribute("error") %></h2>
  <% } %>
  
  <form class="main-form" action="/login" method="POST">
    <input type="text" name="username" id="username" placeholder="Username">
    <input type="password" name="password" id="password" placeholder="Password">
    <button type="submit">Login</button>
  </form>
  
</body>
</html>