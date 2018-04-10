package com.etc.ser;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etc.biz.HomeworkBiz;
import com.etc.biz.LessonBiz;
import com.etc.biz.TimeAssistBiz;
import com.etc.entity.Homework;
import com.etc.entity.Lesson;

public class ReleaseHomeworkSer extends HttpServlet {

	public static LessonBiz lessonBiz = new LessonBiz();
	public static HomeworkBiz homeworkBiz = new HomeworkBiz();
	public static TimeAssistBiz timeAssistBiz = new TimeAssistBiz();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		/***发布作业并存到数据库****/
		int lessonId = Integer.parseInt(request.getParameter("lessonId"));
		String homeworkName = request.getParameter("homeworkName");
		String homeworkContent = request.getParameter("homeworkContent");
		String homeworkStartTime = request.getParameter("homeworkStartTime");
		int homeworkEndTime = Integer.parseInt(request.getParameter("homeworkEndTime"));//作业期限(多少天)
		
		Lesson lesson = lessonBiz.getById(lessonId);

		Homework homework = new Homework();
		homework.setLesson(lesson);
		homework.setHomeworkName(homeworkName);
		homework.setHomeworkContent(homeworkContent);
		
		Date startTime = timeAssistBiz.getDateTimeByString(homeworkStartTime);	
		Calendar calendar = new GregorianCalendar(); 
		calendar.setTime(startTime);
		calendar.add(Calendar.DATE, homeworkEndTime);
		Date endTime = calendar.getTime();
		
		homework.setHomeworkStartTime(startTime);
		homework.setHomeworkEndTime(endTime);
		homeworkBiz.add(homework);
		/*************************/
	}

}
