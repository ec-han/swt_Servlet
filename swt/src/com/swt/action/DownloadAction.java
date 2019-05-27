package com.swt.action;

import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.swt.common.Constants;

public class DownloadAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String filename = request.getParameter("file");
		System.out.println("filename>>>"+filename);
		
		// 파일 다운로드 과정
		String path = Constants.UPLOAD_PATH + filename;
		// D:\\upload\\favi.png 이런식으로 가져옴 
		
		// byte단위로 쪼개서 가져오는 방법
		byte[] b = new byte[4096]; // 바이트 배열 생성
		
		// 서버에 저장된 파일을 읽기 위한 스트림 생성 FileInputStream : import java.io.FileInputStream;
		FileInputStream fis = new FileInputStream(path);
		
		// 파일의 종류(mimeType) 통합 타입, 웬만한 확장자는 다 읽어올 수 있음 
		String mimeType = request.getServletContext().getMimeType(path);
		if(mimeType == null) {
			mimeType = "application/octet-stream; charset=utf-8";
		}
		
		// 파일 이름에 한글이 포함된 경우
		// new String(바이트배열, 변환할 이놐딩) 8859_1 서유럽언어
		// header에 특수문자 사용 못함, 서유럽언어로 변환
		filename = new String(filename.getBytes("utf-8"), "8859_1");
		
		// http header
		response.setHeader("content-Disposition", "attachment;filename="+filename);
		
		// http body
		// OutputStream 생성(서버에서 클라이언트에 쓰기): body에다 내용을 집어넣겠다
		ServletOutputStream out = response.getOutputStream();
		// out은 쪼개서 보낼 블록 크기라 생각하면 됨 
		
		// 실질적으로 파일을 다운로드 해주는 코드
		// 파일이 35,000 byte => 한번에 다운로드 불가능
		int numRead;
		while(true) {
			// 4096 byte로 쪼개서 파일 읽어오기 : 4096만큼 읽어오고 보내고 반복.
			numRead = fis.read(b, 0, b.length); // 4096만큼 읽어옴
			if(numRead == -1) break;
			out.write(b, 0, numRead); // 4096만큼 보냄
		}
		
		// 파일 처리 관련 리소스 정리
		fis.close();
		out.flush(); // 4096씩 읽고 4096보다 작은 사이즈로 남아있는거 가져옴 
		out.close();
		
		
		return null;	// 다운로드이기때문에 페이지 이동이 필요 없으니 return null임
	}

}
