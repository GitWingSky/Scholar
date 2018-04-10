package com.etc.entity;

import java.util.Date;

// 实体类,私信

public class PrivateMessage {
	
	private int privateMessageId;
	private User user;
	private User targetUser;
	private Boolean readed;
	private Date privateMessageTime;
	private String privateMessageContent;
	
	public int getPrivateMessageId() {
		return privateMessageId;
	}
	public void setPrivateMessageId(int privateMessageId) {
		this.privateMessageId = privateMessageId;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public User getTargetUser() {
		return targetUser;
	}
	public void setTargetUser(User targetUser) {
		this.targetUser = targetUser;
	}
	public Boolean getReaded() {
		return readed;
	}
	public void setReaded(Boolean readed) {
		this.readed = readed;
	}
	public Date getPrivateMessageTime() {
		return privateMessageTime;
	}
	public void setPrivateMessageTime(Date privateMessageTime) {
		this.privateMessageTime = privateMessageTime;
	}
	public String getPrivateMessageContent() {
		return privateMessageContent;
	}
	public void setPrivateMessageContent(String privateMessageContent) {
		this.privateMessageContent = privateMessageContent;
	}
	
	@Override
	public String toString() {
		return "PrivateMessage [privateMessageId=" + privateMessageId + ", user=" + user + ", targetUser=" + targetUser
				+ ", readed=" + readed + ", privateMessageTime=" + privateMessageTime + ", privateMessageContent="
				+ privateMessageContent + "]";
	}
}
