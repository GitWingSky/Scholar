package com.etc.ser;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etc.biz.UserBiz;
import com.etc.biz.UserFocusRelationBiz;
import com.etc.entity.User;
import com.etc.entity.UserFocusRelation;

public class FocusSer extends HttpServlet {

	public static UserFocusRelationBiz userFocusRelationBiz = new UserFocusRelationBiz();
	public static UserBiz userBiz = new UserBiz();
	
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
			int userId = Integer.parseInt(request.getParameter("userId"));
			int userFocusRelationId = Integer.parseInt(request.getParameter("userFocusRelationId"));
			userFocusRelationBiz.delete(userFocusRelationId);
			User user = userBiz.getById(userId);
			List<UserFocusRelation> focusList = userFocusRelationBiz.getByuserId(user.getUserId());
			request.getSession().setAttribute("focusList", focusList);
		}else if(method.equals("add")){
			int userId = Integer.parseInt(request.getParameter("userId"));
			int targetUserId = Integer.parseInt(request.getParameter("targetUserId"));
			UserFocusRelation userFocusRelation = new UserFocusRelation();
			userFocusRelation.setUser(userBiz.getById(userId));
			userFocusRelation.setTargetUser(userBiz.getById(targetUserId));
			userFocusRelationBiz.add(userFocusRelation);
			List<UserFocusRelation> focusList = userFocusRelationBiz.getByuserId(userId);
			request.getSession().setAttribute("focusList", focusList);
		}
	}

}
