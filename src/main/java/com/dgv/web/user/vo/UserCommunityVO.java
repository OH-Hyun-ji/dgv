package com.dgv.web.user.vo;

import lombok.Data;

@Data
public class UserCommunityVO {
	private Integer community_code;
	private String community_title;
	private String community_kind;
	private String community_text;
	private String commuity_img;
	private String user_id;
	private Integer community_count;
	private Integer community_answerCount;
	private String write_date;
	private String write_time;
}
