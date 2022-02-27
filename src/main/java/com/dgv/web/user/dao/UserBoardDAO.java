package com.dgv.web.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgv.web.admin.vo.AdminNoticeVO;
import com.dgv.web.user.vo.UserInquiryVO;

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
	
}
