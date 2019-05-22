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
import com.swt.action.BoardListAction;
import com.swt.action.BoardViewAction;
import com.swt.action.CommentListAction;
import com.swt.action.ConstractAction;
import com.swt.action.DropMemberAction;
import com.swt.action.DropMemberPlayAction;
import com.swt.action.IdCheckAction;
import com.swt.action.IndexAction;
import com.swt.action.InfoUpdateAction;
import com.swt.action.InfoUpdatePlayAction;
import com.swt.action.LoginAjaxAction;
import com.swt.action.LoginOutAction;
import com.swt.action.LogoutAjaxAction;
import com.swt.action.MemberAction;
import com.swt.action.MemberPlayAction;
import com.swt.action.PwCheckAction;
import com.swt.action.PwUpdateAction;
import com.swt.action.PwUpdatePlayAction;

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
		
		// 13. uri와 ctx를 빼고 command를 생성 
		// 	   실행: /swt/idCheck.swt
		//	     - /swt/
		//-----------------------------------
		//       = /idCheck.swt  >>> command
		String uri = request.getRequestURI();
		String ctx = request.getContextPath(); 
		String command = uri.substring(ctx.length());
		System.out.println("페이지 이동>>>>>>"+command);
		
		// 14. 생성된 command 조건에 맞는 if문 실행 
		//		command = /idCheck.swt 
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
			// 15. idCheckAction 클래스 객체 생성
			//	    결과물: action 인스턴스
			//	   action 인스턴스를 활용하여 excute() 메서드 실행
			//     매개변수로 Controller의 request와 response를 전송 
			//	    이동: IdCheckAction 클래스의 excute()로 이동!:) 
			action = new IdCheckAction();
			forward = action.excute(request, response);
		} else if(command.equals("/memberPlay.swt")) {
			action = new MemberPlayAction();
			forward = action.excute(request, response);
		} else if(command.equals("/login.swt")) {
			action = new LoginAjaxAction();
			forward = action.excute(request, response);
		} else if(command.equals("/loginOut.swt")) { //ajax없이 referer로 로그아웃 한 방법
			action = new LoginOutAction();
			forward = action.excute(request, response);
		} else if(command.equals("/logoutAjax.swt")) { //ajax로 로그아웃 
			action = new LogoutAjaxAction();
			forward = action.excute(request, response);
		} else if(command.equals("/infoUpdate.swt")) { //ajax로 로그아웃 
			action = new InfoUpdateAction();
			forward = action.excute(request, response);
		} else if(command.equals("/infoUpdatePlay.swt")) { //ajax로 로그아웃 
			action = new InfoUpdatePlayAction();
			forward = action.excute(request, response);
		} else if(command.equals("/pwUpdate.swt")) { //ajax로 로그아웃 
			action = new PwUpdateAction();
			forward = action.excute(request, response);
		} else if(command.equals("/pwCheck.swt")) { //ajax로 로그아웃 
			action = new PwCheckAction();
			forward = action.excute(request, response);
		} else if(command.equals("/pwUpdatePlay.swt")) { //ajax로 로그아웃 
			action = new PwUpdatePlayAction();
			forward = action.excute(request, response);
		} else if(command.equals("/dropMember.swt")) { //ajax로 로그아웃 
			action = new DropMemberAction();
			forward = action.excute(request, response);
		} else if(command.equals("/dropMemberPlay.swt")) { //ajax로 로그아웃 
			action = new DropMemberPlayAction();
			forward = action.excute(request, response);
		} else if(command.equals("/boardList.swt")) { //ajax로 로그아웃 
			action = new BoardListAction();
			forward = action.excute(request, response);
		} else if(command.equals("/boardView.swt")) { //ajax로 로그아웃 
			action = new BoardViewAction();
			forward = action.excute(request, response);
		} else if(command.equals("/commentlist.swt")) { //ajax로 로그아웃 
			action = new CommentListAction();
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
