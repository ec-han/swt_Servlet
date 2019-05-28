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
		String url = "";
		File uploadDir = new File(Constants.UPLOAD_PATH);
		
		if(!uploadDir.exists()) {
			uploadDir.mkdir(); 
		}
		
		// 기존파일이 있든 없든 새로운 파일을 저장 
		// ex) 만약에 기존 파일이 aaa.txt가 있고 새로 등록하는 첨부파일이 bbb.txt가 있다면
		//		현재 upload 디렉토리에 있는 aaa.txt와 bbb.txt가 있음 
		MultipartRequest multi = new MultipartRequest(request,Constants.UPLOAD_PATH,Constants.MAX_UPLOAD,"UTF-8",new DefaultFileRenamePolicy());
		
		int bno = Integer.parseInt(multi.getParameter("hidden_bno"));		
		System.out.println("Play Action단 bno="+bno);
		String title = multi.getParameter("modi_title");
		String content = multi.getParameter("boardListModify");
		String writer = multi.getParameter("modi_writer");
		
		// 기존 첨부파일
		String bFileName = multi.getParameter("bFileName");
		int bFileSize = Integer.parseInt(multi.getParameter("bFileSize"));
		String bCheck = multi.getParameter("basic_check");
		System.out.println(bCheck+","+bFileName+","+bFileSize);
		// 새로운 첨부파일
		String filename = " "; // " " 공백값을 넣어놓음 꼭 한칸 띄워야 함. null이나 공백으로 두면 첨부파일에 파일 첨부 안했을때 sql문 실행할때 문제가 다분  try~catch문 아래의 if문에서 방지해줌 
		int filesize = 0;
		
		System.out.println(bno+","+title+","+content+","+writer+","+bFileName+","+bFileSize+","+bCheck+","+filename+","+filesize);
		
		// DB에 저장할 첨부파일의 이름과 사이즈를 구함
		// 새로 등록한 첨부파일이 있다면 : 새로등록한 첨부파일의 filename의 filesize를 구하고  
		// 새로 등록한 첨부파일이 없다면 : while()을 타지 않아 filename = " ", filesize = 0으로 고정 
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
			// 새로 등록한 첨부파일이 없는 경우
			filename = "-"; 
			if(bCheck.equals("no")) { // 기존 첨부파일이 있는 경우(기존첨부파일bFileName 삭제)
				File file = new File(Constants.UPLOAD_PATH+bFileName);
				file.delete();
			}else { // 유지: 다시 기존첨부파일이랑 기존첨부파일 사이즈를 넣어줘야함
			//위에서 새로 등록한 첨부파일 없는 경우 filename = " ", filesize = 0로 초기화해놔서 다시 집어넣어줌
				filename = bFileName;
				filesize = bFileSize;
			}
		} else {
			// 새로 등록한 첨부파일이 있는 경우
			// 기존파일 있는지 체크
			if(bFileSize > 0) { // 기존 파일 있음
				File file = new File(Constants.UPLOAD_PATH+bFileName);
				file.delete();
			}
			
		}
		
		// 파일업로드) 첨부파일 포함한 DTO가방 생성 
		BoardDTO bDto = new BoardDTO(bno, title, content, writer, filename, filesize);
		System.out.println(bDto.toString());		
		BoardDAO bDao = BoardDAO.getInstance();
		int result = bDao.contentModify(bDto); //  파일업로드) Mapper가서 sql문 변경해야함 
		
		System.out.println("DAO 다녀옴");
		if(result>0) {
			System.out.println("게시글 수정 성공");
			url= "boardView.swt?bno="+bno;
		} else {
			System.out.println("게시글 수정 실패");
		}
		
		
		ActionForward forward = new ActionForward();
		forward.setPath(url); 
		forward.setRedirect(true);
		
		return forward;
	}

}
