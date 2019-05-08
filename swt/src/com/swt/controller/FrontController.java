package com.swt.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.swt.action.Action;
import com.swt.action.ActionForward;
import com.swt.action.ConstractAction;
import com.swt.action.IdCheckAction;
import com.swt.action.IndexAction;
import com.swt.action.MemberAction;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("/FrontController")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontController() {
        super();
       
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		Action action = null;
		ActionForward forward = null;
		
		String uri = request.getRequestURI();
		String ctx = request.getContextPath(); 
		String command = uri.substring(ctx.length());
		System.out.println("페이지 이동>>>>>>"+command);
		
		if(command.equals("/index.swt")) {
			action = new IndexAction();
			forward = action.excute(request, response);
			// execute라 하려면 Action.java의 추상메서드 이름도 똑같이 바꿔줘야함. excute나 execute나 같음.
		} else if(command.equals("/constract.swt")) {
			action = new ConstractAction();
			forward = action.excute(request, response);
		} else if(command.equals("/member.swt")) {
			action = new MemberAction();
			forward = action.excute(request, response);
		} else if(command.equals("/idCheck.swt")) {
			action = new IdCheckAction();
			forward = action.excute(request, response);
		}	  
		
		
		
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher rd = request.getRequestDispatcher(forward.getPath()); 
				rd.forward(request, response);
			}
		}
	}
}
