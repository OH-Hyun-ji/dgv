package com.dgv.web.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dgv.web.admin.dao.AdminMovieDAO;
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
import com.dgv.web.admin.vo.AdminTheaterVO;
import com.dgv.web.user.vo.UserInquiryVO;

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

	

	

}
