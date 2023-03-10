package com.bunny.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/logout")
public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public LogoutController() {
        super();
    }


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		session.invalidate();
		response.sendRedirect("../index/");
		*/
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/member/logout.jsp");
		dispatcher.forward(request, response);
	}

	
}
