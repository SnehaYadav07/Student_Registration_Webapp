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
				<h2 class="text-center text-success">Login Page</h2>
				<%
				String invalidmsg=(String) session.getAttribute("invalidmsg");
				if(invalidmsg!=null)
				{%>
				
					<P class="text-center alert alert-danger"><%=invalidmsg %></P>
				<% 
				session.removeAttribute("invalidmsg");
				}
				%>
				
				<%
				String logoutmsg=(String) session.getAttribute("logoutmsg");
				if(logoutmsg!=null)
				{%>
					<P class="text-center alert alert-success"><%=logoutmsg %></P>
				<% 
				session.removeAttribute("logoutmsg");
				}
				%>
					<form action="login" method="post" >
				
						<div class="form-group">
							<label for="exampleInputEmail1">Email address </label> <input name="s_email"
								type="email" class="form-control" id="exampleInputEmail1"
								>
							
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Password</label> <input name="s_password"
								type="password" class="form-control" id="exampleInputPassword1"
								>
						</div>
						<div class="text-center">
						<button type="submit" class="btn btn-primary">Login</button>
						</div>
					</form>
				</div>
			</div>
			</div>
		</div>
	</div>
</body>
</html>