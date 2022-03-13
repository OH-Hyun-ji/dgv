package com.dgv.web.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgv.web.admin.vo.AdminRankVO;
import com.dgv.web.admin.vo.AdminTermVO;
import com.dgv.web.admin.vo.AdminVO;
import com.dgv.web.user.vo.UserDetailVO;
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
	
	public List<AdminTermVO> termList(){
		return sqlSessionTemplate.selectList("AdminUserDAO.termList");
	}
	
	public int termInsert(AdminTermVO vo) {
		return sqlSessionTemplate.insert("AdminUserDAO.termInsert",vo);
	}
	
	public List<AdminRankVO> rankList(){
		return sqlSessionTemplate.selectList("AdminUserDAO.rankList");
		
	}
	public int rankInsert(AdminRankVO vo) {
		return sqlSessionTemplate.insert("AdminUserDAO.rankInsert", vo);
	}
	
	public int userRankUpdate(UserDetailVO vo) {
		return sqlSessionTemplate.update("AdminUserDAO.userRankUpdate", vo);
	}
	public AdminRankVO rankOneSelect(int num) {
		return sqlSessionTemplate.selectOne("AdminUserDAO.rankOneSelect",num);
	}
	
	public AdminRankVO rankNameSelect(String name) {
		return sqlSessionTemplate.selectOne("AdminUserDAO.rankNameSelect", name);
	}
}
