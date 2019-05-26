package com.swt.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.swt.dao.BoardDAO;
import com.swt.dto.BoardDTO;

public class ModifyPlayAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("게시글 수정 Play action단 시작");
		String strBno = request.getParameter("modi_bno");
		int bno = Integer.parseInt(strBno);
		System.out.println("Play Action단 bno="+bno+",strBno="+strBno);
		String url = "boardView.swt?bno="+bno;
//		String url = "boardList.swt";
		String writer = request.getParameter("modi_writer");
		String content = request.getParameter("boardListModify");
		String title = request.getParameter("modi_title");
		System.out.println("writer"+writer+", content"+content+", title"+title);
		BoardDTO bDto = new BoardDTO(bno, title, content, writer);
		
		BoardDAO bDao = BoardDAO.getInstance();
		int result = bDao.contentModify(bDto);
		
		System.out.println("DAO 다녀옴");
		if(result>0) {
			System.out.println("게시글 수정 성공");
		} else {
			System.out.println("게시글 수정 실패");
		}

		ActionForward forward = new ActionForward();
		forward.setPath(url); 
		forward.setRedirect(true);
		
		return forward;
	}

}
