package com.dgv.web.admin.service;

import java.util.List;

import org.springframework.web.bind.support.SessionStatus;

import com.dgv.web.admin.vo.AdminCouponVO;
import com.dgv.web.admin.vo.AdminEventVO;
import com.dgv.web.admin.vo.AdminNoticeVO;
import com.dgv.web.admin.vo.AdminRankVO;
import com.dgv.web.admin.vo.AdminTermVO;
import com.dgv.web.admin.vo.AdminVO;
import com.dgv.web.user.vo.UserDetailVO;
import com.dgv.web.user.vo.UserVO;

public interface AdminUserService {

	List<UserVO> userList();
	
	int userDelete(UserVO vo);
	
	AdminVO adminLogin(String id);
	
	void adminLogout(SessionStatus sessionStatus);
	
	List<AdminTermVO> termList();
	
	int termInsert(AdminTermVO vo);
	
	List<AdminRankVO> rankList();
	
	int rankInsert(AdminRankVO vo);
	
	int userRankUpdate(UserDetailVO vo);
	
	AdminRankVO rankOneSelect(int num);
	
	AdminRankVO rankNameSelect(String name);
	
	UserVO userNumList(int num);
	
	AdminTermVO userTermNumVo (int num);
	
	int userStatus(UserVO vo);
	
	int eventDelete(AdminEventVO vo);
	
	int noticeDelete(AdminNoticeVO vo);
	
	int couponDelete(AdminCouponVO vo);
}
