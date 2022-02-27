package com.dgv.web.admin.vo;

import lombok.ToString;

@ToString
public class AdminGenreVO {

	private Integer movie_genre_code;
	private String movie_genre_name;
	private String reg_id;
	private String reg_date;
	
	
	public Integer getMovie_genre_code() {
		return movie_genre_code;
	}
	public void setMovie_genre_code(Integer movie_genre_code) {
		this.movie_genre_code = movie_genre_code;
	}
	public String getMovie_genre_name() {
		return movie_genre_name;
	}
	public void setMovie_genre_name(String movie_genre_name) {
		this.movie_genre_name = movie_genre_name;
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
