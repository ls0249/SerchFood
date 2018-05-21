package com.sung.sf.util;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionLocator {

public static SqlSession getSession(){
		
		// * 메서드가 static이고 session은 지역변수인 것 주의하기!
		SqlSession session = null;
		InputStream inputStream = null;

		try {
			
			String resource = "config/MyBatisConfig.xml";
			inputStream = Resources.getResourceAsStream(resource);

			/* ibatis와 차이점(3) : 사용하는 객체가 sqlMapper에서 session으로 바뀜! */ 
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);	
			session = sqlSessionFactory.openSession();
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return session;
	}
}
