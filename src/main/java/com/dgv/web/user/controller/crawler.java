package com.dgv.web.user.controller;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dgv.web.admin.dao.AdminMovieInfoDAO;
import com.dgv.web.admin.service.AdminMovieInfoService;
import com.dgv.web.admin.vo.AdminMovieInfoVO;
@Controller
public class crawler {

	@Autowired
	private AdminMovieInfoService adminMovieInfoService;
	
	@RequestMapping("/insert.mdo")
	public String craw() {
		System.out.println("dddd");
		
		try {
			String URL = "https://www.cgv.co.kr/movies/";
			
			Connection conn =Jsoup.connect(URL);
			
			Document doc = conn.get();
			
			System.out.println("Å©·Ñ¸µÀÌ´å");
			
			Elements ranks = doc.select(".rank");
			/* logger.info("rank" + ranks); */
			 
			 Elements imgs = doc.select(".thumb-image > img");
			/* logger.info("imgs" + imgs); */
			 
			 Elements movieAges = doc.select(".ico-grade");
			/* logger.info("ico-grade" + movieAges); */
			 
			 Elements movieTitles = doc.select("div.box-contents strong.title");
			/* logger.info("titles" + movieTitles); */
			 
			 Elements movieRates = doc.select(".percent span");
			/* logger.info("percents" + movieRates); */
			 
			 
			 Elements movieOpenDates = doc.select(".txt-info strong");
			/* logger.info("percents" + movieOpenDates); */
			
			 Elements likes = doc.select(".count strong>i");
			 
			 List<AdminMovieInfoVO> list = new ArrayList<AdminMovieInfoVO>();
			 
			 for(int i = 0; i < ranks.size(); i++) {
					
				 String rank = ranks.get(i).text();
				 String img = imgs.get(i).attr("src");
				 String movieAge = movieAges.get(i).text();
				 String movieTitle = movieTitles.get(i).text();
				 String movieRate = movieRates.get(i).text();
			
			
			 AdminMovieInfoVO vo = new AdminMovieInfoVO(img, movieAge, movieTitle);
			 adminMovieInfoService.insertMovieInfo(vo);
			 
			 }
			 
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "/movie/admin_movie_list";
	}
	
	
	
}
