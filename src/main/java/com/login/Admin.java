package com.login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.dao.LoginDao;

/**
 * Servlet implementation class Admin
 */
public class Admin extends HttpServlet {

	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String fullName = request.getParameter("fullname");
		 String email = request.getParameter("email");
		 String courseCode = request.getParameter("coursecode");
		 LoginDao dao = new LoginDao();
		 dao.insertRegisteredCourseOfTeacher(fullName, email, courseCode);
		 RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
		 rd.forward(request, response);
	}

	
}
