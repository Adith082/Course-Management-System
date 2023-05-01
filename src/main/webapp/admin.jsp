<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
  
     
      <%
     response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");  //http1.1
     response.setHeader("Pragma","no-cache"); //http1.0
     response.setHeader("Expires","0"); //proxies 
     if(session.getAttribute("username") == null){
        	response.sendRedirect("login.jsp");
        }
     
     %>
       <h1> This is admin page</h1>
       
       <h1> Add Course Form</h1>
	<form action="Admin" method="post">
		<label for="fullname">Teacher's Name:</label>
		<input type="text" id="fullname" name="fullname"><br><br>
		
		<label for="email">Email:</label>
		<input type="email" id="email" name="email"><br><br>
		
		<label for="coursecode">Course Code:</label>
		<input type="text" id="coursecode" name="coursecode"><br><br>
		
		<input type="submit" value="Submit">
	</form> 
       
        
        
        
          <form action="Logout" >
  <input type="submit" value="logout">
  </form>
     
  
</body>
</html>