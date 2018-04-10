package com.etc.dao;

import java.util.Date;

public interface TimeAssistDao {
	
	public Date getDateTimeByString(String t);//DateTime 转换为 String
	public Date getDateByString(String t);//Date 转换为 String
	public String getStringByDate(Date dt);//String 转换为 Date
	public String getStringByDateTime(Date dt);//String 转换为 DateTime
}
