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

import com.etc.entity.Lesson;
import com.etc.entity.StudentLessonRelation;

public interface StudentLessonRelationDao {
	
	@Select("SELECT * FROM studentLessonRelation")
	@Results({ @Result(column = "studentLessonRelationId", id = true, property = "studentLessonRelationId"),
			@Result(column = "studentId", property = "student", one = @One(select = "com.etc.dao.UserDao.getById")),
			@Result(column = "lessonId", property = "lesson", one = @One(select = "com.etc.dao.LessonDao.getById")), })
	public List<StudentLessonRelation> get();

	@Select("SELECT * FROM studentLessonRelation WHERE studentLessonRelationId = #{studentLessonRelationId}")
	@Results({ @Result(column = "studentLessonRelationId", id = true, property = "studentLessonRelationId"),
			@Result(column = "studentId", property = "student", one = @One(select = "com.etc.dao.UserDao.getById")),
			@Result(column = "lessonId", property = "lesson", one = @One(select = "com.etc.dao.LessonDao.getById")), })
	public StudentLessonRelation getById(int studentLessonRelationId);
	
	@Select("SELECT * FROM studentLessonRelation WHERE studentId = #{studentId} AND lessonId = #{lessonId}")
	@Results({ @Result(column = "studentLessonRelationId", id = true, property = "studentLessonRelationId"),
			@Result(column = "studentId", property = "student", many = @Many(select = "com.etc.dao.UserDao.getById")),
			@Result(column = "lessonId", property = "lesson", many = @Many(select = "com.etc.dao.LessonDao.getById")), })
	public StudentLessonRelation getByRelation(@Param("studentId") int userId, @Param("lessonId") int lessonId);
	
	@Select("SELECT * FROM studentlessonrelation s INNER JOIN lesson g ON s.lessonId = g.lessonId WHERE studentId = #{studentId}")
	@Results({ @Result(column = "lessonId", id = true, property = "lessonId"),
		@Result(column = "teacherId", property = "teacher", one = @One(select = "com.etc.dao.UserDao.getById")),
		@Result(column = "majorId", property = "major", one = @One(select = "com.etc.dao.MajorDao.getById")),
		@Result(column = "lessonName", property = "lessonName"),
		@Result(column = "lessonIntroduction", property = "lessonIntroduction"),
		@Result(column = "lessonAnnouncement", property = "lessonAnnouncement"),
		@Result(column = "lessonPictureUrl", property = "lessonPictureUrl")
	})
	public List<Lesson> getByStudentId(int studentId);

	@Insert("INSERT INTO studentLessonRelation VALUES (null, #{student.userId}, #{lesson.lessonId})")
	public void add(StudentLessonRelation studentLessonRelation);

	@Update("UPDATE studentLessonRelation SET studentId = #{student.userId}, lessonId = #{lesson.lessonId} WHERE studentLessonRelationId = #{studentLessonRelationId}")
	public void update(StudentLessonRelation studentLessonRelation);

	@Delete("DELETE FROM studentLessonRelation WHERE studentLessonRelationId = #{studentLessonRelationId}")
	public void delete(int studentLessonRelationId);
	
	@Select("SELECT * FROM studentLessonRelation WHERE lessonId = #{lessonId} ORDER BY studentId")
	@Results({ @Result(column = "studentLessonRelationId", id = true, property = "studentLessonRelationId"),
		@Result(column = "studentId", property = "student", one = @One(select = "com.etc.dao.UserDao.getById")),
		@Result(column = "lessonId", property = "lesson", many = @Many(select = "com.etc.dao.LessonDao.getById")), })
	public List<StudentLessonRelation> getByLessonId(int lessonId);
}
