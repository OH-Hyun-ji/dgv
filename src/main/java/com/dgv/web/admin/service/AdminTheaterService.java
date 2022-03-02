package com.dgv.web.admin.service;

import java.util.List;
import com.dgv.web.admin.vo.AdminCityVO;
import com.dgv.web.admin.vo.AdminRegionVO;


public interface AdminTheaterService {

	//관리자 지역별관리
	List<AdminCityVO> selectCityList();
	List<AdminRegionVO> selectRegionList();
	List<AdminCityVO> adminTotalList();
	List<AdminRegionVO> choiceRegion(int num);
	
}
