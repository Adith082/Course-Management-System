


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
  <link rel="stylesheet" href="loginStyle.css" />
  <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap"
      rel="stylesheet"
    />
   
  
</head>
<body  style=" background-image: url(./images/backgroundImage_03.jpg);
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover; margin: 0px;
  height: 100%;
  display: flex;
  flex-direction: column;
  justify-content: center;">
 
  <nav style="background-color:black; height: 70px;">
  <h1 style="font-size: 36px; margin: 0; padding-top: 10px;">Course Management System</h1>
</nav>
  
  
  
  
  
   <div class="center">
      <form method="post"> 
        <label style="font-weight: bold; color: #000000;" for="username">Username:</label>
        <input type="text" name="uname" required>
        <br><br>
        <label style="font-weight: bold; color: #000000;" for="password">Password:</label>
        <input type="password" name="pass" required>
        <br><br>
        <input style="background-color:black;" type="submit" name="action" value="Admin Login" formaction="AdminLogin">
        <input style="background-color:black;" type="submit" name="action" value="Teacher Login" formaction="TeacherLogin">
        <input style="background-color:black;" type="submit" name="action" value="Student Login" formaction="StudentLogin">
      </form>
    </div>
  
  
      
</body>
</html>


























