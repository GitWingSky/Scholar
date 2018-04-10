package com.etc.ser;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etc.biz.DepartmentBiz;
import com.etc.biz.LessonBiz;
import com.etc.biz.MajorBiz;
import com.etc.biz.PrivateMessageBiz;
import com.etc.biz.StudentLessonRelationBiz;
import com.etc.biz.TimeAssistBiz;
import com.etc.biz.UserBiz;
import com.etc.biz.UserFocusRelationBiz;
import com.etc.entity.Department;
import com.etc.entity.Lesson;
import com.etc.entity.Major;
import com.etc.entity.PrivateMessage;
import com.etc.entity.User;
import com.etc.entity.UserFocusRelation;

public class UserSer extends HttpServlet {

	public static UserBiz userBiz = new UserBiz();
	public static StudentLessonRelationBiz studentLessonRelationBiz = new StudentLessonRelationBiz();
	public static PrivateMessageBiz privateMessageBiz = new PrivateMessageBiz();
	public static TimeAssistBiz timeAssistBiz = new TimeAssistBiz();
	public static LessonBiz lessonBiz = new LessonBiz();
	public static DepartmentBiz departmentBiz = new DepartmentBiz();
	public static MajorBiz majorBiz = new MajorBiz();
	public static UserFocusRelationBiz userFocusRelationBiz = new UserFocusRelationBiz();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String method = request.getParameter("method");

		if (method == null) {
			/******* 用户登陆并检查是否记住密码 ********/

			String userUsername = request.getParameter("userUsername");
			String userPassword = request.getParameter("userPassword");
			String rememberMe = request.getParameter("rememberMe");
			User user = null;
			user = userBiz.getByUserUsername(userUsername);
			PrintWriter out = response.getWriter();

			if (user == null) {
				out.print("用戶名或密码错误!");
			} else if (!user.getUserPassword().equals(userPassword)) {
				out.print("密碼错误!");
			} else {

				if (rememberMe != null) {
					Cookie c1 = new Cookie("userUsername", userUsername);
					Cookie c2 = new Cookie("userPassword", userPassword);
					response.addCookie(c1);
					response.addCookie(c2);
				}
				List<PrivateMessage> privateMessageList = privateMessageBiz.getByTargetUserId(user.getUserId());
				List<Lesson> lessonList = null;
				List<Department> departmentList = null;
				if(user.getUserType().equals("学生")){
					lessonList = studentLessonRelationBiz.getByStudentId(user.getUserId());
				}else{
					lessonList = lessonBiz.getByTeacherId(user.getUserId());
					departmentList = departmentBiz.get();
					request.getSession().setAttribute("departmentList", departmentList);
					List<Major> majorList = majorBiz.getByDepartmentId(1);
					request.getSession().setAttribute("majorList", majorList);
				}
				List<UserFocusRelation> focusList = userFocusRelationBiz.getByuserId(user.getUserId());
				List<UserFocusRelation> targetFocusList = userFocusRelationBiz.getBytargetUserId(user.getUserId());
				
				request.getSession().setAttribute("focusList", focusList);
				request.getSession().setAttribute("targetFocusList", targetFocusList);
				request.getSession().setAttribute("privateMessageList", privateMessageList);
				request.getSession().setAttribute("user", user);
				request.getSession().setAttribute("lessonList", lessonList);
				out.print("success");
			}
		} else if (method.equals("register")) {
			/******* 用户注册、存储数据库并页面转发到home.jsp ********/

			String userUsername = request.getParameter("userUsername");
			String userPassword = request.getParameter("userPassword");
			String userName = request.getParameter("userName");
			String userType = request.getParameter("userType");
			User user = new User();
			user.setUserUsername(userUsername);
			user.setUserPassword(userPassword);
			user.setUserName(userName);
			user.setUserType(userType);
			user.setUserSex("");
			user.setUserAge(0);
			user.setUserBirthday(new Date());
			user.setUserPhone("");
			user.setUserEmail("");
			user.setUserSchool("");
			user.setUserAddress("");
			user.setUserIntroduction("");
			user.setUserPictureUrl("resource/user/0.jpg");
			userBiz.add(user);
			request.getSession().setAttribute("user", user);
			response.sendRedirect("home/home.jsp");

		} else if (method.equals("check")) {

			/******* 检查用户名是否存在 ********/
			String userUsername = request.getParameter("userUsername");
			User user = null;
			user = userBiz.getByUserUsername(userUsername);
			PrintWriter out = response.getWriter();

			if (user == null) {
				out.print("success");
			} else {
				out.print("用户名已存在!");
			}
		}else if (method.equals("read")) {

			/******* 检查用户名是否已读 ********/
			int privateMessageId = Integer.parseInt(request.getParameter("privateMessageId"));
			PrivateMessage privateMessage = null;
			privateMessage = privateMessageBiz.getById(privateMessageId);
			privateMessage.setReaded(false);
			privateMessageBiz.update(privateMessage);
			
			PrintWriter out = response.getWriter();
			out.print("rgba(255, 255, 255, 0.5)");
			
		}else if (method.equals("logout")) {
			request.getSession().invalidate();
			response.sendRedirect("index.jsp");
		}
	}

}
