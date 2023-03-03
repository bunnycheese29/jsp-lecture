<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<form method="GET" action="login_process.jsp">
	<div><h2>로그인</h2></div>
		<div><label><span>아이디</span><input type="text" name="userID"></label></div>
		<div><label><span>패스워드</span><input type="password" name="userPW"></label></div>
		<div><button>로그인</button><button type="reset">취소</button></div>
	</form>
</body>
</html>