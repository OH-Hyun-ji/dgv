package com.dgv.web.admin.common;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class HotelServiceImpl implements HotelService {

	private final HotelDAO hotelDAO;

	
	@Override
	public List<HotelVO> hotelSelect() {
		return hotelDAO.hotelSelect();
	}

	@Override
	public List<HotelVO> hotelSelectStatus() {
		return hotelDAO.hotelSelectStatus();
	}

	@Override
	public List<HotelVO> hotelDay() {
		
		return hotelDAO.hotelDay();
	}
	
	
}
