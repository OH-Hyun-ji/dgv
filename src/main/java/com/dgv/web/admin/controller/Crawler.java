package com.dgv.web.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.IntStream;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.nodes.Node;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dgv.web.admin.service.AdminCrawlerService;
import com.dgv.web.admin.vo.AdminTheaterLocationVO;

@Controller
public class Crawler {

	@Autowired
	private AdminCrawlerService adminCrawlerService;
	
	private static final Map<String, Integer> regionMap;
	
	static {
		regionMap = new HashMap<>();
		regionMap.put("서울", 1);
	}
	
	@RequestMapping("/insertCity.mdo")
	public String crawlCity() {
		System.out.println("크롤링");
		try {
			String url = "https://www.megabox.co.kr/theater/list";
			
			Connection conn = Jsoup.connect(url);
			Document doc = conn.get();
			
			Elements city = doc.select("div.theater-place button.sel-city");
			
			for(int i=0; i<city.size(); i++) {
				String citys = city.get(i).text();
				
				AdminTheaterLocationVO vo = new AdminTheaterLocationVO(citys);
				adminCrawlerService.insertTheaterLocation(vo);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return"/movie/admin_movie_list";
	}
	
	
	@RequestMapping("/insertTheater.mdo")
	public String crawlTheater() {
		System.out.println("크롤링이닷");
		
		try {
			
			String url ="http://www.cgv.co.kr/theaters/";
			
			Connection conn = Jsoup.connect(url);
		
			Document doc = conn.get();
			
			Elements city = doc.select("div.theater-area-list .depth1");
			
			Elements regions =doc.select("div.area-depth2 a");
			List list = new ArrayList<String>();
			
			final Element test = doc.select("div.sect-city").first();
			
			final Elements cities = doc.select("div.sect-city").first().getElementsByTag("ul");
			//System.out.println(cities.text());
//			cities.forEach(region -> {
//				System.out.println(String.format("지역 이름 : %s", region.select("a").text()));
//				region.select("div > ul > li").forEach(li -> {
//					final String text = li.select("a").text();
//					System.out.println(String.format("\t하위 이름 : %s ", text));
//				});
//			});
			
//			for(int i=0; i<city.size(); i++) {
//				String citys = city.get(i).text();
//				list.add(citys);
//				if(list.get(i).equals("서울")) {
//					for(int j=0;j<18;j++) {
//						String regions = region.get(j).text();
//						System.out.println(regions);
//						
//						
//						AdminRegionVO vo = new AdminRegionVO(i+1, regions);
//						adminCrawlerService.insertRegion(vo);
//					}
//					System.out.println("/////////////////////////////////");
//				}else if(list.get(i).equals("경기")) {
//					for(int j=19;j<47;j++) {
//						String regions = region.get(j).text();
//						System.out.println(regions);
//						System.out.println(i);
//						AdminRegionVO vo = new AdminRegionVO(i+1, regions);
//						adminCrawlerService.insertRegion(vo);
//					}
//					System.out.println("/////////////////////////////////");
//				}else if(list.get(i).equals("인천")) {
//					for(int j=47;j<52;j++) {
//						String regions = region.get(j).text();
//						System.out.println(regions);
//						System.out.println(i);
//						AdminRegionVO vo = new AdminRegionVO(i+1, regions);
//						adminCrawlerService.insertRegion(vo);
//					
//					}
//					System.out.println("/////////////////////////////////");
//				}else if(list.get(i).equals("대전/충청/세종")) {
//					for(int j=52;j<69;j++) {
//						String regions = region.get(j).text();
//						System.out.println(regions);
//						AdminRegionVO vo = new AdminRegionVO(i+1, regions);
//						adminCrawlerService.insertRegion(vo);
//					}
//					System.out.println("/////////////////////////////////");
//				}else if(list.get(i).equals("부산/대구/경상")) {
//					for(int j=69;j<91;j++) {
//						String regions = region.get(j).text();
//						System.out.println(regions);
//						AdminRegionVO vo = new AdminRegionVO(i+1, regions);
//						adminCrawlerService.insertRegion(vo);
//					}
//					System.out.println("/////////////////////////////////");
//				}else if(list.get(i).equals("광주/전라")) {
//					for(int j=91;j<100;j++) {
//						String regions = region.get(j).text();
//						System.out.println(regions);
//						AdminRegionVO vo = new AdminRegionVO(i+1, regions);
//						adminCrawlerService.insertRegion(vo);
//					}System.out.println("/////////////////////////////////");
//				}else if(list.get(i).equals("강원")) {
//					for(int j=100;j<104;j++) {
//						String regions = region.get(j).text();
//						System.out.println(regions);
//						AdminRegionVO vo = new AdminRegionVO(i+1, regions);
//						adminCrawlerService.insertRegion(vo);
//						
//						
//
//					}	
//					
//				}
//			}
//			
			System.out.println(list.toString());
		}catch (Exception e) {
			e.printStackTrace();
		}
		return"/movie/admin_movie_list";
	}
	
	@RequestMapping("/insertMovieInfo.mdo")
	public String crawlMovie() {
		System.out.println("등록 !!");
		
		try {
			String URL = "http://www.cgv.co.kr/movies/detail-view/?midx=85603";
			
			Connection conn =Jsoup.connect(URL);
			
			Document doc = conn.get();
			
			Elements movieTitle = doc.select("div.title strong");
			 /*logger.info("rank" + ranks); */
			Elements movieTitleEn = doc.select("div.title p");
		 
			 Elements imgs = doc.select(".thumb-image > img");
			/* logger.info("imgs" + imgs); */
			 
			 Elements movieAges = doc.select(".ico-grade");
			/* logger.info("ico-grade" + movieAges); */
			 
			 Elements movieTitles = doc.select("div.box-contents strong.title");
			/* logger.info("titles" + movieTitles); */
			 
			 Elements movieRates = doc.select(".percent span");
			/* logger.info("percents" + movieRates); */
			 
			 
			 Elements gam = doc.select("div.spec dt");
			/* logger.info("percents" + movieOpenDates); */
			
			 Elements actor = doc.select("div.spec dd a");
			 
			 for(int i=0; i<actor.size();i++) {
				 String gams = gam.get(i).text();
				 System.out.println(gam);
			 }
			
			 
	 
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "/movie/admin_movie_list";
	}
	
	
	
}
