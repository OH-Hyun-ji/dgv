package com.dgv.web.admin.service;

import java.util.List;

import com.dgv.web.admin.vo.AdminActorVO;
import com.dgv.web.admin.vo.AdminAgeVO;
import com.dgv.web.admin.vo.AdminCityTheaterVO;
import com.dgv.web.admin.vo.AdminGenreVO;
import com.dgv.web.admin.vo.AdminGroupVO;
import com.dgv.web.admin.vo.AdminInquiryVO;
import com.dgv.web.admin.vo.AdminMovieVO;
import com.dgv.web.admin.vo.AdminNoticeVO;
import com.dgv.web.admin.vo.AdminParVO;
import com.dgv.web.admin.vo.AdminRegionVO;
import com.dgv.web.admin.vo.AdminSeatVO;
import com.dgv.web.admin.vo.AdminTheaterVO;
import com.dgv.web.admin.vo.AdminTimeVO;
import com.dgv.web.user.vo.UserInquiryVO;
import com.dgv.web.user.vo.UserMapVO;
import com.dgv.web.user.vo.UserReserveVO;

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
	
	//배우 삭제
	int deleteActor(AdminActorVO vo);
	
	int deleteGroup(AdminGroupVO vo);

	int deleteAge(AdminAgeVO vo);
	
	int deleteGenre(AdminGenreVO vo);
	
	int insertAnswer(AdminInquiryVO vo);
	
	int updateStatus(Integer num);
	
	//도시-지역-상영광
	int insertCityTheater(AdminCityTheaterVO vo);
	
	List<AdminMovieVO> movieList();
	//상영관 등록 
	int insertTheater(AdminTheaterVO vo);
	
	//상영관 등록시 필요한 지역 코드받아오기
	AdminRegionVO regionList(String name);
	
	List<AdminTheaterVO> selectTheater();
	
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
	
	List<AdminActorVO> choiceActorList(int num);
	
	List<AdminTheaterVO> choiceTheaterList(int num);
	
	AdminGroupVO groupView(int num);
	
	int updateGroup(AdminGroupVO vo);
	
	AdminActorVO actorListInfo(int num);
	
	int updateActor(AdminActorVO vo);
	
	AdminGenreVO genreListInfo(int num);
	
	AdminAgeVO ageListInfo(int num);
	
	int updateGenre(AdminGenreVO vo);
	
	int updateAge(AdminAgeVO vo);
	
	AdminTheaterVO theaterListInfo(int num);
	
	int insertTime(AdminTimeVO vo);

	int insertSeat(AdminSeatVO vo);
	
	List<AdminTimeVO> timeList(int num);
	
	int deleteTheater(int num);
	
	int selectMap(String name);
	
	int timeCheckList(int num);
	
	List<UserReserveVO> SelectReserveInfo();
	
	int updateReserveStatus(UserReserveVO vo);
}
