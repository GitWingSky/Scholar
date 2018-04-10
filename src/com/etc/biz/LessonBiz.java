package com.etc.biz;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.etc.dao.LessonDao;
import com.etc.entity.Lesson;
import com.etc.entity.PageUtil;
import com.etc.util.SessionFactoryUtil;

public class LessonBiz {
	
	public List<Lesson> get() {
		
		List<Lesson> list = null;
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			LessonDao dao = session.getMapper(LessonDao.class);
			list = dao.get();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}

	public Lesson getById(int lessonId) {
		
		Lesson lesson = null;
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			LessonDao dao = session.getMapper(LessonDao.class);
			lesson = dao.getById(lessonId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return lesson;
	}
	
	public List<Lesson> getByTeacherId(int teacherId){
		
		List<Lesson> list = null;
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			LessonDao dao = session.getMapper(LessonDao.class);
			list = dao.getByTeacherId(teacherId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}

	public void add(Lesson lesson) {
		
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			LessonDao dao = session.getMapper(LessonDao.class);
			dao.add(lesson);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	public void update(Lesson lesson) {
		
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			LessonDao dao = session.getMapper(LessonDao.class);
			dao.update(lesson);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	public void delete(int lessonId) {
		
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			LessonDao dao = session.getMapper(LessonDao.class);
			dao.delete(lessonId);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	
	public PageUtil<Lesson> getSearchLessonPage(String searchString, int pageIndex, int pageSize) {

		pageIndex = (pageIndex < 1) ? 1 : pageIndex;
		pageSize = (pageSize < 1) ? 1 : pageSize;
		
		SqlSession session = SessionFactoryUtil.getSession();
		
		PageUtil<Lesson> lessonPage = new PageUtil<Lesson>();
		lessonPage.setIndex(pageIndex);
		lessonPage.setPageSize(pageSize);

		try {
			LessonDao dao = session.getMapper(LessonDao.class);
			
			searchString = "%" + searchString + "%";
			int totalItem = dao.getSearchLessonTotalItem(searchString);
			lessonPage.setTotalItem(totalItem);
			lessonPage.setTotalPage((int)Math.ceil((double)totalItem / (double)pageSize));
			lessonPage.setList(dao.getSearchLessonPageList(searchString, (pageIndex - 1) * pageSize, pageSize));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return lessonPage;
	}
}
