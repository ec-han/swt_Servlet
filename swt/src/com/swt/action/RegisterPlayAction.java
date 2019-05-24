package com.swt.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.swt.dao.BoardDAO;
import com.swt.dao.ReplyDAO;
import com.swt.dto.BoardDTO;
import com.swt.dto.ReplyDTO;

public class RegisterPlayAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("action단 시작");
		String url = "boardList.swt";
		String writer = request.getParameter("regi_writer");
		String content = request.getParameter("boardListInsert");
		String title = request.getParameter("regi_title");
		
		BoardDTO bDto = new BoardDTO(title, content, writer);

		BoardDAO bDao = BoardDAO.getInstance();
		int result = bDao.contentRegister(bDto);
		System.out.println("DAO 다녀옴");
		if(result>0) {
			System.out.println("게시글 등록 성공");
		} else {
			System.out.println("게시글 등록 실패");
		}

		ActionForward forward = new ActionForward();
		forward.setPath(url); 
		forward.setRedirect(true);
		
		return forward;
	}

}
