package com.etc.biz;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.etc.dao.DepartmentDao;
import com.etc.entity.Department;
import com.etc.util.SessionFactoryUtil;

public class DepartmentBiz {

	public List<Department> get() {
		
		List<Department> list = null;
		SqlSession session = SessionFactoryUtil.getSession();
		
		try {
			DepartmentDao dao = session.getMapper(DepartmentDao.class);
			list = dao.get();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}

	public Department getById(int departmentId) {
		
		Department department = null;
		SqlSession session = SessionFactoryUtil.getSession();

		try {
			DepartmentDao dao = session.getMapper(DepartmentDao.class);
			department = dao.getById(departmentId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return department;
	}
}
