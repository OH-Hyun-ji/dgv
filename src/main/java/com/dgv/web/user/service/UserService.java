package com.dgv.web.user.service;

import java.util.List;

import com.dgv.web.admin.common.S3KeyVO;
import com.dgv.web.admin.vo.AdminTermVO;
import com.dgv.web.user.vo.UserDetailVO;
import com.dgv.web.user.vo.UserInquiryVO;
import com.dgv.web.user.vo.UserVO;

public interface UserService {

	// 회원가입처리
	int register(UserVO userVO);

	// 로그인처리
	UserVO login(UserVO userVO);

	// 회원가입 ID중복체크
	int checkId(String id);
	
	// 회원가입 Email중복체크
	int checkEmail(String email);

	// 마이페이지 상단 페이지
	UserVO MyUserList(String id);

	// 회원 개인정보변경 불러오기 부분
	UserVO MyUserData(String id);

	// 회원정보 수정
	int updateUser(UserVO userVO);

	// 회원 탈퇴
	int deleteUser(UserVO userVO);
	
	UserVO kakaoLogin(UserVO userVO);
	
	//마이페이지 나의문의사항
	List<UserInquiryVO> MyPageQnaOneList(String id);
	
	UserDetailVO userDetailVo(int num);
	
	int userProfileImg(UserDetailVO vo);
	
	int userDetail(UserDetailVO vo);

	//아이디 찾기
	UserVO findId(UserVO userVO);
	
	List<AdminTermVO> userTermList();
	
	AdminTermVO userTermInfo(AdminTermVO vo);
	
	//비밀번호 찾기
	UserVO selectMember(String email);
	
	//새 비밀번호 설정
	int newPassword(UserVO vo);
}
