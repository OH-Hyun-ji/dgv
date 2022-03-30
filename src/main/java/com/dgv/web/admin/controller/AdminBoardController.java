package com.dgv.web.admin.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
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
import com.dgv.web.admin.service.AdminUserService;
import com.dgv.web.admin.vo.AdminCouponVO;
import com.dgv.web.admin.vo.AdminEventVO;
import com.dgv.web.admin.vo.AdminGenreVO;
import com.dgv.web.admin.vo.AdminInquiryVO;
import com.dgv.web.admin.vo.AdminMovieVO;
import com.dgv.web.admin.vo.AdminNoticeVO;
import com.dgv.web.admin.vo.CommonResultDto;
import com.dgv.web.user.service.UserBoardService;
import com.dgv.web.user.service.UserService;
import com.dgv.web.user.vo.UserCouponUseVO;
import com.dgv.web.user.vo.UserDetailVO;
import com.dgv.web.user.vo.UserInquiryVO;
import com.dgv.web.user.vo.UserReserveVO;
import com.dgv.web.user.vo.UserVO;
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
	private AdminUserService adminUserService;

	@Autowired
	private AdminMovieService adminMovieService;

	@Autowired
	private UserBoardService userBoardService;
	
	@Autowired
	private UserService userService;

	private IamportClient api;

	public AdminBoardController() {
		this.api = new IamportClient("0009476751745942",
				"2d858bdbfe3239265e6abec99ce5e3b90509980494c0ea7981c685a19da948c32b5159a584da4a57");
	}

	// excel 변환
	@PostMapping("excelConvert.mdo")
	public void excelConvert(HttpServletResponse response, HttpServletRequest request) throws IOException {
		List<UserReserveVO> paymentList = adminMovieService.SelectReserveInfo();
		DecimalFormat formatter = new DecimalFormat("###,###,###");
		PaymentCancelDetail dd = new PaymentCancelDetail();
		System.out.println("dddd엑셀");
		for (UserReserveVO reserveVo : paymentList) {
			AdminMovieVO movieVo = userBoardService.movieList(reserveVo.getMovie_num());
			reserveVo.setMovie_title(movieVo.getMovie_title());
			String price = formatter.format(reserveVo.getReserve_price());
			reserveVo.setFomatter_price(price);

		}

		Workbook wb = new HSSFWorkbook();// 엑셀 파일 객체 생성
		Sheet sheet = wb.createSheet("결제내역 목록");

		CellStyle style = wb.createCellStyle();// 셀 스타일 생성
		Font font = wb.createFont();// 폰트 스타일 생성

		font.setFontHeight((short) 560); // 글자 크기 왜 적용안돼??
		font.setFontName("맑은 고딕"); // 글씨체
		sheet.setDefaultColumnWidth(30); // sheet 전체 기본 너비설정
		sheet.setDefaultRowHeightInPoints(30); // sheet 전체 기본 너비설정
		// sheet.setColumnWidth(4, 2100); // 특정 cell 설정 => 5번째(e) cell 2100=7.63
		// sheet.setColumnWidth(7, 3400); // 7번째(h) cell 3400=12.63
		Row titleRow = sheet.createRow(0); // 타이틀 행 생성
		int titleColNum = 0;// 첫번째 열이기때문에 0으로

		Cell titleCell = titleRow.createCell(titleColNum); // 첫 번째행의 첫번째 열을 지정
		titleCell.setCellValue("결제 내역 전체 목록");

		Row headRow = sheet.createRow(2);
		int headerCol = 0;

		CellStyle dataStyle = wb.createCellStyle(); // 셀 스타일!

		dataStyle.setBorderRight(BorderStyle.DOUBLE);
		dataStyle.setBorderLeft(BorderStyle.DOUBLE);
		dataStyle.setBorderBottom(BorderStyle.DOUBLE);
		dataStyle.setBorderTop(BorderStyle.DOUBLE);

		Cell headerCell = headRow.createCell(headerCol++);
		headerCell.setCellValue("순번");
		headerCell.setCellStyle(dataStyle);

		headerCell = headRow.createCell(headerCol++);
		headerCell.setCellValue("예매번호");
		headerCell.setCellStyle(dataStyle);

		headerCell = headRow.createCell(headerCol++);
		headerCell.setCellValue("결제고유 ID");
		headerCell.setCellStyle(dataStyle);

		headerCell = headRow.createCell(headerCol++);
		headerCell.setCellValue("회원 ID");
		headerCell.setCellStyle(dataStyle);

		headerCell = headRow.createCell(headerCol++);
		headerCell.setCellValue("영화제목");
		headerCell.setCellStyle(dataStyle);

		headerCell = headRow.createCell(headerCol++);
		headerCell.setCellValue("결제금액");
		headerCell.setCellStyle(dataStyle);

		headerCell = headRow.createCell(headerCol++);
		headerCell.setCellValue("결제 일");
		headerCell.setCellStyle(dataStyle);

		// 데이터 삽입
		int rowNum = 3;
		int cellNum = 0;
		Row dataRow = null; // 반복문으로 돌릴거양
		Cell dataCell = null;

		for (UserReserveVO reserveVo : paymentList) {
			cellNum = 0;
			dataRow = sheet.createRow(rowNum++);

			dataCell = dataRow.createCell(cellNum++); // 열 한줄씩 추가
			dataCell.setCellValue(reserveVo.getReserve_code());
			dataCell.setCellStyle(dataStyle);

			dataCell = dataRow.createCell(cellNum++);
			dataCell.setCellValue(reserveVo.getReserve_merchant_uid());
			dataCell.setCellStyle(dataStyle);

			dataCell = dataRow.createCell(cellNum++);
			dataCell.setCellValue(reserveVo.getReserve_imp_uid());
			dataCell.setCellStyle(dataStyle);

			dataCell = dataRow.createCell(cellNum++);
			dataCell.setCellValue(reserveVo.getUser_id());
			dataCell.setCellStyle(dataStyle);

			dataCell = dataRow.createCell(cellNum++);
			dataCell.setCellValue(reserveVo.getMovie_title());
			dataCell.setCellStyle(dataStyle);

			dataCell = dataRow.createCell(cellNum++);
			dataCell.setCellValue(reserveVo.getFomatter_price());
			dataCell.setCellStyle(dataStyle);

			dataCell = dataRow.createCell(cellNum++);
			dataCell.setCellValue(reserveVo.getReserve_date());
			dataCell.setCellStyle(dataStyle);
		}

		response.setContentType("ms-vnd/excel");
		response.setHeader("Content-Disposition", "attachment;filename=paymentTotal.xls");
		wb.write(response.getOutputStream());

		System.out.println("dddd엑셀121212");
	}

	// 결제내역 관리창으로 이동
	@RequestMapping("/adminpaymentDetails.mdo")
	public String paymentDetails(Model model) {
		List<UserReserveVO> paymentList = adminMovieService.SelectReserveInfo();
		DecimalFormat formatter = new DecimalFormat("###,###,###");
		PaymentCancelDetail dd = new PaymentCancelDetail();

		for (UserReserveVO reserveVo : paymentList) {
			AdminMovieVO movieVo = userBoardService.movieList(reserveVo.getMovie_num());
			reserveVo.setMovie_title(movieVo.getMovie_title());
			String price = formatter.format(reserveVo.getReserve_price());
			reserveVo.setFomatter_price(price);

		}
		model.addAttribute("paymentList", paymentList);
		return "/board/admin_payment_details";
	}

	@PostMapping("/adminpaymentCancel.mdo")
	@ResponseBody
	public CommonResultDto paymentCancel(@RequestBody UserReserveVO reserveVo,AdminCouponVO cVo, UserCouponUseVO cuVo) {
		String merchantUid = null;
		BigDecimal amount = null;
		IamportResponse<Payment> reservePaymentResponse = null;
		IamportResponse<Payment> paymentResponse = null;
		String reserveImpUid = reserveVo.getReserve_imp_uid();
		UserVO userVo = userBoardService.userNumSelect(reserveVo.getUser_id());
		UserDetailVO detailVo = userService.userDetailVo(userVo.getUser_num());
		
		//사용한 쿠폰 정보가 있다면
		if(reserveVo.getCoupon_discount() != 0) {
			//사용한 쿠폰 조회
			cVo.setCoupon_discount(reserveVo.getCoupon_discount()); 
			AdminCouponVO couponVo = userBoardService.couponCancel(cVo);
			cuVo.setUser_id(reserveVo.getUser_id());
			cuVo.setCoupon_num(couponVo.getCoupon_num());
			
			List<UserCouponUseVO> couponUseEnAbleList = userBoardService.couponUseEnAbleList(cuVo);
			int cuCode=0;
			int count =0;
			for(UserCouponUseVO couponUseVo:couponUseEnAbleList ) {
				cuCode = couponUseVo.getCu_code();
				count ++;
				if(count <=1 ) {
					break;
				}
			}
					
			int checkCuCode = userBoardService.couponUseTrue(cuCode);
			if(checkCuCode ==0)
				return CommonResultDto.fail();
		}
		
		int addPoint = 0;
		if(reserveVo.getUse_point()==0) {
			addPoint =0;
		}else {
			addPoint = reserveVo.getUse_point();
		}
		
		int remainPoint = detailVo.getUser_point();
		int totalPoint = addPoint+remainPoint;
		detailVo.setUser_point(totalPoint);
		
		int updatePoint = userBoardService.userPointInsert(detailVo);
			if(updatePoint ==0)
				return CommonResultDto.fail();
//		if(updatePoint!=0) {
//			int resetNum = userBoardService.usePointReset(reserveVo.getReserve_imp_uid());
//				if(resetNum==0)
//					return CommonResultDto.fail();
//		}else {
//			return CommonResultDto.fail();
//		}
		
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

		if (num == 0)
			return CommonResultDto.fail();
		return CommonResultDto.success();
	}

	@RequestMapping("/adminNotice.mdo")
	public String adminNotice(Model model) {

		model.addAttribute("noticeList", adminMovieService.noticeList());
		return "/board/admin_board_notice";
	}

	//공지사항 상세보기
	@RequestMapping("/adminNoticeDetail.mdo")
	public String adminNoticeDetail(@RequestParam("notice_num") int num, Model model) {
		AdminNoticeVO noticeVo = adminMovieService.noticeNumVo(num);
		
		model.addAttribute("noticeVo",noticeVo);
		return "/board/admin_board_noticeDetail";
	}
	
	//공지사항 수정
	@PostMapping("/updateNotice.mdo")
	@ResponseBody
	public CommonResultDto updateNotice(@RequestBody AdminNoticeVO noticeVo) {
		int num = adminMovieService.noticeUpate(noticeVo);
		
		if(num == 0)
			return CommonResultDto.fail();
		return CommonResultDto.success();
	}
	
	// 공지사항 등록창
	@RequestMapping("/adminNoticeRegister.mdo")
	public String adminNoticeRegister() {
		return "/board/admin_board_notice_register";
	}

	@PostMapping("/InsertNotice.mdo")
	@ResponseBody
	public String insertNotice(@RequestBody AdminNoticeVO vo) {

		int num = adminMovieService.insertNotice(vo);
		System.out.println("내용" + vo.getNotice_text());

		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();

		if (num == 0) {
			System.out.println("등록 실패");
			jsonObject.addProperty("msg", "FAIL");
		} else {
			System.out.println("등록 성공!");
			jsonObject.addProperty("msg", "SUCCESS");
		}
		String jsonResult = gson.toJson(jsonObject);
		return jsonResult;
	}
	
	// 공지사항 삭제
	@PostMapping("deleteNotice.mdo")
	@ResponseBody
	public CommonResultDto deleteNotice(@RequestBody AdminNoticeVO vo) {
		
		int num = adminUserService.noticeDelete(vo);
		if (num == 0)
			return CommonResultDto.fail();
		return CommonResultDto.success();
	}
	
	

	@RequestMapping("/adminEnquriy.mdo")
	public String adminEnquriy(Model model) {
		model.addAttribute("inquiryList", adminMovieService.inquiryList());
		return "/board/admin_board_enquriy";
	}

	@RequestMapping("/adminAnswerOk.mdo")
	public String adminAnswer(Model model) {
		model.addAttribute("answerList", adminMovieService.answerList());
		return "/board/admin_board_answerOk";
	}

	// 답변하기 등록창
	@RequestMapping("/answerRegister.mdo")
	public String answerRegister(@RequestParam("dgv_inquiry_code") int code, Model model) {
		UserInquiryVO user = adminMovieService.waitCode(code);
		model.addAttribute("user", user);

		return "/board/admin_board_answer";
	}

	@PostMapping("insertAnswer.mdo")
	@ResponseBody
	public String insertAnswer(@RequestBody AdminInquiryVO vo) {

		int num = adminMovieService.insertAnswer(vo);

		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();

		if (num == 0) {
			System.out.println("등록 실패");
			jsonObject.addProperty("msg", "FAIL");
		} else {
			System.out.println("등록 성공 ");
			adminMovieService.updateStatus(vo.getWait_code());
			System.out.println("status 상태 변경 완료!!");
			jsonObject.addProperty("msg", "SUCCESS");
		}

		String jsonResult = gson.toJson(jsonObject);
		return jsonResult;
	}

	@RequestMapping("/adminChart.mdo")
	public String adminChart(UserReserveVO vo, Model model) {
		// 일별 매출 통계
		int today = 0;
		Calendar cal = Calendar.getInstance();
		String format = "yyyy-MM-dd";
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		List<Integer> dataList = new ArrayList<Integer>();

		System.out.println("//////////////////////////////////////");
		
		int j = 0;
		for (int i = 0; i < 6; i++) {
			cal.add(cal.DATE, j);
			System.out.println(" j : "+j);
			System.out.println("cal : "+cal);
			
			String date = sdf.format(cal.getTime());
			System.out.println("date : "+date);
			Date sqlDate = Date.valueOf(date);
			
			
			
			vo.setRese_date(sqlDate);
			int count = adminMovieService.beforeChartCheck(vo);
				if (count != 0) {
					today = adminMovieService.areaChart(vo);
				} else { //null 막기위해 
					today = 0;
				}
///////////////////////////////////////////////////////////////////////////////////////////	
			if(i != 0){
				j= -1;
			}
			System.out.println("sqlDate" +sqlDate+"i : "+i+"today : "+today);
			dataList.add(i, today);
			j=-1;
		}
		model.addAttribute("dataList", dataList);

		// 영화 장르별 통계
		List<AdminMovieVO> totalMovieList = adminMovieService.BarChartGenreInfo();

		int length =0;
	
		for (AdminMovieVO movieVo : totalMovieList) {
			
			AdminGenreVO genreVo = adminMovieService.genreListInfo(movieVo.getMovie_genre_code());
			movieVo.setMovie_genre_name(genreVo.getMovie_genre_name());
			
		}
		
		

		System.out.println("");

		model.addAttribute("totalMovieList", totalMovieList);

		
		//영화 선호도 통계
		
		List<UserReserveVO> pieChartCount = adminMovieService.pieChartCount();
		List<AdminMovieVO> movieList = adminMovieService.movieList();
		for(UserReserveVO reserveVo : pieChartCount) {
			for(AdminMovieVO movieVo : movieList) {
				if(reserveVo.getMovie_num() == movieVo.getMovie_num()) {
					reserveVo.setMovie_title(movieVo.getMovie_title());
					
				}
			}
		}
		model.addAttribute("pieChartCount",pieChartCount);
		
		return "/movie/admin_movie_chart";
	}

	// 베스트 ...진짜 와나 아나
	@RequestMapping("/adminBest.mdo")
	public String adminBest(Model model) {
		List<UserReserveVO> bestMovieList = adminMovieService.bestMovieList();
		List<UserReserveVO> totalPeopleCount = adminMovieService.totalPeopleCount();
		List<AdminMovieVO> movieList = adminMovieService.movieList();

		for (UserReserveVO bestVo : bestMovieList) {
			for (AdminMovieVO movieVo : movieList) {
				if (bestVo.getMovie_num() == movieVo.getMovie_num()) {
					bestVo.setMovie_title(movieVo.getMovie_title());
					bestVo.setMovie_img(movieVo.getMovie_img());

				}
			}
		}
		for (UserReserveVO bestVo : bestMovieList) {
			for (UserReserveVO peopleVo : totalPeopleCount) {
				if (bestVo.getMovie_num() == peopleVo.getMovie_num()) {
					bestVo.setTotal_people(peopleVo.getTotal_people());
				}
			}
		}
		model.addAttribute("bestMovieList", bestMovieList);
		return "/movie/admin_movie_best";
	}
}
