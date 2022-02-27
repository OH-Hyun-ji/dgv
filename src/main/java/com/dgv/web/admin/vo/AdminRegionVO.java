package com.dgv.web.admin.vo;

import java.util.List;

public class AdminRegionVO {

	private Integer region_code;
	private Integer city_code;
	private String region_name;
	private List<AdminTheaterVO> theaterList;
	
	
	public AdminRegionVO(Integer region_code, String region_name) {
		super();
		this.region_code = region_code;
		this.region_name = region_name;
	}
	public List<AdminTheaterVO> getTheaterList() {
		return theaterList;
	}
	public void setTheaterList(List<AdminTheaterVO> theaterList) {
		this.theaterList = theaterList;
	}
	public Integer getRegion_code() {
		return region_code;
	}
	public void setRegion_code(Integer region_code) {
		this.region_code = region_code;
	}
	public Integer getCity_code() {
		return city_code;
	}
	public void setCity_code(Integer city_code) {
		this.city_code = city_code;
	}
	public String getRegion_name() {
		return region_name;
	}
	public void setRegion_name(String region_name) {
		this.region_name = region_name;
	}
	@Override
	public String toString() {
		return "AdminRegionVO [region_code=" + region_code + ", city_code=" + city_code + ", region_name=" + region_name
				+ "]";
	}

	
 
	
	

}
