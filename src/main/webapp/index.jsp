<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	.navbar{
		background-color: skyblue;
		display: flex;
		padding: 10px;
		
	}
	.form-inline button{
		margin-left: 50px;	
		
	}
</style>

</head>
<body>
	<nav class="navbar navbar-light bg-light">
	  <a class="navbar-brand" >STUDENTS</a>
	  <form class="form-inline" action="addStudent.jsp">
	    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">ADD STUDENT</button>
	  </form>
	  <form class="form-inline" action="display_student">
	    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">STUDENT LIST</button>
	  </form>
	</nav>
</body>
</html>