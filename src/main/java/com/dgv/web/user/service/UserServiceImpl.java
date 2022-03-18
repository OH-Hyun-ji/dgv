package com.dgv.web.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgv.web.admin.common.S3KeyVO;
import com.dgv.web.admin.vo.AdminTermVO;
import com.dgv.web.user.dao.UserDAO;
import com.dgv.web.user.vo.UserDetailVO;
import com.dgv.web.user.vo.UserInquiryVO;
import com.dgv.web.user.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO userDAO;

	public UserServiceImpl(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	// 회원가입처리
	@Override
	public int register(UserVO userVO) {
		return userDAO.register(userVO);
	}

	// 로그인처리
	@Override
	public UserVO login(UserVO userVO) {
		return userDAO.login(userVO);
	}

	// ID 중복 체크
	@Override
	public int checkId(String id) {
		return userDAO.checkId(id);
	}
	
	// Email 중복 체크
	@Override
	public int checkEmail(String email) {
		return userDAO.checkEmail(email);
	}

	// 마이페이지 상단 페이지
	@Override
	public UserVO MyUserList(String id) {
		return userDAO.MyUserList(id);
	}

	// 회원 개인정보변경 불러오기 부분
	@Override
	public UserVO MyUserData(String id) {
		return userDAO.MyUserData(id);
	}

	// 회원정보 수정
	@Override
	public int updateUser(UserVO userVO) {
		return userDAO.updateUser(userVO);
	}

	// 회원 탈퇴
	@Override
	public int deleteUser(UserVO userVO) {
		return userDAO.deleteUser(userVO);
	}

	@Override
	public UserVO kakaoLogin(UserVO userVO) {
		
		return userDAO.kakaoLogin(userVO);
	}
	
	@Override
	public List<UserInquiryVO> MyPageQnaOneList(String id) {
		
		return userDAO.MyPageQnaOneList(id);
	}

	@Override
	public UserDetailVO userDetailVo(int num) {
		
		return userDAO.userDetailVo(num);
	}

	@Override
	public int userProfileImg(UserDetailVO vo) {
		
		return userDAO.userProfileImg(vo);
	}

	@Override
	public int userDetail(UserDetailVO vo) {
		
		return userDAO.userDetail(vo);
	}
	
	// 아이디 찾기
	@Override
	public UserVO findId(UserVO vo) {		
		return userDAO.findId(vo);
	}

	@Override
	public List<AdminTermVO> userTermList() {
		
		return userDAO.userTermList();
	}

	@Override
	public AdminTermVO userTermInfo(AdminTermVO vo) {
		
		return userDAO.userTermInfo(vo);
	}
	
	// 비밀번호 찾기
	@Override
	public UserVO selectMember(String userVO) {		
		return userDAO.selectMember(userVO);
	}
	
	// 새 비밀번호 설정
	@Override
	public int newPassword(UserVO vo) {
		return userDAO.newPassword(vo);
	}

}