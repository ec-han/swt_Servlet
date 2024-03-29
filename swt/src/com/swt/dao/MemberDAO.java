package com.swt.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.swt.dto.MemberDTO;
import com.swt.mybatis.SqlMapConfig;

public class MemberDAO {
	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
	
	SqlSession sqlSession;
	
	int result = 0;
	MemberDTO mDto = new MemberDTO();
	boolean flag = false;
	
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
		sqlSession = sqlSessionFactory.openSession(true);
		result = 0;
		try {
			result = sqlSession.insert("memInsert", mDto); 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return result;
	}
	
	// 회원정보 수정(PW 제외)
	
	public int memUpdate(MemberDTO mDto) {
		sqlSession = sqlSessionFactory.openSession(true);
		try {
			result = sqlSession.update("memUpdate", mDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
	
	// 회원 1명의 정보를 가져옴
	public MemberDTO memOne(String id) {
		sqlSession = sqlSessionFactory.openSession(true);
		try {
			mDto = sqlSession.selectOne("memOne", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return mDto;
	}
	
	// 비밀번호 재설정: 현재비밀번호와 입력한 비밀번호가 일치하는지 확인
	public boolean pwCheck(String id,String pw) {
		sqlSession = sqlSessionFactory.openSession();
		HashMap<String, String> map = new HashMap<>();
		
		try {
			map.put("id",id);
			map.put("pw", pw);
			result = sqlSession.selectOne("pwCheck", map);
			System.out.println("result>>"+result);
			if(result == 1) {
				flag = true;
			} else {
				flag = false;
			}
			
			System.out.println("flag>>> "+flag);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return flag;
	}
	
	public int pwUpdate(String id, String pw) {
		sqlSession = sqlSessionFactory.openSession(true);
		HashMap<String, String> map = new HashMap<>();
		map.put("id",id);
		map.put("pw",pw);
		
		try {
			result = sqlSession.update("pwUpdate", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return result;
	}
	
	// 회원탈퇴(삭제)
	public int memDelete(String id) {
		sqlSession = sqlSessionFactory.openSession(true);
		
		try {
			result = sqlSession.delete("memDelete", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return result;
	}
	
}
