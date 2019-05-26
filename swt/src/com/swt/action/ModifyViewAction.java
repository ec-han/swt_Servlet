package com.swt.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ModifyViewAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "board/modify.jsp";
		
		String strBno = request.getParameter("bno");
		int bno = Integer.parseInt(strBno);
		System.out.println("bno="+bno+",strBno="+strBno);
		
		request.setAttribute("modi_bno", strBno); // 이게 안됨 
		
		ActionForward forward = new ActionForward();
		forward.setPath(url); 
		forward.setRedirect(false);
		
		return forward;  

	}
}
