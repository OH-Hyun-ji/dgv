package com.dgv.web.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dgv.web.admin.dao.AdminMovieInfoDAO;
import com.dgv.web.admin.vo.AdminMovieInfoVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AdminMovieInfoServiceImpl implements AdminMovieInfoService {

	private final AdminMovieInfoDAO adminMovieInfoDAO;
	
	public void insertMovieInfo(AdminMovieInfoVO vo) {
		adminMovieInfoDAO.insertMovieInfo(vo);	
	}	
}
