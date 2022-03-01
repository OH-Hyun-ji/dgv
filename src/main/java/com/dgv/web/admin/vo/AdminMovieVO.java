package com.dgv.web.admin.vo;

import java.util.List;

import lombok.Data;

@Data
public class AdminMovieVO {

	private Integer movie_num;
	private Integer movie_genre_code;
	private String movie_img;
	private String movie_real_img;
	private String movie_running_time;
	private String movie_open_date;
	private String movie_text;
	private String movie_title;
	private String movie_title_en;
	private Integer movie_age_code;
	private String reg_id;
	private String reg_date;
	private String  movie_time;
	private Integer theater_code;
	private Integer region_code;
	private String movie_date;
	private Integer city_code;
	
	private List<AdminGenreVO> genreList;
	private List<AdminAgeVO> ageList;
	private List<AdminCityVO> cityList;
	private List<AdminRegionVO> regionList;
	private List<AdminParVO> parList;
	
}
