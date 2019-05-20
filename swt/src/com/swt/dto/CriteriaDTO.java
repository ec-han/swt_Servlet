package com.swt.dto;

public class CriteriaDTO {
	// 한 페이지에 몇 건 띄울건지
	private int page;//1 2			// 페이지 번호(하단의 번호들 클릭)
	private int perPageNum;//10			// 한 페이지에 보여줄 게시글 수 
	private String keyword;			// 검색 키워드
	private String search_option;	// 검색 타입
	private String sort_type;		// 정렬 타입
	
	public CriteriaDTO() { // 생성자 생성과 동시에 초기화 
		// Default로 게시판 목록 출력 시 
		// 1페이지에 10개의 게시물을 출력함. 
		this.page = 1;
		this.perPageNum = 10;
	}
	
	
	public CriteriaDTO(int page, int perPageNum, String keyword, String search_option, String sort_type) {
		super();
		this.page = page;
		this.perPageNum = perPageNum;
		this.keyword = keyword;
		this.search_option = search_option;
		this.sort_type = sort_type;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		// 1페이지에서 이전 게시글 눌렀을때 1페이지 그대로 있게 방지
		if(page<=0) {
			this.page= 1;
			return;
		}
		this.page = page;
	}
	
	// method for MyBatis SQL Mapper 
	// : 조회 시작 row 취득하는 메서드 
	public int getPageStart() {
		return (((this.page-1)*perPageNum)+1);
		// 41 = ((5-1)*10)+1
	}
	
	// 조회 마지막 row 취득하는 메서드 
	public int getPerPageNum() {
		return this.page * perPageNum;
		// 50
	}

	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getSearch_option() {
		return search_option;
	}

	public void setSearch_option(String search_option) {
		this.search_option = search_option;
	}

	public String getSort_type() {
		return sort_type;
	}

	public void setSort_type(String sort_type) {
		this.sort_type = sort_type;
	}

	@Override
	public String toString() {
		return "CriteriaDTO [page=" + page + ", perPageNum=" + perPageNum + ", keyword=" + keyword + ", search_option="
				+ search_option + ", sort_type=" + sort_type + "]";
	}
	
	
	
}
