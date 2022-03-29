package com.dgv.web.user.vo;

public class MyPagePaging {
	private int pageNum;
	private int amount;
	private int skip;
	private String user_id;
		
	public MyPagePaging() {
		this(1,5);
		this.skip = 0;
				
	}

	public MyPagePaging(int pageNum, int amount) {
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


	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	
	
	
}
