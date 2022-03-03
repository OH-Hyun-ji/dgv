package com.dgv.web.admin.vo;

import java.util.List;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class AdminCityTheaterVO {
	
	private Integer city_theater_code;
	private Integer movie_num;
	private Integer city_code;
	private Integer region_code;
	private Integer theater_code;
	
	private List<AdminCityVO> cityList;
	private List<AdminRegionVO> regionList;
	private List<AdminTheaterVO> theaterList;
}
