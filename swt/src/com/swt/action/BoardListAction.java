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
		int page = 1;
		
		// ★★★★★★null로 들어오냐 안 들어오냐 체크하는 게 중요. 그래야 Integer.parseInt할때 널포인트익셉션이 안 뜸.
		// 사용자가 뭔가 페이지네이션을 클릭했을때 페이지 값을 넣어주게 . 안 눌렀으면 걍 1페이지. 그때는 Integer.parseInt(request.getParameter("page"))이게 null임.
		// null이 아닌 경우에만 이 if문이 실행되게 null을 parseInt하면 오류 뜸 널포인트익셉션. 
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		System.out.println("페이지번호:" + page);
		criDto.setPage(page); 
		
		String sort_type = "new";
		if(request.getParameter("sort_type")!=null) {
			sort_type = request.getParameter("sort_tpye");
		}
		System.out.println("정렬타입:"+sort_type);
		
		
		
		// DB에서 게시글 목록 호출 
		BoardDAO bDao = BoardDAO.getInstance();
		List<BoardDTO> list = bDao.listAll(criDto);
		
		// 페이지네이션 생성
		PageMakerDTO pageMaker = new PageMakerDTO();
		pageMaker.setCriDto(criDto);
		int totalCount = bDao.totalCount(criDto);
		pageMaker.setTotalCount(totalCount);
		
		// View단으로 게시글목록 전송 
		request.setAttribute("list", list);
		request.setAttribute("pageMaker", pageMaker);
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("sort_type", sort_type);
		
		ActionForward forward = new ActionForward();
		forward.setPath(url); 
		forward.setRedirect(false); // forward방식: 값이 안 바뀜 
		
		return forward; 
	}

}
