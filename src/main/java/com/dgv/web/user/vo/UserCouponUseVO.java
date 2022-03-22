package com.dgv.web.user.vo;

import lombok.Data;

@Data
public class UserCouponUseVO {

	private Integer cu_code; 
	private String user_id; 
	private Integer coupon_num;
	private boolean cu_status; //활성화 상태 여부 
	private Integer coupon_code;
	
	//
	private String coupon_name;
	private String coupon_date;
}
