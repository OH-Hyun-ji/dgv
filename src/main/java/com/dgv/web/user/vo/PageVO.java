package com.dgv.web.user.vo;

import lombok.Data;

@Data
public class PageVO {

	private int pageIndex =1;  //현재페이지
	private int pageUnit =10;  //페이지갯수
	private int pageSize=5;    //페이지사이즈
	private int firstIndex=1;  //firstIndex
	private int recordCountPerPage=10; //recordCountPage
	private int totCnt =0;  //총갯수
	private int startDate =0; //시작데이터
	private int endDate=0; //종료데이터
	private int realEnd =0; //페이징마지막숫자
	private boolean prev, next; //이전 다음버튼 
}
