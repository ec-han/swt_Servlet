package com.swt.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

public class ModifyAjaxAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url ="board/modify.jsp";
		
		String strBno = request.getParameter("bno");
		int bno = Integer.parseInt(strBno);
		System.out.println("Ajax bno="+bno+",strBno="+strBno);
		
		request.setAttribute("modi_bno", bno);
		
		JSONObject jObj = new JSONObject();
		jObj.put("bno=", bno);
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(jObj);
		
		return null; 
	}

}
