package com.swt.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.swt.dao.BoardDAO;
import com.swt.dao.MemberDAO;
import com.swt.dao.ReplyDAO;
import com.swt.dto.MemberDTO;

public class DeletePlayAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "boardList.swt";
		int bno = Integer.parseInt(request.getParameter("bno"));
		BoardDAO bDao = BoardDAO.getInstance();
		int result = bDao.bdelete(bno);
		System.out.println("DAO 다녀옴");
		if(result>0) {
			System.out.println("게시글 삭제 성공");
		} else {
			System.out.println("게시글 삭제 실패");
		}

		
		ActionForward forward = new ActionForward();
		forward.setPath(url); 
		forward.setRedirect(true); 
		
		return forward;
		
	}

}
