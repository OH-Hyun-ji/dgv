package com.dgv.web.admin.common;

import java.util.List;

public interface HotelService {

	List<HotelVO> hotelSelect();
	
	List<HotelVO> hotelSelectStatus();

	List<HotelVO> hotelDay();
}
