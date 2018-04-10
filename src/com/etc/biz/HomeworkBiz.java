package com.etc.biz;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.etc.dao.HomeworkDao;
import com.etc.entity.Homework;
import com.etc.util.SessionFactoryUtil;

public class HomeworkBiz {

	public List<Homework> get() {

		List<Homework> list = null;
		SqlSession session = SessionFactoryUtil.getSession();

		try {
			HomeworkDao dao = session.getMapper(HomeworkDao.class);
			list = dao.get();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return list;
	}

	public Homework getById(int homeworkId) {

		Homework homework = null;
		SqlSession session = SessionFactoryUtil.getSession();

		try {
			HomeworkDao dao = session.getMapper(HomeworkDao.class);
			homework = dao.getById(homeworkId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return homework;
	}

	public void add(Homework homework) {

		SqlSession session = SessionFactoryUtil.getSession();

		try {
			HomeworkDao dao = session.getMapper(HomeworkDao.class);
			dao.add(homework);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	public void update(Homework homework) {

		SqlSession session = SessionFactoryUtil.getSession();

		try {
			HomeworkDao dao = session.getMapper(HomeworkDao.class);
			dao.update(homework);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	public void delete(int homeworkId) {

		SqlSession session = SessionFactoryUtil.getSession();

		try {
			HomeworkDao dao = session.getMapper(HomeworkDao.class);
			dao.delete(homeworkId);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	
	public List<Homework> getByLessonId(int lessonId) {

		List<Homework> list = null;
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			HomeworkDao dao = session.getMapper(HomeworkDao.class);
			list = dao.getByLessonId(lessonId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return list;
	}
	
	public List<Homework> getByLessonIdNot(int studentId, int lessonId) {

		List<Homework> list = null;
		SqlSession session = SessionFactoryUtil.getSession();

		try {
			HomeworkDao dao = session.getMapper(HomeworkDao.class);
			list = dao.getByLessonIdNot(studentId, lessonId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return list;
	}
}
