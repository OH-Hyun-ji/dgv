package com.dgv.web.admin.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgv.web.admin.vo.AdminMovieInfoVO;

@Repository
public class AdminMovieInfoDAO   {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public void insertMovieInfo(AdminMovieInfoVO vo) {
		System.out.println("mybatis insert()���ó��");
		sqlSessionTemplate.insert("AdminMovieInfoDAO.insertMovieInfo",vo);
	}

	
}
