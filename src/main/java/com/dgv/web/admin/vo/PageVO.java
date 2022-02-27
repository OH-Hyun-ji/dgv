package com.dgv.web.admin.vo;

public class PageVO {
	
	private int page; //현재 페이지번호 
	private int perPageNum; //한페이지당 보여줄 게시글 갯수 

	public int getPageStart() { //특정 페이지의 게시글 시작 번호, 게시글 시작 행번호 
		return (this.page-1)*perPageNum;
	}
	
	public PageVO() {
		this.page = 1;
		this.perPageNum = 5;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if(page <=0 ) {
			this.page = 1;
		}else {
			this.page = page;			
		}
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int pageCount) {
		int cnt = this.perPageNum;
		if(pageCount != cnt) {
			this.perPageNum = cnt;
		}else {
			this.perPageNum = pageCount;			
		}
	}
}
