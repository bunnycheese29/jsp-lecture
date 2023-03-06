<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//driver 찾아서 db 연결
//sql 날리기
//결과 확인
String userID = request.getParameter("userID");
String userPW = request.getParameter("userPW");

String driver = "oracle.jdbc.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String id = "BUNNY29";
String pw = "1234";

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String sql = "SELECT * FROM MEMBER";

Class.forName(driver);
conn = DriverManager.getConnection(url, id, pw);
pstmt = conn.prepareStatement(sql);
pstmt.executeQuery(); //executeUpdate는 int를 리턴 query는 select의 결과를 리턴
rs = pstmt.executeQuery();
//다음줄을 읽어라
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
		while (rs.next()) {
			out.println("<li>"
					+ "<dl><dt>ID</dt><dd>"+rs.getString("USERID")+"</dd></dl>"
					+ "<dl><dt>PW</dt><dd>"+rs.getString("USERPW")+"</dd></dl>"
					+ "<dl><dt>NAME</dt><dd>"+rs.getString("USERNAME")+"</dd></dl>"
					+ "<dl><dt>GENDER</dt><dd>"+rs.getString("GENDER")+"</dd></dl>"
					+ "<dl><dt>GRADE</dt><dd>"+rs.getString("GRADE")+"</dd></dl>"
					);
			out.println("</ln>");
		}
		%>
	</ul>
</body>
</html>