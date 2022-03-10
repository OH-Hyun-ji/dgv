package com.dgv.web.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
import com.dgv.web.user.vo.UserInquiryVO;
import com.dgv.web.user.vo.UserMapVO;
import com.dgv.web.user.vo.UserMoiveImgVO;

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
}
