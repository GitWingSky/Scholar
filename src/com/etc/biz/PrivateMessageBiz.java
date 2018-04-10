package com.etc.biz;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.etc.dao.LessonDao;
import com.etc.dao.PrivateMessageDao;
import com.etc.dao.UserDao;
import com.etc.entity.Lesson;
import com.etc.entity.PageUtil;
import com.etc.entity.PrivateMessage;
import com.etc.entity.User;
import com.etc.util.SessionFactoryUtil;

public class PrivateMessageBiz {
	
	public List<PrivateMessage> get() {
		
		List<PrivateMessage> list = null;
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			PrivateMessageDao dao = session.getMapper(PrivateMessageDao.class);
			list = dao.get();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}

	public PrivateMessage getById(int privateMessageId) {
		
		PrivateMessage privateMessage = null;
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			PrivateMessageDao dao = session.getMapper(PrivateMessageDao.class);
			privateMessage = dao.getById(privateMessageId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return privateMessage;
	}
	
	public List<PrivateMessage> getByTargetUserId(int privateMessageId) {
		
		List<PrivateMessage> list = null;
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			PrivateMessageDao dao = session.getMapper(PrivateMessageDao.class);
			list = dao.getByTargetUserId(privateMessageId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}

	public void add(PrivateMessage privateMessage) {
		
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			PrivateMessageDao dao = session.getMapper(PrivateMessageDao.class);
			dao.add(privateMessage);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	public void update(PrivateMessage privateMessage) {
		
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			PrivateMessageDao dao = session.getMapper(PrivateMessageDao.class);
			dao.update(privateMessage);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	public void delete(int privateMessageId) {
		
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			PrivateMessageDao dao = session.getMapper(PrivateMessageDao.class);
			dao.delete(privateMessageId);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
}
