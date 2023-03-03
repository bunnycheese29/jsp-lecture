<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method='POST' action='login_ok_forward.jsp'>
		<div><input type='text' name='userID'></div>
		<div><input type='password' name='userPW'></div>
		<div>
			<button type='submit'>로그인</button>
			<button type='reset'>취소</button>
		</div>
	</form>
</body>
</html>