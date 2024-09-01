package com.studentproject;

import java.io.IOException;
import java.io.PrintWriter;

import org.apache.catalina.connector.Response;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/add_student")
public class AddStudentServelet extends HttpServlet{
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String name = req.getParameter("name");
		String classs = req.getParameter("classs");
		int age = Integer.parseInt(req.getParameter("age"));
		String gender = req.getParameter("gender");
		String address = req.getParameter("address");
		String mobile = req.getParameter("mobile");
		
		
		PrintWriter out = res.getWriter();
//		out.println("Name is "+ name + classs+ age+ gender+address+mobile);
		
		AddStudent st = new AddStudent();
		
		st.setName(name);
		st.setClasss(classs);
		st.setAge(age);
		st.setGender(gender);
		st.setAddress(address);
		st.setMobile(mobile);
		
		int result = StudentDAO.saveData(st);
		HttpSession session = req.getSession();

		if(result > 0) {
			session.setAttribute("alert", "Successfully Added Student");
			res.sendRedirect("addStudent.jsp");
		}else {
            session.setAttribute("alert", "Failed to add student.");
		}


		
	}

}
