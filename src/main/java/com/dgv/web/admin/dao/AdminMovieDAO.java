package com.dgv.web.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgv.web.admin.vo.AdminActorVO;
import com.dgv.web.admin.vo.AdminAgeVO;
import com.dgv.web.admin.vo.AdminGenreVO;
import com.dgv.web.admin.vo.AdminGroupVO;

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
}
