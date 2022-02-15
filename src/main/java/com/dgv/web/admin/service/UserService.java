package com.dgv.web.admin.service;

import com.dgv.web.admin.vo.UserVO;

public interface UserService {
	// 회원가입처리
	void register(UserVO userVO) throws Exception;
}
