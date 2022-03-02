package com.dgv.web.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.dgv.web.admin.vo.AdminCityVO;
import com.dgv.web.admin.vo.AdminRegionVO;


@Repository
public class AdminTheaterDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	public List<AdminCityVO> adminCityList(){
		System.out.println("TEST  8 :");
		
		return sqlSessionTemplate.selectList("AdminTheaterDAO.theaterCity");	
		
	}
	
	public List<AdminRegionVO> adminRegionList(){
		return sqlSessionTemplate.selectList("AdminTheaterDAO.theaterRegion");	
		
	}
	
	public List<AdminCityVO> adminTotalList() {
		return sqlSessionTemplate.selectList("AdminTheaterDAO.totalTheater");
	}
	
	public List<AdminRegionVO> choiceRegion(int num){
		return sqlSessionTemplate.selectList("AdminTheaterDAO.choiceRegion", num);
	}
	

}
