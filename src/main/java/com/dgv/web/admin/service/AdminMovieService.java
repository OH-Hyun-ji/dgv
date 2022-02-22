package com.dgv.web.admin.service;

import java.util.List;

import com.dgv.web.admin.vo.AdminActorVO;
import com.dgv.web.admin.vo.AdminAgeVO;
import com.dgv.web.admin.vo.AdminGenreVO;
import com.dgv.web.admin.vo.AdminGroupVO;

public interface AdminMovieService {

	//장르 등록 
	int insertGenre(AdminGenreVO vo);
	
	//연령 등록
	int insertAge(AdminAgeVO vo);
	
	//그룹 등록
	int insertGroup(AdminGroupVO vo);
	
	//배우등록
	int insertActor(AdminActorVO vo);
	
	List<AdminGenreVO> genreList();
	
	List<AdminAgeVO> ageList();
	
	List<AdminGroupVO> groupList();
	
	List<AdminActorVO> actorList();
	
	
}
