package com.dgv.web.admin.dao;


import org.mybatis.spring.SqlSessionTemplate;
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
		System.out.println("mybatis insert()처리");
		sqlSessionTemplate.insert("AdminCrawlerDAO.InsertMovieInfo",vo);
	}

	public void insertTheaterLocation(AdminTheaterLocationVO vo) {
		System.out.println("극장극장!!");
		sqlSessionTemplate.insert("AdminCrawlerDAO.InsertTheaterLocation", vo);
	}
	
	public void insertRegion(AdminRegionVO vo) {
		System.out.println("지역지역!!!");
		sqlSessionTemplate.insert("AdminCrawlerDAO.InsertRegion",vo);
	}
	
}