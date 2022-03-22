package com.dgv.web.user.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dgv.web.admin.config.RequestUtils;
import com.dgv.web.admin.service.AdminMovieService;
import com.dgv.web.admin.service.AdminUserService;
import com.dgv.web.admin.vo.AdminEventVO;
import com.dgv.web.admin.vo.AdminParUserEventVO;
import com.dgv.web.admin.vo.CommonResultDto;
import com.dgv.web.user.service.UserBoardService;
import com.dgv.web.user.service.UserService;
import com.dgv.web.user.vo.UserVO;
import com.fasterxml.jackson.annotation.JsonCreator.Mode;

@Controller
public class UserEventController {

	@Autowired
	private UserBoardService userBoardService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private AdminMovieService adminMovieService;
	
	@Autowired
	private AdminUserService adminUserService;

	//이벤트 참여 
	@PostMapping("/userParEvent.do")
	@ResponseBody
	public CommonResultDto userParEvent(@RequestBody AdminParUserEventVO parEventVo) {
		String userId = RequestUtils.getUserId("userID");
		UserVO userVo = userService.MyUserData(userId);	
		
		parEventVo.setUser_num(userVo.getUser_num());	
		List<AdminParUserEventVO> parList = userBoardService.parUserEventSelec();
		
		int count = userBoardService.parEventCheck(parEventVo);
		if(count ==0) {
			int num = userBoardService.parUserEventInsert(parEventVo);
			
			if(num ==0)
				return CommonResultDto.fail();
			return CommonResultDto.success();
			
		}else {
			return CommonResultDto.exist();
		}		
	}
	
	//이벤트 당첨자 발표 
	@RequestMapping("eventWinnerPage.do")
	public String eventWinnerPage(@RequestParam("event_code")int num , Model model) {
		List<AdminEventVO> endEventList = adminMovieService.endEventSelect();
		ArrayList<String> winnerList = new ArrayList<String>();
		String winner ="";
//		String[] winner;
		for(AdminEventVO eventVo : endEventList) {
			if(eventVo.getEvent_winner().length() >0 && eventVo.getEvent_code()==num) {	
//				winner = eventVo.getEvent_winner().split(",");
//				for(int i=0;i<winner.length;i++) {
//					winnerList.add(i, winner[i]);				
//				}
				winner =eventVo.getEvent_winner();
										
			}
		}
		model.addAttribute("winnerList", winner);
		return "/event/event_winner_view"; 
	}
	
	//이벤트 상세보기
	@RequestMapping("eventDetail.do")
	public String event(@RequestParam("event_code") int num,Model model) {
		AdminEventVO eventVo = adminMovieService.EventDetailSelect(num);
		model.addAttribute("eventVo",eventVo);
		return "/event/event_detail";
	}
	
	@RequestMapping("/event.do")
	public String event(Model model) {
		List<AdminEventVO> eventList =adminMovieService.continueEventSelect();
		model.addAttribute("eventList", eventList);
		return "/event/user_event";
	}

	@RequestMapping("/eventWinner.do")
	public String eventWinner(Model model) {
		List<AdminEventVO> endEventList = adminMovieService.endEventSelect();
		List<AdminEventVO> winnerList = new ArrayList<AdminEventVO>();
		for(AdminEventVO eventVo : endEventList) {
			if(eventVo.getEvent_winner().length()>0) {
				winnerList.add(eventVo);
			}
		}
		model.addAttribute("winnerList",winnerList);
		return "/event/event_winner";
	}

	@RequestMapping("/eventEnd.do")
	public String eventEnd(Model model) {
		List<AdminEventVO> eventList = adminMovieService.endEventSelect();
		for(AdminEventVO eventVo : eventList) {
			adminMovieService.eventCheck(eventVo);
			System.out.println("상태 ㅣ: "+ eventVo.getEvent_check());
			
		}
		model.addAttribute("eventList",eventList);
		return "/event/event_end";
	}

}