package com.dgv.web.admin.service;

import java.util.List;

import com.dgv.web.admin.vo.AdminActorVO;
import com.dgv.web.admin.vo.AdminAgeVO;
import com.dgv.web.admin.vo.AdminGenreVO;
import com.dgv.web.admin.vo.AdminGroupVO;
import com.dgv.web.admin.vo.AdminInquiryVO;
import com.dgv.web.admin.vo.AdminMovieVO;
import com.dgv.web.admin.vo.AdminNoticeVO;
import com.dgv.web.admin.vo.AdminParVO;
import com.dgv.web.admin.vo.AdminRegionVO;
import com.dgv.web.admin.vo.AdminTheaterVO;
import com.dgv.web.user.vo.UserInquiryVO;

public interface AdminMovieService {

	//장르 등록 
	int insertGenre(AdminGenreVO vo);
	
	//연령 등록
	int insertAge(AdminAgeVO vo);
	
	//그룹 등록
	int insertGroup(AdminGroupVO vo);
	
	//배우등록
	int insertActor(AdminActorVO vo);
	
	//공지사항 등록 
	int insertNotice(AdminNoticeVO vo);
	
	//답변 등록 고객 코드
	UserInquiryVO waitCode(int code);
	
	int insertAnswer(AdminInquiryVO vo);
	
	int updateStatus(Integer num);
	
	//상영관 등록 
	int insertTheater(AdminTheaterVO vo);
	
	//상영관 등록시 필요한 지역 코드받아오기
	AdminRegionVO regionList(String name);
	
	//영화등록전 참여자 테이블 등록 
	int insertPar(AdminParVO vo);
	//드디어 대망의 영화정보등록
	int insertMovie(AdminMovieVO vo);
	
	List<AdminNoticeVO> noticeList();
	
	//답변대기 목록
	List<UserInquiryVO> inquiryList();
	
	//답변완료 목록
	List<AdminInquiryVO> answerList();
		
	
	List<AdminGenreVO> genreList();
	
	List<AdminAgeVO> ageList();
	
	List<AdminGroupVO> groupList();
	
	List<AdminActorVO> actorList();
	
	
}
