package com.dgv.web.admin.vo;

import lombok.Data;

@Data
public class AdminParUserEventVO {

	private Integer par_code;
	private Integer user_num;
	private Integer event_code;
	private String par_date;
	
	//
	private String event_title;
	private String event_end_date;
}
