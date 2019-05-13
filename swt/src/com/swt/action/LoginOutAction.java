package com.swt.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginOutAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		if(session != null) {
			// Session을 초기화
			session.invalidate();
		}
		// 내 페이지의 바로 이전페이지의 url정보를 알려줌 
		String referer = request.getHeader("referer");
		
		System.out.println("url: "+referer);
		
		String url = referer;
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
		
		
		return forward;
	}

}
