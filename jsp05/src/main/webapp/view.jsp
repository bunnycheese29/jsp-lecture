<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String idx = request.getParameter("idx");
    
    System.out.println(idx);
    
    String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "BUNNY29";
	String pw = "1234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "SELECT * FROM BOARD WHERE NO = ?";
	
	String userName = null;
	String subject = null;
	String contents = null;
	String regDate = null;
	
	try{
	Class.forName(driver);
	conn = DriverManager.getConnection(url, id, pw);
	pstmt  = conn.prepareStatement(sql);
	pstmt.setString(1, idx);
	rs = pstmt.executeQuery();
	
	if(rs.next()) {
		userName = rs.getString("userName");
		subject = rs.getString("subject");
		contents = rs.getString("contents");
		regDate = rs.getString("regDate");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if(rs!=null) rs.close();
		if(pstmt!=null) pstmt.close();
		if(conn!=null) conn.close();
	}
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tbody>
			<tr>
				<th>제목</th>
				<td><%= subject %></td>
			</tr>
			<tr>
				<th>글쓴이</th>
				<td><%= userName %></td>
			</tr>
			<tr>
				<th>날짜</th>
				<td><%= regDate %></td>
			</tr>
			<tr>
				<th>내용</th>
				<td style="white-space:pre;"><%= contents %></td>
			</tr>
		</tbody>
	</table>
	<a href='write.jsp'>글쓰기</a>
	<a href='modify.jsp?idx=<%=idx %>'>수정</a>
	<a href='delete.jsp?idx=<%=idx %>'>삭제</a>
</body>
</html>