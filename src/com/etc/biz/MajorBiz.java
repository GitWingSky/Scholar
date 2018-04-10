package com.etc.biz;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.etc.dao.MajorDao;
import com.etc.entity.Major;
import com.etc.util.SessionFactoryUtil;

public class MajorBiz {
	
	public List<Major> get() {
		
		List<Major> list = null;
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			MajorDao dao = session.getMapper(MajorDao.class);
			list = dao.get();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}

	public Major getById(int majorId) {
		
		Major major = null;
		SqlSession session = SessionFactoryUtil.getSession();

		try {
			MajorDao dao = session.getMapper(MajorDao.class);
			major = dao.getById(majorId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return major;
	}
	public List<Major> getByDepartmentId(int departmentId){
		
		List<Major> list = null;
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			MajorDao dao = session.getMapper(MajorDao.class);
			list = dao.getByDepartmentId(departmentId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}
}
