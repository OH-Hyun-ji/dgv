package com.dgv.web.user.service;

import java.util.List;

import com.dgv.web.admin.common.S3KeyVO;
import com.dgv.web.user.vo.UserVO;

public interface UserService {

	// 회원가입처리
	int register(UserVO userVO);

	// 로그인처리
	UserVO login(UserVO userVO);

	// 회원가입 ID중복체크
	int checkId(String id);

	// 마이페이지 상단 페이지
	UserVO MyUserList(String id);

	// 회원 개인정보변경 불러오기 부분
	UserVO MyUserData(String id);

	// 회원정보 수정
	int updateUser(UserVO userVO);

	// 회원 탈퇴
	int deleteUser(UserVO userVO);
}
