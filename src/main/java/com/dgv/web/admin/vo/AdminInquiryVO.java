package com.dgv.web.admin.vo;

import com.dgv.web.user.vo.UserInquiryVO;

import lombok.Data;
import lombok.ToString;

@Data
public class AdminInquiryVO {
	
	private Integer admin_answer_code;
	private String admin_answer_title;
	private String admin_answer_text;
	private String dgv_inquiry_user;
	private String reg_id;
	private String reg_date;
	private Integer wait_code;
	private UserInquiryVO userInquiryVO;
	
}
