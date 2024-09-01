package com.studentproject;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/display_student")
public class DisplayStudentDataServelet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	List<AddStudent> s = StudentDAO.displyaData();
		
	  RequestDispatcher red = request.getRequestDispatcher("/display.jsp");
	  request.setAttribute("data", s);
	  red.forward(request, response);
	  
	}	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  
		String search = request.getParameter("search");
	List<AddStudent> st = StudentDAO.searchName(search);

	  RequestDispatcher red = request.getRequestDispatcher("/display.jsp");
	  request.setAttribute("data", st);
	  red.forward(request, response);
	  
	}	

}
