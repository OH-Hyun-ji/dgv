package com.dgv.web.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgv.web.user.vo.UserVO;

@Repository
public class UserDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	// 회원가입처리
	public int register(UserVO userVO) {

		return sqlSessionTemplate.insert("UserDAO.register", userVO);
	}

	// 로그인처리
	public UserVO login(UserVO userVO) {
		return sqlSessionTemplate.selectOne("UserDAO.login", userVO);
	}

	// 회원가입 ID 중복체크
	public int checkId(String id) {
		return sqlSessionTemplate.selectOne("UserDAO.checkId", id);
	}

	// 마이페이지 상단 정보
	public UserVO MyUserList(String id) {
		return sqlSessionTemplate.selectOne("UserDAO.userList", id);
	}

	// 회원 개인정보변경 불러오기
	public UserVO MyUserData(String id) {
		return sqlSessionTemplate.selectOne("UserDAO.userData", id);
	}

	// 회원 정보 수정
	public int updateUser(UserVO userVO) {
		int daoNum=sqlSessionTemplate.update("UserDAO.updateUser", userVO);
		System.out.println(daoNum);
		return daoNum;
	}
	
	// 회원 탈퇴
	public int deleteUser(UserVO userVO) {
		return sqlSessionTemplate.delete("UserDAO.deleteUser", userVO);
	}
	
	//카카오 로그인
	public UserVO kakaoLogin(UserVO userVO) {
		return sqlSessionTemplate.selectOne("UserDAO.kakaoUserList",userVO);
	}

}