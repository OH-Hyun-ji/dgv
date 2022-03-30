package com.dgv.web.user.vo;

public class MyPagePagingVO {
	
	private int startPage;
	private int endPage;
	private boolean prev,next;
	private int total;
	private MyPagePaging page;
	
	
	
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


	public MyPagePaging getPage() {
		return page;
	}

	public void setPage(MyPagePaging page) {
		this.page = page;
	}

	public MyPagePagingVO(int total, MyPagePaging page) {

		this.total = total;
		this.page = page;
		this.endPage =(int)(Math.ceil(page.getPageNum()/10.0))*10;
		this.startPage = this.endPage -9;
		
		int realEnd=(int)(Math.ceil(total * 1.0/page.getAmount()));
		
		if(realEnd <this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		
		this.next = this.endPage <realEnd;
		
		
	}


	
	
	
	
	
}
