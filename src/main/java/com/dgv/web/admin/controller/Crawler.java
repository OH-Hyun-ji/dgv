package com.dgv.web.admin.controller;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.dgv.web.admin.service.AdminCrawlerService;
import com.dgv.web.admin.vo.AdminMovieInfoVO;
import com.dgv.web.admin.vo.AdminRegionVO;
import com.dgv.web.admin.vo.AdminTheaterLocationVO;

@Controller
public class Crawler {

	@Autowired
	private AdminCrawlerService adminCrawlerService;
	
	@RequestMapping("/insertCity.mdo")
	public String crawlCity() {
		System.out.println("���õ���");
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
		System.out.println("�������");
		
		try {
			String url ="https://www.megabox.co.kr/theater?brchNo=1372";
			System.out.println("�������1");
			Connection conn = Jsoup.connect(url);
			System.out.println("�������2");
			Document doc = conn.get();
			
			Elements city = doc.select("div.theater-area-list .depth1");
			
			Elements region =doc.select("div.area-depth2 a");
			List list = new ArrayList<String>();
			for(int i=0; i<city.size(); i++) {
				String citys = city.get(i).text();
				list.add(citys);
				if(list.get(i).equals("����")) {
					for(int j=0;j<18;j++) {
						String regions = region.get(j).text();
						System.out.println(regions);
						
						
						AdminRegionVO vo = new AdminRegionVO(i+1, regions);
						adminCrawlerService.insertRegion(vo);
					}
					System.out.println("/////////////////////////////////");
				}else if(list.get(i).equals("���")) {
					for(int j=19;j<47;j++) {
						String regions = region.get(j).text();
						System.out.println(regions);
						System.out.println(i);
						AdminRegionVO vo = new AdminRegionVO(i+1, regions);
						adminCrawlerService.insertRegion(vo);
					}
					System.out.println("/////////////////////////////////");
				}else if(list.get(i).equals("��õ")) {
					for(int j=47;j<52;j++) {
						String regions = region.get(j).text();
						System.out.println(regions);
						System.out.println(i);
						AdminRegionVO vo = new AdminRegionVO(i+1, regions);
						adminCrawlerService.insertRegion(vo);
					
					}
					System.out.println("/////////////////////////////////");
				}else if(list.get(i).equals("����/��û/����")) {
					for(int j=52;j<69;j++) {
						String regions = region.get(j).text();
						System.out.println(regions);
						AdminRegionVO vo = new AdminRegionVO(i+1, regions);
						adminCrawlerService.insertRegion(vo);
					}
					System.out.println("/////////////////////////////////");
				}else if(list.get(i).equals("�λ�/�뱸/���")) {
					for(int j=69;j<91;j++) {
						String regions = region.get(j).text();
						System.out.println(regions);
						AdminRegionVO vo = new AdminRegionVO(i+1, regions);
						adminCrawlerService.insertRegion(vo);
					}
					System.out.println("/////////////////////////////////");
				}else if(list.get(i).equals("����/����")) {
					for(int j=91;j<100;j++) {
						String regions = region.get(j).text();
						System.out.println(regions);
						AdminRegionVO vo = new AdminRegionVO(i+1, regions);
						adminCrawlerService.insertRegion(vo);
					}System.out.println("/////////////////////////////////");
				}else if(list.get(i).equals("����")) {
					for(int j=100;j<104;j++) {
						String regions = region.get(j).text();
						System.out.println(regions);
						AdminRegionVO vo = new AdminRegionVO(i+1, regions);
						adminCrawlerService.insertRegion(vo);
					}	
				}
			}
			
			System.out.println(list.toString());
		}catch (Exception e) {
			e.printStackTrace();
		}
		return"/movie/admin_movie_list";
	}
	
	@RequestMapping("/insertMovieInfo.mdo")
	public String crawlMovie() {
		System.out.println("��ȭ����!!");
		
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
