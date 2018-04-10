package com.etc.util;

import java.util.List;

import com.etc.entity.Message;

public class MessageUtil {
	private Message message;
	private List<Message> replyList;
	
	public Message getMessage() {
		return message;
	}
	public void setMessage(Message message) {
		this.message = message;
	}
	public List<Message> getReplyList() {
		return replyList;
	}
	public void setReplyList(List<Message> replyList) {
		this.replyList = replyList;
	}
	
	@Override
	public String toString() {
		return "MessageUtil [message=" + message + ", replyList=" + replyList + "]";
	}
}
