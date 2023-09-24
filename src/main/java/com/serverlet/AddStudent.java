package com.serverlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DbConnect;
import com.dao.StudentinfoDAO;
import com.entity.student;


@WebServlet("/addStudent")
public class AddStudent extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int userid=Integer.parseInt(req.getParameter("userid"));
		String name=req.getParameter("s_name");
		String email=req.getParameter("s_email");
		String age=req.getParameter("s_age");
		
		student student=new student(name,email,age,userid);
		
		StudentinfoDAO dao=new StudentinfoDAO(DbConnect.getConn());
		
		boolean f=dao.saveStudent(student);
		
		HttpSession session=req.getSession();
		
		if(f) {
			
			session.setAttribute("successmsg","Student added successfully");
			resp.sendRedirect("addStudent.jsp");
		}
		
		else {
			session.setAttribute("errormsg","Something went wrong........");
			resp.sendRedirect("addStudent.jsp");
		}
		
		System.out.println(name+email+userid+age);
	}

	
	
}
