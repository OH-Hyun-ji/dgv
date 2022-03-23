package com.dgv.web.admin.common;

import lombok.Data;

@Data
public class HotelVO {

	private Integer hotel_code;
	private String hotel_name;
	private Integer hotel_status;
	private String day;
	
	//
	private Integer formatDay;
}
