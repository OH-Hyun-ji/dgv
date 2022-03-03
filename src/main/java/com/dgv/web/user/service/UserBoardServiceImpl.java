package com.dgv.web.user.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dgv.web.admin.vo.AdminCityVO;
import com.dgv.web.admin.vo.AdminNoticeVO;
import com.dgv.web.admin.vo.AdminRegionVO;
import com.dgv.web.user.dao.UserBoardDAO;
import com.dgv.web.user.vo.UserInquiryVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class UserBoardServiceImpl implements UserBoardService {
	
	
	private final UserBoardDAO userBoardDAO;
	
	
	@Override
	public List<AdminNoticeVO> noticeList() {
		
		return userBoardDAO.noticeList();
	}


	@Override
	public List<UserInquiryVO> userQnaOneList(String id) {
		
		return userBoardDAO.userQnaOneList(id);
	}


	@Override
	public int insertMyQna(UserInquiryVO vo) {
		
		return userBoardDAO.insertMyQna(vo);
	}


	@Override
	public List<AdminCityVO> cityTheater() {
		
		return userBoardDAO.cityTheaterList();
	}


	@Override
	public List<AdminRegionVO> regionTheater(int num) {
		
		return userBoardDAO.regionTheaterList(num);
	}



	

}
