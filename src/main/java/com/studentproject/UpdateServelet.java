package com.studentproject;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/updateStudent")
public class UpdateServelet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		 AddStudent s = StudentDAO.updateStudent(id);
		  RequestDispatcher red = request.getRequestDispatcher("updateStudent.jsp");
		  request.setAttribute("data", s);
		  red.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String name = req.getParameter("name");
		String classs = req.getParameter("classs");
		String gender = req.getParameter("gender");
		String address = req.getParameter("address");
		String mobile = req.getParameter("mobile");
		int age = Integer.parseInt(req.getParameter("age").trim());
		int id =Integer.parseInt(req.getParameter("id").trim()) ;
		
		
		PrintWriter out = res.getWriter();
		
		AddStudent st = new AddStudent();
		
		st.setName(name);
		st.setClasss(classs);
		st.setAge(age);
		st.setGender(gender);
		st.setAddress(address);
		st.setMobile(mobile);
		st.setId(id);
		
		int result = StudentDAO.updateById(st);
		HttpSession session = req.getSession();
		if(result > 0) {
			session.setAttribute("alert", "Student Update Successfully");
			res.sendRedirect("updateStudent.jsp");
		}else {
			out.println("Data Not Loaded Properly");
		}
		
	}
	
	

}
