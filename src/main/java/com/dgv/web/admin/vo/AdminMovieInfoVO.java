package com.dgv.web.admin.vo;

public class AdminMovieInfoVO {
//크롤링용
	
	Integer num;
	String img;
	String movieAge;
	String movieTitle;
	
	
	public AdminMovieInfoVO() {
		
	}

	public AdminMovieInfoVO(String img, String movieAge, String movieTitle) {
		super();
		this.img = img;
		this.movieAge = movieAge;
		this.movieTitle = movieTitle;
	}

	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getMovieAge() {
		return movieAge;
	}
	public void setMovieAge(String movieAge) {
		this.movieAge = movieAge;
	}
	public String getMovieTitle() {
		return movieTitle;
	}
	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}
	
	@Override
	public String toString() {
		return "AdminMovieInfoVO [num=" + num + ", img=" + img + ", movieAge=" + movieAge + ", movieTitle=" + movieTitle
				+ "]";
	}
	
	
	
	
}