package com.dgv.web.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgv.web.admin.vo.AdminCityVO;
import com.dgv.web.admin.vo.AdminNoticeVO;
import com.dgv.web.admin.vo.AdminRegionVO;
import com.dgv.web.user.vo.UserInquiryVO;
import com.dgv.web.user.vo.UserMapVO;

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
}
