package com.etc.ser;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etc.biz.HomeworkBiz;
import com.etc.biz.LessonBiz;
import com.etc.biz.MessageBiz;
import com.etc.biz.StudentHomeworkRelationBiz;
import com.etc.biz.StudentLessonRelationBiz;
import com.etc.biz.UserBiz;
import com.etc.entity.Homework;
import com.etc.entity.Message;
import com.etc.entity.StudentHomeworkRelation;
import com.etc.entity.StudentLessonRelation;
import com.etc.entity.User;
import com.etc.util.MessageUtil;

@WebServlet("/LessonDetailSer")
public class LessonDetailSer extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	public static LessonBiz lessonBiz = new LessonBiz();
	public static HomeworkBiz homeworkBiz = new HomeworkBiz();
	public static UserBiz userBiz = new UserBiz();
	public static StudentLessonRelationBiz studentLessonRelationBiz = new StudentLessonRelationBiz();
	public static MessageBiz messageBiz = new MessageBiz();
	public static StudentHomeworkRelationBiz studentHomeworkRelationBiz = new StudentHomeworkRelationBiz();
	
	
	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String method = "";
		if (request.getParameter("method") != null) {
			method = request.getParameter("method");
		}
		
		if (method.equals("")) {
			
			int lessonId = 0;
			if (request.getParameter("lessonId") != null) {
				lessonId = Integer.parseInt(request.getParameter("lessonId"));
			}
			
			List<Homework> homeworkList = homeworkBiz.getByLessonId(lessonId);
			
			List<StudentHomeworkRelation> studentHomeworkRelationsList = studentHomeworkRelationBiz.getByLessonId(lessonId);
			
			List<StudentLessonRelation> studentLessonRelationList = studentLessonRelationBiz.getByLessonId(lessonId);
			
			
			User user = null; 
			if((User)request.getSession().getAttribute("user") != null){
				user = (User)request.getSession().getAttribute("user");
				List<Homework> studentHomeworkNotList = homeworkBiz.getByLessonIdNot(user.getUserId(),lessonId);
				List<StudentHomeworkRelation> studentHomeworkList = studentHomeworkRelationBiz.getByTheStudentId(user.getUserId());
				request.getSession().setAttribute("studentHomeworkNotList", studentHomeworkNotList);
				request.getSession().setAttribute("studentHomeworkList", studentHomeworkList);
			}
			
			List<MessageUtil> messageUtilList = messageBiz.getByLessonId(lessonId);
			
			request.getSession().setAttribute("homeworkList", homeworkList);
			request.getSession().setAttribute("studentHomeworkRelationsList", studentHomeworkRelationsList);
			request.getSession().setAttribute("studentLessonRelationList", studentLessonRelationList);
			request.getSession().setAttribute("lessonIdd",lessonId);
			request.getSession().setAttribute("messageUtilList", messageUtilList);
			
			if (request.getParameter("messageFlush") == null) {
				response.sendRedirect("home/lessonDetail.jsp");
			} else {
				response.sendRedirect("home/lessonDetail.jsp#comments");
			}
		} else if (method.equals("score")) {
			int studentHomeworkRelationId = 0;
			if (request.getParameter("studentHomeworkRelationId") != null) {
				studentHomeworkRelationId = Integer.parseInt(request.getParameter("studentHomeworkRelationId"));
			}
			
			int score = 0;
			if (request.getParameter("score") != null) {
				score = Integer.parseInt(request.getParameter("score"));
			}
			
			StudentHomeworkRelation studentHomeworkRelation = studentHomeworkRelationBiz.getById(studentHomeworkRelationId);
			studentHomeworkRelation.setScore(score);
			studentHomeworkRelationBiz.update(studentHomeworkRelation);
		} else if (method.equals("sendMessage")) {
			
			int userId = 0;
			if (request.getParameter("userId") != null) {
				userId = Integer.parseInt(request.getParameter("userId"));
			}
			
			int lessonId = 0;
			if (request.getParameter("lessonId") != null) {
				lessonId = Integer.parseInt(request.getParameter("lessonId"));
			}
			
			int targetUserId = 0;
			if (request.getParameter("targetUserId") != null) {
				targetUserId = Integer.parseInt(request.getParameter("targetUserId"));
			}
			
			int floor = 0;
			if (request.getParameter("floor") != null) {
				floor = Integer.parseInt(request.getParameter("floor"));
			}
			
			String messageContent = "";
			if (request.getParameter("messageContent") != null) {
				messageContent = request.getParameter("messageContent");
			}
			
			Message message = new Message();
			message.setLesson(lessonBiz.getById(lessonId));
			message.setUser(userBiz.getById(userId));
			
			if (targetUserId > 0) {
				message.setTargetUser(userBiz.getById(targetUserId));
			} else {
				User userTmp = new User();
				userTmp.setUserId(0);
				message.setTargetUser(userTmp);
			}
			
			message.setFloor(floor);
			message.setMessageTime(new Date());
			message.setMessageContent(messageContent);
			
			messageBiz.add(message);
			
			response.sendRedirect("LessonDetailSer?messageFlush=1&lessonId=" + lessonId);
		}else if(method.equals("post")){
			
			String homeworkName = null;
			if (request.getParameter("homeworkName") != null) {
				homeworkName = request.getParameter("homeworkName");
			}
			
			int lessonId = 0;
			if (request.getParameter("lessonId") != null) {
				lessonId = Integer.parseInt(request.getParameter("lessonId"));
			}
			System.out.println(lessonId);
			int homeworkEndTime = 0;
			if (request.getParameter("homeworkEndTime") != null) {
				homeworkEndTime = Integer.parseInt(request.getParameter("homeworkEndTime"));
			}
			System.out.println(homeworkEndTime);
			String homeworkContent = null;
			if (request.getParameter("homeworkContent") != null) {
				homeworkContent = request.getParameter("homeworkContent");
			}
			
			System.out.println(homeworkContent);
			Date date=new Date();
			Homework homework = new Homework();
			homework.setHomeworkContent(homeworkContent);
			homework.setHomeworkName(homeworkName);
			homework.setHomeworkStartTime(date);
			homework.setLesson(lessonBiz.getById(lessonId));
			Calendar calendar = new GregorianCalendar();
			calendar.setTime(date);
			calendar.add(calendar.DATE,homeworkEndTime);
			date=calendar.getTime();
			homework.setHomeworkEndTime(date);
			homeworkBiz.add(homework);
			User user = null;
			user = (User)request.getSession().getAttribute("user");
			List<Homework> homeworkList = homeworkBiz.getByLessonId(lessonId);
			request.getSession().setAttribute("homeworkList", homeworkList);
			response.sendRedirect("home/lessonDetail.jsp");
		}

	}

	public void init() throws ServletException {
	}
}
