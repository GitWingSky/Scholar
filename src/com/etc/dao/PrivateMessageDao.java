package com.etc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.etc.entity.Lesson;
import com.etc.entity.PrivateMessage;
import com.etc.entity.User;

public interface PrivateMessageDao {
	
	@Select("SELECT * FROM privateMessage")
	@Results({ @Result(id = true, property = "privateMessageId", column = "privateMessgeId"),
			@Result(property = "user", column = "userId", one = @One(select = "com.etc.dao.UserDao.getById")),
			@Result(property = "targetUser", column = "targetUserId", one = @One(select = "com.etc.dao.UserDao.getById")),
			@Result(property = "readed", column = "readed"),
			@Result(property = "privateMessageTime", column = "privateMessageTime"),
			@Result(property = "privateMessageContent", column = "privateMessageContent") })
	public List<PrivateMessage> get();

	@Select("SELECT * FROM privateMessage WHERE privateMessageId = #{privatemMessageId}")
	@Results({ @Result(id = true, property = "privateMessageId", column = "privateMessageId"),
			@Result(property = "user", column = "userId", one = @One(select = "com.etc.dao.UserDao.getById")),
			@Result(property = "targetUser", column = "targetUserId", one = @One(select = "com.etc.dao.UserDao.getById")),
			@Result(property = "readed", column = "readed"),
			@Result(property = "privateMessageTime", column = "privateMessageTime"),
			@Result(property = "privateMessageContent", column = "privateMessageContent") })
	public PrivateMessage getById(int privateMessageId);

	@Select("SELECT * FROM privateMessage WHERE targetUserId = #{targetUserId} ORDER BY readed DESC, privateMessageTime DESC")
	@Results({ @Result(id = true, property = "privateMessageId", column = "privateMessageId"),
			@Result(property = "user", column = "userId", one = @One(select = "com.etc.dao.UserDao.getById")),
			@Result(property = "targetUser", column = "targetUserId", one = @One(select = "com.etc.dao.UserDao.getById")),
			@Result(property = "readed", column = "readed"),
			@Result(property = "privateMessageTime", column = "privateMessageTime"),
			@Result(property = "privateMessageContent", column = "privateMessageContent") })
	public List<PrivateMessage> getByTargetUserId(int targetUserId);
	
	@Insert("INSERT INTO privateMessage VALUES (NULL, #{user.userId}, #{targetUser.userId}, #{readed}, #{privateMessageTime}, #{privateMessageContent})")
	public void add(PrivateMessage privateMessage);

	@Update("UPDATE privateMessage SET userId = #{user.userId}, targetUserId = #{targetUser.userId}, readed = #{readed}, privateMessageTime = #{privateMessageTime}, privateMessageContent = #{privateMessageContent} WHERE privateMessageId = #{privateMessageId}")
	public void update(PrivateMessage privateMessage);

	@Delete("DELETE FROM privateMessage WHERE privateMessageId = #{privateMessageId}")
	public void delete(int privateMessageId);
	
}
