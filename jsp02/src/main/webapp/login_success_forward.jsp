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
	String userName = (String) request.getAttribute("userName"); //setAttribute > Object로 넘어옴
	int userAge = (int) request.getAttribute("userAge");
%>
	<h1><%= userName %>님 안녕하세요.</h1>
	<h1>당신의 나이는 <%= userAge %>입니다.</h1>
</body>
</html>