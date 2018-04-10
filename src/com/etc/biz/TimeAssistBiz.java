package com.etc.biz;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeAssistBiz {
	
	public Date getDateTimeByString(String t){
		
		Date dt = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			dt = sdf.parse(t);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dt;
	}
	
	public Date getDateByString(String t){
		
		Date dt = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			dt = sdf.parse(t);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dt;
	}
	
	public String getStringByDate(Date dt){
		String t = "";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		t = sdf.format(dt); 
		return t;
	}
	
	public String getStringByDateTime(Date dt){
		String t = "";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		t = sdf.format(dt); 
		return t;
	}
}
