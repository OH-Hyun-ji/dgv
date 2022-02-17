package com.dgv.web.user.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgv.web.user.vo.UserVO;


@Repository
public class UserDAO{
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//회원가입처리
	public void register(UserVO userVO) {
		sqlSessionTemplate.insert("UserDAO.register",userVO);
		
	}
}
