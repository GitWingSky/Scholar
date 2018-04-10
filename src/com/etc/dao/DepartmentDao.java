package com.etc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.etc.entity.Department;

public interface DepartmentDao {
	
	@Select("SELECT * FROM department")
	public List<Department> get();

	@Select("SELECT * FROM department WHERE departmentId = #{departmentId}")
	public Department getById(int departmentId);
}
