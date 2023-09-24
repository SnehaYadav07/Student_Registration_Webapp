<%@page import="com.entity.User"%>
</style>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <li class="nav-item active">
        <a class="nav-link btn btn-outline-info my-2 my-sm-0 mr-3" href="addStudent.jsp">Add Student <i class="fas fa-plus-circle"></i>
        </a>
      </li>
      <li class="nav-item active">
        <a class="nav-link btn btn-outline-info my-2 my-sm-0 mr-3" href="viewStudents.jsp">View Students <i class="fas fa-eye"></i>
        </a>
      </li>
      
    </ul>
    <% User u=(User) session.getAttribute("user");
    if(u==null){
    	%>
    	 <form class="form-inline my-2 my-lg-0">
     <button class="btn btn-outline-success my-2 my-sm-0 mr-3" type="submit"><a class="nav-link text-white" href="login.jsp">Login</a></button>
     
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit"><a class="nav-link text-white" href="register.jsp">Register</a></button>
    </form>
    <%
    }
    else{
    %>
     <form class="form-inline my-2 my-lg-0">
     <button class="btn btn-outline-success my-2 my-sm-0 mr-3" type="submit"><a class="nav-link text-white" href="#"><i class="fas fa-user"></i>
       <%=u.getName() %></a></button>
      <button class="btn btn-outline-danger my-2 my-sm-0" type="submit"><a data-toggle="modal" data-target="#exampleModalCenter" class="nav-link text-white" >Logut <i class="fas fa-sign-out-alt"></i></a></button>
    </form>
    <%
    }
    %>
  </div>
  <!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h2 class="modal-title text-danger" id="exampleModalLongTitle">Alert</h2>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <h4>Do you want to logout???</h4>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal"> <a class="nav-link">Close</a></button>
        <button type="button" class="btn btn-primary"><a class="text-white nav-link" href="logout"> 
        Logout</a></button>
      </div>
    </div>
  </div>
</div>
</nav>