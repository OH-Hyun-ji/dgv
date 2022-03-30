package com.dgv.web.user.vo;

import java.sql.Date;

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
	private String reserve_movie_date;
	private Integer use_point;
	private Integer coupon_discount;
	private Integer earn_point;
	private Integer reserve_myPoint;
	///////
	private Integer city_code;
	private String  city_name;
	private String  movie_title;
	private String  movie_title_en;
	private String  movie_img;
	private String  theater_name;
	private String  region_name;
	private String age_name;
	private Integer total_people;
	private String fomat_total_people;
	private String fomatter_price;
	private Date start_day;
	private Date end_day;
	private Date rese_date;
	private Integer genre_count;
	private Integer student;
	private Integer normal;
	private Integer old;
	
	

	
}
