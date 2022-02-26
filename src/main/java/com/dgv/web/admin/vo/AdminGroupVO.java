package com.dgv.web.admin.vo;

import java.util.Date;

import lombok.ToString;

@ToString
public class AdminGroupVO {

	private Integer movie_group_code;
	private String movie_group_name;
	private String reg_id;
	private String reg_date;
	public Integer getMovie_group_code() {
		return movie_group_code;
	}
	public void setMovie_group_code(Integer movie_group_code) {
		this.movie_group_code = movie_group_code;
	}
	public String getMovie_group_name() {
		return movie_group_name;
	}
	public void setMovie_group_name(String movie_group_name) {
		this.movie_group_name = movie_group_name;
	}
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	

}
