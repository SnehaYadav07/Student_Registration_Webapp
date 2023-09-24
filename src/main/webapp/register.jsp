<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Management</title>
<%@include file="NewFile.jsp"%>
<style type="text/css">

#box{
  margin-top:30px;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container-fluid">
		<div class="row pd-3">
			<div class="col-md-6 offset-md-3">
			<div class="card" id="box">
				<div class="card-body">
				<h2 class="text-center text-success">Registration Page</h2>
					<form action="register" method="post" >
					
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
						<p class="alert alertt-danger text-center"><%=errormsg  %></p>
						<%
						session.removeAttribute("errormsg");
					}
					
					%>
					
					<div class="form-group">
							<label for="exampleInputEmail1">Name</label> <input name="s_name"
								type="text" class="form-control" id="exampleInputEmail1"
								>
							
						</div>
					
						<div class="form-group">
							<label for="exampleInputEmail1">Email address</label> <input name="s_email"
								type="email" class="form-control" id="exampleInputEmail1"
								>
							
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Password</label> <input name="s_password"
								type="password" class="form-control" id="exampleInputPassword1"
								>
						</div>
						<div class="text-center">
						<button type="submit" class="btn btn-primary">Register</button>
						</div>
					</form>
				</div>
			</div>
			</div>
		</div>
	</div>
</body>
</html>