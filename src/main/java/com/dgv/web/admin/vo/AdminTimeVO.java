package com.dgv.web.admin.vo;



import lombok.Data;

@Data
public class AdminTimeVO {

	private Integer movie_time_code;
	private Integer region_code;
	private Integer theater_code;
	private String movie_time_start;
	
	
	///
	private String region_name;
	private String time_date;
	private String seat_num;
	private String theater_name;
}	
