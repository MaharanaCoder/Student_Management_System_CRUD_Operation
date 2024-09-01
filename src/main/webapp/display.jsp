<%@page import="com.studentproject.AddStudent"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="index.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   <!--  <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'></link>  
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script> --> 
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> 
    
<title>Insert title here</title>
<style type="text/css">
	h2{
		font-weight: bold;
	}
	tr{
		padding: 20px;
	}
	a{
		color: white;
		text-decoration: none !important;
	}
	.search{
		display: flex;
		
	}
</style>
</head>
<body>



<div class="container mt-2" >
<% List<AddStudent> s = (List<AddStudent>)request.getAttribute("data"); %>
<form action="display_student" method="post">
    <div class="row search">
        <input type="text" class="form-control col-lg-8" placeholder="Search by Name" name="search" id="txtSearch" style="margin-right: 20px" value=" <%= (request.getParameter("search") != null) ? request.getParameter("search") : "" %> "/>
        <button class="btn btn-primary col-lg-4" type="submit">
            <span class="glyphicon glyphicon-search"></span> SEARCH
        </button>
    </div>
</form>

<center>

<h2>Student List</h2>
<table class="table table-striped">
  <thead>
    <tr>
     <th scope="col">ID</th>
      <th scope="col">Name</th>
      <th scope="col">Class</th>
      <th scope="col">Age</th>
      <th scope="col">Gender</th>
      <th scope="col">Address</th>
      <th scope="col">Phone No</th>
    </tr>
  </thead>
  <tbody>
  
  <% for(AddStudent temp : s){ %>
  
    <tr>
      <td><%= temp.getId() %></td>
      <td><%= temp.getName() %></td>
      <td><%= temp.getClasss() %></td>
      <td><%= temp.getAge() %></td>
      <td><%= temp.getGender() %></td>
      <td><%= temp.getAddress() %></td>
      <td><%= temp.getMobile() %></td>
      <td><button class="btn btn-primary"><a href="UpdateServelet?id=<%= temp.getId() %> ">Edit</a></button></td>
      <td><button class="btn btn-danger delete-btn"><a id="dlt" >Delete</a></button></td>
    </tr>
    <% }%>
  </tbody>
</table>
</center>
</div>
	<script type="text/javascript">
	 $(document).ready(function () {
	        // Use event delegation to handle dynamically generated elements
	        $(document).on('click', '.delete-btn', function (e) {
	            e.preventDefault();
	            Swal.fire({
	                title: 'Delete!',
	                text: 'Are you sure you want to delete this student?',
	                icon: 'warning',
	                showCancelButton: true,
	                confirmButtonText: 'Yes, delete it!',
	                cancelButtonText: 'Cancel'
	            });
	        });
	    });
	</script>
</body>
</html>