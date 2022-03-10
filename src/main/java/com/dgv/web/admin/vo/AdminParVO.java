package com.dgv.web.admin.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AdminParVO {

	private Integer movie_par_num;
	private Integer movie_num;
	private Integer movie_group_code;
	private String reg_id;
	private String reg_date;
	private Integer movie_actor_code;
	
	
	private List<AdminGroupVO> groupList;
	private List<AdminActorVO> actorList;
}
