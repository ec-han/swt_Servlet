package com.swt.common;

public class Constants {
	// 파일이 업로드 되는 디렉토리				// 윈도우에서는 경로가 역슬러시\(두개를 써야 하나로 인식), 리눅스&유닉스&맥에서는 /
	public final static String UPLOAD_PATH = "D:\\upload\\"; //D드라이브에 upload폴더 만들어야 함. 
			//static: 객체생성 안해도 사용가능. 인스턴스X. 클래스이름으로 호출							 
	
	// 파일 업로드 제한 용량(10MB)
	public final static int MAX_UPLOAD = 10 * 1024 * 1024;

	
}
