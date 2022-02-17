package com.dgv.web.admin.service;

import java.util.List;

import com.dgv.web.admin.vo.AdminCityVO;
import com.dgv.web.admin.vo.AdminMovieInfoVO;
import com.dgv.web.admin.vo.AdminRegionVO;
import com.dgv.web.admin.vo.AdminTheaterLocationVO;

public interface AdminCrawlerService {

	void insertMovieInfo(AdminMovieInfoVO vo);
	void insertTheaterLocation(AdminTheaterLocationVO vo);
	void insertRegion(AdminRegionVO vo);
	

	
}
