package com.dgv.web.admin.dao;

import com.dgv.web.admin.vo.UserVO;

public interface UserDAO {
	
	// 회원가입처리
	void register(UserVO userVO) throws Exception;
}
