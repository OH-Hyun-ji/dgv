package com.dgv.web.admin.vo;

import lombok.Data;

@Data
public class AdminCouponVO {

	private Integer coupon_num; 
	private Integer coupon_code; 
	private String coupon_name; 
	private Integer coupon_discount;
	private String coupon_date; 
	private String reg_id; 
	private String reg_date; 
	private String coupon_img;
	
	//
	private String fomatter_discount;

}
