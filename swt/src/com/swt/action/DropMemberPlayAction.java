package com.swt.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.swt.dao.MemberDAO;
import com.swt.dto.MemberDTO;

public class DropMemberPlayAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "index.swt";
		HttpSession session = request.getSession();
						//Object->MemberDTO로 형변환(session에 들어가면 dto그런 타입 없고 걍 object(객체)가 됨)
		MemberDTO mDto = (MemberDTO)session.getAttribute("loginUser");
		// 세션에서 값 꺼내 옴. 
		String id = mDto.getId();
		MemberDAO mDao = MemberDAO.getInstance();
		int result = mDao.memDelete(id);
		if(result > 0) {
			session.invalidate(); // 세션 초기화
		} 
		
		ActionForward forward = new ActionForward();
		forward.setPath(url); 
		forward.setRedirect(true); 
		
		return forward;
	}

}
