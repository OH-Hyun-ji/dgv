package com.dgv.web.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgv.web.admin.vo.AdminTermVO;
import com.dgv.web.user.vo.UserDetailVO;
import com.dgv.web.user.vo.UserInquiryVO;
import com.dgv.web.user.vo.UserVO;

@Repository
public class UserDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	// 회원가입처리
	public int register(UserVO userVO) {

		return sqlSessionTemplate.insert("UserDAO.register", userVO);
	}

	// 로그인처리
	public UserVO login(UserVO userVO) {
		return sqlSessionTemplate.selectOne("UserDAO.login", userVO);
	}

	// 회원가입 ID 중복체크
	public int checkId(String id) {
		return sqlSessionTemplate.selectOne("UserDAO.checkId", id);
	}

	// 회원가입 Email 중복체크
	public int checkEmail(String email) {
		return sqlSessionTemplate.selectOne("UserDAO.checkEmail", email);
	}

	// 마이페이지 상단 정보
	public UserVO MyUserList(String id) {
		return sqlSessionTemplate.selectOne("UserDAO.userList", id);
	}

	// 회원 개인정보변경 불러오기
	public UserVO MyUserData(String id) {
		return sqlSessionTemplate.selectOne("UserDAO.userData", id);
	}

	// 회원 정보 수정
	public int updateUser(UserVO userVO) {
		int daoNum = sqlSessionTemplate.update("UserDAO.updateUser", userVO);
		System.out.println(daoNum);
		return daoNum;
	}

	// 회원 탈퇴
	public int deleteUser(UserVO userVO) {
		return sqlSessionTemplate.delete("UserDAO.deleteUser", userVO);
	}

	// 카카오 로그인
	public UserVO kakaoLogin(UserVO userVO) {
		return sqlSessionTemplate.selectOne("UserDAO.kakaoUserList", userVO);
	}

	// 마이페이지 나의 문의 내역
	public List<UserInquiryVO> MyPageQnaOneList(String id) {
		return sqlSessionTemplate.selectList("UserDAO.MyPageQnaOneList", id);
	}
	
	public UserDetailVO userDetailVo(int num) {
		return sqlSessionTemplate.selectOne("UserDAO.userDetailVo",num);
	}

	public int userProfileImg(UserDetailVO vo) {
		return sqlSessionTemplate.update("UserDAO.userProfileImg",vo);
	}
	public int userDetail(UserDetailVO vo) {
		return sqlSessionTemplate.insert("UserDAO.userDetail", vo);
	}

	
	// 아이디 찾기
	public UserVO findId(UserVO vo) {
		return sqlSessionTemplate.selectOne("UserDAO.findId", vo);
	}
	public List<AdminTermVO> userTermList(){
		return sqlSessionTemplate.selectList("UserDAO.userTermCheck");
	}
	public AdminTermVO userTermInfo(AdminTermVO vo) {
		return sqlSessionTemplate.selectOne("UserDAO.userTermInfo",vo);

	}
	
	// 비밀번호 찾기(이메일 확인)
	public UserVO selectMember(String userVO) {
		return sqlSessionTemplate.selectOne("UserDAO.selectMember", userVO);
	}
	
	// 새 비밀번호 설정
	public int newPassword(UserVO vo) {
		return sqlSessionTemplate.update("UserDAO.newPassword", vo);
	}
	
}