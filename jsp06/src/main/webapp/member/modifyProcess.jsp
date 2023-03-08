<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.net.ConnectException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    request.setCharacterEncoding("UTF-8");
	String userID = (String)session.getAttribute("userId");
	String userPW = request.getParameter("userPW");
	String userName = request.getParameter("userName");
	String userEmail = request.getParameter("userEmail");
	String userHp = request.getParameter("userHp");
	int userZipcode = 
	Integer.parseInt(request.getParameter("userZipcode"));
	String userAddr01 = request.getParameter("userAddr01");
	String userAddr02 = request.getParameter("userAddr02");
	String userAddr03 = request.getParameter("userAddr03");
	String address =  userAddr01 + userAddr02 + userAddr03;
	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "BUNNY29";
	String pw = "1234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String sql = "UPDATE MEMBER02 SET USERNAME = ?, USEREMAIL = ?, USERHP = ?, USERZIPCODE = ?, ADDRESS = ?"
			+ "WHERE USERID = ? AND USERPW = ?";
	
	try {
		//1. 드라이버 찾기
		Class.forName(driver);
		//2. db 연결
		conn = DriverManager.getConnection(url, id, pw);
		// 쿼리 날리기.
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,userName);
		pstmt.setString(2,userEmail);
		pstmt.setString(3,userHp);
		pstmt.setInt(4,userZipcode);
		pstmt.setString(5,address);	
		pstmt.setString(6, userID);
		pstmt.setString(7, userPW);
		
		int result = pstmt.executeUpdate();
		if(result > 0 ) {
			//response.sendRedirect("list.jsp");
			out.println("<script>alert('정보 수정이 완료되었습니다.');location.href='index.jsp'</script>");
		} else {
			out.println("<script>alert('다시 확인해 주세요.');</script>");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if(pstmt!=null) pstmt.close();
		if(conn!=null) conn.close();
	}
	
    %>