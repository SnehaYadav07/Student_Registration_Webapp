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

@WebServlet("/updateStudent")
public class updateStudent extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id=Integer.parseInt(req.getParameter("id"));
		System.out.print(id);
		String name=req.getParameter("s_name");
		String email=req.getParameter("s_email");
		String age=req.getParameter("s_age");
		
		student student=new student();
		student.setId(id);
		student.setName(name);
		student.setEmail(email);
		student.setAge(age);
		
		
		StudentinfoDAO dao=new StudentinfoDAO(DbConnect.getConn());
		
        boolean f=dao.updateStudent(student);
		
		HttpSession session=req.getSession();
		
		if(f) {
			
			session.setAttribute("successmsg","Student updated successfully");
			resp.sendRedirect("viewStudents.jsp");
		}
		
		else {
			session.setAttribute("errormsg","Something went wrong........");
			resp.sendRedirect("editStudent.jsp"+id);
		}
		
	}

	
	
}
