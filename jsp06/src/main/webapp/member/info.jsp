<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
	
<%

String driver = "oracle.jdbc.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String id = "BUNNY29";
String pw = "1234";

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String sql = "SELECT * FROM MEMBER02 WHERE USERID = ?";
String userID = (String)session.getAttribute("userId");
String userName = null;
String userEmail = null;
String userHp = null;
int userZipcode = 0;
String address = null;


try {
		//1. 드라이버 찾기
		Class.forName(driver);
		//2. db 연결
		conn = DriverManager.getConnection(url, id, pw);
		// 쿼리 날리기.
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,userID);
		rs = pstmt.executeQuery();
		while(rs.next()){
			userName = rs.getString("USERNAME");
			userEmail = rs.getString("USEREMAIL");
			userHp = rs.getString("USERHP");
			userZipcode = rs.getInt("USERZIPCODE");
			address = rs.getString("ADDRESS");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if(pstmt!=null) pstmt.close();
		if(conn!=null) conn.close();
	}
%>
	 <table>
            <colgroup>
                <col style="width:20%">
                <col style="width:80%">
            </colgroup>
            <tbody>
                <tr>
                
                    <th>아이디</th>
                    <td>
                        <p><%= userID %></p>
                    </td>
                </tr>
                <tr>
                    <th>이름</th>
                    <td>
                       <p><%= userName %></p>
                    </td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td>
                        <p><%= userEmail %></p>
                    </td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td>
                        <p><%= userHp %></p>
                    </td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td>
                       <div><span><%= userZipcode %></span></div> 
                       <div><span><%= address %></span></div>
                    </td>
                </tr>
            </tbody>
        </table>
        <div>
        	<a href="modify.jsp">회원정보 수정</a>
        	<a href="delete.jsp">회원정보 탈퇴</a>
        </div>
<%@ include file="../include/footer.jsp" %>