package com.dgv.web.user.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
public class UserDetailVO {

	private Integer user_num;
	private String user_id;
	private String user_rank;
	private Integer user_point;
	private String user_img;
	private String user_agree;
	
	//
	private Integer rank_code;
	private String rank_img;

	
}
