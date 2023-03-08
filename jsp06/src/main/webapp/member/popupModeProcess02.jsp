<%@page import="com.bunny.utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
   <% 
   	String sevenDay = request.getParameter("sevenDay");
    if(sevenDay!=null && sevenDay.equals("1")) {
   	CookieManager.makeCookie(response, "popupCookie02", "off", 60*60*24*7);
    }
   %>