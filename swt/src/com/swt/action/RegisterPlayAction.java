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

public class RegisterPlayAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("게시글 등록 action단 시작");
		String url = "";
		// 파일업로드 1) 업로드할 파일을 저장할 디렉토리 생성 
		// File은 (java.io로 import)
		File uploadDir = new File(Constants.UPLOAD_PATH);
		
		// D드라이브에 upload라는 폴더(UPLOAD_PATH로 설정한 경로)가 없으면 만들어라는 뜻임. 
		if(!uploadDir.exists()) {// 저장할 경로가 없다면(!uploadDir.exists() = true면 if문 탐) 
			uploadDir.mkdir(); // 디렉토리를 생성하세요 mkdir: make directory
		}
		
		// request를 확장시킨 MultipartRequest 생성
		// request는 모두 String 타입
		// 파일 <- reqeust로 전송 불가
		// 파일 <- request를 향상시킨 MultipartRequest를 사용
		// 그래서 파일 뿐만 아니라 기존에 String타입도 전부 
		// Multipart타입으로 변경해야 함 
		// reqeust는 화면단에서 준 데이터. 그것을 multipart로 바꿔주는 것임. 
		
		// 파일업로드 2) 'D:\\upload"로 첨부파일 저장  																//import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
		MultipartRequest multi = new MultipartRequest(request,Constants.UPLOAD_PATH,Constants.MAX_UPLOAD,"UTF-8",new DefaultFileRenamePolicy());
															// 파일업로드 디렉토리,        업로드 최대 용량,        인코딩,   파일이름중복정책
		// 파일 관련된 DTO가 Constants라 생각하면 됨. Constants는 com.프로젝트명.common.Constants로 import
		String writer = multi.getParameter("regi_writer");
		String content = multi.getParameter("boardListInsert");
		String title = multi.getParameter("regi_title");
		// 파일이름과 파일 사이즈를 담을 변수 초기화 
		String filename = " "; // " " 공백값을 넣어놓음 꼭 한칸 띄워야 함. null이나 공백으로 두면 첨부파일에 파일 첨부 안했을때 sql문 실행할때 문제가 다분  try~catch문 아래의 if문에서 방지해줌 
		int filesize = 0;
		

		// 파일업로드 3) DB에 저장할 첨부파일의 이름과 사이즈를 구함 
		// file I/O할때랑 DB탈때 try~catch해야함
		try {
			Enumeration files = multi.getFileNames();
			// Enumeration - java.util로 import
			while (files.hasMoreElements()) {
				// hasMoreElements: files에 3개의 파일이 있다고 하면 file이 있으면 true해서 반복문 돔. 값이 더 있냐 없냐만 판단.  
				// 1 file true
				// 2 file true
				// 3 file true 파일이 있는 동안 반복문을 타고
				// false 없으면 안 탐 
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
		
		// 사용자가 첨부파일을 등록하지 않았을 때 
		// 파일이름이 null이나 ""으로 들어가는 것을 방지
		// "-"로 저장 되게 변경 
		if(filename == null || filename.trim().equals("")) {
			filename = "-"; 
		}
		
		// 파일업로드) 첨부파일 포함한 DTO가방 생성 
		BoardDTO bDto = new BoardDTO(title, content, writer, filename, filesize);
		System.out.println(bDto.toString());
		
		BoardDAO bDao = BoardDAO.getInstance();
		int result = bDao.contentRegister(bDto); //  파일업로드) Mapper가서 sql문 변경해야함 
		int bno = bDao.boardBno();
		
		System.out.println("DAO 다녀옴");
		if(result>0) {
			System.out.println("게시글 등록 성공");
//			url = "boardView.swt?bno="+bno; //게시글 등록하고 바로 그 등록한 게시글이 뜨게 하는 방법 
			url = "boardList.swt?";
			// 시퀀스가 고질병이 많아서...실패할때마다 꼬여서 안됨. 상용화하기 전까진 boardList로 띄우기 
		} else {
			System.out.println("게시글 등록 실패");
		}

		ActionForward forward = new ActionForward();
		forward.setPath(url); 
		forward.setRedirect(true);
		
		return forward;
	}

}
