package com.dgv.web.user.vo;

import com.dgv.web.user.controller.Pagination;

import lombok.Data;

@Data
public class SearchVO extends Pagination{

	private String searchType;
	private String keyword;
}
