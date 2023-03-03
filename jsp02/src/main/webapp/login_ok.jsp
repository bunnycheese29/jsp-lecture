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
	<!--jsp 내장 객체 (out, request, response)-->
	<%
		String userID = request.getParameter("userID");
		String userPW = request.getParameter("userPW");
		String userName = "토끼";
		if(userID.equals("bunnycheese") && userPW.equals("1234")) {
			response.sendRedirect("login_success.jsp?userName="+ URLEncoder.encode(userName, "UTF-8"));
		} else {
			out.println("<script>alert('아이디와 패스워드를 확인해 주세요.');history.back();</script>");
		}
		
		out.println("id===" +userID+" , pw=="+userPW);
		
		//db에서 값을 비교해서 일치하면 다른 페이지로 보내주기, 그렇지 않으면 경고창 띄우기
	%>
</body>
</html>