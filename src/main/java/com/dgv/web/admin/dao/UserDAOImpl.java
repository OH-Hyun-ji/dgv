package com.dgv.web.admin.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dgv.web.admin.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{
	private static final String NAMESPACE = "UserDAO";
	private final SqlSession sqlSession;
	
	@Inject
	public UserDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//회원가입처리
	@Override
	public void register(UserVO userVO) throws Exception{
		sqlSession.insert(NAMESPACE + ".register", userVO);
	}
}
