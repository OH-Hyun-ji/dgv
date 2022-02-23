package com.dgv.web.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dgv.web.admin.dao.AdminUserDAO;
import com.dgv.web.user.vo.UserVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AdminUserServiceImpl implements AdminUserService {

	private final AdminUserDAO adminUserDAO;

	@Override
	public List<UserVO> userList() {
		
		return adminUserDAO.userList();
	}
	
	
}
