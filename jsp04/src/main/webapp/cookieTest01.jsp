<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>쿠키 테스트</h1>
	<%
		Cookie cookie = new Cookie("myCookie", "에이스");
		cookie.setPath(request.getContextPath());
		cookie.setMaxAge(60);
		response.addCookie(cookie);
		
		Cookie oreoCookie = new Cookie("myCookie02", "오레오");
		cookie.setPath(request.getContextPath());
		cookie.setMaxAge(60);
		response.addCookie(oreoCookie);
	%>
</body>
</html>