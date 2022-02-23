package com.dgv.web.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgv.web.user.vo.UserVO;

@Repository
public class AdminUserDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<UserVO> userList(){
		return sqlSessionTemplate.selectList("AdminUserDAO.UserList");
	}
	
	
}
