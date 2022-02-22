package com.dgv.web.admin.vo;

import org.springframework.stereotype.Controller;

import lombok.ToString;

@ToString
public class AdminAgeVO {

	private Integer movie_age_num;
	private String movie_age_name;
	private String movie_age_img;
	private String reg_id;
	private String reg_date;

	public Integer getMovie_age_num() {
		return movie_age_num;
	}

	public void setMovie_age_num(Integer movie_age_num) {
		this.movie_age_num = movie_age_num;
	}

	public String getMovie_age_name() {
		return movie_age_name;
	}

	public void setMovie_age_name(String movie_age_name) {
		this.movie_age_name = movie_age_name;
	}

	public String getMovie_age_img() {
		return movie_age_img;
	}

	public void setMovie_age_img(String movie_age_img) {
		this.movie_age_img = movie_age_img;
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
