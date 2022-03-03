package com.dgv.web.admin.vo;

import lombok.Data;

@Data
public class AdminTermVO {

	private Integer term_num;
	private String user_term;
	private String term_name;
	private boolean term_status;
	private String term_text;
	private String reg_id;
	private String reg_date; 
}
