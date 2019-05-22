package com.swt.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.swt.dao.BoardDAO;
import com.swt.dto.BoardDTO;
import com.swt.dto.CriteriaDTO;
import com.swt.dto.PageMakerDTO;



public class BoardListAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "board/qna.jsp";
		
		CriteriaDTO criDto = new CriteriaDTO();
		
		// 페이지번호 설정 시작 
		int page = 1;
		
		// ★★★★★★null로 들어오냐 안 들어오냐 체크하는 게 중요. 그래야 Integer.parseInt할때 널포인트익셉션이 안 뜸.
		// 사용자가 뭔가 페이지네이션을 클릭했을때 페이지 값을 넣어주게 . 안 눌렀으면 걍 1페이지. 그때는 Integer.parseInt(request.getParameter("page"))이게 null임.
		// null이 아닌 경우에만 이 if문이 실행되게 null을 parseInt하면 오류 뜸 널포인트익셉션. 
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		System.out.println("페이지번호:" + page);
		criDto.setPage(page); 
		// 페이지번호 설정 끝
		
		// 페이지정렬 설정 시작
		String sort_type = "new";
		if(request.getParameter("sort_type")!=null) {
			sort_type = request.getParameter("sort_type");
		}
		criDto.setSort_type(sort_type);
		System.out.println("정렬타입:"+sort_type);
		// 페이지정렬 설정 끝
		
		// 검색 설정 시작(검색타입, 키워드)
		String search_option = null;
		String keyword = null;
		if(request.getParameter("keyword") != null) {
			search_option = request.getParameter("search_option");
			keyword = request.getParameter("keyword");
			criDto.setSearch_option(search_option);
			criDto.setKeyword(keyword);
			// 검색한 값이 있을때만 보내줘야 하니까 if문안에 setAttribute씀. 
			request.setAttribute("search_option", search_option);
			request.setAttribute("keyword", keyword);
			System.out.println("검색타입: "+search_option+", 검색키워드: "+keyword);
		}
		System.out.println(criDto.toString());
		
		
		// DB에서 게시글 목록 호출 
		BoardDAO bDao = BoardDAO.getInstance();
		List<BoardDTO> list = bDao.listAll(criDto); // 정렬타입 뭔지 알려주려고 criDto 보냄. 
		// mapper 다녀와서 정렬된 데이터가 쭉 들어옴
		
		// 페이지네이션 생성
		PageMakerDTO pageMaker = new PageMakerDTO();
		pageMaker.setCriDto(criDto);
		int totalCount = bDao.totalCount(criDto);
		pageMaker.setTotalCount(totalCount);
		
		// View단으로 게시글목록 전송 
		request.setAttribute("list", list);	// 게시글 목록
		request.setAttribute("pageMaker", pageMaker); // 페이지네이션 생성 정보
		request.setAttribute("totalCount", totalCount); // 게시글 총 갯수 
		request.setAttribute("sort_type", sort_type); // 게시글 정렬 타입
		// sort_type을 계속 보내줘야 페이지 이동해도 계속 sort_type을 가지고 다님. 
		
		ActionForward forward = new ActionForward();
		forward.setPath(url); 
		forward.setRedirect(false); // forward방식: 값이 안 바뀜 
		
		return forward; 
	}

}
