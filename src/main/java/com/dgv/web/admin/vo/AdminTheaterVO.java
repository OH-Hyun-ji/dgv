package com.dgv.web.admin.vo;

import java.util.List;

import lombok.Data;


@Data
public class AdminTheaterVO {
	
	private Integer theater_code;
	private String theater_name;
	private Integer theater_seat_count;
	private Integer region_code;
	private Integer theater_max_row;
	private Integer theater_max_column;
	private String seat_status;
	//hidden처리
	private String region_name;
	private List<AdminRegionVO> regionList;
	
	
}
