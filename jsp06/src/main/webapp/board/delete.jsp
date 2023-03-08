<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String idx = request.getParameter("idx");
    %>
<%@ include file="../include/header.jsp" %>
	<form action="deleteProcess.jsp" method="POST">
		<!-- 데이터는 보내지는데 화면에는 출력이 안됨 -->
		<input type="hidden" name="idx" value="<%=idx%>">
		<input type="password" name="userPW">
		<div>
			<button>삭제</button>
			<button type="reset">취소</button>
			<a href="list.jsp">목록</a>
		</div>
	</form>
<%@ include file="../include/footer.jsp" %>