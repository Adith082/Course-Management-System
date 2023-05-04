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
      
      
      
      
      
    <form action="Logout" id="loggingout" style="border-color:transparent;background-color:transparent;display:block;position: absolute; top: 0px; right: 0px; ">
    <input action="Logout" type="submit" value="Logout" style="background-color: #4CAF50; width: 300px; color: white; padding: 1px 2px; border: none; border-radius: 8px; box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.3); cursor: pointer;">
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
     
     
     
     
   <% ArrayList<Course> coursesInfo = (ArrayList<Course>)session.getAttribute("coursesInfo"); %>  
  
  <p class="stuInfoHead" style="font-weight: bold; color: #000000; text-align: center;">Currently Available Courses</p>


<table class="courseTable table align-middle mb-0 bg-white table-hover" style="border-collapse: collapse; width: 50%; margin: 0 auto; border: 1px solid #ddd; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);">
  <thead class="bg-light" style="background-color: #f1f1f1;">
    <tr>
      <th style="padding: 10px; border: 1px solid #ddd;">Course Code</th>
      <th style="padding: 10px; border: 1px solid #ddd;">Course Name</th>
    </tr>
  </thead>
  <tbody>
    <% for (int i = 0; i < coursesInfo.size(); i++) { %>
      <tr>
        <td style="padding: 10px; border: 1px solid #ddd;"><%= coursesInfo.get(i).getCourseCode() %></td>
        <td style="padding: 10px; border: 1px solid #ddd;"><%= coursesInfo.get(i).getCourseName() %></td>
      </tr>
    <% } %>
  </tbody>
</table>
  
  
  
  <div style="display: flex; justify-content: center; margin-top:40px">
  <div style="width: 50%; margin-right: 10px;">
    <h5 style=" font-weight: bold; color: #000000;   text-align: center;">Add New Course to the System</h1>
    <form method="get" action="Admin" style="box-shadow: 0px 0px 5px rgba(0,0,0,0.3);">
      <label for="coursecode">Course Code:</label>
      <input type="text" id="coursecode" name="coursecode"><br>
      <label for="coursename">Course Name:</label>
      <input type="text" id="coursename" name="coursename"><br>
      <input type="submit" value="Submit">
    </form>
  </div>
  
  <div style="width: 50%; margin-left: 10px; ">
    <h5 style=" font-weight: bold; color: #000000;       text-align: center;">Assign Teacher to a particular course</h1>
    <form action="Admin" method="post" style="box-shadow: 0px 0px 5px rgba(0,0,0,0.3);">
      <label for="fullname">Teacher's Name:</label>
      <input type="text" id="fullname" name="fullname"><br><br>
      <label for="email">Email:</label>
      <input type="email" id="email" name="email"><br><br>
      <label for="coursecode">Course Code:</label>
      <input type="text" id="coursecode" name="coursecode"><br><br>
      <input type="submit" value="Submit">
    </form>
  </div>
</div>
  
  
        
        
       
  
</body>
</html>