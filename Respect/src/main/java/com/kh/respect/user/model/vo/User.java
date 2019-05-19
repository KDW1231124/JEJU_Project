package com.kh.respect.user.model.vo;

import java.sql.Date;

public class User {
	private String userId;
	private String password;
	private String nickName;
	private Date birth;
	private String gender;
	private String email;
	private int emailCheck;
	private String emailHash;
	private Date joinDate;
	private String picture;
	private int userLevel;
	private int leaveFlag;
	private int noReadMessage;
	public User() {
		
	}
	public User(String userId, String password, String nickName, Date birth, String gender, String email,
			int emailCheck, String emailHash, Date joinDate, String picture, int userLevel, int leaveFlag,
			int noReadMessage) {
		super();
		this.userId = userId;
		this.password = password;
		this.nickName = nickName;
		this.birth = birth;
		this.gender = gender;
		this.email = email;
		this.emailCheck = emailCheck;
		this.emailHash = emailHash;
		this.joinDate = joinDate;
		this.picture = picture;
		this.userLevel = userLevel;
		this.leaveFlag = leaveFlag;
		this.noReadMessage = noReadMessage;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getEmailCheck() {
		return emailCheck;
	}
	public void setEmailCheck(int emailCheck) {
		this.emailCheck = emailCheck;
	}
	public String getEmailHash() {
		return emailHash;
	}
	public void setEmailHash(String emailHash) {
		this.emailHash = emailHash;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public int getUserLevel() {
		return userLevel;
	}
	public void setUserLevel(int userLevel) {
		this.userLevel = userLevel;
	}
	public int getLeaveFlag() {
		return leaveFlag;
	}
	public void setLeaveFlag(int leaveFlag) {
		this.leaveFlag = leaveFlag;
	}
	public int getNoReadMessage() {
		return noReadMessage;
	}
	public void setNoReadMessage(int noReadMessage) {
		this.noReadMessage = noReadMessage;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", password=" + password + ", nickName=" + nickName + ", birth=" + birth
				+ ", gender=" + gender + ", email=" + email + ", emailCheck=" + emailCheck + ", emailHash=" + emailHash
				+ ", joinDate=" + joinDate + ", picture=" + picture + ", userLevel=" + userLevel + ", leaveFlag="
				+ leaveFlag + ", noReadMessage=" + noReadMessage + "]";
	}

	

	
	
}


