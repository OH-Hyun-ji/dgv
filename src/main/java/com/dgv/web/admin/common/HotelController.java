package com.dgv.web.admin.common;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

@Controller
public class HotelController {
	@Autowired
	private HotelService hotelService;

	@RequestMapping("/hotel.mdo")
	public String hotel(Model model,DateVO vo) {
		
		Calendar cal = Calendar.getInstance();
		DateVO calendarData;
		//검색 날짜
		if(vo.getDate().equals("")&&vo.getMonth().equals("")){
			vo= new DateVO(String.valueOf(cal.get(Calendar.YEAR)),String.valueOf(cal.get(Calendar.MONTH)),String.valueOf(cal.get(Calendar.DATE)),null);
		}
		//검색 날짜 end

		Map<String, Integer> today_info =  vo.today_info(vo);
		List<DateVO> dateList = new ArrayList<DateVO>();
		
		//실질적인 달력 데이터 리스트에 데이터 삽입 시작.
		//일단 시작 인덱스까지 아무것도 없는 데이터 삽입
		for(int i=1; i<today_info.get("start"); i++){
			calendarData= new DateVO(null, null, null, null);
			dateList.add(calendarData);
		}
		
		//날짜 삽입
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			if(i==today_info.get("today")){
				calendarData= new DateVO(String.valueOf(vo.getYear()), String.valueOf(vo.getMonth()), String.valueOf(i), "today");
			}else{
				calendarData= new DateVO(String.valueOf(vo.getYear()), String.valueOf(vo.getMonth()), String.valueOf(i), "normal_date");
			}
			dateList.add(calendarData);
		}

		//달력 빈곳 빈 데이터로 삽입
		int index = 7-dateList.size()%7;
		
		if(dateList.size()%7!=0){
			
			for (int i = 0; i < index; i++) {
				calendarData= new DateVO(null, null, null, null);
				dateList.add(calendarData);
			}
		}
	
		
		
		////////////////////////////////////////////////////////////
		List<HotelVO> hotelDay =hotelService.hotelDay();
		for(DateVO dateV : dateList) {
			for(HotelVO hotel : hotelDay) {
				if(dateV.date.equals(hotel.getDay())) {
				//	List<DateVO> list = new ArrayList<DateVO>();
					dateV.setHotelDay(hotel.getDay());
					dateV.setHotelName(hotel.getHotel_name());
					dateV.setHotelCode(hotel.getHotel_code());
			
			
				}
				
			}
		
			
		}
		

		System.out.println(dateList);
		model.addAttribute("hotelDay",hotelDay);
		//배열에 담음
		model.addAttribute("dateList", dateList);		//날짜 데이터 배열
		model.addAttribute("today_info", today_info);
		
		
		

		return "/default/hotel";
	}
}
