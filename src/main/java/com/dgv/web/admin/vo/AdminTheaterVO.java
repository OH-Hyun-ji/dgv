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
	
	//hidden처리
	private String seat_status;
	private Double map_x;
	private Double map_y;
	private String map_address;
	private String map_name;
	private String region_name;
	private String movie_time_start;
	private Integer movie_time_code;
	private List<AdminRegionVO> regionList;
	
	
}
