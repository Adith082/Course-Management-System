<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.login.model.StudentInfo" %>
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
<body > 
<!--   <nav>
  <div class="navbarleft">
    <h1>Course Management System</h1>
  </div>
  <div class="navbarright">
    <form action="Logout">
      <input type="submit" value="Logout">
    </form>
  </div>
</nav> -->
 <div class="studentInfoDiv">
      <p class="courseHeading">Teacher Dashboard</p>
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
     
    
 
    <div class="center">
   
    <% ArrayList<String> courseCodes = (ArrayList<String>)request.getAttribute("courseCodes");
       ArrayList<String> courseNames = (ArrayList<String>)request.getAttribute("courseNames");
      // for (int i = 0; i < courseCodes.size(); i++) {
        //   out.println(courseCodes.get(i) + " " + courseNames.get(i) + "<br>");
       //}
    %>
   
     <div style="text-align:center;">
     
      <h2 class="teacherheader" style="margin:20px;font-weight:bold;color:black;">Assigned Courses for <%= session.getAttribute("username") %></h2>
      
      
      <table class="courseTable table align-middle mb-0 bg-white table-hover" style="border-collapse: collapse; width: 50%; margin: 0 auto; border: 1px solid #ddd; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);">
  <thead class="bg-light" style="background-color: #f1f1f1;">
    <tr>
      <th style="padding: 10px; border: 1px solid #ddd;">Course Code</th>
      <th style="padding: 10px; border: 1px solid #ddd;">Course Name</th>
    </tr>
  </thead>
  <tbody>
    <% for (int i = 0; i < courseCodes.size(); i++) { %>
      <tr>
        <td style="padding: 10px; border: 1px solid #ddd;"><%= courseCodes.get(i) %></td>
        <td style="padding: 10px; border: 1px solid #ddd;"><%= courseNames.get(i) %></td>
      </tr>
    <% } %>
  </tbody>
</table>
      
      <button id="toggleButton" style="background-color: #42adb4; border: none; color: white; font-weight: bold; padding: 10px 20px; text-align: center; text-decoration: none; display: inline-block; font-size: 20px; margin: 40px; cursor: pointer; box-shadow: 2px 2px 5px #888888; transition: background-color 0.5s;">
    StudentList of particular course
</button>
      
     
  
    <form action="StudentList" method="post" id="addCourseForm" style="display:none;">
     <label for="coursecode" style="font-weight: bold; color: black;">Course Code:</label>
     
      <input type="text" id="coursecode" name="coursecode">
      <input type="submit" value="Get Student List">
    </form>

   <%
ArrayList<StudentInfo> studentInfos = (ArrayList<StudentInfo>) request.getAttribute("studentInfos");
%>


 <h2 class="teacherheader" style="margin:20px;font-weight:bold;color:black;">Students of <%= request.getParameter("coursecode") %></h2>
      
      <div style="margin:40px">
      <table class="courseTable table align-middle mb-0 bg-white table-hover" style="border-collapse: collapse; width: 50%; margin: 0 auto; border: 1px solid #ddd; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);">
  <thead class="bg-light" style="background-color: #f1f1f1;">
    <tr>
      <th style="padding: 10px; border: 1px solid #ddd;">Full Name</th>
      <th style="padding: 10px; border: 1px solid #ddd;">Registration</th>
    </tr>
  </thead>
  <tbody>
  <% if (studentInfos != null && !studentInfos.isEmpty()) {%>
    <% for (StudentInfo studentInfo : studentInfos) { %>
      <tr>
        <td style="padding: 10px; border: 1px solid #ddd;"><%= studentInfo.getFullname() %></td>
        <td style="padding: 10px; border: 1px solid #ddd;"><%= studentInfo.getRegistration() %></td>
      </tr>
    <% } %>
    <%} %>
  </tbody>
</table>
</div>
</div>


   
  
</div>
  <script>
  var toggleButton = document.getElementById("toggleButton");
  var addCourseForm = document.getElementById("addCourseForm");
  toggleButton.addEventListener("click", function() {
    if (addCourseForm.style.display === "none") {
      addCourseForm.style.display = "block";
    } else {
      addCourseForm.style.display = "none";
    }
  });
</script>
</body>
</html>