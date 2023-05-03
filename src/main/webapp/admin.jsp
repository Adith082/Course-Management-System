<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="com.login.model.Course" %>
       <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
      crossorigin="anonymous"
    />
      <link rel="stylesheet" href="adminStyle.css" />
</head>
<body>
  <div class="studentInfoDiv">
      <p class="courseHeading">Admin Dashboard</p>
    
    <form action="Logout">
      <input type="submit" value="Logout">
    </form>
  
    </div>
     
      <%
     response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");  //http1.1
     response.setHeader("Pragma","no-cache"); //http1.0
     response.setHeader("Expires","0"); //proxies 
     if(session.getAttribute("username") == null){
        	response.sendRedirect("login.jsp");
        }
     
     %>
      
       <h1> All Currently Available Courses</h1>
        <% ArrayList<Course> coursesInfo = (ArrayList<Course>)session.getAttribute("coursesInfo");
  
      // for (int i = 0; i < courseCodes.size(); i++) {
        //   out.println(courseCodes.get(i) + " " + courseNames.get(i) + "<br>");
       //}
    %>
    <table>
    <thead>
      <tr>
        <th>Course Code</th>
        <th>Course Name</th>
      </tr>
    </thead>
    <tbody>
      <% for (int i = 0; i < coursesInfo.size(); i++) { %>
        <tr>
          <td><%= coursesInfo.get(i).getCourseCode() %></td>
          <td><%= coursesInfo.get(i).getCourseName() %></td>
        </tr>
      <% } %>
    </tbody>
  </table>
       
        <h1>Add New Course to the System </h1>
	<form method="get" action="Admin">
  <label for="coursecode">Course Code:</label>
  <input type="text" id="coursecode" name="coursecode"><br>
  
  <label for="coursename">Course Name:</label>
  <input type="text" id="coursename" name="coursename"><br>
  
  <input type="submit" value="Submit">
</form>
	
       
       
       <h1> Assign Teacher to a particular course</h1>
	<form action="Admin" method="post">
		<label for="fullname">Teacher's Name:</label>
		<input type="text" id="fullname" name="fullname"><br><br>
		
		<label for="email">Email:</label>
		<input type="email" id="email" name="email"><br><br>
		
		<label for="coursecode">Course Code:</label>
		<input type="text" id="coursecode" name="coursecode"><br><br>
		
		<input type="submit" value="Submit">
	</form> 
       
        
        
       
  
</body>
</html>