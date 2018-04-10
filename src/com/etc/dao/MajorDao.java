package com.etc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.etc.entity.Major;

public interface MajorDao {
	
	@Select("SELECT * FROM major")
	@Results({ @Result(id = true, property = "majorId", column = "majorId"),
			@Result(property = "department", column = "departmentId", one = @One(select = "com.etc.dao.DepartmentDao.getById")),
			@Result(property = "majorName", column = "majorName") })
	public List<Major> get();

	@Select("SELECT * FROM major WHERE majorId = #{majorId}")
	@Results({ @Result(id = true, property = "majorId", column = "majorId"),
			@Result(property = "department", column = "departmentId", one = @One(select = "com.etc.dao.DepartmentDao.getById")),
			@Result(property = "majorName", column = "majorName") })
	public Major getById(int majorId);
	
	@Select("SELECT * FROM major WHERE departmentId = #{departmentId}")
	@Results({ @Result(id = true, property = "majorId", column = "majorId"),
		@Result(property = "department", column = "departmentId", many = @Many(select = "com.etc.dao.DepartmentDao.getById")),
		@Result(property = "majorName", column = "majorName") })
	public List<Major> getByDepartmentId(int departmentId);
}
