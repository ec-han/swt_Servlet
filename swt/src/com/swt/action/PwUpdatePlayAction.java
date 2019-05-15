package com.swt.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.swt.dao.MemberDAO;
import com.swt.dto.MemberDTO;

public class PwUpdatePlayAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "index.jsp";
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pswd1");
		System.out.println(id+","+pw);
		
		// 패스워드 수정 
		MemberDAO mDao = MemberDAO.getInstance();
		int result = mDao.pwUpdate(id,pw);
		
		if(result>0) {
			HttpSession session = request.getSession();
			MemberDTO mDto = mDao.memOne(id);
			session.removeAttribute("loginUser");
			session.setAttribute("loginUser", mDto);
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url); 
		forward.setRedirect(true); //DB타니까 sendRedirect방식 
		
		return forward; 
	}

}
