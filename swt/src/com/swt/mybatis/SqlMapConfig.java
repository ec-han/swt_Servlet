package com.swt.mybatis;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {
	private static SqlSessionFactory sqlSessionFactory;
	
	static {
		/* resource에 mybatis의 모든 환경설정 정보가 들어 있는 것 */
		String resource = "com/swt/mybatis/Configuration.xml";
		
		try {
			Reader reader = Resources.getResourceAsReader(resource);
				/* file I/O같은 것. xml파일을 읽어오는 것. 한번에 보낼 수 없음. 그래서 쪼개서 보냄. getResource~로 조금씩 읽음*/
			if (sqlSessionFactory == null) { // 공장이 아직 하나도 없으면
				sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
										// 공장을 만들어주는 애인데 xml파일 읽어온 것을 토대로 만듦. 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static SqlSessionFactory getSqlSession() {
		return sqlSessionFactory;
	}
	
}
