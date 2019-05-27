package com.swt.action;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.swt.common.Constants;
import com.swt.dao.BoardDAO;
import com.swt.dto.BoardDTO;

public class ModifyPlayAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("게시글 수정 Play action단 시작");
		
		String url="boardList.swt";
		
		File uploadDir = new File(Constants.UPLOAD_PATH);
		
		if(!uploadDir.exists()) {
			uploadDir.mkdir(); 
		}
		
		MultipartRequest multi = new MultipartRequest(request,Constants.UPLOAD_PATH,Constants.MAX_UPLOAD,"UTF-8",new DefaultFileRenamePolicy());
		
		String strBno = multi.getParameter("bno");
		int bno = Integer.parseInt(strBno);
		System.out.println("Play Action단 bno="+bno+"strBno="+strBno);
		
		String writer = multi.getParameter("modi_wrtier");
		String content = multi.getParameter("boardListModify");
		String title = multi.getParameter("modi_title");
		
		String filename = " "; // " " 공백값을 넣어놓음 꼭 한칸 띄워야 함. null이나 공백으로 두면 첨부파일에 파일 첨부 안했을때 sql문 실행할때 문제가 다분  try~catch문 아래의 if문에서 방지해줌 
		int filesize = 0;
		

		try {
			Enumeration files = multi.getFileNames();
			// Enumeration - java.util로 import
			while (files.hasMoreElements()) {
				
				String file1 = (String)files.nextElement(); // nextElement(): rs.next()랑 똑같은거
				filename = multi.getFilesystemName(file1);	// 첨부파일의 파일 이름 : 파일의 이름을 가져와서 filename 변수에 초기화 
				File f1 = multi.getFile(file1); // 첨부파일의 파일: 파일을 불러온 다음에 f1이라는 변수에 담음
				
				if(f1 != null) { // 파일이 있으면
					// filesize는 Long타입으로 가져옴
					// int로 형변환 
					filesize = (int)f1.length(); // 첨부파일의 파일 사이즈 저장 : f1.length() 파일의 사이즈를 구함 
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		if(filename == null || filename.trim().equals("")) {
			filename = "-"; 
		}
		
		// 파일업로드) 첨부파일 포함한 DTO가방 생성 
		BoardDTO bDto = new BoardDTO(title, content, writer, filename, filesize);
		System.out.println(bDto.toString());
		
		BoardDAO bDao = BoardDAO.getInstance();
		int result = bDao.contentRegister(bDto); //  파일업로드) Mapper가서 sql문 변경해야함 
		bno = bDao.boardBno();
		
		System.out.println("DAO 다녀옴");
		if(result>0) {
			System.out.println("게시글 등록 성공");
//			url = "boardView.swt?bno="+bno; //게시글 등록하고 바로 그 등록한 게시글이 뜨게 하는 방법 
			url = "boardList.swt?";
		} else {
			System.out.println("게시글 등록 실패");
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url); 
		forward.setRedirect(true);
		
		return forward;
	}

}
