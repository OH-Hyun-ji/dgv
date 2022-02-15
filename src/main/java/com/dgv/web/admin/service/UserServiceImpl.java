package com.dgv.web.admin.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.dgv.web.admin.dao.UserDAO;
import com.dgv.web.admin.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {
	
	private final UserDAO userDAO;
	
	@Inject
	public UserServiceImpl(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	//회원가입처리
	@Override
	public void register(UserVO userVO) throws Exception {
		userDAO.register(userVO);
	}
}
