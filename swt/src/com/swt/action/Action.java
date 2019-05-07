package com.swt.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 인터페이스엔 추상메서드와 상수만 올 수 있음
public interface Action {
	// 추상메서드
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
}
