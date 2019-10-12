<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/trial.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>    
<body>

<h2>Welcome to Assset Management System </h2>

<div class="container">
    <div class="row">
     
  

      <div class="col">
      
		 <form action="login" method="post">
        <input type="text" name="username" placeholder="Enter Username" required>
        <input type="password" name="password" placeholder="Enter Password" required>
        <input type="submit" value="Login">
          </form>
        <%
		if(request.getParameter("error")!=null){
			%>
			<font color="red"><%= request.getParameter("error") %></font><br><br>
			<%
		}
	 %>
        

      
     
        
        
    
    </div>
        
      </div>
      
    </div>

</body>
</html>

