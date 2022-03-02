package com.dgv.web.user.service;




import org.springframework.stereotype.Service;

import com.dgv.web.admin.common.S3KeyVO;
import com.dgv.web.user.dao.UserDAO;
import com.dgv.web.user.vo.UserVO;



@Service
public class UserServiceImpl implements UserService {
	
	private UserDAO userDAO;
	
	public UserServiceImpl(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	//회원가입처리
	@Override
	public int register(UserVO userVO) {
		return userDAO.register(userVO);
	}
	
	//로그인처리
	@Override
	public UserVO login(UserVO userVO){
		return userDAO.login(userVO);
	}
	//ID 중복 체크 
	@Override
	public int checkId(String id) {
		return userDAO.checkId(id);
	}
	
	//회원정보 수정
	@Override
	public int userUpdate(UserVO userVO) {
		return userDAO.userUpdate(userVO);
	}

}
