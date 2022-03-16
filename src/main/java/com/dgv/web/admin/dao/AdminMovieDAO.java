package com.dgv.web.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgv.web.admin.vo.AdminActorVO;
import com.dgv.web.admin.vo.AdminAgeVO;
import com.dgv.web.admin.vo.AdminCityTheaterVO;
import com.dgv.web.admin.vo.AdminEventVO;
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
import com.dgv.web.user.vo.Criteria;
import com.dgv.web.user.vo.UserInquiryVO;
import com.dgv.web.user.vo.UserReserveVO;

@Repository
public class AdminMovieDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int TimecheckList(int num) {
		return sqlSessionTemplate.selectOne("AdminMovieDAO.TimecheckList", num);
	}
	
	public int selectMap(String name) {
		return sqlSessionTemplate.selectOne("AdminMovieDAO.selectMap", name);
	}
	
	public int deleteTheater(int num) {
		return sqlSessionTemplate.delete("AdminMovieDAO.deleteTheater",num);
	}
	public List<AdminTimeVO> timeList(int num){
		return sqlSessionTemplate.selectList("AdminMovieDAO.TimeList", num);
	}
	
	public int insertSeat(AdminSeatVO vo) {
		return sqlSessionTemplate.insert("AdminMovieDAO.InsertSeat", vo);
	}
	
	public int insertTime(AdminTimeVO vo) {
		return sqlSessionTemplate.insert("AdminMovieDAO.InsertTime", vo);
	}
	
	public AdminTheaterVO theaterListInfo(int num) {
		return sqlSessionTemplate.selectOne("AdminMovieDAO.theaterListInfo", num);
	}
	
	public int insertGenre(AdminGenreVO vo) {
		System.out.println("TEST :4");
		return sqlSessionTemplate.insert("AdminGenreDAO.InsertGenre",vo);
	}
	
	public int insertAge(AdminAgeVO vo) {
		return sqlSessionTemplate.insert("AdminAgeDAO.InsertAge",vo);
	}
	public int insertGroup(AdminGroupVO vo) {
		return sqlSessionTemplate.insert("AdminGroupDAO.InsertGroup", vo);
	}
	public int insertActor(AdminActorVO vo) {
		return sqlSessionTemplate.insert("AdminGroupDAO.InsertActor", vo);
	}
	
	
	public List<AdminGenreVO> genreList(){
		return sqlSessionTemplate.selectList("AdminGenreDAO.GenreList");
	}
	
	public List<AdminAgeVO> ageList(){
		return sqlSessionTemplate.selectList("AdminAgeDAO.AgeList");
	}
	
	public List<AdminGroupVO> groupList(){
		return sqlSessionTemplate.selectList("AdminGroupDAO.GroupList");
	}
	public List<AdminActorVO> actorList(){
		return sqlSessionTemplate.selectList("AdminGroupDAO.ActorList");
	}
	
	/////////// 공지사항 //////////////
	public int insertNotice(AdminNoticeVO vo) {
		return sqlSessionTemplate.insert("AdminBoardDAO.InsertNotice",vo);
	}
	
	public List<AdminNoticeVO> noticeList(){
		return sqlSessionTemplate.selectList("AdminBoardDAO.NoticeList");
	}
	
	//////////고객답변대기 목록/////////////
	public List<UserInquiryVO> inquiryList(){
		
		return sqlSessionTemplate.selectList("AdminBoardDAO.InquiryList");
	}
	
	////////고객 답변 완료 목록/////////////
	public List<AdminInquiryVO> answerList(){
		return sqlSessionTemplate.selectList("AdminBoardDAO.AnswerList");
	}
	
	///////답변등록페이지에 고객아이디 readonly///////
	public UserInquiryVO answerUser(int code) {
		return sqlSessionTemplate.selectOne("AdminBoardDAO.AnswerUser",code);
		
	}
	
	public int insertAnswer(AdminInquiryVO vo) {
		return sqlSessionTemplate.insert("AdminBoardDAO.InsertAnswer", vo);
	}
	//답변하고 status 변경
	public int updateStatus(Integer num) {
		return sqlSessionTemplate.update("AdminBoardDAO.UpdateStatus",num);
	}
	
	//상영관 등록
	public int insertTheater(AdminTheaterVO vo) {
		return sqlSessionTemplate.insert("AdminMovieDAO.InsertTheater",vo);
	}
	
	public AdminRegionVO regionList(String name) {
		return sqlSessionTemplate.selectOne("AdminMovieDAO.regionList",name);
	}
	
	//영화등록전 참여자 테이블 등록 
	public int insertPar(AdminParVO vo) {
		return sqlSessionTemplate.insert("AdminMovieDAO.InsertPar",vo);
	}
	
	public int insertMovie(AdminMovieVO vo) {
		return sqlSessionTemplate.insert("AdminMovieDAO.InsertMovie",vo);
	}
	
	public List<AdminActorVO> choiceActorList(int num){
		return sqlSessionTemplate.selectList("AdminGroupDAO.ChoiceActorList",num);
	}
	
	public List<AdminTheaterVO> choiceTheaterList(int num){
		return sqlSessionTemplate.selectList("AdminMovieDAO.TheaterList", num);
	}
	
	public List<AdminTheaterVO> selectTheater(){
		return sqlSessionTemplate.selectList("AdminMovieDAO.SelectTheater");
	}

	public int insertCityTheater(AdminCityTheaterVO vo) {
		return sqlSessionTemplate.insert("AdminMovieDAO.InsertCityTheater",vo);
	}
	
	public int deleteActor(AdminActorVO vo) {
		return sqlSessionTemplate.delete("AdminGroupDAO.ActorDelete",vo);
	}
	
	public int deleteGroup(AdminGroupVO vo) {
		return sqlSessionTemplate.delete("AdminGroupDAO.GroupDelete",vo);
	}

	public int deleteAge(AdminAgeVO vo) {
		return sqlSessionTemplate.delete("AdminGenreDAO.AgeDelete",vo);
	}

	public int deleteGenre(AdminGenreVO vo) {
		return sqlSessionTemplate.delete("AdminGenreDAO.GenreDelete",vo);
	}
	public List<AdminMovieVO> movieList(){
		return sqlSessionTemplate.selectList("AdminMovieDAO.MovieList");
	}
	public int updateGroup(AdminGroupVO vo) {
		return sqlSessionTemplate.update("AdminGroupDAO.UpdateGroup",vo);
	}
	public AdminGroupVO groupView(int num) {
		return sqlSessionTemplate.selectOne("AdminGroupDAO.GroupListInfo",num);
	}
	
	public AdminActorVO actorListInfo(int num) {
		return sqlSessionTemplate.selectOne("AdminGroupDAO.actorListInfo",num);	
	}
	
	public int updateActor(AdminActorVO vo) {
		return sqlSessionTemplate.update("AdminGroupDAO.UpdateActor",vo);
	}
	public AdminGenreVO genreListInfo(int num) {
		return sqlSessionTemplate.selectOne("AdminGenreDAO.GenreListInfo", num);
	}
	public AdminAgeVO ageListInfo(int num) {
		return sqlSessionTemplate.selectOne("AdminGenreDAO.AgeListinfo", num);
		
	}
	
	public int genreUpdate(AdminGenreVO vo) {
		return sqlSessionTemplate.update("AdminGenreDAO.GenreUpdate",vo);
		
	}
	
	public int updateAge(AdminAgeVO vo) {
		return sqlSessionTemplate.update("AdminGenreDAO.AgeUpdate",vo);
	}
	
	public List<UserReserveVO> SelectReserveInfo(){
		return sqlSessionTemplate.selectList("AdminBoardDAO.SelectReserveInfo");
	}
	
	public int updateReserveStatus(UserReserveVO vo) {
		return sqlSessionTemplate.update("AdminBoardDAO.updateReserveStatus",vo);
	}
	public int areaChart(UserReserveVO vo) {
		return sqlSessionTemplate.selectOne("AdminMovieDAO.areaChart",vo);
	}
	public int areaBarChart(UserReserveVO vo) {
		return sqlSessionTemplate.selectOne("AdminMovieDAO.areaBarChart",vo);
	}
	
	public int EventInsert(AdminEventVO vo) {
		return sqlSessionTemplate.insert("AdminBoardDAO.EventInsert",vo);
	}
	public List<AdminEventVO> EventSelect(){
		return sqlSessionTemplate.selectList("AdminBoardDAO.EventSelect");
	}
	public int StatusChange(AdminMovieVO vo) {
		return sqlSessionTemplate.update("AdminMovieDAO.StatusChange",vo);
	}
	public List<AdminMovieVO> continueMovie(Criteria cri){
		return sqlSessionTemplate.selectList("AdminMovieDAO.continueMovie",cri);
	}
	public List<AdminMovieVO> endMovie(Criteria cri){
		return sqlSessionTemplate.selectList("AdminMovieDAO.endMovie",cri);
	}
	public List<AdminMovieVO> yetMovie(Criteria cri){
		return sqlSessionTemplate.selectList("AdminMovieDAO.yetMovie",cri);
	}
	
	public int deleteMovie(AdminMovieVO vo) {
		return sqlSessionTemplate.delete("AdminMovieDAO.deleteMovie",vo);
	}
}
