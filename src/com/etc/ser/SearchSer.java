package com.etc.ser;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etc.biz.LessonBiz;
import com.etc.biz.UserBiz;
import com.etc.entity.Lesson;
import com.etc.entity.PageUtil;
import com.etc.entity.User;

@WebServlet("/SearchSer")
public class SearchSer extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public static LessonBiz lessonBiz = new LessonBiz();

	public static UserBiz userBiz = new UserBiz();

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getContextPath();

		String type = "";
		String searchString = "";
		int pageIndex = 1;
		int pageSize = 10;

		if (request.getParameter("type") != null) {
			type = request.getParameter("type");
		}
		if (request.getParameter("searchString") != null) {
			searchString = request.getParameter("searchString");
		}
		if (request.getParameter("pageIndex") != null) {
			pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
			pageIndex = (pageIndex < 1) ? 1 : pageIndex;
		}
		if (request.getParameter("pageSize") != null) {
			pageSize = Integer.parseInt(request.getParameter("pageSize"));
			pageSize = (pageSize < 1) ? 1 : pageSize;
		}

		if (type.equals("Lesson")) {
			LessonBiz lessonBiz = new LessonBiz();
			PageUtil<Lesson> lessonPage = lessonBiz.getSearchLessonPage(searchString, pageIndex, pageSize);

			request.getSession().setAttribute("type", "Lesson");
			request.getSession().setAttribute("searchString", searchString);
			request.getSession().setAttribute("page", lessonPage);
		} else if (type.equals("User")) {
			UserBiz userBiz = new UserBiz();
			PageUtil<User> userPage = userBiz.getSearchUserPage(searchString, pageIndex, pageSize);

			request.getSession().setAttribute("type", "User");
			request.getSession().setAttribute("searchString", searchString);
			request.getSession().setAttribute("page", userPage);
		} else {
			request.getSession().removeAttribute("type");
			request.getSession().removeAttribute("searchString");
			request.getSession().removeAttribute("page");
		}
		
		response.sendRedirect(path + "/search.jsp");
	}

	public void init() throws ServletException {
	}
}
