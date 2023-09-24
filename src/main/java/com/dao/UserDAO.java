package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDAO {

	
	private Connection conn;
	
	public UserDAO(Connection conn) {
		super();
		this.conn=conn;
	}
	
	
	public boolean userRegister(User u) {
		boolean f= false;
		
		try {
			
			String sqlString="insert into students(s_name,s_email,s_password) values(?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sqlString);
			ps.setString(1,u.getName() );
			ps.setString(2,u.getEmail() );
			ps.setString(3,u.getPassword() );
			
			int i=ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}
	
	
	public User loginUser(String s_email,String s_password) {
		User user=null;
		
		try {
			String sqlString="select * from students where s_email=? and s_password=?";
			PreparedStatement ps=conn.prepareStatement(sqlString);
			ps.setString(1, s_email);
		    ps.setString(2, s_password);
		    
		    
		    ResultSet rSet=ps.executeQuery();
		    
		    while(rSet.next()) {
		    	user=new User();
		    	user.setId(rSet.getInt(1));
		    	user.setName(rSet.getString(2));
		    	user.setEmail(rSet.getString(3));
		    	user.setPassword(rSet.getString(4));
		    }
		    
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return user;
	}
	
}
