package com.dgv.web.user.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgv.web.user.vo.UserVO;


@Repository
public class UserDAO{
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//회원가입처리
	public int register(UserVO userVO) {
		
		 return sqlSessionTemplate.insert("UserDAO.register",userVO);
	}
	//로그인처리
	public UserVO login(UserVO userVO) {
		return sqlSessionTemplate.selectOne("UserDAO.login",userVO);

	}
	
	//회원가입 ID 중복체크 
	public int checkId(String id) {
		return sqlSessionTemplate.selectOne("UserDAO.checkId", id);
	}
}
