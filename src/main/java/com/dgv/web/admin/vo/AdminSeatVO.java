package com.dgv.web.admin.vo;

import lombok.Builder;
import lombok.Data;
import lombok.ToString;

@Data
@Builder
public class AdminSeatVO {

	private Integer seat_code;
	private Integer region_code;
	private String  seat_status;
	private Integer theater_code;
	private String seat_reservation;

	
	
}
