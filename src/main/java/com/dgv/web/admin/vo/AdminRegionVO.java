package com.dgv.web.admin.vo;

import java.util.List;

import lombok.Data;

@Data
public class AdminRegionVO {

	private Integer region_code;
	private Integer city_code;
	private String region_name;
	private List<AdminTheaterVO> theaterList;
	
	

	
 
	
	

}
