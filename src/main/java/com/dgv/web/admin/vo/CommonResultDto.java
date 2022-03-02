package com.dgv.web.admin.vo;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@RequiredArgsConstructor
public class CommonResultDto {
	
	private final String msg;
	private final boolean isSuccess;
	
	private static final String SUCCESS = "SUCCESS";
	private static final String FAIL = "FAIL";
	
	public static CommonResultDto success() {
		return new CommonResultDto(SUCCESS, true);
	}
	
	public static CommonResultDto fail() {
		return new CommonResultDto(FAIL, false);
	}

}
