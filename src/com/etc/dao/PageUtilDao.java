package com.etc.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Select;




import com.etc.entity.PageUtil;
import com.etc.entity.User;

public interface PageUtilDao {
	
	//根据课程给学生列表分页
	public PageUtil<User> pageFind(int pageIndex, int pageSize,int lessonId,int totalItem);
	
}
