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
		String name = "장성호";
		int age = 20;
	%>
	<h1>Hello JSP</h1>
	<h1>헬로 JSP</h1>
	<h1><% out.println(name); %></h1>
	<h1><% out.println(age); %></h1>
	<h1><%= name %></h1>
	<h1><%= age %></h1>
</body>
</html>