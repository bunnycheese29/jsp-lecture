<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String num = request.getParameter("oneday");
	System.out.println(num);
	if(num !=null && num.equals("1")){
		Cookie popupCookie = new Cookie("popupCookie", "off");
		popupCookie.setPath(request.getContextPath());
		popupCookie.setMaxAge(60*60*24);
		response.addCookie(popupCookie);
		System.out.println("쿠키 구워짐");
	};
%>