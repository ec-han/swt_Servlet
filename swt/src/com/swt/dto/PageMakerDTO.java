package com.swt.dto;

public class PageMakerDTO {
	// 페이지 네이션 
	// 여기는 생성자 안 만듦 (값을 한꺼번에 넣는 경우가 없어서 set으로 넣음)
	
	
	private int totalCount; //310 // 전체 데이터 개수
	private int startPage;//1	// 시작 페이지 번호
	private int endPage;//10	// 끝 페이지 번호
	private boolean prev;//false	// 이전 페이지 
	private boolean next;//true	// 이후 페이지
	private int displayPageNum = 10;	// 화면에 보여지는 클릭 수 
	private int finalPage; //31
	private CriteriaDTO criDto;
	// page(), pageStart(), perPageNum()
	
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	
	private void calcData() {
		// Math 클래스의 ceil 메서드는 무조건 소수점을 올림함 0.2 = 1로 처리
		endPage = (int)Math.ceil(criDto.getPage() / (double)displayPageNum) * displayPageNum;
//		10								(2 / 10) = 0.2 => 1 * 10 = 10
		startPage = (endPage - displayPageNum) + 1;
//		1			=	(10 - 10)+1
		int tempEndPage = (int)(Math.ceil(totalCount/(double)(criDto.getPerPageNum()/ criDto.getPage())));
//			62 =								310	/					         10/2=5
		if(endPage>tempEndPage) {
			endPage = tempEndPage;
		}
		
		prev = startPage == 1 ? false : true; 
//		false
		next = (endPage * (criDto.getPerPageNum()/criDto.getPage())) >= totalCount ? false : true;
//		true		10	*		10 / 2 =5   50 >= 310 ?? -> true				
		finalPage = (int)Math.ceil(totalCount/(double)(displayPageNum));
//		31		310/10=31
	}
	
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	public int getFinalPage() {
		return finalPage;
	}
	public void setFinalPage(int finalPage) {
		this.finalPage = finalPage;
	}
	public CriteriaDTO getCriDto() {
		return criDto;
	}
	public void setCriDto(CriteriaDTO criDto) {
		this.criDto = criDto;
	}
	@Override
	public String toString() {
		return "PageMakerDTO [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", prev=" + prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", finalPage="
				+ finalPage + "]";
	}
	
	
	
	
	
}
