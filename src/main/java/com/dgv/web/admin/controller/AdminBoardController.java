package com.dgv.web.admin.controller;


import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.dgv.web.admin.service.AdminMovieService;
import com.dgv.web.admin.vo.AdminInquiryVO;
import com.dgv.web.admin.vo.AdminMovieVO;
import com.dgv.web.admin.vo.AdminNoticeVO;
import com.dgv.web.admin.vo.CommonResultDto;
import com.dgv.web.user.service.UserBoardService;
import com.dgv.web.user.vo.UserInquiryVO;
import com.dgv.web.user.vo.UserReserveVO;
import com.fasterxml.jackson.core.format.DataFormatDetector;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.siot.IamportRestClient.response.PaymentCancelDetail;
import com.sun.tools.javac.util.Convert;


@Controller
public class AdminBoardController {
	
	@Autowired
	private AdminMovieService adminMovieService;
	
	@Autowired
	private UserBoardService userBoardService;
	
	private IamportClient api;

	public AdminBoardController() {
		this.api = new IamportClient("0009476751745942", "2d858bdbfe3239265e6abec99ce5e3b90509980494c0ea7981c685a19da948c32b5159a584da4a57");
	}
	
	//결제내역 관리창으로 이동 
	@RequestMapping("/adminpaymentDetails.mdo")
	public String paymentDetails(Model model) {
		List<UserReserveVO> paymentList = adminMovieService.SelectReserveInfo();
			DecimalFormat formatter = new DecimalFormat("###,###,###");
			PaymentCancelDetail dd =new PaymentCancelDetail();
			
			for(UserReserveVO reserveVo : paymentList) {
				AdminMovieVO movieVo = userBoardService.movieList(reserveVo.getMovie_num());
				reserveVo.setMovie_title(movieVo.getMovie_title());
				String price = formatter.format(reserveVo.getReserve_price());
				reserveVo.setFomatter_price(price);
				
			}
		model.addAttribute("paymentList",paymentList);
		return "/board/admin_payment_details";
	}
	
	@PostMapping("/adminpaymentCancel.mdo")
	@ResponseBody
	public CommonResultDto paymentCancel(@RequestBody UserReserveVO reserveVo) {
		String merchantUid = null;
		BigDecimal amount = null;
		IamportResponse<Payment> reservePaymentResponse = null;
		IamportResponse<Payment> paymentResponse = null;
		String reserveImpUid = reserveVo.getReserve_imp_uid();
		
		try {
			reservePaymentResponse = api.paymentByImpUid(reserveImpUid);
			Payment reservePayment = reservePaymentResponse.getResponse();
			merchantUid = reservePayment.getMerchantUid();
			amount = reservePayment.getAmount();

			CancelData cancelData = new CancelData(merchantUid, false, amount);
		
			paymentResponse = api.cancelPaymentByImpUid(cancelData);

			if (paymentResponse != null) { // 이미 취소된 거래건은 response == null
				Payment payment = paymentResponse.getResponse();
//				
//				if (payment != null) {
//					
//				}
			}

		} catch (IamportResponseException e) {
			int exceptionHttpStatusCode = e.getHttpStatusCode();
			if (HttpStatus.UNAUTHORIZED.value() == exceptionHttpStatusCode) {
				// 유효하지 않은 인증
			} else if (HttpStatus.INTERNAL_SERVER_ERROR.value() == exceptionHttpStatusCode) {
				// 아임포트 서버 에러
			}
		} catch (IOException e) {
			
		}
		
		int num = adminMovieService.updateReserveStatus(reserveVo);
		
		
		if(num == 0) 
			return CommonResultDto.fail();
		return CommonResultDto.success();
	}
	
	@RequestMapping("/adminNotice.mdo")
	public String adminNotice(Model model) {
		
		model.addAttribute("noticeList", adminMovieService.noticeList());
		return "/board/admin_board_notice";
	}
	//공지사항 등록창 
		@RequestMapping("/adminNoticeRegister.mdo")
		public String adminNoticeRegister() {
			return "/board/admin_board_notice_register";
		}
		
		@PostMapping("/InsertNotice.mdo")
		@ResponseBody
		public String insertNotice(@RequestBody AdminNoticeVO vo) {
			
			int num = adminMovieService.insertNotice(vo);
			System.out.println("내용" +vo.getNotice_text());
			
			Gson gson = new Gson();
			JsonObject jsonObject =new JsonObject();
			
			if(num ==0) {
				System.out.println("등록 실패");
				jsonObject.addProperty("msg", "FAIL");
			}else {
				System.out.println("등록 성공!");
				jsonObject.addProperty("msg", "SUCCESS");
			}
			String jsonResult = gson.toJson(jsonObject);
			return jsonResult;
		}
		
	
	
