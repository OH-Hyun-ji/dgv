package com.dgv.web.user.vo;

import lombok.Data;

@Data
public class UserFAQVO {

	private Integer faq_num;
	private String faq_title;
	private String faq_text;
	private String faq_date;
	private Integer faq_kind_num;
	private String reg_id;
	private Integer faq_count;
	////
	private String kind_name;
	
}
