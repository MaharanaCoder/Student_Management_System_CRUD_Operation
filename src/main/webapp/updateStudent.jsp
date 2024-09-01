<%@page import="java.util.List"%>
<%@page import="com.studentproject.AddStudent"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> 
<title>Insert title here</title>
<style>
        .form-container {
            background: #f8f9fa;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 2rem;
            width: 600px;
            margin: auto;
            margin-top: 3rem;
        }
        .form-title {
            margin-bottom: 1.5rem;
            font-size: 1.5rem;
            font-weight: bold;
        }
        .form-control {
            border-radius: 0.375rem;
        }
        .btn-custom {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 0.375rem;
            padding: 0.5rem 1.5rem;
            font-size: 1rem;
            float: right;
        }
        .btn-custom:hover {
            background-color: #0056b3;
            color: #fff;
        }
    </style>
</head>
<body>
<%-- 	<% out.print(2*5); %>   --%>
<% HttpSession ses = request.getSession(false);
	String message = (String) ses.getAttribute("alert");
%>
	 <div class="container form-container">
        <h1 class="form-title text-center">Add Student Details</h1>
        <form action="updateStudent" method="post">
        <% AddStudent st = (AddStudent)request.getAttribute("data"); %>
            <div class="form-group">
                <label for="name">Name :</label>
                <input type="text" id="name" name="name" class="form-control" placeholder="Enter Your Name" value="<%= st.getName() %> ">
                <input type="hidden" id="id" name="id" class="form-control" placeholder="Enter Your Name" value="<%= st.getId() %> ">
               
            </div>
            <div class="form-group">
                <label for="class">Class :</label>
                <input type="text" id="class" name="classs" class="form-control" placeholder="Enter Your Class" value=" <%= st.getClasss() %> ">
            </div>
            <div class="form-group">
                <label for="age">Age :</label>
                <input type="text" id="age" name="age" class="form-control" placeholder="Enter Your Age" value=" <%= st.getAge() %> ">
            </div>
            <div class="form-group">
                 <label for="Gender">Gender :</label><br>
                 <input type="radio" name="gender" value="Male" <%= "Male".equals(st.getGender()) ? "checked" : "" %> />
                 <label><i>Male</i></label>
                 <input type="radio" name="gender" value="Female" <%= "Female".equals(st.getGender()) ? "checked" : "" %>/>
                 <label><i>Female</i></label>
           	</div>
            <div class="form-group">
                <label for="address">Address :</label>
                <input type="text" id="address" name="address" class="form-control" placeholder="Enter Your Address" value=" <%= st.getAddress() %>">
            </div>
            <div class="form-group">
                <label for="mobile">Phone No :</label>
                <input type="text" id="mobile" name="mobile" class="form-control" placeholder="Enter Your Mobile Number" value=" <%= st.getMobile() %>">
            </div>
            <button type="submit" class="btn btn-custom">SUBMIT</button>
        </form>
    </div>
    <%if(message != null){ %>
    <script type="text/javascript">
	    Swal.fire({
	        title: 'Success!',
	        text: '<%= message %>',
	        icon: 'success',
	        confirmButtonText: 'OK'
	    });
    </script>
    <% ses.removeAttribute("alert");
    } %>
</body>
</html>