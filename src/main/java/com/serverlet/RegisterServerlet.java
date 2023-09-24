package com.serverlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DbConnect;
import com.dao.UserDAO;
import com.entity.User;

@WebServlet("/register")
public class RegisterServerlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response ) throws IOException 
	{
		String s_name=request.getParameter("s_name");
		String s_email=request.getParameter("s_email");
		String s_password=request.getParameter("s_password");
		
		
		User u=new User(s_name,s_email,s_password);
		
		UserDAO dao=new UserDAO(DbConnect.getConn());
		boolean f=dao.userRegister(u);
		
		HttpSession session=request.getSession();
		
				if(f) {
					session.setAttribute("successmsg", "Student Registered Successfully");
					response.sendRedirect("login.jsp");
//					System.out.println("successfully register");
				}
		     else {
		    	 session.setAttribute("errormsg", "Student Registered Unsuccessfull");
		    	 response.sendRedirect("register.jsp");
//		    	 System.out.println("something wrong");
		     }
	}
	
	
}
