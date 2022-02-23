package com.dgv.web.user.vo;

import lombok.ToString;

@ToString
public class UserDetailVO {

	private Integer user_num;
	private String user_id;
	private String user_rank;
	private Integer user_point;
	public Integer getUser_num() {
		return user_num;
	}
	public void setUser_num(Integer user_num) {
		this.user_num = user_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_rank() {
		return user_rank;
	}
	public void setUser_rank(String user_rank) {
		this.user_rank = user_rank;
	}
	public Integer getUser_point() {
		return user_point;
	}
	public void setUser_point(Integer user_point) {
		this.user_point = user_point;
	}
	
	
}
