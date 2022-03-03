package com.dgv.web.user.service;

import java.util.List;

import com.dgv.web.admin.vo.AdminCityVO;
import com.dgv.web.admin.vo.AdminNoticeVO;
import com.dgv.web.admin.vo.AdminRegionVO;
import com.dgv.web.admin.vo.AdminTheaterVO;
import com.dgv.web.user.vo.UserInquiryVO;

public interface UserBoardService {

	List<AdminNoticeVO> noticeList();
	
	//고객 나의문의사항
	List<UserInquiryVO> userQnaOneList(String id);
	
	//고객 문의 등록 
	int insertMyQna(UserInquiryVO vo);

	List<AdminCityVO> cityTheater();
	
	List<AdminRegionVO> regionTheater(int num);
}
