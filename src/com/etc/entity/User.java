package com.etc.entity;

import java.util.Date;

// 实体类,用户

public class User {
	
	private int userId;
	private String userUsername;
	private String userPassword;
	private String userType;
	private String userName;
	private String userSex;
	private int userAge;
	private Date userBirthday;
	private String userPhone;
	private String userEmail;
	private String userSchool;
	private String userAddress;
	private String userIntroduction;
	private String userPictureUrl;
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserUsername() {
		return userUsername;
	}
	public void setUserUsername(String userUsername) {
		this.userUsername = userUsername;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserSex() {
		return userSex;
	}
	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}
	public int getUserAge() {
		return userAge;
	}
	public void setUserAge(int userAge) {
		this.userAge = userAge;
	}
	public Date getUserBirthday() {
		return userBirthday;
	}
	public void setUserBirthday(Date userBirthday) {
		this.userBirthday = userBirthday;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserSchool() {
		return userSchool;
	}
	public void setUserSchool(String userSchool) {
		this.userSchool = userSchool;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getUserIntroduction() {
		return userIntroduction;
	}
	public void setUserIntroduction(String userIntroduction) {
		this.userIntroduction = userIntroduction;
	}
	public String getUserPictureUrl() {
		return userPictureUrl;
	}
	public void setUserPictureUrl(String userPictureUrl) {
		this.userPictureUrl = userPictureUrl;
	}
	
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userUsername=" + userUsername + ", userPassword=" + userPassword
				+ ", userType=" + userType + ", userName=" + userName + ", userSex=" + userSex + ", userAge=" + userAge
				+ ", userBirthday=" + userBirthday + ", userPhone=" + userPhone + ", userEmail=" + userEmail
				+ ", userSchool=" + userSchool + ", userAddress=" + userAddress + ", userIntroduction="
				+ userIntroduction + ", userPictureUrl=" + userPictureUrl + "]";
	}
}
