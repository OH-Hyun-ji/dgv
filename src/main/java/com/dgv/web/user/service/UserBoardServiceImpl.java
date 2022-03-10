package com.dgv.web.user.service;

import java.util.List;

import org.springframework.stereotype.Service;

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
import com.dgv.web.user.dao.UserBoardDAO;
import com.dgv.web.user.vo.UserInquiryVO;
import com.dgv.web.user.vo.UserMapVO;
import com.dgv.web.user.vo.UserMoiveImgVO;

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
		return null;
	}

	


	

}
