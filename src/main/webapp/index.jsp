<%@page import="com.conn.DbConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Management</title>
<%@include file="NewFile.jsp" %>
<style type="text/css">
.home{
  background:url("hand-drawn-back-school-background_23-2149464866.avif");
  width:100vw;
  height:89vh;
  background-repeat:no-repeat;
  background-size:cover;
}


h1{
display:flex;
justify-content:center;
padding-top:290px;
align-item:center;
font-size:50px;
text-shadow: 2px 2px 4px grey;
}
</style>
</head>
<body>
<%@include file="navbar.jsp" %>

<div class="home container-fluid">
<h1 >Welcome to Student Management</h1>
</div>

</body>
</html>