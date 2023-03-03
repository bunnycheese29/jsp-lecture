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
	out.println("====scope third====" + "<br>");
	out.println("pageContext===" + pageContext.getAttribute("name") + "<br>");
	out.println("request===" + request.getAttribute("name") + "<br>");
	out.println("session===" + session.getAttribute("name") + "<br>");
	out.println("application===" + application.getAttribute("name") + "<br>");
	out.println("<a href='third.jsp'>third</a>");
	%>
</body>
</html>