package com.etc.ser;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etc.biz.LessonBiz;
import com.etc.biz.StudentLessonRelationBiz;
import com.etc.biz.TimeAssistBiz;
import com.etc.biz.UserBiz;
import com.etc.biz.UserFocusRelationBiz;
import com.etc.entity.Lesson;
import com.etc.entity.User;
import com.etc.entity.UserFocusRelation;

public class SelfSer extends HttpServlet {

	public static UserBiz userBiz = new UserBiz();
	public static StudentLessonRelationBiz studentLessonRelationBiz = new StudentLessonRelationBiz();
	public static LessonBiz lessonBiz = new LessonBiz();
	public static TimeAssistBiz timeAssistBiz = new TimeAssistBiz();
	public static UserFocusRelationBiz userFocusRelationBiz = new UserFocusRelationBiz();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int userId = Integer.parseInt(request.getParameter("userId"));
		User user = userBiz.getById(userId);
		
		User uuser = null; 
		if((User)request.getSession().getAttribute("user") != null){
			uuser = (User)request.getSession().getAttribute("user");
			if(uuser.getUserType().equals("学生")){
				UserFocusRelation userFocusRelation = userFocusRelationBiz.getByRelation(uuser.getUserId(), userId);
				request.setAttribute("userFocusRelation", userFocusRelation);
			}
			
		}
		
		List<Lesson> lessonList = null;
		if(user.getUserType().equals("学生")){
			lessonList = studentLessonRelationBiz.getByStudentId(user.getUserId());
		}else{
			lessonList = lessonBiz.getByTeacherId(user.getUserId());
		}
		request.setAttribute("usser", user);
		request.setAttribute("lessonListt", lessonList);
		request.getRequestDispatcher("self.jsp").forward(request, response);
	}

}
