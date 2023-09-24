<%@page import="com.entity.student"%>
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
	<div class="container-fluid">
		<div class="row pd-3">
			<div class="col-md-6 offset-md-3">
			<div class="card">
				<div class="card-body">
				<h2 class="text-center text-success">Add Student</h2>
					<form action="addStudent" method="post" >				
					
					<%if(u!=null){
					%>
					<input type="hidden" value="<%= u.getId() %>" name="userid">
					<%}
					%>
					
					
					<div class="form-group">
					<% String successmsg=(String)session.getAttribute("successmsg");  
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
							<label for="exampleInputEmail1">Name</label> <input name="s_name"
							 	type="text" class="form-control" id="exampleInputEmail1"
								>
							
						</div>
					
						<div class="form-group">
							<label for="exampleInputEmail1">Email</label> <input name="s_email" 
								type="email" class="form-control" id="exampleInputEmail1"
								>
							
						</div>
						<div class="form-group">
							<label for="exampleInput">Age</label> <input name="s_age" 
								type="text" class="form-control"
								>
						</div>
						<div class="text-center">
						<button type="submit" class="btn btn-primary">Add</button>
						</div>
					</form>
				</div>
			</div>
			</div>
		</div>
	</div>
</body>
</html>