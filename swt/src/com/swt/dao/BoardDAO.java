package com.swt.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.swt.dto.BoardDTO;
import com.swt.dto.CriteriaDTO;
import com.swt.mybatis.SqlMapConfig;

public class BoardDAO {
	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
	
	SqlSession sqlSession;
	
	int result = 0;
	BoardDTO bDto = new BoardDTO();
	List<BoardDTO> list = null;
	boolean flag = false;
	
	
	private BoardDAO() {} 
	
	private static BoardDAO instance = new BoardDAO();
	public static BoardDAO getInstance() {
		return instance;
	}
	
	// 게시글 목록 
	public List<BoardDTO> listAll(CriteriaDTO criDto){
		
		sqlSession = sqlSessionFactory.openSession();

		try {
			list = sqlSession.selectList("listAll",criDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return list;
	}
	// 페이지 네이션에 필요한 게시글 Total수 구하기 
	public int totalCount(CriteriaDTO criDto) {
		sqlSession = sqlSessionFactory.openSession();
		
		try {
			result = sqlSession.selectOne("totalCount", criDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		
		return result;
	}
	
	// 게시글 1건(상세조회)
	public BoardDTO view(String bno) {
		sqlSession = sqlSessionFactory.openSession();
		
		try {								
			bDto = sqlSession.selectOne("view", bno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return bDto;
	}
	// 게시글 조회수 증가(+1)
	public void viewCnt(String bno, HttpSession session) {
		sqlSession = sqlSessionFactory.openSession(true);
		
		try {				
			
			long update_time = 0;
			
			// null이면 => 처음 조회수 1 증가
			if(session.getAttribute("read_time_"+bno)!=null) {
				// 조회수 맨 처음에 한번 증가시킬땐 read_time_+bno변수 없었으니까 if문 안 타고 그 다음부터 read_time_+bno변수 있으니까 탐 
				// 이전에 게시글 조회 시간 
				update_time = (long)session.getAttribute("read_time_"+bno);
			}
			
			// 현재시간 구하기(밀리초)
			long current_time = System.currentTimeMillis();
			
			// 현재시간과 이전에 게시글 조회시간을 비교
			// 24시간(1일)이 지났으면 조회수를 1증가 
			// 				아니면 조회수 증가 없음 
			// 24*60*60*1000 이게 24시간임.
			// currentTimeMillis가 밀리초단위로 나옴 
			// 현재시간-0=현재시간
			if(current_time - update_time > 24*60*60*1000) {
				// 조회수 1 증가
				sqlSession.update("viewCnt", bno);
				
				// 조회수 1 증가한 최신 시간을 session에 "read_time_"+bno라는 변수를 담음.
				session.setAttribute("read_time_"+bno, current_time);
				
				// ex) 30번게시글을 조회하는 경우
				// 		read_time_30 변수를 하나 만들고
				//		현재시간을 담음 
				// 좋아요는 read_time_을 good_time_으로 바꿔. 빼는것도 해야함. 사용자이름 비교해야함. 
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
	}
	
	// 댓글 등록 또는 삭제 시 해당 게시글 replycnt 증가 또는 감소(하나의 메서드로 묶을 수 있음) 
	public void replyCntUpdate(String bno, String flag) {
		sqlSession = sqlSessionFactory.openSession(true);
		try {	
			HashMap<String, String> map = new HashMap<>();
			map.put("bno", bno);
			map.put("flag", flag);
			sqlSession.update("replyCntUpdate", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
	}
	
	public int contentRegister(BoardDTO bDto) {
		sqlSession = sqlSessionFactory.openSession(true);
		
		try {	
			System.out.println("DAO단 실행");
			result = sqlSession.insert("contentRegister", bDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
	
	public int contentModify(BoardDTO bDto) {
		sqlSession = sqlSessionFactory.openSession(true);
		
		try {	
			System.out.println("Modify DAO단 실행");
			result = sqlSession.update("contentModify", bDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
	
	// 게시글 삭제 
	public int bdelete(int bno) {
		sqlSession = sqlSessionFactory.openSession(true);
		
		try {	
			System.out.println("게시글 삭제 DAO단 실행");
			result = sqlSession.delete("contentDelete", bno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
	
	public int boardBno() {
		sqlSession = sqlSessionFactory.openSession();
		
		try {	
			result = sqlSession.update("boardBno");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
}
