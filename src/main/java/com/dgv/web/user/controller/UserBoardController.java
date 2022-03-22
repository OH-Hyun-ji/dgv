package com.dgv.web.user.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;
import java.io.Writer;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.dgv.web.admin.config.RequestUtils;
import com.dgv.web.admin.service.FileUploadService;
import com.dgv.web.admin.vo.AdminInquiryVO;
import com.dgv.web.admin.vo.AdminNoticeVO;
import com.dgv.web.admin.vo.CommonResultDto;
import com.dgv.web.commons.interceptor.TimeCalc;
import com.dgv.web.user.service.UserBoardService;
import com.dgv.web.user.service.UserService;
import com.dgv.web.user.vo.Criteria;
import com.dgv.web.user.vo.CriteriaBoard;
import com.dgv.web.user.vo.PageBoardVO;
import com.dgv.web.user.vo.PageVO;
import com.dgv.web.user.vo.SearchVO;
import com.dgv.web.user.vo.UserCommentVO;
import com.dgv.web.user.vo.UserCommunityVO;
import com.dgv.web.user.vo.UserDetailVO;
import com.dgv.web.user.vo.UserFAQKindVO;
import com.dgv.web.user.vo.UserFAQVO;
import com.dgv.web.user.vo.UserInquiryVO;
import com.dgv.web.user.vo.UserVO;
import com.google.gson.Gson;

@Controller
public class UserBoardController {

	@Autowired
	private UserBoardService userBoardService;
	
	@Autowired
	private FileUploadService fileUploadService;

	@Autowired
	private UserService userService;
	
	@RequestMapping("/review.do")
	public String userReview() {
		return "/board/user_board_review";
	}
	
	/////속닥속닥 등록 페이지 ///////
	@RequestMapping("/sokdakRegister.do")
	public String sokdakRegister() {
		
		return "/board/user_sokdak_register";
	}
	@PostMapping("/communityRegister.do")
	@ResponseBody
	public CommonResultDto communityRegister(@RequestPart("vo") UserCommunityVO communityVo,@RequestPart("imgFile") MultipartFile imgFile) {
		
		final FileUploadService.FileUploadResult fileResult = fileUploadService.fileUpload(imgFile, "community/", communityVo.getCommuity_img());
		if(!fileResult.isSuccess())
			return CommonResultDto.fail();
		
		communityVo.setCommuity_img(fileResult.getUrl());
		communityVo.setUser_id(RequestUtils.getUserId("userID"));
		int num = userBoardService.communityInsert(communityVo);
		
		if(num==0)
			return CommonResultDto.fail();
		return CommonResultDto.success();
	}
	
	@RequestMapping("/board.do")
	public String userBoard(Model model,@ModelAttribute CriteriaBoard cri)throws Exception {
		
//		SearchVO search = new SearchVO();
//		search.setSearchType(searchType);
//		search.setKeyword(keyword);
//http://localhost/board.do?pageNum=1&amount=5&searchType=community_title&keyword=%EB%82%98%EB%82%98
		
		
		//전체 게시글수 
		int listCnt = userBoardService.getCommunityCnt();
		PageBoardVO pageMake = new PageBoardVO(listCnt, cri);
		
		List<UserCommunityVO> communityList = userBoardService.communitySelect(cri);
		
		for(UserCommunityVO comVo :communityList) {
			UserVO userVo = userBoardService.communityUserInfo(comVo.getUser_id());
			for(UserDetailVO detailVo :userVo.getDetailVO()) {
				comVo.setUser_img(detailVo.getUser_img());
			}
		}
		model.addAttribute("pageMake",pageMake);
		model.addAttribute("communityList",communityList);
		
		
		//시간시간//
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ISO_LOCAL_TIME;
		String formatted = now.format(formatter);
		for(UserCommunityVO communityVo:communityList) {
			long writeTime = TimeCalc.timeMillis(communityVo.getWrite_time());
			long writeCurrent = TimeCalc.timeMillis(formatted);
			communityVo.setWrite_time(TimeCalc.compareTime(writeTime, writeCurrent));
		}
		

		
		return "/board/user_board_community";
	}
	
	@RequestMapping("/communityDetail.do")
	public String communityDetail(@RequestParam("community_code")int communityCode, Model model) {
		UserCommunityVO communityVo = userBoardService.communityChoiceNum(communityCode);
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ISO_LOCAL_TIME;
		String formatted = now.format(formatter);
		userBoardService.communityCountView(communityCode);
		long writeTime=TimeCalc.timeMillis(communityVo.getWrite_time());
		long currentTime =TimeCalc.timeMillis(formatted);
		communityVo.setWrite_time(TimeCalc.compareTime(writeTime, currentTime));

		List<UserCommentVO> commentList =  userBoardService.commentSelect(communityCode);
			for(UserCommentVO comment:commentList ) {
				UserVO userVo = userBoardService.userNumSelect(comment.getUser_id());
				UserDetailVO detailVo = userService.userDetailVo(userVo.getUser_num());
				comment.setUser_rank(detailVo.getUser_rank());
				comment.setUser_img(detailVo.getUser_img());	
			}
			
		UserVO userVo = userBoardService.communityUserInfo(communityVo.getUser_id());
			for(UserDetailVO detailVo : userVo.getDetailVO()) {
				communityVo.setUser_img(detailVo.getUser_img());
				communityVo.setRank_name(detailVo.getUser_rank());
			}
		model.addAttribute("commentList",commentList);
		model.addAttribute("communityVo",communityVo);
		
		return "/board/user_community_detail";
	}
	
