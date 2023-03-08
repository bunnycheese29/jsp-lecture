<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
	String idx = request.getParameter("idx");
    %>
    
    <%
    String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "BUNNY29";
	String pw = "1234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "SELECT * FROM BOARD ORDER BY NO DESC";
	
	try {
	Class.forName(driver);
	conn = DriverManager.getConnection(url, id, pw);
	pstmt  = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	%>
	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
<ul>
<%
	while(rs.next()) {
		out.println("<li>");
		out.println("<span>" + rs.getInt("no") + "</span>");
		out.println("<span><a href='view.jsp?idx="+rs.getInt("no")+"'>" + rs.getString("subject") + "</a></span>");
		out.println("<span>" + rs.getString("userName") + "</span>");
		out.println("<span>" + rs.getString("regdate") + "</span>");
		out.println("</li>");
		
	}
%>	
</ul>
<div>
	<a href="write.jsp">글쓰기</a>
</div>
</body>
</html>
<%	
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if(rs!=null) rs.close();
		if(pstmt!=null) pstmt.close();
		if(conn!=null) conn.close();
	}
    %>