package com.dgv.web.user.vo;

public class Criteria {

	private int pageNum;
	private int amount;
	private int skip;
	private String searchType;
	private String keyword;
		
	public Criteria() {
		this(1,13);
		this.skip = 0;
				
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.skip =(pageNum-1)* amount;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.skip=(pageNum-1)*this.amount;
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.skip=(this.pageNum-1)*amount;
		this.amount = amount;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
}
