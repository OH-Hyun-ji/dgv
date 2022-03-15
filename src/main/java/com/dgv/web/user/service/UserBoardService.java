package com.dgv.web.user.service;

import java.util.List;

import com.dgv.web.admin.vo.AdminActorVO;
import com.dgv.web.admin.vo.AdminAgeVO;
import com.dgv.web.admin.vo.AdminCityVO;
import com.dgv.web.admin.vo.AdminGenreVO;
import com.dgv.web.admin.vo.AdminGroupVO;
import com.dgv.web.admin.vo.AdminMovieVO;
import com.dgv.web.admin.vo.AdminNoticeVO;
import com.dgv.web.admin.vo.AdminParVO;
import com.dgv.web.admin.vo.AdminRegionVO;
import com.dgv.web.admin.vo.AdminSeatVO;
import com.dgv.web.admin.vo.AdminTheaterVO;
import com.dgv.web.admin.vo.AdminTimeVO;
import com.dgv.web.user.vo.Criteria;
import com.dgv.web.user.vo.SearchVO;
import com.dgv.web.user.vo.UserCommentVO;
import com.dgv.web.user.vo.UserCommunityVO;
import com.dgv.web.user.vo.UserFAQKindVO;
import com.dgv.web.user.vo.UserFAQVO;
import com.dgv.web.user.vo.UserInquiryVO;
import com.dgv.web.user.vo.UserMapVO;
import com.dgv.web.user.vo.UserMoiveImgVO;
import com.dgv.web.user.vo.UserReserveVO;
import com.dgv.web.user.vo.UserVO;

public interface UserBoardService {

	List<AdminNoticeVO> noticeList();
	
	//고객 나의문의사항
	List<UserInquiryVO> userQnaOneList(String id);
	
	//고객 문의 등록 
	int insertMyQna(UserInquiryVO vo);

	List<AdminCityVO> cityTheater();
	
	List<AdminRegionVO> regionTheater(int num);
	
	UserMapVO mapList(int num);
	
	int insertMap(UserMapVO vo);
	
	List<AdminTheaterVO> theaterCodeList(int num);
	
	AdminTimeVO timeStatusList(int num);
	
	AdminSeatVO seatListInfo(int num);
	
	AdminMovieVO movieList(int num);
	
	AdminTheaterVO theaterListInfo(int num);
	
	List<AdminParVO> parList(int num);
	
	List<AdminParVO> distinctGroupList(int num);
	
	List<AdminActorVO> actorList(int num);
	
	List<AdminGroupVO> groupList(int num);
	
	UserMoiveImgVO imgList(int num);
	
	List<AdminParVO> actorMovieList(int num);
	
	List<AdminMovieVO> actorParMovieList(int num);
	
	List<AdminGenreVO> actorGenreList(int num);
	
	List<AdminAgeVO> actorAgeList(int num);
	
	void viewCount(int num);
	
	AdminNoticeVO noticeView(int num);
	
	List<UserFAQVO> faqList(int num);
	
	UserFAQKindVO faqKindList(int num);
	
	void faqCount(int num);
	
	UserFAQVO faqVoSelect(int num);
	
	int communityInsert(UserCommunityVO vo);
	
	List<UserCommunityVO> communitySelect();
	
	UserCommunityVO communityChoiceNum(int num);
	
	int userReserveInsert(UserReserveVO reserveVo);
	
	List<UserReserveVO> userReserveMyPage(String id);
	
	List<UserReserveVO> userReserveSeatStatus(UserReserveVO vo);
	
	int UpdateReserveStatus(UserReserveVO vo);
	
	List<AdminMovieVO> userArtHouseList();
	
	UserVO communityUserInfo(String id);
	
	List<UserCommunityVO> getCommunityList(SearchVO vo) throws Exception;
	
	int getCommunityCnt(SearchVO vo) throws Exception;
	
	List<AdminMovieVO> getListPaging(Criteria cri);
	
	int getTotal();
	
	int communityCountView(int num);
	
	int CommentInsert(UserCommentVO vo);
	
	List<UserCommentVO> commentSelect(int num);
}
