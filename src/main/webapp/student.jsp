<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.ArrayList" %>
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
<link rel="stylesheet" href="studentStyle.css" />
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
 <div class="studentInfoDiv">
      <p class="courseHeading">Student Dashboard</p>
    <form action="Logout" id="loggingout" style="border-color:transparent;background-color:transparent;display:block;position: absolute; top: 0px; right: 0px; ">
    <input action="Logout" type="submit" value="Logout" style="background-color: #4CAF50; width: 300px; color: white; padding: 1px 2px; border: none; border-radius: 8px; box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.3); cursor: pointer;">
   </form>

  
  
    </div>
     <% ArrayList <String> courseCodes = (ArrayList<String>)request.getAttribute("courseCodes");
   ArrayList <String> courseNames = (ArrayList<String>)request.getAttribute("courseNames"); %>
   
    
    <% request.getAttribute("studentRegistration"); %>
    <div class="flexDiv">
      <div class="studentDiv">
        <p class="stuInfoHead">Student Information</p>
        <div class="student-info bg-white border rounded-2">
          <table class="table align-middle mb-0 bg-white table-hover">
            <tr>
              <th>Name</th>
              <td><%= request.getAttribute("studentUsername") %></td>
            </tr>
            <tr>
              <th>Reg. no</th>
              <td><%= request.getAttribute("studentRegistration") %></td>
            </tr>
            <tr>
              <th>Email</th>
              <td> <%= request.getAttribute("studentEmail") %></td>
            </tr>
          </table>
        </div>
      </div>
      <div class="courseDiv">
        <p class="stuInfoHead">Courses Enrolled</p>
         
    <table class="courseTable table align-middle mb-0 bg-white table-hover">
    <thead class="bg-light">
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
  
  
    
    
      <p class="stuInfoHead">Currently Available Courses</p>
        <% ArrayList<Course> coursesInfo = (ArrayList<Course>)request.getAttribute("coursesInfo");
    %>
    <table class="courseTable table align-middle mb-0 bg-white table-hover">
    <thead class="bg-light">
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
    
    
    
    
    
    
  
  
  
        <div class="add-course" id="toggleButton" >
           
              <button id="styleButton" >Course Registration Form</button>
        </div>
      </div>
    </div>
    
    
    
    
    
    
    
    
    
    
 
    
    
   

   


   
       
	<form action="Student" method="post" id="toggleForm">
		<label for="fullname">Full Name:</label>
		<input type="text" id="fullname" name="fullname"><br><br>
		
		<label for="email">Email:</label>
		<input type="email" id="email" name="email"><br><br>
		
		<label for="registration">Registration:</label>
		<input type="text" id="registration" name="registration"><br><br>
		
		<label for="coursecode">Course Code:</label>
		<input type="text" id="coursecode" name="coursecode"><br><br>
		
		<input type="submit" value="Submit">
	</form>
    
</div>
   
 
   
   
   
  
   
   
   
   
   
   
   
  
  
  
   <script>
  var toggleButton = document.getElementById("toggleButton");
  var addCourseForm = document.getElementById("toggleForm");
  toggleButton.addEventListener("click", function() {
    if (addCourseForm.style.display === "none") {
      addCourseForm.style.display = "block";
    } else {
      addCourseForm.style.display = "none";
    }
  });
  
  
  
  function toggleDiv() {
		var div = document.getElementById("availablecourses");
		
		if (div.style.display === "none") {
			div.style.display = "block";
		} else {
			div.style.display = "none";
		}
	}
  
  
  
</script>
  
</body>
</html>