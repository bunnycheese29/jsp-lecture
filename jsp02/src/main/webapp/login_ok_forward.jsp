<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String userID = request.getParameter("userID");
	String userPW = request.getParameter("userPW");
	String userName = "토끼";
	
	
	if (userID.equals("bunnycheese") && userPW.equals("1234")) {
		request.setAttribute("userName", "토끼");
		request.setAttribute("userAge", 20);
		
		//출력 페이지
		RequestDispatcher dispatcher =  request.getRequestDispatcher("login_success_forward.jsp");
		dispatcher.forward(request, response);
	} else {
		out.println("<script>alert('아이디와 패스워드를 확인해 주세요.');history.back();</script>");
	}
	%>
</body>
</html>