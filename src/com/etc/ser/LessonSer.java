package com.etc.ser;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etc.biz.DepartmentBiz;
import com.etc.biz.LessonBiz;
import com.etc.biz.MajorBiz;
import com.etc.biz.StudentLessonRelationBiz;
import com.etc.biz.UserBiz;
import com.etc.entity.Department;
import com.etc.entity.Lesson;
import com.etc.entity.Major;
import com.etc.entity.StudentLessonRelation;
import com.etc.entity.User;
import com.etc.entity.UserFocusRelation;

public class LessonSer extends HttpServlet {

	public static LessonBiz lessonBiz = new LessonBiz();
	public static MajorBiz majorBiz = new MajorBiz();
	public static UserBiz userBiz = new UserBiz();
	public static DepartmentBiz departmentBiz = new DepartmentBiz();
	public static StudentLessonRelationBiz studentLessonRelationBiz = new StudentLessonRelationBiz();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String method = null;
		if (request.getParameter("method") != null) {
			method = request.getParameter("method");
		}
		
		if(method == null){
			int lessonId = Integer.parseInt(request.getParameter("lessonId"));
			Lesson lesson = lessonBiz.getById(lessonId);
			request.setAttribute("lesson", lesson);
			List<Department> departmentList =  departmentBiz.get();
			List<Major> majorList = majorBiz.getByDepartmentId(lesson.getMajor().getDepartment().getDepartmentId());
			User uuser = null; 
			if((User)request.getSession().getAttribute("user") != null){
				uuser = (User)request.getSession().getAttribute("user");
				StudentLessonRelation studentLessonRelation = studentLessonRelationBiz.getByRelation(uuser.getUserId(), lessonId);
				request.setAttribute("studentLessonRelation", studentLessonRelation);
			}
			request.setAttribute("departmentListt", departmentList);
			request.setAttribute("majorListt", majorList);
			request.getRequestDispatcher("lesson.jsp").forward(request, response);
		}else if(method.equals("major")){
			int departmentId = Integer.parseInt(request.getParameter("departmentId"));
			System.out.println(departmentId);
			List<Major> list = majorBiz.getByDepartmentId(departmentId);
			PrintWriter out = response.getWriter();
			int num = 0;
			for (Major major : list) {
				if(num == 0){
					out.print("<option selected='selected' value='" + major.getMajorId() + "'>" + major.getMajorName() + "</option>");
					num++;
				}else{
					out.print("<option value='" + major.getMajorId() + "'>" + major.getMajorName() + "</option>");
				}
			}
		}else if (method.equals("createLesson")) {
			
			int teacherId = 0;
			int majorId = 0;
			String lessonName = "";
			String lessonIntroduction = "";
			String lessonAnnouncement = "";
			String lessonPictureUrl = "";
			
			if(request.getParameter("teacherId") != null) {
				teacherId = Integer.parseInt(request.getParameter("teacherId"));
			}
			if(request.getParameter("majorId") != null) {
				majorId = Integer.parseInt(request.getParameter("majorId"));
			}
			if(request.getParameter("lessonName") != null) {
				lessonName = request.getParameter("lessonName");
			}
			if(request.getParameter("lessonIntroduction") != null) {
				lessonIntroduction = request.getParameter("lessonIntroduction");
			}
			if(request.getParameter("lessonAnnouncement") != null) {
				lessonAnnouncement = request.getParameter("lessonAnnouncement");
			}
			
			
			
			MajorBiz majorBiz = new MajorBiz();
			
			Lesson lesson = new Lesson();
			
			lesson.setTeacher(userBiz.getById(teacherId));
			lesson.setMajor(majorBiz.getById(majorId));
			lesson.setLessonName(lessonName);
			lesson.setLessonIntroduction(lessonIntroduction);
			lesson.setLessonAnnouncement(lessonAnnouncement);
			lesson.setLessonPictureUrl("resource/lesson/0.jpg");
			System.out.println(lesson);
			LessonBiz lessonBiz = new LessonBiz();
			
			lessonBiz.add(lesson);

			
			response.sendRedirect("LessonSer?lessonId=" + lesson.getLessonId());
			return ;
		}else if(method.equals("add")){
			int studentId = 0;
			int lessonId = 0;
			if(request.getParameter("studentId") != null) {
				studentId = Integer.parseInt(request.getParameter("studentId"));
			}
			if(request.getParameter("lessonId") != null) {
				lessonId = Integer.parseInt(request.getParameter("lessonId"));
			}
			StudentLessonRelation studentLessonRelation = new StudentLessonRelation();
			studentLessonRelation.setLesson(lessonBiz.getById(lessonId));
			studentLessonRelation.setStudent(userBiz.getById(studentId));
			studentLessonRelationBiz.add(studentLessonRelation);
			response.sendRedirect("LessonDetailSer?lessonId=" + lessonId);
		}
	}

}
