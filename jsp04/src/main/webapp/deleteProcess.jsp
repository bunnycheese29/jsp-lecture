<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   request.setCharacterEncoding("UTF-8");
   String driver = "oracle.jdbc.OracleDriver";
   String url = "jdbc:oracle:thin:@localhost:1521:xe";
   String id = "BUNNY29";
   String pw = "1234";

   Connection conn = null;
   PreparedStatement pstmt = null;

   String sql = "DELETE FROM MEMBER02 WHERE USERID = ? AND USERPW = ?";
   String userID = (String)session.getAttribute("userId");
   String userPW = request.getParameter("userPW");
   
   try {
		//1. 드라이버 찾기
		Class.forName(driver);
		//2. db 연결
		conn = DriverManager.getConnection(url, id, pw);
		// 쿼리 날리기.
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,userID);
		pstmt.setString(2,userPW);
		
		int result = pstmt.executeUpdate();
		if(result > 0 ) {
			//response.sendRedirect("list.jsp");
			out.println("<script>alert('회원탈퇴가 완료 되었습니다.'); location.href='index.jsp';</script>");
			session.invalidate();
		} else {
			out.println("<script>alert('아이디와 비밀번호를 다시 입력해 주세요.'); history.back();</script>");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if(pstmt!=null) pstmt.close();
		if(conn!=null) conn.close();
	}
   %>
