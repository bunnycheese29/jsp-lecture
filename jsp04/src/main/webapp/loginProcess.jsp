<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = request.getParameter("userID");
	String userPW = request.getParameter("userPW");
	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "BUNNY29";
	String pw = "1234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "SELECT * FROM MEMBER02 WHERE USERID = ? AND USERPW = ?";
	
	try {
		//1. 드라이버 찾기
		Class.forName(driver);
		//2. db 연결
		conn = DriverManager.getConnection(url, id, pw);
		// 쿼리 날리기.
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,userID);
		pstmt.setString(2,userPW);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			//response.sendRedirect("list.jsp");
			//로그인 해도 값이 남아있게 session으로 유지
			//("key", value), 키는 내가 정하는 이름, value는 object 
			String userName = rs.getString("USERNAME");
			String userId = rs.getString("USERID");
			session.setAttribute("userName", userName);
			session.setAttribute("userId", userID);
			response.sendRedirect("index.jsp");
			//out.println("<script>alert('"+userName+"님 로그인 되었습니다.');</script>");
		} else {
			out.println("<script>alert('아이디 혹은 비밀번호를 확인해 주세요.'); history.back();</script>");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if(pstmt!=null) pstmt.close();
		if(conn!=null) conn.close();
	}
	
	
%>