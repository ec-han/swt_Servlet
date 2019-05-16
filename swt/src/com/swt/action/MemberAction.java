package com.swt.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.swt.dao.ProductDAO;
import com.swt.dto.ProductDTO;

public class MemberAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "member/member.jsp";
	
		
		ActionForward forward = new ActionForward();
		forward.setPath(url); 
		forward.setRedirect(false);
		
		return forward; 
	}

}
