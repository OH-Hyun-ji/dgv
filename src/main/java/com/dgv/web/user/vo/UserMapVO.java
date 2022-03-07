package com.dgv.web.user.vo;

import lombok.Data;

@Data
public class UserMapVO {

	private Integer map_code;
	private Double map_x;
	private Double map_y;
	private Integer region_code;
	private String map_address;
	private String map_name;
	
	
	private String city_name;
}
