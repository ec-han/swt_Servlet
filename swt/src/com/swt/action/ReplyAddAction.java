package com.swt.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.swt.dao.BoardDAO;
import com.swt.dao.ReplyDAO;
import com.swt.dto.ReplyDTO;

public class ReplyAddAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int bno = Integer.parseInt(request.getParameter("re_bno"));
		String writer = request.getParameter("re_writer");
		String content = request.getParameter("re_textarea");
		
		ReplyDTO rDto = new ReplyDTO(content, writer, bno);
//		System.out.println(rDto.toString());
		ReplyDAO rDao = ReplyDAO.getInstance();
		int result = rDao.replyAdd(rDto);
		
		if(result>0) {
			System.out.println(rDto.toString()+"ACTION");
			// 해당게시글 댓글카운트 1 증가 
			BoardDAO bDao = BoardDAO.getInstance();
			result = bDao.replyCntAdd(bno);
			if(result>0) {
				System.out.println("DB에 댓글 갯수 업데이트 성공!");
			}else {
				System.out.println("DB에 댓글 갯수 업데이트 실패!");
			}
		}else {
			System.out.println("Action 에러에러!!");
		}
		
		
		return null;
	}

}
