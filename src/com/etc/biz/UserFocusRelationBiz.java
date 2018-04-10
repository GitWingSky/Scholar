package com.etc.biz;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.etc.dao.UserFocusRelationDao;
import com.etc.entity.UserFocusRelation;
import com.etc.util.SessionFactoryUtil;

public class UserFocusRelationBiz {
	
	public List<UserFocusRelation> get() {
		
		List<UserFocusRelation> list = null;
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			UserFocusRelationDao dao = session.getMapper(UserFocusRelationDao.class);
			list = dao.get();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}

	public UserFocusRelation getById(int userFocusRelationId) {
		
		UserFocusRelation userFocusRelation = null;
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			UserFocusRelationDao dao = session.getMapper(UserFocusRelationDao.class);
			userFocusRelation = dao.getById(userFocusRelationId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return userFocusRelation;
	}
	
	public List<UserFocusRelation> getByuserId(int userId){
		
		List<UserFocusRelation> list = null;
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			UserFocusRelationDao dao = session.getMapper(UserFocusRelationDao.class);
			list = dao.getByuserId(userId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}
	
	public List<UserFocusRelation> getBytargetUserId(int targetUserId){
		
		List<UserFocusRelation> list = null;
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			UserFocusRelationDao dao = session.getMapper(UserFocusRelationDao.class);
			list = dao.getBytargetUserId(targetUserId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}
	
public UserFocusRelation getByRelation(int userId, int targetUserId) {
		
		UserFocusRelation userFocusRelation = null;
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			UserFocusRelationDao dao = session.getMapper(UserFocusRelationDao.class);
			userFocusRelation = dao.getByRelation(userId, targetUserId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return userFocusRelation;
	}

	public void add(UserFocusRelation userFocusRelation) {
		
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			UserFocusRelationDao dao = session.getMapper(UserFocusRelationDao.class);
			dao.add(userFocusRelation);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	public void update(UserFocusRelation userFocusRelation) {
		
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			UserFocusRelationDao dao = session.getMapper(UserFocusRelationDao.class);
			dao.update(userFocusRelation);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	public void delete(int userFocusRelationId) {
		
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			UserFocusRelationDao dao = session.getMapper(UserFocusRelationDao.class);
			dao.delete(userFocusRelationId);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
}
