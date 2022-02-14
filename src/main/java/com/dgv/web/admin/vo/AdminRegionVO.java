package com.dgv.web.admin.vo;

public class AdminRegionVO {

	Integer regionCode;
	Integer cityCode;
	String regionName;

	
	
	public AdminRegionVO(Integer cityCode,String regionName) {
		super();
		this.cityCode=cityCode;
		this.regionName = regionName;
	}

	public Integer getRegionCode() {
		return regionCode;
	}

	public void setRegionCode(Integer regionCode) {
		this.regionCode = regionCode;
	}


	public Integer getCityCode() {
		return cityCode;
	}

	public void setCityCode(Integer cityCode) {
		this.cityCode = cityCode;
	}

	public String getRegionName() {
		return regionName;
	}

	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}

	@Override
	public String toString() {
		return "AdminRegionVO [regionCode=" + regionCode + ", cityCode=" + cityCode + ", regionName=" + regionName
				+ "]";
	}

}
