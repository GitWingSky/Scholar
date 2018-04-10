package com.etc.entity;

// 实体类,用户关注关系,用于记录和关联用户之间的关注

public class UserFocusRelation {
	
	private int userFocusRelationId;
	private User user;
	private User targetUser;
	
	public int getUserFocusRelationId() {
		return userFocusRelationId;
	}
	public void setUserFocusRelationId(int userFocusRelationId) {
		this.userFocusRelationId = userFocusRelationId;
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
	
	@Override
	public String toString() {
		return "UserFocusRelation [userFocusRelationId=" + userFocusRelationId + ", user=" + user + ", targetUser="
				+ targetUser + "]";
	}
}
