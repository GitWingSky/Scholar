package com.etc.entity;

import java.util.Date;

// 实体类,留言

public class Message {
	
	private int messageId;
	private User user;
	private Lesson lesson;
	private User targetUser;
	private int floor;
	private Date messageTime;
	private String messageContent;
	
	public int getMessageId() {
		return messageId;
	}
	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Lesson getLesson() {
		return lesson;
	}
	public void setLesson(Lesson lesson) {
		this.lesson = lesson;
	}
	public User getTargetUser() {
		return targetUser;
	}
	public void setTargetUser(User targetUser) {
		this.targetUser = targetUser;
	}
	public int getFloor() {
		return floor;
	}
	public void setFloor(int floor) {
		this.floor = floor;
	}
	public Date getMessageTime() {
		return messageTime;
	}
	public void setMessageTime(Date messageTime) {
		this.messageTime = messageTime;
	}
	public String getMessageContent() {
		return messageContent;
	}
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}
	
	@Override
	public String toString() {
		return "Message [messageId=" + messageId + ", user=" + user + ", lesson=" + lesson + ", targetUser="
				+ targetUser + ", floor=" + floor + ", messageTime=" + messageTime + ", messageContent="
				+ messageContent + "]";
	}
}
