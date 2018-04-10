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

import com.etc.entity.Homework;

public interface HomeworkDao {

	@Select("SELECT * FROM homework")
	@Results({ @Result(id = true, property = "homeworkId", column = "homeworkId"),
			@Result(property = "lesson", column = "lessonId", one = @One(select = "com.etc.dao.LessonDao.getById")),
			@Result(property = "homeworkName", column = "homeworkName"),
			@Result(property = "homeworkContent", column = "homeworkContent"),
			@Result(property = "homeworkStartTime", column = "homeworkStartTime"),
			@Result(property = "homeworkEndTime", column = "homeworkEndTime") })
	public List<Homework> get();

	@Select("SELECT * FROM homework WHERE homeworkId = #{homeworkId}")
	@Results({ @Result(id = true, property = "homeworkId", column = "homeworkId"),
			@Result(property = "lesson", column = "lessonId", one = @One(select = "com.etc.dao.LessonDao.getById")),
			@Result(property = "homeworkName", column = "homeworkName"),
			@Result(property = "homeworkContent", column = "homeworkContent"),
			@Result(property = "homeworkStartTime", column = "homeworkStartTime"),
			@Result(property = "homeworkEndTime", column = "homeworkEndTime") })
	public Homework getById(int homeworkId);

	@Insert("INSERT INTO homework VALUES(NULL, #{lesson.lessonId}, #{homeworkName}, #{homeworkContent}, #{homeworkStartTime}, #{homeworkEndTime})")
	public void add(Homework homework);

	@Update("UPDATE homework SET lessonId = #{lesson.lessonId}, homeworkName = #{homeworkName}, homeworkContent = #{homeworkContent}, homeworkStartTime = #{homeworkStartTime}, homeworkEndTime = #{homeworkEndTime} WHERE homeworkId = #{homeworkId}")
	public void update(Homework homework);

	@Delete("DELETE FROM homework WHERE homeworkId = #{homeworkId}")
	public void delete(int homeworkId);
	
	@Select("SELECT * FROM homework WHERE lessonId = #{lessonId} ORDER BY homeworkId DESC")
	@Results({ @Result(id = true, property = "homeworkId", column = "homeworkId"),
			@Result(property = "lesson", column = "lessonId", many = @Many(select = "com.etc.dao.LessonDao.getById")),
			@Result(property = "homeworkName", column = "homeworkName"),
			@Result(property = "homeworkContent", column = "homeworkContent"),
			@Result(property = "homeworkStartTime", column = "homeworkStartTime"),
			@Result(property = "homeworkEndTime", column = "homeworkEndTime") })
	public List<Homework> getByLessonId(int lessonId);
	
	@Select("SELECT * FROM homework WHERE homeworkId NOT IN(SELECT homeworkId FROM studenthomeworkrelation WHERE studentId = #{studentId}) And lessonId = #{lessonId}")
	@Results({ @Result(id = true, property = "homeworkId", column = "homeworkId"),
		@Result(property = "lesson", column = "lessonId", many = @Many(select = "com.etc.dao.LessonDao.getById")),
		@Result(property = "homeworkName", column = "homeworkName"),
		@Result(property = "homeworkContent", column = "homeworkContent"),
		@Result(property = "homeworkStartTime", column = "homeworkStartTime"),
		@Result(property = "homeworkEndTime", column = "homeworkEndTime") })
	public List<Homework> getByLessonIdNot(@Param("studentId") int studentId, @Param("lessonId") int lessonId);
}
