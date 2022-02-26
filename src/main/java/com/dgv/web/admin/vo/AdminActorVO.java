package com.dgv.web.admin.vo;

import lombok.ToString;

@ToString
public class AdminActorVO {

	private Integer movie_actor_num;
	private Integer movie_group_code;
	private String movie_actor;
	private String reg_id;
	private String reg_date;

	public Integer getMovie_actor_num() {
		return movie_actor_num;
	}

	public void setMovie_actor_num(Integer movie_actor_num) {
		this.movie_actor_num = movie_actor_num;
	}

	public Integer getMovie_group_code() {
		return movie_group_code;
	}

	public void setMovie_group_code(Integer movie_group_code) {
		this.movie_group_code = movie_group_code;
	}

	public String getMovie_actor() {
		return movie_actor;
	}

	public void setMovie_actor(String movie_actor) {
		this.movie_actor = movie_actor;
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
