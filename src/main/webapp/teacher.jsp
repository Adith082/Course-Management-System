<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="teacherStyle.css" />
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
     <nav>
  <div class="navbar-left">
    <h1>Course Management System</h1>
  </div>
  <div class="navbar-right">
    <form action="Logout">
      <input type="submit" value="Logout">
    </form>
  </div>
</nav>

    <div class="center">
  <h1>This is the teacher page</h1>
  <h1>Hello <%= session.getAttribute("username") %></h1>
  <h1>Registered Courses</h1>
  <h2>
    <% ArrayList<String> courseCodes = (ArrayList<String>)request.getAttribute("courseCodes");
       ArrayList<String> courseNames = (ArrayList<String>)request.getAttribute("courseNames");
       for (int i = 0; i < courseCodes.size(); i++) {
           out.println(courseCodes.get(i) + " " + courseNames.get(i) + "<br>");
       }
    %>
  </h2>
</div>
  
</body>
</html>