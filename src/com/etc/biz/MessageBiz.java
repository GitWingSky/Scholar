package com.etc.biz;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.etc.dao.MessageDao;
import com.etc.entity.Message;
import com.etc.util.MessageUtil;
import com.etc.util.SessionFactoryUtil;

public class MessageBiz {
	
	public List<Message> get() {
		
		List<Message> list = null;
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			MessageDao dao = session.getMapper(MessageDao.class);
			list = dao.get();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}

	public Message getById(int MessageId) {
		
		Message message = null;
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			MessageDao dao = session.getMapper(MessageDao.class);
			message = dao.getById(MessageId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return message;
	}
	
	public List<Message> getByParentMessageId(int parentMessageId) {
		
		List<Message> list = null;
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			MessageDao dao = session.getMapper(MessageDao.class);
			list = dao.getByParentMessageId(parentMessageId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}

	public void add(Message Message) {
		
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			MessageDao dao = session.getMapper(MessageDao.class);
			dao.add(Message);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	public void update(Message Message) {
		
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			MessageDao dao = session.getMapper(MessageDao.class);
			dao.update(Message);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	public void delete(int MessageId) {
		
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			MessageDao dao = session.getMapper(MessageDao.class);
			dao.delete(MessageId);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	
	public List<MessageUtil> getByLessonId(int lessonId) {
		
		SqlSession session = SessionFactoryUtil.getSession();

		List<MessageUtil> utilList = new ArrayList<MessageUtil>();
		
		try {
			MessageDao dao = session.getMapper(MessageDao.class);
			
			List<Message> floorHostList = dao.getFloorHostByLessonId(lessonId);
			for (Message message : floorHostList) {
				MessageUtil util = new MessageUtil();
				util.setMessage(message);
				util.setReplyList(dao.getFloorReplyByLessonId(lessonId, message.getFloor()));
				utilList.add(util);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return utilList;
	}
}
