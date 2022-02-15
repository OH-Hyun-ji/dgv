package com.dgv.web.user.service;


import org.springframework.stereotype.Service;
import com.dgv.web.user.dao.UserDAO;
import com.dgv.web.user.vo.UserVO;



@Service
public class UserServiceImpl implements UserService {
	
	private final UserDAO userDAO;
	
	public UserServiceImpl(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	//회원가입처리
	@Override
	public void register(UserVO userVO) {
		userDAO.register(userVO);
	}
}
