package com.bunny.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bunny.utils.ScriptWriter;

public class MemberDao {
	//crud method
	//create
	
	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "BUNNY29";
	String pw = "1234";

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private void getConnection() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, id, pw);
			System.out.println("db연결 성공");
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
	}
	
	private void close() {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
	}
	
	public int insertMember(MemberDto memberDto) {
		int result = 0;
		getConnection();
		String sql = "INSERT INTO MEMBER02 VALUES(MEMBER02_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, SYSDATE)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberDto.getUserId());
			pstmt.setString(2, memberDto.getUserPw());
			pstmt.setString(3, memberDto.getUserName());
			pstmt.setString(4, memberDto.getUserEmail());
			pstmt.setString(5, memberDto.getUserHp());
			pstmt.setInt(6, memberDto.getUserZipcode());
			pstmt.setString(7, memberDto.getAddress());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	public MemberDto getLoggedMember(MemberDto memberDto) {
		MemberDto loggedMember = null;
		getConnection();
		String sql = "SELECT * FROM MEMBER02 WHERE USERID = ? AND USERPW = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberDto.getUserId());
			pstmt.setString(2, memberDto.getUserPw());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				loggedMember = new MemberDto();
				loggedMember.setUserId(rs.getString("userId"));
				loggedMember.setUserName(rs.getString("userName"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return loggedMember;
	}
	public MemberDto getLoggedMember(String userId, String userPw) {
		MemberDto loggedMember = null;
		getConnection();
		String sql = "SELECT * FROM MEMBER02 WHERE USERID = ? AND USERPW = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPw);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				loggedMember = new MemberDto();
				loggedMember.setUserId(rs.getString("userId"));
				loggedMember.setUserName(rs.getString("userName"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return loggedMember;
	}

	public int idCheck(String userId) {
		int result = 0;
		getConnection();
		String sql = "SELECT COUNT(*) AS COUNT FROM MEMBER02 WHERE USERID=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("COUNT");
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	//session으로 담은 userId를 넣어서 뿌리기
	public MemberDto getInfo(String userId) {
		MemberDto memberInfo = null;
		getConnection();
		String sql = "SELECT * FROM MEMBER02 WHERE USERID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				memberInfo = new MemberDto();
				memberInfo.setUserId(rs.getString("userId"));
				memberInfo.setUserName(rs.getString("userName"));
				memberInfo.setUserEmail(rs.getString("userEmail"));
				memberInfo.setUserHp(rs.getString("userHp"));
				memberInfo.setUserZipcode(Integer.parseInt(rs.getString("userZipcode")));
				memberInfo.setAddress(rs.getString("address"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return memberInfo;
	}
	
	public int deleteInfo(String userId, String userPw) {
		int result = 0;
		getConnection();
		System.out.println("delete");
		String sql = "DELETE FROM MEMBER02 WHERE USERID = ? AND USERPW = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPw);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
		
	}
}
