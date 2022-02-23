package com.dgv.web.admin.service;

import java.util.List;

import com.dgv.web.admin.vo.AdminVO;
import com.dgv.web.user.vo.UserVO;

public interface AdminUserService {

	List<UserVO> userList();
	
	int userDelete(UserVO vo);
	
	AdminVO adminLogin(String id);
}
