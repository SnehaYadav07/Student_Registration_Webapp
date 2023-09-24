<%@page import="com.entity.student"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DbConnect"%>
<%@page import="com.dao.StudentinfoDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Management</title>
<%@include file="NewFile.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	 <%
	 if(u==null){
		 session.setAttribute("invalidmsg", "Login Please........");
		 response.sendRedirect("login.jsp");
	 }
	 %>
	 
	 <%
	 
	 String successmsg=(String)session.getAttribute("successmsg");  
		String errormsg=(String)session.getAttribute("errorsmsg");
		
		if(successmsg!=null){
		%>
			<p class="alert alert-success text-center"><%=successmsg  %></p>
		<%
		session.removeAttribute("successmsg");
		}
		if(errormsg!=null){
			%>
			<p class="alert alert-danger text-center"><%=errormsg  %></p>
			<%
			session.removeAttribute("errormsg");
		}
	 
	 %>
	 <br>
	
	<div class="table-responsive">
		<table class="table table-hover">
				<thead class="thead-dark">
					<tr>
						<th scope="col">Serial no.</th>
						<th scope="col">Name</th>
						<th scope="col">Email</th>
						<th scope="col">Age</th>
						<th scope="col"></th>
						<th scope="col"></th>
					</tr>
				</thead>
			<%
			int n=1;
			if (u != null) {
				StudentinfoDAO dao = new StudentinfoDAO(DbConnect.getConn());

				List<student> list = dao.getAllStudents(u.getId());

				for (student s : list) {
			%>
			
				<tbody>
					<tr>
						<th scope="row"><%=n%></th>
						<td><%=s.getName()%></td>
						<td><%=s.getEmail()%></td>
						<td><%=s.getAge()%></td>
						
	     <td><button class="btn btn-success btn-sm " type="submit"><a class="nav-link text-white" href="editStudent.jsp?id=<%= s.getId() %>">Update</a>
	     </button></td>
	      <td><button class="btn btn-danger btn-sm" type="submit"><a class="nav-link text-white" href="delete?id=<%= s.getId() %>">Delete</a></button></td>
	    
					</tr>
				</thead>
				</tbody>
			
			<%
			n++;
			}
			}
			%>
		</table>
	
</div>

  
		
</body>
</html>