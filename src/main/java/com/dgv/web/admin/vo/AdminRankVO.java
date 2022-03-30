package com.dgv.web.admin.vo;

import com.dgv.web.user.vo.UserDetailVO;

import lombok.Data;

@Data
public class AdminRankVO {

	private Integer rank_code;
	private String rank_name;
	private Double rank_earn;
	private Integer rank_standard;
	private String rank_img;
	private String reg_id;
	private String reg_date;
	
	private UserDetailVO detailVO;
	
}
