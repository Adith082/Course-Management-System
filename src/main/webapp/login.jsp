<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
      <form method="post"> 
  <label for="username">Username:</label>
  <input type="text" name="uname" required>
  <br><br>
  <label for="password">Password:</label>
  <input type="password" name="pass" required>
  <br><br>
  <input type="submit" name="action" value="Admin Login" formaction="AdminLogin">
  <input type="submit" name="action" value="Teacher Login" formaction="TeacherLogin">
  <input type="submit" name="action" value="Student Login" formaction="StudentLogin">
</form>
      
</body>
</html>