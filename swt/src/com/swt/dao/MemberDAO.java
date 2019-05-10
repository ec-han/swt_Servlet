package com.swt.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.swt.dto.MemberDTO;
import com.swt.mybatis.SqlMapConfig;

public class MemberDAO {
	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
	
	SqlSession sqlSession;
	
	private MemberDAO() {} 
	
	private static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() {
		return instance;
	}
	
	// 회원가입 ID중복체크(Ajax)
	public String idCheck(String id) {
		// 19. myBatis를 사용하기 위해 sqlSession을 빌려옴 
		sqlSession = sqlSessionFactory.openSession();
		String result = "";
		try {
			// 20. sqlSession을 활용하여 mapper.xml의 idCheck이름의 sql문을 실행(매개변수로 id 데이터 전달) 
			result = sqlSession.selectOne("idCheck",id);
			// 22. DB에서 sql문을 실행한 결과를 result 변수에 담음 
			// 23. result가 null이면 사용가능한 ID
			//     result가 null이 아니면 중복된 ID
			//     사용 가능한 ID = "1"
			//     중복 된 ID = "-1"
			if(result != null) { // id가 있다. = 중복
				result = "-1";
			}else {
				result = "1"; // 사용 가능한 ID
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		// 24. IdCheckAction 클래스로 
		// 	   "1" or "-1"값을 return으로 보냄 
		return result;
	}
	
	public int memInsert(MemberDTO mDto) {
		sqlSession = sqlSessionFactory.openSession();
		int result = 0;
		try {
			result = sqlSession.insert("memInsert", mDto); 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return result;
	}
	
	
}
