package com.login.dao;
import com.login.model.*;
import java.sql.*;
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
		   } catch(Exception e) {		
			   e.printStackTrace();
		   }
		   
		   return false;
	   }
}
