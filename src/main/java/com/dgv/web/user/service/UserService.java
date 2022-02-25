package com.dgv.web.user.service;


import com.dgv.web.user.vo.UserVO;

public interface UserService {
	
	// 회원가입처리
	int register(UserVO userVO);
	
	// 로그인처리
	UserVO login(UserVO userVO);
	
	//회원가입 ID중복체크
	int checkId(String id); 
}
