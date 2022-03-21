package com.dgv.web.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgv.web.admin.vo.AdminActorVO;
import com.dgv.web.admin.vo.AdminAgeVO;
import com.dgv.web.admin.vo.AdminCityVO;
import com.dgv.web.admin.vo.AdminEventVO;
import com.dgv.web.admin.vo.AdminGenreVO;
import com.dgv.web.admin.vo.AdminGroupVO;
import com.dgv.web.admin.vo.AdminMovieVO;
import com.dgv.web.admin.vo.AdminNoticeVO;
import com.dgv.web.admin.vo.AdminParVO;
import com.dgv.web.admin.vo.AdminRegionVO;
import com.dgv.web.admin.vo.AdminSeatVO;
import com.dgv.web.admin.vo.AdminTheaterVO;
import com.dgv.web.admin.vo.AdminTimeVO;
import com.dgv.web.user.controller.Pagination;
import com.dgv.web.user.vo.Criteria;
import com.dgv.web.user.vo.CriteriaBoard;
import com.dgv.web.user.vo.SearchVO;
import com.dgv.web.user.vo.UserCommentVO;
import com.dgv.web.user.vo.UserCommunityVO;
import com.dgv.web.user.vo.UserDetailVO;
import com.dgv.web.user.vo.UserFAQKindVO;
import com.dgv.web.user.vo.UserFAQVO;
import com.dgv.web.user.vo.UserInquiryVO;
import com.dgv.web.user.vo.UserMapVO;
import com.dgv.web.user.vo.UserMoiveImgVO;
import com.dgv.web.user.vo.UserReserveVO;
import com.dgv.web.user.vo.UserVO;

