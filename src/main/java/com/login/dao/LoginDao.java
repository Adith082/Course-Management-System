package com.login.dao;
import com.login.model.*;
import java.sql.*;
import java.util.ArrayList;
public class LoginDao {
	
	   String dburl = "jdbc:mysql://localhost:3306/course_management_system";
	   String dbusername="root";
	   String dbpassword="35821";
	   
	   public boolean check(String username,String password,String tableName) {
		 
		   try {
			   Class.forName("com.mysql.jdbc.Driver");
			  
			   Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			   String query = "select * from "+tableName+" where username=? and password=?";
		       PreparedStatement st = con.prepareStatement(query);
		       st.setString(1, username);
		       st.setString(2, password);
		       ResultSet rs = st.executeQuery();
		       if(rs.next()) {
		    	
		    	   return true;
		       }
		       st.close();
		        con.close();
		   } catch(Exception e) {		
			   e.printStackTrace();
		   }
		   
		   return false;
	   }
	   
	   public String getInfoUser(String username,String tableName) {
		  
		   String studentEmail="";
		   try {
			   
		   Class.forName("com.mysql.jdbc.Driver");
		   Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
		   String query = "select email from "+tableName+" where username=?";
	       PreparedStatement st = con.prepareStatement(query);
	       st.setString(1, username);
	       ResultSet rs = st.executeQuery();
	       
	       
	       if(rs.next()) {
	    	   studentEmail = rs.getString("email");
	       }
	       st.close();
	        con.close();
		   } catch(Exception e) {
			   e.printStackTrace();
		   }
		   return studentEmail;
	   }
	   
	   
	   public ArrayList<String> getRegisteredCourses(String email,String tableName) {
		    ArrayList<String> courseCodes = new ArrayList<String>();
		    try {
				   
				   Class.forName("com.mysql.jdbc.Driver");
				   Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
				   String query = "select coursecode from "+tableName+" where email=?";
			       PreparedStatement st = con.prepareStatement(query);
			       st.setString(1, email);
			       ResultSet rs = st.executeQuery();
			       
			       while(rs.next()) {
			    	   courseCodes.add(rs.getString("coursecode"));
			       }
			       st.close();
			        con.close();
				   } catch(Exception e) {
					   e.printStackTrace();
				   }
		    

		    return courseCodes;
		}
	   
	   public ArrayList<StudentInfo> registeredStudentOfCourse(String coursecode) {
		   ArrayList<StudentInfo> studentInfos = new ArrayList<StudentInfo>();
		   try {
			   
			   Class.forName("com.mysql.jdbc.Driver");
			   Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			   String query = "select * from student_registered where coursecode=?";
		       PreparedStatement st = con.prepareStatement(query);
		       st.setString(1, coursecode);
		       ResultSet rs = st.executeQuery();
		       
		       while(rs.next()) {
		    	   StudentInfo si = new StudentInfo();
		    	   si.setFullname(rs.getString("fullname"));
		    	   si.setRegistration(rs.getString("registration"));
		    	   studentInfos.add(si);
		       }
		       
		        st.close();
		        con.close();
			   } catch(Exception e) {
				   e.printStackTrace();
			   }
	       
		   return studentInfos;
	   }
	   
	   
	   
	   
	   
	   
	   
	   
}
