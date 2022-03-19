package com.dgv.web.admin.vo;

import lombok.Data;

@Data
public class AdminEventVO {

	private Integer event_code; 
	private String event_title; 
	private String event_text; 
	private String start_date; 
	private String end_date; 
	private String reg_id;
	private String reg_date;
	private String event_status;
	private String event_winner;
	private String event_img;
	private String event_text_img;
}
