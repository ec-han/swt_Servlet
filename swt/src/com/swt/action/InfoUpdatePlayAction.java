package com.swt.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.swt.dao.MemberDAO;
import com.swt.dto.MemberDTO;

public class InfoUpdatePlayAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "index.jsp";
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String zipcode = request.getParameter("zipcode");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		MemberDTO mDto = new MemberDTO(id, name, phone, email, zipcode, addr1, addr2);
		MemberDAO mDao = MemberDAO.getInstance();
		int result = mDao.memUpdate(mDto);
//		System.out.println(mDto.toString());
		
		if(result > 0) {
			mDto = mDao.memOne(id);
			HttpSession session = request.getSession();
			session.removeAttribute("loginUser");
			session.setAttribute("loginUser",mDto);
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url); 
		forward.setRedirect(true); // Redirect방식
		
		return forward; 
	}

}
