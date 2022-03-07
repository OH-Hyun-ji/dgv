package com.dgv.web.admin.vo;



import lombok.Data;

@Data
public class AdminTimeVO {

	private Integer movie_time_code;
	private Integer region_code;
	private Integer theather_code;
	private String movie_time_start;
	private String region_name;
	private String theather_name;
	private String time_date;
}	
