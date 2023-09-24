package com.serverlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DbConnect;
import com.dao.UserDAO;
import com.entity.User;

@WebServlet("/login")
public class LoginServerlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String s_email=request.getParameter("s_email");
		String s_password=request.getParameter("s_password");
		
		UserDAO dao=new UserDAO(DbConnect.getConn());
		User user=dao.loginUser(s_email, s_password);
		
		HttpSession session=request.getSession();
		
		if(user!=null) {
			session.setAttribute("user",user);
			response.sendRedirect("index.jsp");
			
			//System.out.println("user available"+user);
		}
		else {
			session.setAttribute("invalidmsg","Invalid email and password");
			response.sendRedirect("login.jsp");
			//System.out.println("user not available");
		}
	}
          
}
