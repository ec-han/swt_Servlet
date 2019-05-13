package com.swt.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.swt.dto.MemberDTO;
import com.swt.mybatis.SqlMapConfig;

public class LoginDAO {
	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
	
	SqlSession sqlSession;
	int result = 0;
	
	private LoginDAO() {}
	private static LoginDAO instance = new LoginDAO();
	public static LoginDAO getInstance() {
		return instance;
	}
	// Login시 회원가입 유무Check
	public MemberDTO loginCheck(String id, String pw) {
		sqlSession = sqlSessionFactory.openSession();
		// 기본생성자만 만들고 setter통해서 값 다이렉트로 넣어서 가방에 두개의 변수만 담아줌. 두개밖에 없는데 MemberDTO가서 변수2개인 생성자 만들기 그러니까. 
		// MemberDTO mDto = new MemberDTO(id,pw);와 같음. 
		MemberDTO mDto = new MemberDTO();
		mDto.setId(id);
		mDto.setPw(pw);
		try {
			mDto = sqlSession.selectOne("loginCheck", mDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return mDto;
	}
	
}
