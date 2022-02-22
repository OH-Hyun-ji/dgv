package com.dgv.web.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dgv.web.admin.dao.AdminMovieDAO;
import com.dgv.web.admin.vo.AdminActorVO;
import com.dgv.web.admin.vo.AdminAgeVO;
import com.dgv.web.admin.vo.AdminGenreVO;
import com.dgv.web.admin.vo.AdminGroupVO;

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


	

}
