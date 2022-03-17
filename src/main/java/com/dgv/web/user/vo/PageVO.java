package com.dgv.web.user.vo;

import lombok.Data;


public class PageVO {

	private int startPage;
	private int endPage;
	private boolean prev,next;
	private int total;
	private Criteria cri;
	
	
	
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

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	public PageVO(int total, Criteria cri) {

		this.total = total;
		this.cri = cri;
		this.endPage =(int)(Math.ceil(cri.getPageNum()/10.0))*10;
		this.startPage = this.endPage -9;
		
		int realEnd=(int)(Math.ceil(total * 1.0/cri.getAmount()));
		
		if(realEnd <this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		
		this.next = this.endPage <realEnd;
		
		
	}

	@Override
	public String toString() {
		return "PageVO [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", total=" + total + ", cri=" + cri + "]";
	}
	
	
	
	
	
}
