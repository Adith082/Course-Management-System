package com.login;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.dao.LoginDao;

/**
 * Servlet implementation class Student
 */
public class Student extends HttpServlet {
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String studentEmail;
		 ArrayList<String> courseCodes;
		 String fullName = request.getParameter("fullname");
		 String email = request.getParameter("email");
		 String registration = request.getParameter("registration");
		 String courseCode = request.getParameter("coursecode");
		 HttpSession session =  request.getSession();
		 String uname = (String) session.getAttribute("username");
		 
		 
		 LoginDao dao = new LoginDao();
		 dao.insertRegisteredCourseOfStudent(fullName, email, registration, courseCode);
			studentEmail = dao.getEmailOfUser(uname, "student");
	    	courseCodes = dao.getRegisteredCourses(studentEmail, "student_registered");
	     	request.setAttribute("courseCodes", courseCodes);
		 RequestDispatcher rd = request.getRequestDispatcher("student.jsp");
		 
		 rd.forward(request, response);
	}

}
