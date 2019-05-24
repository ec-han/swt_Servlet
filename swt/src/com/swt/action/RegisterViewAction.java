package com.swt.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.swt.dao.ReplyDAO;
import com.swt.dto.ReplyDTO;

public class RegisterViewAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "board/register.jsp";
		
		ActionForward forward = new ActionForward();
		forward.setPath(url); 
		forward.setRedirect(false);
		
		return forward; //ajax썼는데도 forward방식 쓰는 이유는 commentlist.jsp파일 자체를 데이터로 통으로 보내기 때문 이게 최신 방식으로 댓글 띄우는 방법. 
	}

}
