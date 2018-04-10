package com.etc.biz;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.etc.dao.StudentHomeworkRelationDao;
import com.etc.entity.StudentHomeworkRelation;
import com.etc.util.SessionFactoryUtil;

public class StudentHomeworkRelationBiz {
	
	public List<StudentHomeworkRelation> get() {
		
		List<StudentHomeworkRelation> list = null;
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			StudentHomeworkRelationDao dao = session.getMapper(StudentHomeworkRelationDao.class);
			list = dao.get();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}

	public StudentHomeworkRelation getById(int studentHomeworkRelationId) {
		
		StudentHomeworkRelation studentHomeworkRelation = null;
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			StudentHomeworkRelationDao dao = session.getMapper(StudentHomeworkRelationDao.class);
			studentHomeworkRelation = dao.getById(studentHomeworkRelationId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return studentHomeworkRelation;
	}

	public void add(StudentHomeworkRelation studentHomeworkRelation) {
		
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			StudentHomeworkRelationDao dao = session.getMapper(StudentHomeworkRelationDao.class);
			dao.add(studentHomeworkRelation);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	public void update(StudentHomeworkRelation studentHomeworkRelation) {
		
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			StudentHomeworkRelationDao dao = session.getMapper(StudentHomeworkRelationDao.class);
			dao.update(studentHomeworkRelation);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	public void delete(int studentHomeworkRelationId) {
		
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			StudentHomeworkRelationDao dao = session.getMapper(StudentHomeworkRelationDao.class);
			dao.delete(studentHomeworkRelationId);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	
	public List<StudentHomeworkRelation> getByHomeworkId(int homeworkId) {
		
	List<StudentHomeworkRelation> list = null;
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			StudentHomeworkRelationDao dao = session.getMapper(StudentHomeworkRelationDao.class);
			list = dao.getByHomeworkId(homeworkId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	} 

	public List<StudentHomeworkRelation> getByLessonId(int lessonId) {
		
		List<StudentHomeworkRelation> list = null;
		
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			StudentHomeworkRelationDao dao = session.getMapper(StudentHomeworkRelationDao.class);
			list = dao.getByLessonId(lessonId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}
	
	public List<StudentHomeworkRelation> getByTheStudentId(int studentId) {
		
		List<StudentHomeworkRelation> list = null;
		
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			StudentHomeworkRelationDao dao = session.getMapper(StudentHomeworkRelationDao.class);
			list = dao.getByTheStudentId(studentId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	} 
	
	public StudentHomeworkRelation getByLessonIdHomeworkId(int studentId, int homeworkId) {
		
		StudentHomeworkRelation studentHomeworkRelation = null;
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			StudentHomeworkRelationDao dao = session.getMapper(StudentHomeworkRelationDao.class);
			studentHomeworkRelation = dao.getByLessonIdHomeworkId(studentId, homeworkId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return studentHomeworkRelation;
	}
}
