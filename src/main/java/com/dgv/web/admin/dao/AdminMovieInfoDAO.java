package com.dgv.web.admin.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgv.web.admin.vo.AdminMovieInfoVO;

@Repository
public class AdminMovieInfoDAO  extends SqlSessionDaoSupport {
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	public void insertMovieInfo(AdminMovieInfoVO vo) {
		System.out.println("mybatis insert()기능처리");
		getSqlSession().insert("AdminMovieInfoDAO.insertMovieInfo",vo);
	}

	
}
