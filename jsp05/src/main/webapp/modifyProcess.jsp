<%@page import="com.bunny.utils.ScriptWriter"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 
    	request.setCharacterEncoding("UTF-8");
    	String userPW = request.getParameter("userPW");
    	String contents = request.getParameter("contents");
    	String idx = request.getParameter("idx");
    	
    	String driver = "oracle.jdbc.OracleDriver";
    	String url = "jdbc:oracle:thin:@localhost:1521:xe";
    	String id = "BUNNY29";
    	String pw = "1234";
    	
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	
    	String sql = "UPDATE BOARD SET " 
    			+"CONTENTS=? WHERE USERPW =? AND NO =?";
    	
    	
    	try {
    		//1. 드라이버 찾기
    		Class.forName(driver);
    		//2. db 연결
    		conn = DriverManager.getConnection(url, id, pw);
    		// 쿼리 날리기.
    		pstmt = conn.prepareStatement(sql);
   			pstmt.setString(1, contents);
    		pstmt.setString(2, userPW);
    		pstmt.setString(3,idx);
    		
    		
    		int result = pstmt.executeUpdate();
    		if(result > 0 ) {
    			ScriptWriter.alertAndNext(response, "글이 수정 되었습니다.", "list.jsp");
    			
    		} else {
    			ScriptWriter.alertAndBack(response, "서버 오류입니다. 잠시 후 다시 시도해 주시길 바랍니다.");
    		}
    	} catch (Exception e) {
    		e.printStackTrace();
    	} finally {
    		if(pstmt!=null) pstmt.close();
    		if(conn!=null) conn.close();
    	}
    	
        
    %>