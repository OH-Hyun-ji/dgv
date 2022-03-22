package com.dgv.web.admin.controller;

import java.text.DecimalFormat;
import java.util.List;
import java.util.Random;

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
import com.dgv.web.admin.vo.CommonResultDto;

@Controller
public class AdminCouponController {
	
	@Autowired
	private FileUploadService fileUploadService;
	
	@Autowired
	private AdminMovieService adminMovieService;
	

	@RequestMapping("/adminCoupon.mdo")
	public String adminCoupon(Model model) {
		List<AdminCouponVO> couponList = adminMovieService.CouponSelect();
		DecimalFormat formatter = new DecimalFormat("###,###,###");
		for(AdminCouponVO couponVo : couponList) {
			String fomat = formatter.format(couponVo.getCoupon_discount());
			couponVo.setFomatter_discount(fomat);
			
		}
		model.addAttribute("couponList",couponList);
		return "/board/admin_coupon_list";
	}
	
	@RequestMapping("/couponRegister.mdo")
	public String couponRegister() {
		return  "/board/admin_coupon_registerPage";
	}
	
	//쿠폰 등록
	@PostMapping("/insertCoupon.mdo")
	@ResponseBody
	public CommonResultDto insertCoupon(@RequestPart("couponVo") AdminCouponVO couponVo, @RequestPart MultipartFile imgFile) {
		final FileUploadService.FileUploadResult fileResult = fileUploadService.fileUpload(imgFile, "coupon/", couponVo.getCoupon_img());
		
		if(!fileResult.isSuccess())
			return CommonResultDto.fail();
		
		couponVo.setCoupon_img(fileResult.getUrl());
		couponVo.setReg_id(RequestUtils.getAdminId("adminId"));
		
		//쿠폰코드 난수 
		int min =10000000;
		int max =100000000;
		Random random = new  Random();
		int couponCode = random.nextInt(max)+min;
		
		couponVo.setCoupon_code(couponCode);
		
		int num = adminMovieService.CouponInsert(couponVo);
		
		if(num==0)
			return CommonResultDto.fail();
		return CommonResultDto.success();

	}
	
	//쿠폰 상세 
	@RequestMapping("couponDetail.mdo")
	public String couponDetail(@RequestParam("coupon_num") int num, Model model) {
		AdminCouponVO couponVo = adminMovieService.CouponNumSelect(num);
		System.out.println("???");
		model.addAttribute("couponVo",couponVo);
		return "/board/admin_coupon_detail";
	}
	
	// 쿠폰 수정 
	@PostMapping("/CouponUpdate.mdo")
	@ResponseBody
	public CommonResultDto CouponUpdate(@RequestPart("couponVo") AdminCouponVO couponVo,@RequestPart MultipartFile imgFile) {
		final FileUploadService.FileUploadResult fileResult = fileUploadService.fileUpload(imgFile, "coupon/", couponVo.getCoupon_img());
			if(!fileResult.isSuccess())
				return CommonResultDto.fail();
		
		couponVo.setCoupon_img(fileResult.getUrl());
		String adminId = RequestUtils.getAdminId("adminId");
		couponVo.setReg_id(adminId);
		
		int num =adminMovieService.CouponUpdate(couponVo);
		
		if(num ==0)
			return CommonResultDto.fail();
		return CommonResultDto.success();
		
	}
	
}
