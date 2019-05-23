package com.swt.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.swt.dao.BoardDAO;
import com.swt.dao.ReplyDAO;
import com.swt.dto.ReplyDTO;

public class ReplyRemoveAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		int rno = Integer.parseInt(request.getParameter("rno"));
		System.out.println("rno"+rno);
		ReplyDAO rDao = ReplyDAO.getInstance();
		int result = rDao.replyRemove(rno);
		
		if (result>0) {
			System.out.println("성공");
			// 해당게시글 댓글카운트 1 감소 
			BoardDAO bDao = BoardDAO.getInstance();
			result = bDao.replyCntMinus(bno);
			if(result>0) {
				System.out.println("DB에 댓글 갯수 업데이트 성공!");
			}else {
				System.out.println("DB에 댓글 갯수 업데이트 실패!");
			}
		} else {
			System.out.println("실패!");
		}
		
		return null;
	}

}