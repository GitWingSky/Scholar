package com.etc.util;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SessionFactoryUtil {
	
	static SqlSessionFactory sessionFactory = null;
	static Reader reader = null;
	
	private SessionFactoryUtil(){	
	}

	static{
		try {
			reader = Resources.getResourceAsReader("config/mybatis-config.xml");
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
	}

	private static SqlSessionFactory getSessionFactory(){
		if(sessionFactory == null){
			sessionFactory = new SqlSessionFactoryBuilder().build(reader);
		}
		return sessionFactory;
	}

	public static SqlSession getSession(){
		return getSessionFactory().openSession();
	}
} 
