package jsp01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Add")

public class Add extends HttpServlet{
	public Add() {
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int num01 = Integer.parseInt(request.getParameter("num01"));
		int num02 = Integer.parseInt(request.getParameter("num02"));
		int sum = num01 + num02;
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'>");
		out.println("<title>Insert title here</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<p>hello jsp</p>");
		out.println(num01 + "+" + num02+ "=" + sum);
		out.println("</body>");
		out.println("</html>");
	}
}