	@PostMapping("/commentInsert.do")
	@ResponseBody
	public CommonResultDto commentInsert(@RequestBody UserCommentVO commentVo,Model model) {
		
		String userId = RequestUtils.getUserId("userID");
		commentVo.setUser_id(userId);
		
		int num = userBoardService.CommentInsert(commentVo);
				
		List<UserCommentVO> commentList = userBoardService.commentSelect(commentVo.getCommunity_code());
		for(UserCommentVO comment : commentList) {
			UserVO userVo = userBoardService.userNumSelect(comment.getUser_id());
			UserDetailVO detailVo =userService.userDetailVo(userVo.getUser_num());
			comment.setUser_rank(detailVo.getUser_rank());
			comment.setUser_img(detailVo.getUser_img());
		}
		
		
		if(num==0)
			return CommonResultDto.fail();
		return CommonResultDto.success();	
	}
	
	
	/////고객센터 //////
	@RequestMapping("/serviceCenter.do")
	public String serviceCenter(Model model) {
		List<AdminNoticeVO> noticeList = userBoardService.noticeList();		
		String userId = RequestUtils.getUserId("userID");
		List<UserInquiryVO> inquiryList = userBoardService.userQnaOneList(userId);
		
		model.addAttribute("inquiryList",inquiryList);
		model.addAttribute("noticeList",noticeList);
		return "/board/user_service_center";
	}
	
	@RequestMapping("/notice.do")
	public String userNotice(Model model) {
		List<AdminNoticeVO> noticeVo = userBoardService.noticeList();
		model.addAttribute("noticeList",  noticeVo);
		return "/board/user_board_notice";
	}
	
	@RequestMapping("/noticeDetail.do")
	public String noticeDetail(@RequestParam("notice_num") int num,Model model) {
		AdminNoticeVO noticeVo = userBoardService.noticeView(num);
		userBoardService.viewCount(num);
		model.addAttribute("noticeVo",noticeVo);
		
		return "/board/user_notice_detail";
	}
	
	@RequestMapping("/oftenQna.do")
	public String oftenQna() {
		
		return "/board/user_often_qna";	
	}
	
	@RequestMapping("/oftenAnswer.do")
	public String oftenAnswer(@RequestParam("faq_num")int num,Model model ) {
		UserFAQVO faqVo = userBoardService.faqVoSelect(num);
		model.addAttribute("faqVo",faqVo);
		userBoardService.faqCount(num);
		return "/board/user_often_answer";	
	}
	
	
	@PostMapping("/faqList.do")
	@ResponseBody
	public String ticketingList(@RequestBody UserFAQVO faqVo ) {
		List<UserFAQVO> faqList = userBoardService.faqList(faqVo.getFaq_kind_num());
		UserFAQKindVO kindVo = userBoardService.faqKindList(faqVo.getFaq_kind_num());
			for(UserFAQVO faqL : faqList ) {
				faqL.setKind_name(kindVo.getFaq_kind_name());
			}
			
			Gson gson = new Gson();
			String FAQ = gson.toJson(faqList);
			System.out.println("!!!!"+FAQ);
			return FAQ;
	}
	
	
	@RequestMapping("/myQna.do")
	public String myQna(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		System.out.println("session.getId() =" + session.getAttribute("userID"));
		System.out.println("session.getId() =" +session.getAttributeNames());
		String id = (String) session.getAttribute("userID");
		System.out.println("id "+id);
		model.addAttribute("userQnaOneList", userBoardService.userQnaOneList(id));
		model.addAttribute("userQnaCount",userBoardService.userQnaOneList(id).size());
		
		return "/board/user_one_qna";
	}
	
	@RequestMapping("/adminAnswer.do")
	public String adminAnswer(@RequestParam("dgv_inquiry_code")int num, Model model) {
		AdminInquiryVO answerVo = userBoardService.adminAnswer(num);
		UserInquiryVO inquiryVo =userBoardService.userQnaVO(num);
		model.addAttribute("inquiryVo",inquiryVo);
		model.addAttribute("answerVo",answerVo);
		return "/board/user_answer_detail";
	}
	
	@RequestMapping("/qnaRegister.do")
	public String qnaRegister() {
		return "/board/user_qna_register";
	}
	

	@PostMapping("/qnaInsert.do")
	public String qnaRegisterAction(UserInquiryVO vo) {
		int num = userBoardService.insertMyQna(vo);
		
		if(num ==0) {
			System.out.println("등록 실패");
		}else {
			System.out.println("등록 성공 ");
		}
		return "redirect:/myQna.do";
	}
	
}
