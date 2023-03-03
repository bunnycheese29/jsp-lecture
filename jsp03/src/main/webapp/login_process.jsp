<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
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
	
	String sql = "SELECT * FROM MEMBER WHERE USERID = ? AND USERPW = ?";
	
	Class.forName(driver);
	conn = DriverManager.getConnection(url, id, pw);
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userID);
	pstmt.setString(2, userPW);
	pstmt.executeQuery(); //executeUpdate는 int를 리턴 query는 select의 결과를 리턴
	rs = pstmt.executeQuery();
	//다음줄을 읽어라
	if(rs.next()){
		String _userID = rs.getString("USERID");
		String _userPW = rs.getString("USERPW");
		String _userName = rs.getString("userName");
		session.setAttribute("name",_userName);
		response.sendRedirect("login_ok.jsp");
		//System.out.println(_userID + "===" + _userPW);
	} else {
		out.println("<script>alert('아이디 또는 패스워드를 확인해주세요.');history.back()</script>");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>