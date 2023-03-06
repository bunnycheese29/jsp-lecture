<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String loggedUserName = (String)session.getAttribute("userName");
	String loggedUserID = (String)session.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>회원가입</title>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="./js/jquery-3.6.3.min.js"></script>
  </head>
  <body>
    <header id="header" class="header">
      <h1 id="logo">
        <a href="">BUNNY'S MEDIA LAB</a>
      </h1>
      <nav id="gnb">
        <h2 class="blind">global navigation</h2>
        <% if(loggedUserID==null) { %>
        <ul class="list">
          <li><a href="join.jsp">회원가입</a></li>
          <li><a href="login.jsp">로그인</a></li>
        </ul>
        <% } else { %>
        
        <ul class="list">
          <li><a href="info.jsp"><%=loggedUserName %>님</a></li>
          <li><a href="logout.jsp">로그아웃</a></li>
        </ul>
       <%  } %>
      </nav>
    </header>