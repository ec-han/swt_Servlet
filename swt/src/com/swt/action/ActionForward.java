package com.swt.action;

public class ActionForward {
	// view page(결과값을 어디로 넘길지 결정)
	private String path; // shs_index.jsp
	private boolean isRedirect; // false
	// 페이지 넘길 때 2가지 방법
	// 1) sendRedirect
	// 2) forward
	// true -> sendRedirect
	// false -> forward
	
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) { // IndexAction클래스에서 메서드 호출할때의 매개변수인 url이 들어옴 
		this.path = path;
	}
	public boolean isRedirect() {
		return isRedirect; // false를 반환 
	}
	public void setRedirect(boolean isRedirect) {//(false)
		this.isRedirect = isRedirect;
	}
}
