package com.dgv.web.admin.vo;

import java.util.List;

import lombok.Builder;

@Builder
public class AdminTotalTheaterDto {
	
	private List<City> cityList;
	
	@Builder
	public static class City {
		private AdminCityVO cityVO;
		private List<AdminRegionVO> regionList;
	}
	
	@Builder
	public static class Region {
		private final AdminRegionVO regionVO;
		private final List<AdminTheaterVO> theaterList;
	}
	
	@Builder
	public static class Theater {
		private final AdminTheaterVO theaterVO;
	}
	
}
