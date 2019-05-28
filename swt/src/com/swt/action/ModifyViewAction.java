package com.swt.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.swt.dao.BoardDAO;
import com.swt.dto.BoardDTO;

public class ModifyViewAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		String strBno = request.getParameter("bno");
		BoardDAO bDao = BoardDAO.getInstance();
		BoardDTO bDto = new BoardDTO();
		bDto = bDao.view(strBno);
		
		String url = "board/modify.jsp";
		
		request.setAttribute("one", bDto); // view.jsp로 값 보내는 거.
		
		ActionForward forward = new ActionForward();
		forward.setPath(url); 
		forward.setRedirect(false);
		
		return forward;
	}

}
