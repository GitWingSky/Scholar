package com.etc.entity;

import java.util.Date;

// 实体类,学生与作业关系类,用于记录和关联学生提交的作业

public class StudentHomeworkRelation {
	
	private int studentHomeworkRelationId;
	private User student;
	private Homework homework;
	private Date submitTime;
	private int score;
	
	public int getStudentHomeworkRelationId() {
		return studentHomeworkRelationId;
	}
	public void setStudentHomeworkRelationId(int studentHomeworkRelationId) {
		this.studentHomeworkRelationId = studentHomeworkRelationId;
	}
	public User getStudent() {
		return student;
	}
	public void setStudent(User student) {
		this.student = student;
	}
	public Homework getHomework() {
		return homework;
	}
	public void setHomework(Homework homework) {
		this.homework = homework;
	}
	public Date getSubmitTime() {
		return submitTime;
	}
	public void setSubmitTime(Date submitTime) {
		this.submitTime = submitTime;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	
	@Override
	public String toString() {
		return "StudentHomeworkRelation [studentHomeworkRelationId=" + studentHomeworkRelationId + ", student="
				+ student + ", homework=" + homework + ", submitTime=" + submitTime + ", score=" + score + "]";
	}
}
