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
 * Servlet implementation class StudentLogin
 */
public class StudentLogin extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("uname");
		 String pass = request.getParameter("pass");
		 String studentEmail;
		 ArrayList<String> courseCodes;
		 LoginDao dao = new LoginDao();
		    if(dao.check(uname, pass,"student")) {
		    	
		    	
		    	studentEmail = dao.getInfoUser(uname, "student");
		    	courseCodes = dao.getRegisteredCourses(studentEmail, "student_registered");
		    	
		    	
		    	
		    	HttpSession session =  request.getSession();
		    	session.setAttribute("username", uname);
		    	request.setAttribute("courseCodes", courseCodes);
		    	//response.sendRedirect("student.jsp");
		    	RequestDispatcher rd = request.getRequestDispatcher("student.jsp");
				rd.forward(request, response);
		    } else {
		    	response.sendRedirect("login.jsp");
		    }
	}

}
