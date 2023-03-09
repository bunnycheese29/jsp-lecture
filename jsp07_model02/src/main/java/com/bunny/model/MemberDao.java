//Dao = data access object

package com.bunny.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDao {
	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "BUNNY29";
	String pw = "1234";

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public void getConnection() throws SQLException {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, id, pw);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// crud 작성
	public int insertMember(MemberDto memberDto) {
		int result = 0;
		try {
			getConnection();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
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

	public MemberDto getMemberInfo(String userId) {
		MemberDto memberDto = new MemberDto();
			String sql = "SELECT * FROM MEMBER02 WHERE USERID = ?";
			try {
				getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				memberDto.setUserId(rs.getString("userId"));
				memberDto.setUserName(rs.getString("userName"));
				memberDto.setUserHp(rs.getString("userHp"));
				memberDto.setUserEmail(rs.getString("userEmail"));
				memberDto.setUserZipcode(rs.getInt("userZipcode"));
				memberDto.setAddress(rs.getString("address"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return memberDto;
	}

	public MemberDto getLoggedMemberInfo(MemberDto memberDto) {
		MemberDto loggedMemberInfo = null;
		try {
			getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String sql = "SELECT * FROM MEMBER02 WHERE USERID = ? AND USERPW = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberDto.getUserId());
			pstmt.setString(2, memberDto.getUserPw());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				loggedMemberInfo = new MemberDto();
				loggedMemberInfo.setUserId(rs.getString("userId"));
				loggedMemberInfo.setUserName(rs.getString("userName"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return loggedMemberInfo;
		
	}
}
