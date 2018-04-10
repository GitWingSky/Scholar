package com.etc.ser;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etc.biz.PrivateMessageBiz;
import com.etc.biz.TimeAssistBiz;
import com.etc.biz.UserBiz;
import com.etc.entity.PrivateMessage;
import com.etc.entity.User;

public class PrivateMessageSer extends HttpServlet {
	
	public static UserBiz userBiz = new UserBiz();
	public static TimeAssistBiz timeAssistBiz = new TimeAssistBiz();
	public static PrivateMessageBiz privateMessageBiz = new PrivateMessageBiz();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("userId"));
		int targetUserId = Integer.parseInt(request.getParameter("targetUserId"));
		String privateMessageContent = request.getParameter("privateMessageContent");
		
		PrivateMessage privateMessage = new PrivateMessage();
		User user = userBiz.getById(userId);
		User targetUser = userBiz.getById(targetUserId);
		System.out.println(privateMessageContent);
		privateMessage.setUser(user);
		privateMessage.setTargetUser(targetUser);
		privateMessage.setReaded(true);
		privateMessage.setPrivateMessageTime(new Date());
		privateMessage.setPrivateMessageContent(privateMessageContent);
		privateMessageBiz.add(privateMessage);
		PrintWriter out = response.getWriter();
		out.print("block");
	}

}
