package com.etc.entity;

// 实体类,学生与课程关系类,用于记录和关联学生学习的课程

public class StudentLessonRelation {
	
	private int studentLessonRelationId;
	private User student;
	private Lesson lesson;
	
	public int getStudentLessonRelationId() {
		return studentLessonRelationId;
	}
	public void setStudentLessonRelationId(int studentLessonRelationId) {
		this.studentLessonRelationId = studentLessonRelationId;
	}
	public User getStudent() {
		return student;
	}
	public void setStudent(User student) {
		this.student = student;
	}
	public Lesson getLesson() {
		return lesson;
	}
	public void setLesson(Lesson lesson) {
		this.lesson = lesson;
	}
	
	@Override
	public String toString() {
		return "StudentLessonRelation [studentLessonRelationId=" + studentLessonRelationId + ", student=" + student
				+ ", lesson=" + lesson + "]";
	}
}
