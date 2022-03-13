package com.dgv.web.user.vo;

import lombok.Data;

@Data
public class UserReserveVO {

	private Integer reserve_code;
	private Integer movie_num;
	private Integer region_code;
	private String  reserve_date;
	private String movie_time_start;
	private Integer theater_code;
	private String seat_reservation;
	private Integer reserve_basic;
	private Integer reserve_student;
	private Integer reserve_old;
	private Integer reserve_price;
	private String user_id;
	private String reserve_imp_uid;
	private String reserve_apply_num;
	private String reserve_merchant_uid;
	private String reserve_method;
	private Integer reserve_status;
	
	///////
	private String  city_name;
	private String  movie_title;
	private String fomatter_price;
}
