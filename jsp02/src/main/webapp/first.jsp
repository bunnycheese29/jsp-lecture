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
		pageContext.setAttribute("name", "나는 pageContext"); // 단일 페이지에서만 유지
		request.setAttribute("name", "나는 pageRequest"); // forward로 넘기면 유지 (많이 쓰임)
		session.setAttribute("name", "나는 session"); // session이 끊기지 않으면 유지 (많이 쓰임)
		application.setAttribute("name", "나는 application"); // 서버 종료시까지 유지
		
		out.println("====scope first===="+"<br>");
		out.println("pageContext==="+pageContext.getAttribute("name")+"<br>");
		out.println("request==="+request.getAttribute("name")+"<br>");
		out.println("session==="+session.getAttribute("name")+"<br>");
		out.println("application==="+application.getAttribute("name")+"<br>");
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("second.jsp");
		dispatcher.forward(request, response);
	%>
</body>
</html>