	@RequestMapping("/adminEnquriy.mdo")
	public String adminEnquriy(Model model) {
		model.addAttribute("inquiryList",adminMovieService.inquiryList());
		return "/board/admin_board_enquriy";
	}
	
	@RequestMapping("/adminAnswerOk.mdo")
	public String adminAnswer(Model model) {
		model.addAttribute("answerList",adminMovieService.answerList());
		return "/board/admin_board_answerOk";
	}
	//답변하기 등록창 
	@RequestMapping("/answerRegister.mdo")
	public String answerRegister(@RequestParam("dgv_inquiry_code") int code ,Model model) {
		UserInquiryVO user = adminMovieService.waitCode(code);
		model.addAttribute("user",user);
	
		return "/board/admin_board_answer";
	}
	@PostMapping("insertAnswer.mdo")
	@ResponseBody
	public String insertAnswer(@RequestBody AdminInquiryVO vo) {
		
		int num =adminMovieService.insertAnswer(vo);
		
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();
		
		if(num==0) {
			System.out.println("등록 실패");
			jsonObject.addProperty("msg", "FAIL");
		}else {
			System.out.println("등록 성공 ");
			adminMovieService.updateStatus(vo.getWait_code());
			System.out.println("status 상태 변경 완료!!");
			jsonObject.addProperty("msg", "SUCCESS");
		}
		
		String jsonResult = gson.toJson(jsonObject);
		return jsonResult;
	}
	
	@RequestMapping("/adminChart.mdo")
	public String adminChart(UserReserveVO vo,Model model) {
		// 일별 매출 통계
		Calendar cal = Calendar.getInstance();
		String format= "yyyy-MM-dd";
		SimpleDateFormat sdf = new SimpleDateFormat(format);
	
		String date = sdf.format(cal.getTime());
		Date d= Date.valueOf(date);
		System.out.println(d);	
		vo.setReserve_date(d);
		int today1 = adminMovieService.areaChart(vo);
		model.addAttribute("today1",today1);
		
		cal.add(cal.DATE, -1);
		String date2 = sdf.format(cal.getTime());
		Date d2 =Date.valueOf(date2);
		System.out.println(d2);
		vo.setReserve_date(d2);
		int today2 = adminMovieService.areaChart(vo);
		model.addAttribute("today2",today2);
		
		cal.add(cal.DATE, -1);
		String date3 = sdf.format(cal.getTime());
		Date d3 =Date.valueOf(date3);
		System.out.println(d3);
		vo.setReserve_date(d3);
		int today3 = adminMovieService.areaChart(vo);
		model.addAttribute("today3",today3);
		
		cal.add(cal.DATE, -1);
		String date4 = sdf.format(cal.getTime());
		Date d4 =Date.valueOf(date4);
		System.out.println(d4);
		vo.setReserve_date(d4);
		int today4 = adminMovieService.areaChart(vo);
		model.addAttribute("today4",today4);
		
//		cal.add(cal.DATE, -1);
//		String date5 = sdf.format(cal.getTime());
//		Date d5 =Date.valueOf(date5);
//		System.out.println(d5);
//		vo.setReserve_date(d5);
//		int today5 = adminMovieService.areaChart(vo);
//		model.addAttribute("today5",today5);
		
//		cal.add(cal.DATE, -1);
//		String date6 = sdf.format(cal.getTime());
//		Date d6 =Date.valueOf(date6);
//		System.out.println(d6);
//		vo.setReserve_date(d6);
//		int today6 = adminMovieService.areaChart(vo);
//		model.addAttribute("today6",today6);
//////////////////////////////////////////////////////////////////////
		//월별 매출 통계
		
		Calendar month =Calendar.getInstance();
		String fot = "yyyy-MM-dd";
		SimpleDateFormat sd = new SimpleDateFormat(fot);
		
		String mon1 = sd.format(month.getTime());
		Date m1 =Date.valueOf(mon1);
		System.out.println(m1);
		vo.setStart_day(d);
	//	int month1 = adminMovieService.areaChart(vo);
		System.out.println(m1);
	//	model.addAttribute("month1",month1);
		
		month.add(month.MONTH, -1);
		String mon2 = sd.format(month.getTime());
		Date m2 =Date.valueOf(mon2);
		System.out.println("ddd :"+ m2);
		vo.setReserve_date(m2);
		month.add(month.DATE, 30);
	//	int month2 = adminMovieService.areaChart(vo);
	//	model.addAttribute("month2",month2);
		System.out.println("ddd k :"+ m2);
		
		
		
		return "/movie/admin_movie_chart";
	}
	
	@RequestMapping("/adminBest.mdo")
	public String adminBest() {
		return "/movie/admin_movie_best";
	}
}
