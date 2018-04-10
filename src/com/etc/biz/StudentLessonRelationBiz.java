package com.etc.biz;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.etc.dao.StudentLessonRelationDao;
import com.etc.entity.Lesson;
import com.etc.entity.StudentLessonRelation;
import com.etc.util.SessionFactoryUtil;

public class StudentLessonRelationBiz {
	
	public List<StudentLessonRelation> get() {
		
		List<StudentLessonRelation> list = null;
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			StudentLessonRelationDao dao = session.getMapper(StudentLessonRelationDao.class);
			list = dao.get();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}

	public StudentLessonRelation getById(int studentLessonRelationId) {
		
		StudentLessonRelation studentLessonRelation = null;
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			StudentLessonRelationDao dao = session.getMapper(StudentLessonRelationDao.class);
			studentLessonRelation = dao.getById(studentLessonRelationId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return studentLessonRelation;
	}
	
	public StudentLessonRelation getByRelation(int studentId, int lessonId) {
		
		StudentLessonRelation studentLessonRelation = null;
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			StudentLessonRelationDao dao = session.getMapper(StudentLessonRelationDao.class);
			studentLessonRelation = dao.getByRelation(studentId, lessonId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return studentLessonRelation;
	}
	
	public List<Lesson> getByStudentId(int studentId){
		
		List<Lesson> list = null;
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			StudentLessonRelationDao dao = session.getMapper(StudentLessonRelationDao.class);
			list = dao.getByStudentId(studentId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}

	public void add(StudentLessonRelation studentLessonRelation) {
		
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			StudentLessonRelationDao dao = session.getMapper(StudentLessonRelationDao.class);
			dao.add(studentLessonRelation);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	public void update(StudentLessonRelation studentLessonRelation) {
		
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			StudentLessonRelationDao dao = session.getMapper(StudentLessonRelationDao.class);
			dao.update(studentLessonRelation);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	public void delete(int studentLessonRelationId) {
		
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			StudentLessonRelationDao dao = session.getMapper(StudentLessonRelationDao.class);
			dao.delete(studentLessonRelationId);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	
	public List<StudentLessonRelation> getByLessonId(int lessonId) {

		List<StudentLessonRelation> list = null;
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			StudentLessonRelationDao dao = session.getMapper(StudentLessonRelationDao.class);
			list = dao.getByLessonId(lessonId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return list;
	}
}
