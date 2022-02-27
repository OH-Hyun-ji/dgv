package com.dgv.web.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgv.web.admin.vo.AdminActorVO;
import com.dgv.web.admin.vo.AdminAgeVO;
import com.dgv.web.admin.vo.AdminGenreVO;
import com.dgv.web.admin.vo.AdminGroupVO;
import com.dgv.web.admin.vo.AdminInquiryVO;
import com.dgv.web.admin.vo.AdminNoticeVO;
import com.dgv.web.user.vo.UserInquiryVO;

@Repository
public class AdminMovieDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
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

}
