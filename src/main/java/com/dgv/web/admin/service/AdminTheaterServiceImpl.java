package com.dgv.web.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgv.web.admin.dao.AdminTheaterDAO;
import com.dgv.web.admin.vo.AdminCityVO;
import com.dgv.web.admin.vo.AdminRegionVO;
import com.dgv.web.admin.vo.AdminTotalTheaterDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AdminTheaterServiceImpl implements AdminTheaterService{

	
	private final AdminTheaterDAO adminTheaterDAO;
	
//	public AdminTheaterServiceImpl( AdminTheaterDAO adminTheaterDAO) {
//		this.adminTheaterDAO = adminTheaterDAO;
//	}
	
	public List<AdminCityVO> selectCityList() {
		System.out.println(" TEST : 5 !!!!!!! ");

		return adminTheaterDAO.adminCityList();
	}

	@Override
	public List<AdminRegionVO> selectRegionList() {
	
		return adminTheaterDAO.adminRegionList();
	}

	@Override
	public List<AdminCityVO> adminTotalList() {
		
		List<AdminCityVO> test = adminTheaterDAO.adminTotalList();
		return test;
	}

	@Override
	public List<AdminRegionVO> choiceRegion(int num) {
		
		return adminTheaterDAO.choiceRegion(num);
	}



}
