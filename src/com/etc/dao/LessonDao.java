package com.etc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.etc.entity.Lesson;

public interface LessonDao {
	
	@Select("SELECT * FROM lesson")
	@Results({ @Result(column = "lessonId", id = true, property = "lessonId"),
			@Result(column = "teacherId", property = "teacher", one = @One(select = "com.etc.dao.UserDao.getById")),
			@Result(column = "majorId", property = "major", one = @One(select = "com.etc.dao.MajorDao.getById")),
			@Result(column = "lessonName", property = "lessonName"),
			@Result(column = "lessonIntroduction", property = "lessonIntroduction"),
			@Result(column = "lessonAnnouncement", property = "lessonAnnouncement"),
			@Result(column = "lessonPictureUrl", property = "lessonPictureUrl")

	})
	public List<Lesson> get();

	@Select("SELECT * FROM lesson WHERE lessonId = #{lessonId}")
	@Results({ @Result(column = "lessonId", id = true, property = "lessonId"),
			@Result(column = "teacherId", property = "teacher", one = @One(select = "com.etc.dao.UserDao.getById")),
			@Result(column = "majorId", property = "major", one = @One(select = "com.etc.dao.MajorDao.getById")),
			@Result(column = "lessonName", property = "lessonName"),
			@Result(column = "lessonIntroduction", property = "lessonIntroduction"),
			@Result(column = "lessonAnnouncement", property = "lessonAnnouncement"),
			@Result(column = "lessonPictureUrl", property = "lessonPictureUrl")

	})
	public Lesson getById(int lessonId);
	
	@Select("SELECT * FROM lesson WHERE teacherId = #{teacherId}")
	@Results({ @Result(column = "lessonId", id = true, property = "lessonId"),
		@Result(column = "teacherId", property = "teacher", one = @One(select = "com.etc.dao.UserDao.getById")),
		@Result(column = "majorId", property = "major", one = @One(select = "com.etc.dao.MajorDao.getById")),
		@Result(column = "lessonName", property = "lessonName"),
		@Result(column = "lessonIntroduction", property = "lessonIntroduction"),
		@Result(column = "lessonAnnouncement", property = "lessonAnnouncement"),
		@Result(column = "lessonPictureUrl", property = "lessonPictureUrl")

	})
	public List<Lesson> getByTeacherId(int teacherId);
	
	@Insert("INSERT INTO lesson VALUES (null, #{teacher.userId}, #{major.majorId}, #{lessonName}, #{lessonIntroduction}, #{lessonAnnouncement}, #{lessonPictureUrl})")
	@SelectKey(statement = "select last_insert_id()", before = false, resultType = int.class, keyProperty = "lessonId")
	public void add(Lesson Lesson);

	@Update("UPDATE lesson SET teacherId = #{teacher.userId}, majorId = #{major.majorId}, lessonName = #{lessonName}, lessonIntroduction = #{lessonIntroduction}, lessonAnnouncement = #{lessonAnnouncement}, lessonPictureUrl = #{lessonPictureUrl} WHERE lessonId = #{lessonId}")
	public void update(Lesson lesson);

	@Delete("DELETE FROM lesson WHERE lessonId = #{lessonId}")
	public void delete(int lessonId);
	
	@Select("SELECT COUNT(*) FROM lesson WHERE lessonName LIKE #{searchString}")
	public int getSearchLessonTotalItem(@Param("searchString") String searchString);
	
	@Select("SELECT * FROM lesson WHERE lessonName LIKE #{searchString} ORDER BY lessonId LIMIT #{pageStartPosition}, #{pageSize}")
	@Results({ @Result(column = "lessonId", id = true, property = "lessonId"),
			@Result(column = "teacherId", property = "teacher", one = @One(select = "com.etc.dao.UserDao.getById")),
			@Result(column = "majorId", property = "major", one = @One(select = "com.etc.dao.MajorDao.getById")),
			@Result(column = "lessonName", property = "lessonName"),
			@Result(column = "lessonIntroduction", property = "lessonIntroduction"),
			@Result(column = "lessonAnnouncement", property = "lessonAnnouncement"),
			@Result(column = "lessonPictureUrl", property = "lessonPictureUrl")
	})
	public List<Lesson> getSearchLessonPageList(@Param("searchString") String searchString, @Param("pageStartPosition") int pageStartPosition, @Param("pageSize") int pageSize);
}
