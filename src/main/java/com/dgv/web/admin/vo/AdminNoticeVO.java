package com.dgv.web.admin.vo;

import lombok.Data;

@Data
public class AdminNoticeVO {

	private Integer notice_num;
	private String reg_id;
	private String notice_title;
	private String notice_text;
	private String reg_date;
	private String notice_count;
	
}
