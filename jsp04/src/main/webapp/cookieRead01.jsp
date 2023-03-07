<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>클라이언트에서 넘어온 쿠키 읽어보기</h1>
	<%
		Cookie cookies[] = request.getCookies();
	if(cookies != null){
		for(int i=0;i<cookies.length;i++){
			String cookieName = cookies[i].getName();
			String cookieValue = cookies[i].getValue();
			out.println(cookieName + "===" + cookieValue + "<br>");
		}
	}
	%>
</body>
</html>