<%@page import="com.entity.student"%>
<%@page import="com.dao.StudentinfoDAO"%>
<%@page import="com.conn.DbConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>hello</title>
<%@include file="NewFile.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>

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
				<h2 class="text-center text-success">Edit Student Record</h2>
					<form action="updateStudent" method="post" >
					<% 
					int id=Integer.parseInt(request.getParameter("id"));
					StudentinfoDAO dao=new StudentinfoDAO(DbConnect.getConn());
					student s=dao.getStudentbyIdintStudent(id);
					%>
					
					
					<input type="hidden" name="id" value="<%= id %>">
					
					<%if(u!=null){
					%>
					<input type="hidden" value="<%= u.getId() %>" name="userid">
					<%}
					%>
					
					
					<div class="form-group">
					
				<label for="exampleInputEmail1">Name</label> <input name="s_name"
							value="<%=s.getName()%>"	type="text" class="form-control" id="exampleInputEmail1"
								>
							
						</div>
					
						<div class="form-group">
							<label for="exampleInputEmail1">Email</label> <input name="s_email" value="<%=s.getEmail() %>"
								type="email" class="form-control" id="exampleInputEmail1"
								>
							
						</div>
						<div class="form-group">
							<label for="exampleInput">Age</label> <input name="s_age" value="<%=s.getAge() %>"
								type="text" class="form-control"
								>
						</div>
						<div class="text-center">
						<button type="submit" class="btn btn-primary">Update</button>
						</div>
					</form>
				</div>
			</div>
			</div>
		</div>
	</div>
    
</body>
</html>