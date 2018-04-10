package com.etc.biz;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.etc.dao.UserDao;
import com.etc.entity.PageUtil;
import com.etc.entity.User;
import com.etc.util.SessionFactoryUtil;

public class UserBiz {

	public List<User> get() {
		
		List<User> list = null;
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			UserDao dao = session.getMapper(UserDao.class);
			list = dao.get();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}

	public User getById(int userId) {
		
		User user = null;
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			UserDao dao = session.getMapper(UserDao.class);
			user = dao.getById(userId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return user;
	}
	
	public User getByUserUsername(String userUsername) {
		
		User user = null;
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			UserDao dao = session.getMapper(UserDao.class);
			user = dao.getByUserUsername(userUsername);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return user;
	}

	public void add(User user) {
		
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			UserDao dao = session.getMapper(UserDao.class);
			dao.add(user);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	public void update(User user) {
		
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			UserDao dao = session.getMapper(UserDao.class);
			dao.update(user);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	public void delete(int userId) {
		
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			UserDao dao = session.getMapper(UserDao.class);
			dao.delete(userId);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	
	public PageUtil<User> getSearchUserPage(String searchString, int pageIndex, int pageSize) {

		SqlSession session = SessionFactoryUtil.getSession();
		
		PageUtil<User> userPage = new PageUtil<User>();
		userPage.setIndex(pageIndex);
		userPage.setPageSize(pageSize);

		try {
			UserDao dao = session.getMapper(UserDao.class);
			
			searchString = "%" + searchString + "%";
			int totalItem = dao.getSearchLessonTotalItem(searchString);
			userPage.setTotalItem(totalItem);
			userPage.setTotalPage((int)Math.ceil((double)totalItem / (double)pageSize));
			userPage.setList(dao.getSearchLessonPageList(searchString, (pageIndex - 1) * pageSize, pageSize));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return userPage;
	}
}
