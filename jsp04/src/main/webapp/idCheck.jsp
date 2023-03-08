<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("UTF-8");
String userID = request.getParameter("userID");

String driver = "oracle.jdbc.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String id = "BUNNY29";
String pw = "1234";

Connection conn = null;
PreparedStatement pstmt = null;
//SELECT문 -> ResultSet rs = null 만들고 pstmt.executeQuery();
ResultSet rs = null;

String sql = "SELECT COUNT(*) AS COUNT FROM MEMBER02 WHERE USERID = ?";
int result = 0;

try {
	//1. 드라이버 찾기
	Class.forName(driver);
	//2. db 연결
	conn = DriverManager.getConnection(url, id, pw);
	// 쿼리 날리기.
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,userID);	
	
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		result = rs.getInt("COUNT");
		System.out.println(result);
		out.println(result);
	}
	
} catch (Exception e) {
	e.printStackTrace();
} finally {
	if(pstmt!=null) pstmt.close();
	if(conn!=null) conn.close();
}
%>