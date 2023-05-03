<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.login.model.StudentInfo" %>
  <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="teacherStyle.css" />
</head>
<body > 
 <nav>
  <div class="navbarleft">
    <h1>Course Management System</h1>
  </div>
  <div class="navbarright">
    <form action="Logout">
      <input type="submit" value="Logout">
    </form>
  </div>
</nav>
     <%
     response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");  //http1.1
     response.setHeader("Pragma","no-cache"); //http1.0
     response.setHeader("Expires","0"); //proxies 
     if(session.getAttribute("username") == null){
        	response.sendRedirect("login.jsp");
        }
     
     %>
      <h1 class="teacherheader">Assigned Courses for <%= session.getAttribute("username") %></h1>
    
 
    <div class="center">
   
    <% ArrayList<String> courseCodes = (ArrayList<String>)request.getAttribute("courseCodes");
       ArrayList<String> courseNames = (ArrayList<String>)request.getAttribute("courseNames");
      // for (int i = 0; i < courseCodes.size(); i++) {
        //   out.println(courseCodes.get(i) + " " + courseNames.get(i) + "<br>");
       //}
    %>
   
     <div style="text-align:center;">
  <table>
    <thead>
      <tr>
        <th>Course Code</th>
        <th>Course Name</th>
      </tr>
    </thead>
    <tbody>
      <% for (int i = 0; i < courseCodes.size(); i++) { %>
        <tr>
          <td><%= courseCodes.get(i) %></td>
          <td><%= courseNames.get(i) %></td>
        </tr>
      <% } %>
    </tbody>
  </table>
  <button id="toggleButton">StudentList of particular course</button>
    <form action="StudentList" method="post" id="addCourseForm" style="display:none;">
      <label for="coursecode">Course Code:</label>
      <input type="text" id="coursecode" name="coursecode">
      <input type="submit" value="Get Student List">
    </form>
</div>

   <%
ArrayList<StudentInfo> studentInfos = (ArrayList<StudentInfo>) request.getAttribute("studentInfos");

if (studentInfos != null && !studentInfos.isEmpty()) {
out.println("<h2>Students:</h2>");
for (StudentInfo studentInfo : studentInfos) {
out.println("<p>Full Name: " + studentInfo.getFullname() + "</p>");
out.println("<p>Registration: " + studentInfo.getRegistration() + "</p>");
out.println("<br>");
}
}
%>
   
  
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