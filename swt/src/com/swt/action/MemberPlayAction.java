package com.swt.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.swt.dao.MemberDAO;
import com.swt.dao.ProductDAO;
import com.swt.dto.MemberDTO;
import com.swt.dto.ProductDTO;

public class MemberPlayAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "";
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pswd1");
		String name = request.getParameter("name");
		int bir_yy = Integer.parseInt(request.getParameter("yy"));
		int bir_mm = Integer.parseInt(request.getParameter("mm"));
		int bir_dd = Integer.parseInt(request.getParameter("dd"));;
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String zipcode = request.getParameter("zipcode");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		MemberDTO mDto = new MemberDTO(id,pw,name,bir_yy,bir_mm,bir_dd,phone,email,zipcode,addr1,addr2);
		System.out.println(mDto.toString());
		MemberDAO mDao = MemberDAO.getInstance();
		int result = mDao.memInsert(mDto);
		
		if(result>0) {
			url = "index.swt";
		}else {
			url = "constract.swt";
		}
		
		
		ActionForward forward = new ActionForward();
		forward.setPath(url); 
		forward.setRedirect(true); // 값이 변하니까 sendRedirect(delete,update,insert), 값이 안 변하고 페이지 이동만 하면 forward(select,search)
		
		return forward; 
	}

}
