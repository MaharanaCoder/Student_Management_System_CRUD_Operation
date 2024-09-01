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
	String message =(String) ses.getAttribute("alert");
	
%>
	 <div class="container form-container">
        <h1 class="form-title text-center">Add Student Details</h1>
        <form action="add_student" method="post">
            <div class="form-group">
                <label for="name">Name :</label>
                <input type="text" id="name" name="name" class="form-control" placeholder="Enter Your Name">
            </div>
            <div class="form-group">
                <label for="class">Class :</label>
                <input type="text" id="class" name="classs" class="form-control" placeholder="Enter Your Class">
            </div>
            <div class="form-group">
                <label for="age">Age :</label>
                <input type="number" id="age" name="age" class="form-control" placeholder="Enter Your Age">
            </div>
            <div class="form-group">
                 <label for="Gender">Gender :</label><br>
                 <input type="radio" name="gender" value="Male" />
                 <label><i>Male</i></label>
                 <input type="radio" name="gender" value="Female" />
                 <label><i>Female</i></label>
           	</div>
            <div class="form-group">
                <label for="address">Address :</label>
                <input type="text" id="address" name="address" class="form-control" placeholder="Enter Your Address">
            </div>
            <div class="form-group">
                <label for="mobile">Phone No :</label>
                <input type="text" id="mobile" name="mobile" class="form-control" placeholder="Enter Your Mobile Number">
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
    <%         ses.removeAttribute("alert");

    	} %>
</body>
</html>