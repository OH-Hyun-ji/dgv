package com.dgv.web.user.vo;

import lombok.Data;

@Data
public class UserCommentVO {

	private Integer comment_num;
	private Integer community_code;
	private String comment_title;
	private String comment_text;
	private String user_id;
	private String write_date;
	private String write_time;
	
	////
	private String user_rank;
	private String user_img;
	
	
}
