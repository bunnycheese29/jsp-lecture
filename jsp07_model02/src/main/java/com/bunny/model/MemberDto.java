//Dto = data transfer object

package com.bunny.model;

//변수들 적고 Source > Generate Constructor using Fields > Getter Setter > 선택 안 하고 또 만들기(생성자) > ToString
public class MemberDto {
	private int no;
	private String userId;
	private String userPw;
	private String userName;
	private String userHp;
	private String userEmail;
	private int userZipcode;
	private String address;
	private String regDate;
	
	
	
	public MemberDto() {
		super();
	}

	public MemberDto(int no, String userId, String userPw, String userName, String userHp, String userEmail,
			int userZipcode, String address, String regDate) {
		super();
		this.no = no;
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userHp = userHp;
		this.userEmail = userEmail;
		this.userZipcode = userZipcode;
		this.address = address;
		this.regDate = regDate;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserHp() {
		return userHp;
	}
	public void setUserHp(String userHp) {
		this.userHp = userHp;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public int getUserZipcode() {
		return userZipcode;
	}
	public void setUserZipcode(int userZipcode) {
		this.userZipcode = userZipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "MemberDto [no=" + no + ", userId=" + userId + ", userPw=" + userPw + ", userName=" + userName
				+ ", userHp=" + userHp + ", userEmail=" + userEmail + ", userZipcode=" + userZipcode + ", address="
				+ address + ", regDate=" + regDate + "]";
	}
	
	
}
