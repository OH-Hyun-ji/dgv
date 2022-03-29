package com.dgv.web.user.service;

import java.util.List;
import org.springframework.stereotype.Service;
import com.dgv.web.admin.vo.AdminActorVO;
import com.dgv.web.admin.vo.AdminAgeVO;
import com.dgv.web.admin.vo.AdminCityVO;
import com.dgv.web.admin.vo.AdminCouponVO;
import com.dgv.web.admin.vo.AdminEventVO;
import com.dgv.web.admin.vo.AdminGenreVO;
import com.dgv.web.admin.vo.AdminGroupVO;
import com.dgv.web.admin.vo.AdminInquiryVO;
import com.dgv.web.admin.vo.AdminMovieVO;
import com.dgv.web.admin.vo.AdminNoticeVO;
import com.dgv.web.admin.vo.AdminParUserEventVO;
import com.dgv.web.admin.vo.AdminParVO;
import com.dgv.web.admin.vo.AdminRegionVO;
import com.dgv.web.admin.vo.AdminSeatVO;
import com.dgv.web.admin.vo.AdminTheaterVO;
import com.dgv.web.admin.vo.AdminTimeVO;
import com.dgv.web.user.dao.UserBoardDAO;
import com.dgv.web.user.vo.Criteria;
import com.dgv.web.user.vo.CriteriaBoard;
import com.dgv.web.user.vo.MyPagePaging;
import com.dgv.web.user.vo.SearchVO;
import com.dgv.web.user.vo.UserCommentVO;
import com.dgv.web.user.vo.UserCommunityVO;
import com.dgv.web.user.vo.UserCouponUseVO;
import com.dgv.web.user.vo.UserDetailVO;
import com.dgv.web.user.vo.UserFAQKindVO;
import com.dgv.web.user.vo.UserFAQVO;
import com.dgv.web.user.vo.UserInquiryVO;
import com.dgv.web.user.vo.UserMapVO;
import com.dgv.web.user.vo.UserMoiveImgVO;
import com.dgv.web.user.vo.UserReserveVO;
import com.dgv.web.user.vo.UserVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class UserBoardServiceImpl implements UserBoardService {
	
	
	private final UserBoardDAO userBoardDAO;
	
	
	@Override
	public List<AdminNoticeVO> noticeList() {
		
		return userBoardDAO.noticeList();
	}


	@Override
	public List<UserInquiryVO> userQnaOneList(String id) {
		
		return userBoardDAO.userQnaOneList(id);
	}


	@Override
	public int insertMyQna(UserInquiryVO vo) {
		
		return userBoardDAO.insertMyQna(vo);
	}


	@Override
	public List<AdminCityVO> cityTheater() {
		
		return userBoardDAO.cityTheaterList();
	}


	@Override
	public List<AdminRegionVO> regionTheater(int num) {
		
		return userBoardDAO.regionTheaterList(num);
	}


	@Override
	public UserMapVO mapList(int num) {
		
		return userBoardDAO.mapList(num);
	}


	@Override
	public int insertMap(UserMapVO vo) {
		
		return userBoardDAO.insertMap(vo);
	}


	@Override
	public List<AdminTheaterVO> theaterCodeList(int num) {
		
		return userBoardDAO.theaterCodeList(num);
	}


	@Override
	public AdminTimeVO timeStatusList(int num) {
		
		return userBoardDAO.timeStatusList(num);
	}


	@Override
	public AdminSeatVO seatListInfo(int num) {
		
		return userBoardDAO.seatListInfo(num);
	}

	@Override
	public AdminMovieVO movieList(int num) {
		
		return userBoardDAO.movieList(num);
	}

	@Override
	public AdminTheaterVO theaterListInfo(int num) {
		
		return userBoardDAO.theaterListInfo(num);
	}

	@Override
	public List<AdminParVO> parList(int num) {
		
		return userBoardDAO.parList(num);
	}

	@Override
	public List<AdminParVO> distinctGroupList(int num) {
		
		return userBoardDAO.distinctGroupList(num);
	}

	@Override
	public List<AdminActorVO> actorList(int num) {
		
		return userBoardDAO.actorList(num);
	}

	@Override
	public List<AdminGroupVO> groupList(int num) {
		
		return userBoardDAO.groupList(num);
	}


	@Override
	public UserMoiveImgVO imgList(int num) {
		
		return userBoardDAO.imgList(num);
	}

	@Override
	public List<AdminParVO> actorMovieList(int num) {
		
		return userBoardDAO.actorMovieList(num);
	}


	@Override
	public List<AdminMovieVO> actorParMovieList(int num) {
		
		return userBoardDAO.actorParMovieList(num);
	}


	@Override
	public List<AdminGenreVO> actorGenreList(int num) {
		
		return userBoardDAO.actorGenreList(num);
	}


	@Override
	public List<AdminAgeVO> actorAgeList(int num) {
		// TODO Auto-generated method stub
		return userBoardDAO.actorAgeList(num);
	}


	@Override
	public void viewCount(int num) {
		
		userBoardDAO.viewCount(num);
	}


	@Override
	public AdminNoticeVO noticeView(int num) {
		
		return userBoardDAO.noticeView(num);
	}


	@Override
	public List<UserFAQVO> faqList(int num) {
	
		return userBoardDAO.faqList(num);
	}


	@Override
	public UserFAQKindVO faqKindList(int num) {
		
		return userBoardDAO.faqKindList(num);
	}


	@Override
	public void faqCount(int num) {
		userBoardDAO.faqCount(num);
		
	}


	@Override
	public UserFAQVO faqVoSelect(int num) {
		
		return userBoardDAO.faqVoSelect(num);
	}


	@Override
	public int communityInsert(UserCommunityVO vo) {
		
		return userBoardDAO.communityInsert(vo);
	}


	@Override
	public List<UserCommunityVO> communitySelect(CriteriaBoard cri) {
		
		return userBoardDAO.communitySelect(cri);
	}


	@Override
	public UserCommunityVO communityChoiceNum(int num) {
		
		return userBoardDAO.communityChoiceNum(num);
	}


	@Override
	public int userReserveInsert(UserReserveVO reserveVo) {
		
		return userBoardDAO.userReserveInsert(reserveVo);
	}


	@Override
	public List<UserReserveVO> userReserveMyPage(String id) {
		
		return userBoardDAO.userReserveMyPage(id);
	}


	@Override
	public List<UserReserveVO> userReserveSeatStatus(UserReserveVO vo) {
		
		return userBoardDAO.userReserveSeatStatus(vo);
	}


	@Override
	public int UpdateReserveStatus(UserReserveVO vo) {
		
		return userBoardDAO.UpdateReserveStatus(vo);
	}


	@Override
	public List<AdminMovieVO> userArtHouseList() {
		return userBoardDAO.userArtHouseList();
	
	}


	@Override
	public UserVO communityUserInfo(String id) {
		
		return userBoardDAO.communityUserInfo(id);
	}


	@Override
	public List<UserCommunityVO> getCommunityList(SearchVO vo) throws Exception {
		
		return userBoardDAO.getCommunityList(vo);
	}


	@Override
	public int getCommunityCnt()  {
	
		return userBoardDAO.getCommunityCnt();
	}


	@Override
	public List<AdminMovieVO> getListPaging(Criteria cri) {
		
		return userBoardDAO.myPaging(cri);
	}


	@Override
	public int getTotal() {
		
		return userBoardDAO.getTotal();
	}


	@Override
	public int communityCountView(int num) {
		
		return userBoardDAO.communityCountView(num);
	}


	@Override
	public int CommentInsert(UserCommentVO vo) {

		return userBoardDAO.CommentInsert(vo);
	}


	@Override
	public List<UserCommentVO> commentSelect(int num) {
	
		return userBoardDAO.commentSelect(num);
	}
	
	@Override
	public List<AdminEventVO> eventList() {
		
		return userBoardDAO.eventList();
	}

	@Override
	public UserVO userNumSelect(String id) {
	
		return userBoardDAO.userNumSelect(id);
	}

	@Override
	public List<UserReserveVO> userIdMovieReserveList(String id) {
		
		return userBoardDAO.userIdMovieReserveList(id);
	}


	@Override
	public int continueTotal() {
		
		return userBoardDAO.continueTotal();
	}


	@Override
	public int endTotal() {
	
		return userBoardDAO.endTotal();
	}


	@Override
	public int yetTotal() {
		
		return userBoardDAO.yetTotal();
	}
	
	@Override
	public List<UserVO> userIdList() {
		
		return userBoardDAO.userIdList();
	}

	@Override
	public List<AdminCouponVO> myCouponList(int num) {
		
		return userBoardDAO.myCouponList(num);
	}
	@Override
	public AdminCouponVO myCouponVo(int num) {
		
		return userBoardDAO.myCouponVo(num);
	}
	@Override
	public int CouponUseInsert(UserCouponUseVO vo) {
		
		return userBoardDAO.CouponUseInsert(vo);
	}

	@Override
	public List<UserCouponUseVO> CouponUseSelect(UserCouponUseVO vo) {
	
		return userBoardDAO.CouponUseSelect(vo);
	}
	
	@Override
	public AdminInquiryVO adminAnswer(int num) {
		
		return userBoardDAO.adminAnswer(num);
	}
	
	@Override
	public UserInquiryVO userQnaVO(int num) {
		
		return userBoardDAO.userQnaVO(num);
	}
	@Override
	public int parUserEventInsert(AdminParUserEventVO vo) {
		
		return userBoardDAO.parUserEventInsert(vo);
	}

	@Override
	public List<AdminParUserEventVO> parUserEventSelect() {
		
		return userBoardDAO.parUserEventSelect();
	}
	
	@Override
	public int parEventCheck(AdminParUserEventVO vo) {
		
		return userBoardDAO.parEventCheck(vo);
	}
	
	@Override
	public UserReserveVO userReserveFinish(String merchantUid) {
		
		return userBoardDAO.userReserveFinish(merchantUid);
	}

	@Override
	public List<AdminParUserEventVO> participantList(int num) {
		
		return userBoardDAO.participantList(num);
	}

	@Override
	public AdminEventVO eventNumVo(int num) {
	
		return userBoardDAO.eventNumVo(num);
	}
	@Override
	public UserReserveVO movieDetailChart(UserReserveVO vo) {
		
		return userBoardDAO.movieDetailChart(vo);
	}
	
	@Override
	public UserVO userRankEarnPoint(String id) {
		
		return userBoardDAO.userRankEarnPoint(id);
	}
	
	@Override
	public int userPointInsert(UserDetailVO vo) {
		
		return userBoardDAO.userPointInsert(vo);
	}
	
	@Override
	public UserDetailVO userPointSelect(UserDetailVO vo) {
		
		return userBoardDAO.userPointSelect(vo);
	}
	
	@Override
	public int moviePeopleTotalCount() {
		
		return userBoardDAO.moviePeopleTotalCount();
	}
	@Override
	public List<UserCouponUseVO> userCouponList(String id) {
		
		return userBoardDAO.userCouponList(id);
	}
	
	@Override
	public int usePointReset(String id) {
		
		return userBoardDAO.usePointReset(id);
	}
	
	@Override
	public AdminCouponVO couponCancel(AdminCouponVO vo) {
		
		return userBoardDAO.couponCancel(vo);
	}
	@Override
	public List<UserCouponUseVO> couponUseAbleList(UserCouponUseVO vo) {
		
		return userBoardDAO.couponUseAbleList(vo);
	}
	@Override
	public int couponUseFalse(int cuCode) {
	
		return userBoardDAO.couponUseFalse(cuCode);
	}
	@Override
	public List<UserCouponUseVO> couponUseEnAbleList(UserCouponUseVO vo) {
		
		return userBoardDAO.couponUseEnAbleList(vo);
	}
	
	@Override
	public int couponUseTrue(int cuCode) {
		
		return userBoardDAO.couponUseTrue(cuCode);
	}
	
	@Override
	public List<UserReserveVO> myPagePaging(MyPagePaging page) {
		
		return userBoardDAO.myPagePaging(page);
	}
	
	@Override
	public int myReserveCount(String id) {
		
		return userBoardDAO.myReserveCount(id);
	}
	@Override
	public List<UserFAQVO> userFaqTotalList() {
		
		return userBoardDAO.userFaqTotalList();
	}

	@Override
	public int myCouponCount(String id) {
		
		return userBoardDAO.myCouponCount(id);
	}
	
	@Override
	public List<AdminEventVO> myJoinEvent(int num) {
		
		return userBoardDAO.myJoinEvent(num);
	}
}
