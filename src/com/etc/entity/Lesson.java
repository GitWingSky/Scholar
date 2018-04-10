package com.etc.entity;

// 实体类,课程

public class Lesson {
	
	private int lessonId;
	private User teacher;
	private Major major;
	private String lessonName;
	private String lessonIntroduction;
	private String lessonAnnouncement;
	private String lessonPictureUrl;
	
	public int getLessonId() {
		return lessonId;
	}
	public void setLessonId(int lessonId) {
		this.lessonId = lessonId;
	}
	public User getTeacher() {
		return teacher;
	}
	public void setTeacher(User teacher) {
		this.teacher = teacher;
	}
	public Major getMajor() {
		return major;
	}
	public void setMajor(Major major) {
		this.major = major;
	}
	public String getLessonName() {
		return lessonName;
	}
	public void setLessonName(String lessonName) {
		this.lessonName = lessonName;
	}
	public String getLessonIntroduction() {
		return lessonIntroduction;
	}
	public void setLessonIntroduction(String lessonIntroduction) {
		this.lessonIntroduction = lessonIntroduction;
	}
	public String getLessonAnnouncement() {
		return lessonAnnouncement;
	}
	public void setLessonAnnouncement(String lessonAnnouncement) {
		this.lessonAnnouncement = lessonAnnouncement;
	}
	public String getLessonPictureUrl() {
		return lessonPictureUrl;
	}
	public void setLessonPictureUrl(String lessonPictureUrl) {
		this.lessonPictureUrl = lessonPictureUrl;
	}
	
	@Override
	public String toString() {
		return "Lesson [lessonId=" + lessonId + ", teacher=" + teacher + ", major=" + major + ", lessonName="
				+ lessonName + ", lessonIntroduction=" + lessonIntroduction + ", lessonAnnouncement="
				+ lessonAnnouncement + ", lessonPictureUrl=" + lessonPictureUrl + "]";
	}
}
