package com.dgv.web.admin.controller;

import java.awt.print.Book;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dgv.web.admin.config.RequestUtils;
import com.dgv.web.admin.service.AdminMovieService;
import com.dgv.web.admin.service.FileUploadService;
import com.dgv.web.admin.vo.AdminCouponVO;
import com.dgv.web.admin.vo.AdminEventVO;
import com.dgv.web.admin.vo.CommonResultDto;
import com.dgv.web.user.service.UserBoardService;
import com.dgv.web.user.vo.UserCouponUseVO;
import com.dgv.web.user.vo.UserVO;

@Controller
public class AdminEventController {
	
	@Autowired
	private AdminMovieService adminMovieService;

	@Autowired
	private UserBoardService userBoardService;
	
	@Autowired
	private FileUploadService fileUploadService;

	
	
	//이벤트 수정
	@PostMapping("/eventUpdate.mdo")
	@ResponseBody
	public CommonResultDto eventUpdate(@RequestPart("eventVo") AdminEventVO eventVo, @RequestPart MultipartFile imgFile, @RequestPart MultipartFile imgFile1,UserCouponUseVO cuVo) {
		
		if(eventVo.getEvent_img() == null || eventVo.getEvent_text_img() == null) {
			int numResult = adminMovieService.eventUpdateNoImg(eventVo);
			
			if(numResult ==0)
				return CommonResultDto.fail();
			return CommonResultDto.success();
		}else {
			AdminEventVO event = adminMovieService.EventDetailSelect(eventVo.getEvent_code());
			
			final FileUploadService.FileUploadResult fileResult = fileUploadService.fileUpload(imgFile, "event/", eventVo.getEvent_img());
			final FileUploadService.FileUploadResult filrResult1 = fileUploadService.fileUpload(imgFile1, "event/", eventVo.getEvent_text_img());
			if(!fileResult.isSuccess() || !filrResult1.isSuccess())
				return CommonResultDto.fail();
			AdminCouponVO couVo = adminMovieService.CouponNumSelect(eventVo.getCoupon_num());
						
			eventVo.setEvent_img(fileResult.getUrl());
			eventVo.setEvent_text_img(filrResult1.getUrl());	
			eventVo.setReg_id(RequestUtils.getAdminId("adminId"));
			int num = adminMovieService.eventUpdate(eventVo);
			String[] arr = eventVo.getEvent_winner().split(",");
			int count =0;
			for(String winner : arr) {
				cuVo.setUser_id(winner);
				cuVo.setCoupon_num(eventVo.getCoupon_num());
				cuVo.setCu_status(true);
				cuVo.setCoupon_code(couVo.getCoupon_code());
				cuVo.setCoupon_name(couVo.getCoupon_name());
				cuVo.setCoupon_date(couVo.getCoupon_date());
				count = userBoardService.CouponUseInsert(cuVo);	
			}
			if(num == 0 || count != arr.length)
				return CommonResultDto.fail();
			return CommonResultDto.success();
		}
	}
	
	//이벤트 상세페이지
	@RequestMapping("/eventDetail.mdo")
	public String eventUpdate(@RequestParam("event_code") int num, Model model) {
		AdminEventVO eventVo = adminMovieService.EventDetailSelect(num);
		List<UserVO> userList = userBoardService.userIdList();
		List<AdminCouponVO> couponList = adminMovieService.CouponSelect();
		
		model.addAttribute("couponList",couponList);
		model.addAttribute("userList",userList);
		model.addAttribute("eventVo",eventVo);
		return "/board/admin_event_update";
	}
	
	//종료된이벤트
	@RequestMapping("endEventList.mdo")
	public String endEventSelect(Model model) {
		List<AdminEventVO> eventList = adminMovieService.endEventSelect();
		for(AdminEventVO eventVo : eventList) {
			adminMovieService.eventCheck(eventVo);
			System.out.println("상태 ㅣ: "+ eventVo.getEvent_check());
			
		}
		model.addAttribute("eventList",eventList);
		return "/board/admin_event_list";
	}
	//진행중인 이벤트 
	@RequestMapping("continueList.mdo")
	public String continueList(Model model) {
		List<AdminEventVO> eventList = adminMovieService.continueEventSelect();
		model.addAttribute("eventList",eventList);
		return "/board/admin_event_list";
	}
	
	//전체 이벤트 목록 
	@RequestMapping("/adminEventList.mdo")
	public String adminEventList(Model model) {
		List<AdminEventVO> eventList = adminMovieService.EventSelect();
		model.addAttribute("eventList",eventList);
		
		return "/board/admin_event_list";
	}
	
	@RequestMapping("/eventRegisterPage.mdo")
	public String eventRegisterPage() {
		return "/board/admin_event_register";
	}
	
	@PostMapping("/changeEventStatus.mdo")
	@ResponseBody
	public CommonResultDto changeEventStatus(@RequestBody AdminEventVO vo) {
		
		int num = adminMovieService.eventAdminUpdate(vo);
		
		
		if(num ==0 )
			return CommonResultDto.fail();
		return CommonResultDto.success();
	}
	
	@PostMapping("/insertEvent.mdo")
	@ResponseBody
	public CommonResultDto insertEvent(@RequestPart("eventVo")AdminEventVO eventVo,@RequestPart MultipartFile imgFile ,@RequestPart MultipartFile imgFile1) {
		final FileUploadService.FileUploadResult fileResult = fileUploadService.fileUpload(imgFile, "event/", eventVo.getEvent_img());
		final FileUploadService.FileUploadResult fileResult1 = fileUploadService.fileUpload(imgFile1, "event/", eventVo.getEvent_text_img());
		
		eventVo.setEvent_img(fileResult.getUrl());
		eventVo.setEvent_text_img(fileResult1.getUrl());
		
		if(!fileResult.isSuccess() || !fileResult1.isSuccess())
			return CommonResultDto.fail();
		
		
		int num = adminMovieService.EventInsert(eventVo);
		
		if(num==0)
			return CommonResultDto.fail();
		return CommonResultDto.success();
					
		
	}
	
	
}
