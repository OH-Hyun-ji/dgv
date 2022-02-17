package com.dgv.web.user.service;


import com.dgv.web.user.vo.UserVO;

public interface UserService {
	
	// 회원가입처리
	void register(UserVO userVO);
	
	// 로그인처리
	UserVO login(UserVO userVO) throws Exception;
}
