package com.etc.entity;

import java.util.Date;

// 实体类,作业

public class Homework {
	
	private int homeworkId;
	private Lesson lesson;
	private String homeworkName;
	private String homeworkContent;
	private Date homeworkStartTime;
	private Date homeworkEndTime;
	
	public int getHomeworkId() {
		return homeworkId;
	}
	public void setHomeworkId(int homeworkId) {
		this.homeworkId = homeworkId;
	}
	public Lesson getLesson() {
		return lesson;
	}
	public void setLesson(Lesson lesson) {
		this.lesson = lesson;
	}
	public String getHomeworkName() {
		return homeworkName;
	}
	public void setHomeworkName(String homeworkName) {
		this.homeworkName = homeworkName;
	}
	public String getHomeworkContent() {
		return homeworkContent;
	}
	public void setHomeworkContent(String homeworkContent) {
		this.homeworkContent = homeworkContent;
	}
	public Date getHomeworkStartTime() {
		return homeworkStartTime;
	}
	public void setHomeworkStartTime(Date homeworkStartTime) {
		this.homeworkStartTime = homeworkStartTime;
	}
	public Date getHomeworkEndTime() {
		return homeworkEndTime;
	}
	public void setHomeworkEndTime(Date homeworkEndTime) {
		this.homeworkEndTime = homeworkEndTime;
	}
	
	@Override
	public String toString() {
		return "Homework [homeworkId=" + homeworkId + ", lesson=" + lesson + ", homeworkName=" + homeworkName
				+ ", homeworkContent=" + homeworkContent + ", homeworkStartTime=" + homeworkStartTime
				+ ", homeworkEndTime=" + homeworkEndTime + "]";
	}
}
