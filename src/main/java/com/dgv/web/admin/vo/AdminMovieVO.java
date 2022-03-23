package com.dgv.web.admin.vo;

import java.util.List;

import com.dgv.web.user.vo.PageVO;

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
	private Integer theater_code;
	private Integer region_code;
	private String movie_date;
	private Integer city_code;
	private String movie_genre;
	private String movie_status;
	private String age_img;
	private String age_name;
	
	private String url;
	private List<AdminGenreVO> genreList;
	private List<AdminAgeVO> ageList;
	private List<AdminCityVO> cityList;
	private List<AdminRegionVO> regionList;
	private List<AdminParVO> parList;
	private List<AdminGroupVO> groupList;
	private String movie_genre_name;
	private Integer genre_count;
	
}
