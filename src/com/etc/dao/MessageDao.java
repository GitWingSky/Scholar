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

import com.etc.entity.Message;

public interface MessageDao {

	@Select("SELECT * FROM message")
	@Results({ @Result(id = true, property = "messageId", column = "messageId"),
			@Result(property = "user", column = "userId", one = @One(select = "com.etc.dao.UserDao.getById")),
			@Result(property = "lesson", column = "lessonId", one = @One(select = "com.etc.dao.LessonDao.getById")),
			@Result(property = "parentMessage", column = "parentMessageId", one = @One(select = "com.etc.dao.MessageDao.getById")),
			@Result(property = "messageTime", column = "messageTime"),
			@Result(property = "messageContent", column = "messageContent") })
	public List<Message> get();

	@Select("SELECT * FROM message WHERE messageId = #{messageId}")
	@Results({ @Result(id = true, property = "messageId", column = "messageId"),
			@Result(property = "user", column = "userId", one = @One(select = "com.etc.dao.UserDao.getById")),
			@Result(property = "lesson", column = "lessonId", one = @One(select = "com.etc.dao.LessonDao.getById")),
			@Result(property = "parentMessage", column = "parentMessageId", one = @One(select = "com.etc.dao.MessageDao.getById")),
			@Result(property = "messageTime", column = "messageTime"),
			@Result(property = "messageContent", column = "messageContent") })
	public Message getById(int messageId);
	
	@Select("SELECT * FROM message WHERE parentMessageId = #{parentMessageId}")
	@Results({ @Result(id = true, property = "messageId", column = "messageId"),
			@Result(property = "user", column = "userId", one = @One(select = "com.etc.dao.UserDao.getById")),
			@Result(property = "lesson", column = "lessonId", one = @One(select = "com.etc.dao.LessonDao.getById")),
			@Result(property = "parentMessage", column = "parentMessageId", many = @Many(select = "com.etc.dao.MessageDao.getById")),
			@Result(property = "messageTime", column = "messageTime"),
			@Result(property = "messageContent", column = "messageContent") })
	public List<Message> getByParentMessageId(int parentMessageId);

	@Insert("INSERT INTO message VALUES(NULL, #{user.userId}, #{lesson.lessonId}, #{targetUser.userId}, #{floor}, #{messageTime}, #{messageContent})")
	public void add(Message message);

	@Update("UPDATE message SET userId = #{user.userId}, lessonId = #{lesson.lessonId}, targetUserId = #{targetUser.userId}, floor = #{floor}, messageTime = #{messageTime}, messageContent = #{messageContent} WHERE messageId = #{messageId}")
	public void update(Message message);

	@Delete("DELETE FROM message WHERE messageId = #{messageId}")
	public void delete(int messageId);
	
	@Select("SELECT * FROM message WHERE lessonId = #{lessonId} AND targetUserId = 0 ORDER BY messageId DESC")
	@Results({ @Result(id = true, property = "messageId", column = "messageId"),
			@Result(property = "user", column = "userId", one = @One(select = "com.etc.dao.UserDao.getById")),
			@Result(property = "lesson", column = "lessonId", one = @One(select = "com.etc.dao.LessonDao.getById")),
			@Result(property = "targetUser", column = "targetUserId", one = @One(select = "com.etc.dao.UserDao.getById")),
			@Result(property = "floor", column = "floor"),
			@Result(property = "messageTime", column = "messageTime"),
			@Result(property = "messageContent", column = "messageContent") })
	public List<Message> getFloorHostByLessonId(int lessonId);
	
	@Select("SELECT * FROM message WHERE lessonId = #{lessonId} AND targetUserId != 0 AND floor = #{floor}")
	@Results({ @Result(id = true, property = "messageId", column = "messageId"),
			@Result(property = "user", column = "userId", one = @One(select = "com.etc.dao.UserDao.getById")),
			@Result(property = "lesson", column = "lessonId", one = @One(select = "com.etc.dao.LessonDao.getById")),
			@Result(property = "targetUser", column = "targetUserId", one = @One(select = "com.etc.dao.UserDao.getById")),
			@Result(property = "floor", column = "floor"),
			@Result(property = "messageTime", column = "messageTime"),
			@Result(property = "messageContent", column = "messageContent") })
	public List<Message> getFloorReplyByLessonId(@Param("lessonId") int lessonId, @Param("floor") int floor);
}
