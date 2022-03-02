package com.dgv.web.admin.vo;

import java.util.List;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class AdminParVO {

	private Integer movie_par_num;
	private Integer movie_num;
	private Integer movie_group_code;
	private Integer movie_actor_code;
	private String reg_id;
	private String reg_date;
	
	private List<AdminGroupVO> groupList;
	private List<AdminActorVO> actorList;
}
