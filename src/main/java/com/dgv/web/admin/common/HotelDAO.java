package com.dgv.web.admin.common;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HotelDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
		
	public List<HotelVO> hotelSelect(){
		return sqlSessionTemplate.selectList("hotelDAO.hotelSelect");
	}
	
	public List<HotelVO> hotelSelectStatus(){
		return sqlSessionTemplate.selectList("hotelDAO.hotelSelectStatus");
	}
	
	public List<HotelVO> hotelDay(){
		return sqlSessionTemplate.selectList("hotelDAO.hotelDay");
	}

}