package com.dgv.web.admin.vo;

import java.util.List;

public class AdminCityVO {

	private Integer city_code;
	private String city_name;
	private List<AdminRegionVO> regionList;
	
	public Integer getCity_code() {
		return city_code;
	}
	public void setCity_code(Integer city_code) {
		this.city_code = city_code;
	}
	public String getCity_name() {
		return city_name;
	}
	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}
	
	public List<AdminRegionVO> getRegionList() {
		return regionList;
	}
	public void setRegionList(List<AdminRegionVO> regionVO) {
		this.regionList = regionVO;
	}
	@Override
	public String toString() {
		return "AdminCityVO [city_code=" + city_code + ", city_name=" + city_name + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
