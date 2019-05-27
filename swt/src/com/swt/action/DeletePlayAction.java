package com.swt.action;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.swt.common.Constants;
import com.swt.dao.BoardDAO;

public class DeletePlayAction implements Action {
	// 게시글 삭제
	// 1. 댓글 삭제
	// 2. 첨부파일 삭제
	// 3. 게시글 삭제 -> 댓글 삭제 
	// 4. 좋아요 삭제 
	// 댓글 삭제와 게시글 삭제는 게시글번호와 댓글번호가 외래키로 묶여있음 CASCADE 쓰는 게 깔끔 

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "boardList.swt";
		
		// 첨부파일 삭제
		String filename = request.getParameter("filename");
		if(!filename.equals("-")) {	// 첨부파일이 있는 경우
			File file = new File(Constants.UPLOAD_PATH+filename);
			file.delete(); // 첨부파일 삭제 
		}
		
		int bno = Integer.parseInt(request.getParameter("bno")); // 화면단에서 쿼리스트링으로 보낸 bno 가져옴 
		
		BoardDAO bDao = BoardDAO.getInstance(); // 싱글톤패턴이라 객체생성1회하고 인스턴스로 빌려옴 
		int result = bDao.bdelete(bno); // bno로 int로 보내도 되고 String으로 보내도 됨
		
		System.out.println("DAO 다녀옴");
		
		if(result>0) {
			System.out.println("게시글 삭제 성공");
		} else {
			System.out.println("게시글 삭제 실패");
		}

		
		ActionForward forward = new ActionForward();
		forward.setPath(url); 
		forward.setRedirect(true); 
		
		return forward;
		
	}

}
