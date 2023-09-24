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

@WebServlet("/delete")
public class deleteServerlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id=Integer.parseInt(req.getParameter("id"));
		
		StudentinfoDAO dao=new StudentinfoDAO(DbConnect.getConn());
		
		boolean f=dao.deleteStudent(id);
		

		HttpSession session=req.getSession();
		
		if(f) {
			
			session.setAttribute("successmsg","Student data deleted successfully");
			resp.sendRedirect("viewStudents.jsp");
		}
		
		else {
			session.setAttribute("errormsg","Something went wrong........");
			resp.sendRedirect("viewStudents.jsp"+id);
		}
	}

}