@Repository
public class UserBoardDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<AdminNoticeVO> noticeList(){
		return sqlSessionTemplate.selectList("UserBoardDAO.NoticeList");
	}
	
	public List<UserInquiryVO> userQnaOneList(String id){
		return sqlSessionTemplate.selectList("UserBoardDAO.UserQnaOneList",id);
	}
	
	public int insertMyQna(UserInquiryVO vo){
		return sqlSessionTemplate.insert("UserBoardDAO.InsertMyQna",vo);
	}
	
	///도시별 극장
	public List<AdminCityVO> cityTheaterList(){
		return sqlSessionTemplate.selectList("UserMovieDAO.TheaterList");
	}
	public List<AdminRegionVO> regionTheaterList(int num){
		return sqlSessionTemplate.selectList("UserMovieDAO.RegionList",num);
	}
	public UserMapVO mapList(int num) {
		return sqlSessionTemplate.selectOne("UserMovieDAO.MapList", num);
	}
	public int insertMap(UserMapVO vo) {
		return sqlSessionTemplate.insert("UserMovieDAO.InsertMap",vo);
	}
	
	public List<AdminTheaterVO> theaterCodeList(int num){
		return sqlSessionTemplate.selectList("UserMovieDAO.TheaterCodeList", num);
	}
	public AdminTimeVO timeStatusList(int num) {
		return sqlSessionTemplate.selectOne("UserMovieDAO.timeStatusList",num);
	}
	
	public AdminSeatVO seatListInfo(int num) {
		return sqlSessionTemplate.selectOne("UserMovieDAO.seatListInfo", num);
	}
	
	public AdminMovieVO movieList(int num) {
		return sqlSessionTemplate.selectOne("UserMovieDAO.MovieList", num);
	}
	public AdminTheaterVO theaterListInfo(int num) {
		return sqlSessionTemplate.selectOne("UserMovieDAO.theaterListInfo",num);
	}
	
	public List<AdminParVO> parList(int num) {
		return sqlSessionTemplate.selectList("UserMovieDAO.parList",num);
	}

	public List<AdminParVO> distinctGroupList(int num){
		return sqlSessionTemplate.selectList("UserMovieDAO.distinctGroupList",num);
	}
	
	public List<AdminActorVO> actorList(int num){
		return sqlSessionTemplate.selectList("UserMovieDAO.actorList", num);
	}
	
	public List<AdminGroupVO> groupList(int num){
		return sqlSessionTemplate.selectList("UserMovieDAO.groupList", num);
	}
	public UserMoiveImgVO imgList(int num) {
		return sqlSessionTemplate.selectOne("UserMovieDAO.imgList",num);
	}
	
	public AdminGroupVO actorGroup(int num) {
		return sqlSessionTemplate.selectOne("AdminGroupDAO.actorGroup",num);
	}
	
	public List<AdminParVO> actorMovieList(int num){
		return sqlSessionTemplate.selectList("UserMovieDAO.actorMovieList", num);
	}
	
	public List<AdminMovieVO> actorParMovieList(int num){
		return sqlSessionTemplate.selectList("UserMovieDAO.actorParMovieList", num);
	}
	
	public List<AdminGenreVO> actorGenreList(int num){
		return sqlSessionTemplate.selectList("UserMovieDAO.actorGenreList", num);
	}
	
	public List<AdminAgeVO> actorAgeList(int num){
		return sqlSessionTemplate.selectList("UserMovieDAO.actorAgeList", num);
	}
	
	public void viewCount(int num) {
		sqlSessionTemplate.update("UserBoardDAO.viewCount",num);
	}
	
	public AdminNoticeVO noticeView(int num) {
		return sqlSessionTemplate.selectOne("UserBoardDAO.noticeView",num);
	}
	
	public List<UserFAQVO> faqList(int num){
		return sqlSessionTemplate.selectList("UserBoardDAO.faqList",num);
	}
	public UserFAQKindVO faqKindList(int num) {
		return sqlSessionTemplate.selectOne("UserBoardDAO.faqKindList",num);
	}
	
	public void faqCount(int num) {
		sqlSessionTemplate.update("UserBoardDAO.faqCount",num);
	}
	
	public UserFAQVO faqVoSelect(int num) {
		return sqlSessionTemplate.selectOne("UserBoardDAO.faqVoSelect", num);
	}
	public int communityInsert(UserCommunityVO vo) {
		return sqlSessionTemplate.insert("UserBoardDAO.communityInsert",vo);
	}
	
	public List<UserCommunityVO> communitySelect(CriteriaBoard cri){
		return sqlSessionTemplate.selectList("UserBoardDAO.communitySelect",cri);
	}
	public UserCommunityVO communityChoiceNum(int num) {
		return sqlSessionTemplate.selectOne("UserBoardDAO.communityChoiceNum",num);
	}
	
	public int userReserveInsert(UserReserveVO reserveVo) {
		return sqlSessionTemplate.insert("UserMovieDAO.userReserveInsert", reserveVo);
	}
	
	public List<UserReserveVO> userReserveMyPage(String id){
		return sqlSessionTemplate.selectList("UserMovieDAO.userReserveMyPage", id);
	}
	public List<UserReserveVO> userReserveSeatStatus(UserReserveVO vo) {
		return sqlSessionTemplate.selectList("UserMovieDAO.userReserveSeatStatus", vo);
	}
	
	public int UpdateReserveStatus(UserReserveVO vo) {
		return sqlSessionTemplate.update("UserMovieDAO.UpdateReserveStatus", vo);
	}
	
	public List<AdminMovieVO> userArtHouseList(){
		return sqlSessionTemplate.selectList("UserMovieDAO.userArtHouseList");
	}
	public UserVO communityUserInfo(String id) {
		return sqlSessionTemplate.selectOne("UserBoardDAO.communityUserInfo",id);
	}
	
	public List<UserCommunityVO> getCommunityList(SearchVO vo) throws Exception{
		return sqlSessionTemplate.selectList("UserBoardDAO.getSearchList", vo);
	}
	
	public int getCommunityCnt(){
		return sqlSessionTemplate.selectOne("UserBoardDAO.getCommunityCnt");
	}
	public List<AdminMovieVO> myPaging(Criteria cri){
		return sqlSessionTemplate.selectList("UserBoardDAO.myPagingMovie", cri);
	}
	public int getTotal() {
		return sqlSessionTemplate.selectOne("UserBoardDAO.getTotal");
	}
	public int communityCountView(int num) {
		return sqlSessionTemplate.update("UserBoardDAO.communityCountView",num);
	}
	public int CommentInsert(UserCommentVO vo) {
		return sqlSessionTemplate.insert("UserBoardDAO.CommentInsert",vo);
	}
	public List<UserCommentVO> commentSelect(int num){
		return sqlSessionTemplate.selectList("UserBoardDAO.commentSelect",num);
	}
	

	public List<AdminEventVO> eventList(){
		return sqlSessionTemplate.selectList("UserBoardDAO.eventList");

	}
	public UserVO userNumSelect(String id) {
		return sqlSessionTemplate.selectOne("UserDAO.userNumSelect",id);
	}

	public List<UserReserveVO> userIdMovieReserveList(String id){
		return sqlSessionTemplate.selectList("UserMovieDAO.userIdMovieReserveList", id);

	}
	
	public int continueTotal() {
		return sqlSessionTemplate.selectOne("UserBoardDAO.continueTotal");
	}
	
	public int endTotal() {
		return sqlSessionTemplate.selectOne("UserBoardDAO.endTotal");
	}
	
	public int yetTotal() {
		return sqlSessionTemplate.selectOne("UserBoardDAO.yetTotal");
	}
	
	public List<UserVO> userIdList(){
		return sqlSessionTemplate.selectList("UserDAO.userIdList");
	}
}
