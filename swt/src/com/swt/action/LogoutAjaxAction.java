package com.swt.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

public class LogoutAjaxAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 세션가져와서 로그아웃시키는건 referer이용한 로그아웃 방법과 같음 
		HttpSession session = request.getSession();
		
		if(session != null) {
			// Session을 초기화 = 로그아웃 
			session.invalidate();
		}
		
		//--------------------------------------------
		
		// LoginAjaxAction에서 JSON객체 복붙. 
		JSONObject jObj = new JSONObject();
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(jObj);
		
		
		return null;
	}

}
