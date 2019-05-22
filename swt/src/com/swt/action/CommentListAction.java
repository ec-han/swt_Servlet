package com.swt.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.swt.dao.ReplyDAO;
import com.swt.dto.ReplyDTO;

public class CommentListAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "board/commentlist.jsp";
		
		String bno = request.getParameter("bno");
		System.out.println("게시글번호: "+bno);
		// 해당 게시글의 댓글 목록을 조회
		ReplyDAO rDao = ReplyDAO.getInstance();
		List<ReplyDTO> list = rDao.replyList(bno);
		
		//sql실행결과를 setAttribute로 화면단으로 보내줌 
		request.setAttribute("replyList", list);
		
		ActionForward forward = new ActionForward();
		forward.setPath(url); 
		forward.setRedirect(false);
		
		return forward; //ajax썼는데도 forward방식 쓰는 이유는 commentlist.jsp파일 자체를 데이터로 통으로 보내기 때문 이게 최신 방식으로 댓글 띄우는 방법. 
	}

}
