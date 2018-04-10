package com.etc.biz;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.etc.dao.UserDao;
import com.etc.entity.PageUtil;
import com.etc.entity.User;
import com.etc.util.SessionFactoryUtil;

public class PageUtilBiz {
	
	//根据课程取学生总数
	public int getTotalItem(int lessonId){
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			UserDao dao = session.getMapper(UserDao.class);
			return dao.getTotalItem(lessonId);
			//session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}	
		return 0;
	}

	//根据课程分页返回当前页学生列表
	public List<User> page(int pageIndex, int pageSize,int lessonId){
		List<User> list = null;
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			UserDao dao = session.getMapper(UserDao.class);
			int truePage=(pageIndex-1)*pageSize;
			list = dao.page(pageIndex, pageSize, lessonId,truePage);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}
	
	//封装分页
	public PageUtil<User> pageFind(int pageIndex, int pageSize,int lessonId,int totalItem){
		PageUtil<User> pageUtil=new PageUtil<User>();
		List<User> list=new ArrayList<User>();
		
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			UserDao dao = session.getMapper(UserDao.class);
			int truePage=(pageIndex-1)*pageSize;
			list=dao.page(pageIndex, pageSize,lessonId,truePage);
			
			//封装分页数据
			pageUtil.setIndex(pageIndex);
			pageUtil.setPageSize(pageSize);
			pageUtil.setTotalPage((int)Math.ceil((double)totalItem/pageSize));//计算总页数
			pageUtil.setTotalItem(totalItem);
			pageUtil.setList(list);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return pageUtil;
	}
}
