<%@page import="com.bunny.utils.ScriptWriter"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <% 
  		 request.setCharacterEncoding("UTF-8");
   		String userPW = request.getParameter("userPW");
   		int idx = Integer.parseInt(request.getParameter("idx"));
   		
   		String driver = "oracle.jdbc.OracleDriver";
   		String url = "jdbc:oracle:thin:@localhost:1521:xe";
   		String id = "BUNNY29";
   		String pw = "1234";
   		
   		Connection conn = null;
   		PreparedStatement pstmt = null;
   		
   		String sql = "DELETE FROM BOARD WHERE NO = ? AND USERPW = ?";
   		
   		try {
   			Class.forName(driver);
   			conn = DriverManager.getConnection(url, id, pw);
   			pstmt = conn.prepareStatement(sql);
   			pstmt.setInt(1, idx);
   			pstmt.setString(2, userPW);
   			int result = pstmt.executeUpdate();
   			if(result > 0){
   				ScriptWriter.alertAndNext(response, "글이 삭제 되었습니다.", "list.jsp");
   				
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