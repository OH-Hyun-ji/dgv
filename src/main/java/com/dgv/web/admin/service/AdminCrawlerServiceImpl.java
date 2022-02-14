package com.dgv.web.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dgv.web.admin.dao.AdminCrawlerDAO;
import com.dgv.web.admin.vo.AdminMovieInfoVO;
import com.dgv.web.admin.vo.AdminRegionVO;
import com.dgv.web.admin.vo.AdminTheaterLocationVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AdminCrawlerServiceImpl implements AdminCrawlerService {

	private final AdminCrawlerDAO adminCrawlerDAO;
	
	public void insertMovieInfo(AdminMovieInfoVO vo) {
		adminCrawlerDAO.insertMovieInfo(vo);	
	}


	public void insertTheaterLocation(AdminTheaterLocationVO vo) {
		adminCrawlerDAO.insertTheaterLocation(vo);
	}



	public void insertRegion(AdminRegionVO vo) {
		adminCrawlerDAO.insertRegion(vo);
		
	}	
	
}
