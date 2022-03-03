package com.dgv.web.admin.controller;

import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dgv.web.admin.common.AwsS3;
import com.dgv.web.admin.config.AWSConfiguration;
import com.dgv.web.admin.service.AdminUserService;
import com.dgv.web.admin.service.FileUploadService;
import com.dgv.web.admin.vo.AdminRankVO;
import com.dgv.web.admin.vo.CommonResultDto;

@Controller
public class AdminUserRankController {

	@Autowired
	private AwsS3 awsS3;
	
	@Autowired
	private FileUploadService fileUploadService;
	
	@Autowired
	private AdminUserService adminUserService;
	
	@RequestMapping("/userRank.mdo")
	public String userRank(AdminRankVO vo,Model model) {
		model.addAttribute("rankList", adminUserService.rankList());
		model.addAttribute("rankListCount",adminUserService.rankList().size());		
		return "/user/admin_user_rank";
	}
	
	@RequestMapping("/userRankRegister.mdo")
	public String userRankRegister() {
		return "/user/admin_user_rank_register";
	}
	
	@PostMapping("/insertRank.mdo")
	@ResponseBody
	public CommonResultDto insertRank(@RequestPart("rankVo") AdminRankVO vo, @RequestPart("imgFile") MultipartFile imgFile, HttpSession session) {
		final UUID uuid = UUID.randomUUID();
		final String url = "rank/"+uuid.toString()+vo.getRank_img();
		final String path = AWSConfiguration.S3_URL;
		vo.setRank_img(path+url);
		vo.setReg_id((String) session.getAttribute("adminID"));
		final int num = adminUserService.rankInsert(vo);
		
		if(num == 0) {
			return CommonResultDto.fail();
		}else {
			try {
				InputStream is = imgFile.getInputStream();
				String contentType = imgFile.getContentType();
				long contentLength = imgFile.getSize();
				awsS3.upload(is, path, contentType, contentLength);
				System.out.println("등록 성공 ");
			}catch(Exception e) {
				e.printStackTrace();
			}
			return CommonResultDto.success();
		}
		
	}
}
