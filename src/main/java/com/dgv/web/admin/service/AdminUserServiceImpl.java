package com.dgv.web.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.support.SessionStatus;

import com.dgv.web.admin.dao.AdminUserDAO;
import com.dgv.web.admin.vo.AdminRankVO;
import com.dgv.web.admin.vo.AdminTermVO;
import com.dgv.web.admin.vo.AdminVO;
import com.dgv.web.user.vo.UserVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AdminUserServiceImpl implements AdminUserService {

	private final AdminUserDAO adminUserDAO;

	@Override
	public List<UserVO> userList() {
		
		return adminUserDAO.userList();
	}

	@Override
	public int userDelete(UserVO vo) {
		
		return adminUserDAO.userDelete(vo);
	}

	@Override
	public AdminVO adminLogin(String id) {
		
		return adminUserDAO.adminLogin(id);
	}

	@Override
	public void adminLogout(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		
	}

	@Override
	public List<AdminTermVO> termList() {
	
		return adminUserDAO.termList();
	}

	@Override
	public int termInsert(AdminTermVO vo) {
		
		return adminUserDAO.termInsert(vo);
	}

	@Override
	public List<AdminRankVO> rankList() {
	
		return adminUserDAO.rankList();
	}

	@Override
	public int rankInsert(AdminRankVO vo) {
	
		return adminUserDAO.rankInsert(vo);
	}
	
	
}
