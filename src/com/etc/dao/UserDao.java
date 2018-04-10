package com.etc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;


import com.etc.entity.User;

public interface UserDao {

	@Select("SELECT * FROM user")
	public List<User> get();

	@Select("SELECT * FROM user WHERE userId = #{userId}")
	public User getById(int userId);

	// 通过用户名获取用户对象
	@Select("SELECT * FROM user WHERE userUsername = #{userUsername}")
	public User getByUserUsername(String userUsername);

	@Insert("INSERT INTO user VALUES (null, #{userUsername}, #{userPassword}, #{userType}, #{userName}, #{userSex}, #{userAge}, #{userBirthday}, #{userPhone}, #{userEmail}, #{userSchool}, #{userAddress}, #{userIntroduction}, #{userPictureUrl})")
	public void add(User user);

	@Update("UPDATE user SET userUsername = #{userUsername}, userPassword = #{userPassword}, userType = #{userType}, userName = #{userName}, userSex = #{userSex}, userAge = #{userAge}, userBirthday = #{userBirthday}, userPhone = #{userPhone}, userEmail = #{userEmail}, userSchool = #{userSchool}, userAddress = #{userAddress}, userIntroduction = #{userIntroduction}, userPictureUrl = #{userPictureUrl} WHERE userId = #{userId}")
	public void update(User user);

	@Delete("DELETE FROM user WHERE userId = #{userId}")
	public void delete(int userId);

	// 根据课程获取用户总行数
	@Select("SELECT count(*) FROM user s INNER JOIN studentlessonrelation l ON l.studentId=s.userId AND l.lessonId= #{lessonId} ORDER BY userId")
	public int getTotalItem(@Param("lessonId") int lessonId);

	// 按课程获取某页用户
	@Select("SELECT * FROM user s INNER JOIN studentlessonrelation l ON l.studentId=s.userId AND l.lessonId= #{lessonId} ORDER BY userId LIMIT #{truePage} , #{pageSize}")
	@Results({
			@Result(column = "userId", id = true, property = "userId"),
			@Result(column = "userUsername", property = "userUsername"),
			@Result(column = "userPassword", property = "userPassword"),
			@Result(column = "userType", property = "userType"),
			@Result(column = "userName", property = "userName"),
			@Result(column = "userSex", property = "userSex"),
			@Result(column = "userAge", property = "userAge"),
			@Result(column = "userBirthday", property = "userBirthday"),
			@Result(column = "userPhone", property = "userPhone"),
			@Result(column = "userEmail", property = "userEmail"),
			@Result(column = "userSchool", property = "userSchool"),
			@Result(column = "userAddress", property = "userAddress"),
			@Result(column = "userIntroduction", property = "userIntroduction"),
			@Result(column = "userPictureUrl", property = "userPictureUrl")

	})
	public List<User> page(@Param("pageIndex") int pageIndex,
			@Param("pageSize") int pageSize, @Param("lessonId") int lessonId,
			@Param("truePage") int truePage);
	
	@Select("SELECT COUNT(*) FROM user WHERE userName LIKE #{searchString}")
	public int getSearchLessonTotalItem(@Param("searchString") String searchString);
	
	@Select("SELECT * FROM user WHERE userName LIKE #{searchString} ORDER BY userId LIMIT #{pageStartPosition}, #{pageSize}")
	public List<User> getSearchLessonPageList(@Param("searchString") String searchString, @Param("pageStartPosition") int pageStartPosition, @Param("pageSize") int pageSize);
}
