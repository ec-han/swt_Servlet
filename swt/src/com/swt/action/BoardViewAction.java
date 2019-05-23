package com.swt.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.swt.dao.BoardDAO;
import com.swt.dto.BoardDTO;

public class BoardViewAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "board/view.jsp";
		
		String bno = request.getParameter("bno");
		BoardDAO bDao = BoardDAO.getInstance();
		HttpSession session = request.getSession();
		
		// 조회수 증가(+1) 이 위치에 써야 view.jsp로 페이지 이동하면 바로 조회수 올린 후 밑에서 게시글상세출력할때 바뀐값 보여줌 
		bDao.viewCnt(bno, session);
		
		// 게시글 1건(상세조회)
		BoardDTO bDto = bDao.view(bno);
		request.setAttribute("one", bDto); // view.jsp로 값 보내는 거.
		
		ActionForward forward = new ActionForward();
		forward.setPath(url); 
		forward.setRedirect(false);
		
		return forward; 
	}

}
