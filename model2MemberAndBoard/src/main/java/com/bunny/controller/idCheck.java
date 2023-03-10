package com.bunny.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bunny.model.MemberDao;
import com.google.gson.Gson;

@WebServlet("/member/idCheck")
public class idCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public idCheck() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDao memberDao = new MemberDao();
		String userId = request.getParameter("userId");
		int result = memberDao.idCheck(userId);
		
		Map<String, Integer> resultMap = new HashMap<>();
		resultMap.put("count", result); //{count:0}
		Gson gson = new Gson();
		String resultJson = (String) gson.toJson(resultMap);
		
		request.setAttribute("result", resultJson);
		
		RequestDispatcher dispatcher =  request.getRequestDispatcher("/WEB-INF/member/idCheck.jsp");
		dispatcher.forward(request, response);
	}

	
}
