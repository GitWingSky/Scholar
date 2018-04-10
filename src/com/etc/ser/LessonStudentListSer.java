package com.etc.ser;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etc.biz.PageUtilBiz;
import com.etc.biz.UserBiz;
import com.etc.entity.PageUtil;
import com.etc.entity.User;

public class LessonStudentListSer extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		UserBiz biz = new UserBiz();
		PageUtilBiz pa=new PageUtilBiz();
		int index=1;
		if(request.getParameter("index")!=null)
			index=Integer.parseInt(request.getParameter("index"));

		// 调用业务逻辑层方法，获取多底层返回的数据集合
		PageUtil<User> pu = pa.pageFind(index, 1, 1, pa.getTotalItem(1));
		request.setAttribute("pageUtil", pu); // 把数据存储在Request作用域中
		// 转发页面
		request.getRequestDispatcher("home/userList.jsp").forward(request,response);
	}

}
