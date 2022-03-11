package com.dgv.web.user.vo;

import lombok.Data;


public class PaginationVO {

	private int currentPageNo; // 현재페이지번호  
	private int recordCountPage; // 한페이지당 게시되는 게시물수
	private int pageSize;        //페이지 리스트에 게시되는 페이지수 
	private int totalRecordCount; //전체 게시물수 
	private int firstPageNoOnPageList; //페이지 리스트의 첫 페이지 번호
	private int lastPageNoOnPageList; //페이지 리스트의 마지막 페이지 번호 
	private int firstRecordIndex; //페이징 sql조건절에 사용되는 시작 rownum
	private boolean xprev; //이전버튼
	private boolean xnext; //다음버튼
	private int realEnd; //페이징 마지막 숫자
	
	
	
	public int getCurrentPageNo() {
		return currentPageNo;
	}
	public void setCurrentPageNo(int currentPageNo) {
		this.currentPageNo = currentPageNo;
	}
	public int getRecordCountPage() {
		return recordCountPage;
	}
	public void setRecordCountPage(int recordCountPage) {
		this.recordCountPage = recordCountPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalRecordCount() {
		return totalRecordCount;
	}
	public void setTotalRecordCount(int totalRecordCount) {
		this.totalRecordCount = totalRecordCount;
	}
	public int getFirstPageNoOnPageList() {
		//첫페이지번호는 마지막 페이지번호에서 9를 뺀값이 되므로 
		//마지막 페이지 번호먼저 구하기
		
		lastPageNoOnPageList =(int) Math.ceil(currentPageNo/10)*10;
		firstPageNoOnPageList = lastPageNoOnPageList -9;
		
		return firstPageNoOnPageList;
	}
	
	public void setFirstPageNoOnPageList(int firstPageNoOnPageList) {
		this.firstPageNoOnPageList = firstPageNoOnPageList;
	}
	public int getLastPageNoOnPageList() {
		return lastPageNoOnPageList;
	}
	public void setLastPageNoOnPageList(int lastPageNoOnPageList) {
		this.lastPageNoOnPageList = lastPageNoOnPageList;
	}
	public int getFirstRecordIndex() {
		return firstRecordIndex;
	}
	public void setFirstRecordIndex(int firstRecordIndex) {
		this.firstRecordIndex = firstRecordIndex;
	}
	public boolean isXprev() {
		return xprev;
	}
	public void setXprev(boolean xprev) {
		this.xprev = xprev;
	}
	public boolean isXnext() {
		return xnext;
	}
	public void setXnext(boolean xnext) {
		this.xnext = xnext;
	}
	public int getRealEnd() {
		return realEnd;
	}
	public void setRealEnd(int realEnd) {
		this.realEnd = realEnd;
	}
	
	
	
}
