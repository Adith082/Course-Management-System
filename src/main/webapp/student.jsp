<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.ArrayList" %>
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
   <h1>HELLO <% out.print(session.getAttribute("username")); %></h1> <br>
   <h1> REGISTERED COURSES </h1> <br>
   <h2> <%
   
   ArrayList <String> courseCodes = (ArrayList<String>)request.getAttribute("courseCodes");
   for (int i = 0; i < courseCodes.size(); i++) {
       out.println(courseCodes.get(i) + "<br>");
   }
      
   %></h2>
    <form action="Logout" >
  <input type="submit" value="logout">
  </form>
</body>
</html>