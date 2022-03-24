package com.dgv.web.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dgv.web.admin.dao.AdminMovieDAO;
import com.dgv.web.admin.vo.AdminActorVO;
import com.dgv.web.admin.vo.AdminAgeVO;
import com.dgv.web.admin.vo.AdminCityTheaterVO;
import com.dgv.web.admin.vo.AdminCouponVO;
import com.dgv.web.admin.vo.AdminEventVO;
import com.dgv.web.admin.vo.AdminGenreVO;
import com.dgv.web.admin.vo.AdminGroupVO;
import com.dgv.web.admin.vo.AdminInquiryVO;
import com.dgv.web.admin.vo.AdminMovieVO;
import com.dgv.web.admin.vo.AdminNoticeVO;
import com.dgv.web.admin.vo.AdminParVO;
import com.dgv.web.admin.vo.AdminRegionVO;
import com.dgv.web.admin.vo.AdminSeatVO;
import com.dgv.web.admin.vo.AdminTermVO;
import com.dgv.web.admin.vo.AdminTheaterVO;
import com.dgv.web.admin.vo.AdminTimeVO;
import com.dgv.web.user.vo.Criteria;
import com.dgv.web.user.vo.UserInquiryVO;
import com.dgv.web.user.vo.UserMapVO;
import com.dgv.web.user.vo.UserReserveVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AdminMovieServiceImpl implements AdminMovieService {

	private final AdminMovieDAO adminMovieDAO;	
	
	@Override
	public int insertGenre(AdminGenreVO vo) {
		System.out.println("TEST :2");
		int test = adminMovieDAO.insertGenre(vo);
		System.out.println("TEST :3");
		return test;
		
	}

	@Override
	public int insertAge(AdminAgeVO vo) {
		
		return adminMovieDAO.insertAge(vo) ;
	}
	
	@Override
	public int insertGroup(AdminGroupVO vo) {
		
		return adminMovieDAO.insertGroup(vo);
	}

	@Override
	public List<AdminAgeVO> ageList() {
		
		return adminMovieDAO.ageList();
	}

	@Override
	public List<AdminGenreVO> genreList() {
		
		return adminMovieDAO.genreList();
	}

	@Override
	public List<AdminGroupVO> groupList() {
		
		return adminMovieDAO.groupList();
	}

	@Override
	public int insertActor(AdminActorVO vo) {
		return adminMovieDAO.insertActor(vo);
		
	}

	@Override
	public List<AdminActorVO> actorList() {
		
		return adminMovieDAO.actorList();
	}

	@Override
	public int insertNotice(AdminNoticeVO vo) {
		
		return adminMovieDAO.insertNotice(vo);
	}

	@Override
	public List<AdminNoticeVO> noticeList() {
		
		return adminMovieDAO.noticeList();
	}

	@Override
	public List<UserInquiryVO> inquiryList() {
		return adminMovieDAO.inquiryList();
	}

	@Override
	public List<AdminInquiryVO> answerList() {
		return adminMovieDAO.answerList();
	}

	@Override
	public UserInquiryVO waitCode(int code) {
		
		return adminMovieDAO.answerUser(code);
	}

	@Override
	public int insertAnswer(AdminInquiryVO vo) {
		
		return adminMovieDAO.insertAnswer(vo);
	}

	@Override
	public int updateStatus(Integer num) {
		
		return adminMovieDAO.updateStatus(num);
	}

	@Override
	public int insertTheater(AdminTheaterVO vo) {
		
		return adminMovieDAO.insertTheater(vo);
	}

	@Override
	public AdminRegionVO regionList(String name) {
		
		return adminMovieDAO.regionList(name);
	}

	@Override
	public int insertPar(AdminParVO vo) {
		
		return adminMovieDAO.insertPar(vo);
	}

	@Override
	public int insertMovie(AdminMovieVO vo) {
	
		return adminMovieDAO.insertMovie(vo);
	}

	@Override
	public List<AdminActorVO> choiceActorList(int num) {
		
		return adminMovieDAO.choiceActorList(num);
	}

	@Override
	public List<AdminTheaterVO> choiceTheaterList(int num) {
		
		return adminMovieDAO.choiceTheaterList(num);
	}

	@Override
	public int insertCityTheater(AdminCityTheaterVO vo) {
		
		return adminMovieDAO.insertCityTheater(vo);
	}

	@Override
	public int deleteActor(AdminActorVO vo) {
		
		return adminMovieDAO.deleteActor(vo);
	}

	@Override
	public int deleteGroup(AdminGroupVO vo) {
	
		return adminMovieDAO.deleteGroup(vo);
	}

	@Override
	public int deleteAge(AdminAgeVO vo) {
		
		return adminMovieDAO.deleteAge(vo);
	}

	@Override
	public int deleteGenre(AdminGenreVO vo) {
		
		return adminMovieDAO.deleteGenre(vo) ;
	}

	@Override
	public List<AdminTheaterVO> selectTheater() {
		
		return adminMovieDAO.selectTheater();
	}

	@Override
	public List<AdminMovieVO> movieList() {
		
		return adminMovieDAO.movieList();
	}

	@Override
	public int updateGroup(AdminGroupVO vo) {
		
		return adminMovieDAO.updateGroup(vo);
	}

	@Override
	public AdminGroupVO groupView(int num) {
		
		return adminMovieDAO.groupView(num);
	}

	@Override
	public AdminActorVO actorListInfo(int num) {
		
		return adminMovieDAO.actorListInfo(num);
	}

	@Override
	public int updateActor(AdminActorVO vo) {
	
		return adminMovieDAO.updateActor(vo);
	}

	@Override
	public AdminGenreVO genreListInfo(int num) {
		
		return adminMovieDAO.genreListInfo(num);
	}

	@Override
	public AdminAgeVO ageListInfo(int num) {
		
		return adminMovieDAO.ageListInfo(num);
	}

	@Override
	public int updateGenre(AdminGenreVO vo) {
	
		return adminMovieDAO.genreUpdate(vo);
	}

	@Override
	public int updateAge(AdminAgeVO vo) {
	
		return adminMovieDAO.updateAge(vo);
	}

	@Override
	public AdminTheaterVO theaterListInfo(int num) {
		
		return adminMovieDAO.theaterListInfo(num);
	}

	@Override
	public int insertTime(AdminTimeVO vo) {
		
		return adminMovieDAO.insertTime(vo);
	}

	@Override
	public int insertSeat(AdminSeatVO vo) {
		
		return adminMovieDAO.insertSeat(vo);
	}

	@Override
	public List<AdminTimeVO> timeList(int num) {
	
		return adminMovieDAO.timeList(num);
	}

	@Override
	public int deleteTheater(int num) {
		
		return adminMovieDAO.deleteTheater(num);
	}

	@Override
	public int selectMap(String name) {
		
		return adminMovieDAO.selectMap(name);
	}

	@Override
	public int timeCheckList(int num) {
	
		return adminMovieDAO.TimecheckList(num);
	}

	@Override
	public List<UserReserveVO> SelectReserveInfo() {
		
		return adminMovieDAO.SelectReserveInfo();
	}

	@Override
	public int updateReserveStatus(UserReserveVO vo) {
		
		return adminMovieDAO.updateReserveStatus(vo);
	}

	@Override
	public int areaChart(UserReserveVO vo) {
		
		return adminMovieDAO.areaChart(vo);
	}

	@Override
	public int areaBarChart(UserReserveVO vo) {
		
		return adminMovieDAO.areaBarChart(vo);
	}

	@Override
	public int EventInsert(AdminEventVO vo) {
		
		return adminMovieDAO.EventInsert(vo);
	}

	@Override
	public List<AdminEventVO> EventSelect() {
		
		return adminMovieDAO.EventSelect();
	}

	@Override
	public int StatusChange(AdminMovieVO vo) {
		
		return adminMovieDAO.StatusChange(vo);
	}

	@Override
	public List<AdminMovieVO> continueMovie(Criteria cri) {
		
		return adminMovieDAO.continueMovie(cri);
	}

	@Override
	public List<AdminMovieVO> endMovie(Criteria cri) {
	
		return adminMovieDAO.endMovie(cri);
	}

	@Override
	public List<AdminMovieVO> yetMovie(Criteria cri) {
	
		return adminMovieDAO.yetMovie(cri);
	}

	@Override
	public int deleteMovie(AdminMovieVO vo) {
		
		return adminMovieDAO.deleteMovie(vo);
	}

	@Override
	public List<UserReserveVO> bestMovieList() {
		
		return adminMovieDAO.bestMovieList();
	}

	@Override
	public List<UserReserveVO> totalPeopleCount() {
		
		return adminMovieDAO.totalPeopleCount();
	}

	@Override
	public int beforeChartCheck(UserReserveVO vo) {
		
		return adminMovieDAO.beforeChartCheck(vo);
	}

	@Override
	public List<AdminMovieVO> BarChartGenreInfo() {
		
		return adminMovieDAO.BarChartGenreInfo();
	}

	@Override
	public UserReserveVO totalMyMoney() {
		
		return adminMovieDAO.totalMyMoney();
	}

	@Override
	public List<UserReserveVO> userReserveList(String id) {
		
		return adminMovieDAO.userReserveList(id);
	}

	@Override
	public int TermUpdate(AdminTermVO vo) {
		
		return adminMovieDAO.TermUpdate(vo);
	}

	@Override
	public int TermDelete(AdminTermVO vo) {
		
		return adminMovieDAO.TermDelete(vo);
	}

	@Override
	public int eventAdminUpdate(AdminEventVO vo) {
		
		return adminMovieDAO.eventAdminUpdate(vo);
	}
		
	@Override
	public List<AdminEventVO> endEventSelect() {
	
		return adminMovieDAO.endEventSelect();
	}
		
	@Override
	public int eventCheck(AdminEventVO vo) {
		
		return adminMovieDAO.eventCheck(vo);
	}
	
	@Override
	public List<AdminEventVO> continueEventSelect() {
		
		return adminMovieDAO.continueEventSelect();
	}

	@Override
	public AdminEventVO EventDetailSelect(int num) {
		
		return adminMovieDAO.EventDetailSelect(num);
	}
	@Override
	public int eventUpdate(AdminEventVO vo) {
		
		return adminMovieDAO.eventUpdate(vo);
	}
	
	@Override
	public int eventUpdateNoImg(AdminEventVO vo) {
		
		return adminMovieDAO.eventUpdateNoImg(vo);
	}
	
	@Override
	public int CouponInsert(AdminCouponVO vo) {
		
		return adminMovieDAO.CouponInsert(vo);
	}
	@Override
	public List<AdminCouponVO> CouponSelect() {
		
		return adminMovieDAO.CouponSelect();
	}
	@Override
	public int CouponUpdate(AdminCouponVO vo) {
		
		return adminMovieDAO.CouponUpdate(vo);
	}
	@Override
	public AdminCouponVO CouponNumSelect(int num) {
		
		return adminMovieDAO.CouponNumSelect(num);
	}
	
	@Override
	public AdminNoticeVO noticeNumVo(int num) {
		
		return adminMovieDAO.noticeNumVo(num);
	}
	@Override
	public int noticeUpate(AdminNoticeVO vo) {
		// TODO Auto-generated method stub
		return adminMovieDAO.noticeUpate(vo);
	}
	
	@Override
	public List<UserReserveVO> pieChartCount() {
	
		return adminMovieDAO.pieChartCount();
	}
	
	@Override
	public int totalSum() {
		
		return adminMovieDAO.totalSum();
	}
}
