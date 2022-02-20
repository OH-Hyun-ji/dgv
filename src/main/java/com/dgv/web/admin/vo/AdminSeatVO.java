package com.dgv.web.admin.vo;

import lombok.ToString;

@ToString
public class AdminSeatVO {

	private Integer seatCode;
	private Integer seatNum;
	private boolean seatActivation;
	public Integer getSeatCode() {
		return seatCode;
	}
	public void setSeatCode(Integer seatCode) {
		this.seatCode = seatCode;
	}
	public Integer getSeatNum() {
		return seatNum;
	}
	public void setSeatNum(Integer seatNum) {
		this.seatNum = seatNum;
	}
	public boolean isSeatActivation() {
		return seatActivation;
	}
	public void setSeatActivation(boolean seatActivation) {
		this.seatActivation = seatActivation;
	}
	
	
	
}
