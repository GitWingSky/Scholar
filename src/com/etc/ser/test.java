package com.etc.ser;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import com.etc.biz.DepartmentBiz;
import com.etc.biz.HomeworkBiz;
import com.etc.biz.LessonBiz;
import com.etc.biz.MajorBiz;
import com.etc.biz.MessageBiz;
import com.etc.biz.PrivateMessageBiz;
import com.etc.biz.StudentHomeworkRelationBiz;
import com.etc.biz.StudentLessonRelationBiz;
import com.etc.biz.TimeAssistBiz;
import com.etc.biz.UserBiz;
import com.etc.biz.UserFocusRelationBiz;
import com.etc.entity.Homework;
import com.etc.entity.Lesson;
import com.etc.entity.Major;
import com.etc.entity.Message;
import com.etc.entity.PrivateMessage;
import com.etc.entity.StudentHomeworkRelation;
import com.etc.entity.User;
import com.etc.entity.UserFocusRelation;

public class test {
	public static DepartmentBiz departmentBiz = new DepartmentBiz();
	public static HomeworkBiz homeworkBiz = new HomeworkBiz();
	public static LessonBiz lessonBiz = new LessonBiz();
	public static MajorBiz majorBiz = new MajorBiz();
	public static MessageBiz messageBiz = new MessageBiz();
	public static PrivateMessageBiz privateMessageBiz = new PrivateMessageBiz();
	public static StudentHomeworkRelationBiz studentHomeworkRelationBiz = new StudentHomeworkRelationBiz();
	public static StudentLessonRelationBiz studentLessonRelationBiz = new StudentLessonRelationBiz();
	public static UserBiz userBiz = new UserBiz();
	public static UserFocusRelationBiz userFocusRelationBiz = new UserFocusRelationBiz();
	public static TimeAssistBiz timeAssistBiz = new TimeAssistBiz();

	public static void main(String[] args) {
		System.out.println(studentHomeworkRelationBiz.getByLessonIdHomeworkId(2, 4));
		
	}
}
