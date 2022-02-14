package com.dgv.web.admin.vo;

public class AdminTheaterLocationVO {

	Integer cityCode;
	String cityName;
	
	
	
	public AdminTheaterLocationVO(String cityName) {
		super();
		this.cityName = cityName;
	}
	
	public Integer getCityCode() {
		return cityCode;
	}
	public void setCityCode(Integer cityCode) {
		this.cityCode = cityCode;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	@Override
	public String toString() {
		return "AdminTheaterLocationVO [cityCode=" + cityCode + ", cityName=" + cityName + "]";
	}
	
	
}
