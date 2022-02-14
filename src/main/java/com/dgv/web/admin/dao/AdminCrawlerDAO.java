package com.dgv.web.admin.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgv.web.admin.vo.AdminMovieInfoVO;
import com.dgv.web.admin.vo.AdminRegionVO;
import com.dgv.web.admin.vo.AdminTheaterLocationVO;

@Repository
public class AdminCrawlerDAO   {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public void insertMovieInfo(AdminMovieInfoVO vo) {
		System.out.println("mybatis insert()기능처리");
		sqlSessionTemplate.insert("AdminCrawlerDAO.InsertMovieInfo",vo);
	}

	public void insertTheaterLocation(AdminTheaterLocationVO vo) {
		System.out.println("도시 가져오자!!");
		sqlSessionTemplate.insert("AdminCrawlerDAO.InsertTheaterLocation", vo);
	}
	public void insertRegion(AdminRegionVO vo) {
		System.out.println("지역 가져오자!!!");
		sqlSessionTemplate.insert("AdminCrawlerDAO.InsertRegion",vo);
	}
	
}
