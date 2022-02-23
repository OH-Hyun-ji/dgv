package com.dgv.web.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgv.web.admin.vo.AdminVO;
import com.dgv.web.user.vo.UserVO;

@Repository
public class AdminUserDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<UserVO> userList(){
		return sqlSessionTemplate.selectList("AdminUserDAO.UserList");
	}
	
	public int userDelete(UserVO vo) {
		return sqlSessionTemplate.delete("AdminUserDAO.UserDelete",vo);
	}
	
	public AdminVO adminLogin(String id) {
		return sqlSessionTemplate.selectOne("AdminUserDAO.AdminLogin", id);
	}
	
	
}
