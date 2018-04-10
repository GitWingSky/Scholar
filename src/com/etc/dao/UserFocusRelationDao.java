package com.etc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.etc.entity.UserFocusRelation;

public interface UserFocusRelationDao {
	
	@Select("SELECT * FROM userFocusRelation")
	@Results({ @Result(id = true, property = "userFocusRelationId", column = "userFocusRelationId"),
			@Result(property = "user", column = "userId", one = @One(select = "com.etc.dao.UserDao.getById")),
			@Result(property = "targetUser", column = "targetUserId", one = @One(select = "com.etc.dao.UserDao.getById")) })
	public List<UserFocusRelation> get();

	@Select("SELECT * FROM userFocusRelation WHERE userFocusRelationId = #{userFocusRelationId}")
	@Results({ @Result(id = true, property = "userFocusRelationId", column = "userFocusRelationId"),
			@Result(property = "user", column = "userId", one = @One(select = "com.etc.dao.UserDao.getById")),
			@Result(property = "targetUser", column = "targetUserId", one = @One(select = "com.etc.dao.UserDao.getById")) })
	public UserFocusRelation getById(int userFocusRelationId);
	
	@Select("SELECT * FROM userFocusRelation WHERE userId = #{userId}")
	@Results({ @Result(id = true, property = "userFocusRelationId", column = "userFocusRelationId"),
			@Result(property = "user", column = "userId", many = @Many(select = "com.etc.dao.UserDao.getById")),
			@Result(property = "targetUser", column = "targetUserId", one = @One(select = "com.etc.dao.UserDao.getById")) })
	public List<UserFocusRelation> getByuserId(int userId);
	
	@Select("SELECT * FROM userFocusRelation WHERE targetUserId = #{targetUserId}")
	@Results({ @Result(id = true, property = "userFocusRelationId", column = "userFocusRelationId"),
			@Result(property = "user", column = "userId", one = @One(select = "com.etc.dao.UserDao.getById")),
			@Result(property = "targetUser", column = "targetUserId", many = @Many(select = "com.etc.dao.UserDao.getById")) })
	public List<UserFocusRelation> getBytargetUserId(int targetUserId);
	
	@Select("SELECT * FROM userFocusRelation WHERE userId = #{userId} AND targetUserId = #{targetUserId}")
	@Results({ @Result(id = true, property = "userFocusRelationId", column = "userFocusRelationId"),
			@Result(property = "user", column = "userId", many = @Many(select = "com.etc.dao.UserDao.getById")),
			@Result(property = "targetUser", column = "targetUserId", many = @Many(select = "com.etc.dao.UserDao.getById")) })
	public UserFocusRelation getByRelation(@Param("userId") int userId, @Param("targetUserId") int targetUserId);

	@Insert("INSERT INTO userFocusRelation VALUES (NULL, #{user.userId}, #{targetUser.userId})")
	public void add(UserFocusRelation userFocusRelation);

	@Update("UPDATE userFocusRelation SET userId = #{user.userId}, targetUserId = #{targetUser.userId} WHERE userFocusRelationId = #{userFocusRelationId}")
	public void update(UserFocusRelation userFocusRelation);

	@Delete("DELETE FROM userFocusRelation WHERE userFocusRelationId = #{userFocusRelationId}")
	public void delete(int userFocusRelationId);
}
