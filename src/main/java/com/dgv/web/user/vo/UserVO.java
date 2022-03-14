package com.dgv.web.user.vo;

import java.util.List;

import lombok.Data;
import lombok.ToString;

@Data
public class UserVO {
	private Integer user_num; // 회원고유번호
	private String user_id; // 회원아이디
	private String user_pw; // 회원비밀번호
	private String user_name; // 회원이름
	private String user_phone; // 회원전화번호
	private String user_email; // 회원이메일
	private String user_year; // 회원 생년월일
	private String user_month;
	private String user_day;
	private String user_term; // 약관동의여부
	
	private List<UserDetailVO> detailVO;
	
	
	

	

}
