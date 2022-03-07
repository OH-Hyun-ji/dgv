<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user_reserve.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css">
    <link href="https://fonts.googleapis.com/css2?family=Dongle:wght@700&display=swap" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<style type="text/css">
		.onBtn{
			background-color: rgb(42 45 41 / 54%);
  			color: white;
  			border-radius: 5px;
		}
		li.cityName {
  			display: inline-grid;
		}
		li.selected:hover {
  			background-color: gray;
			color:white;
		}
		button.regionBtn {
    		line-height: 36px;
    		z-index: 10;
		}
		button.regionBtn:hover {
			background-color: gray;
			color:white;
    		
		}
		button.timeList {
		    border: 1px solid #80808075;
		    width: 66px;
		    height: 30px;
		    margin-left: 2%;
		    border-radius: 3px;
		    font-weight: bolder;
		}
		button.timeList:hover {
			background-color: gray;
			color:white;
		}
	</style>
</head>
<body class="block" >
<jsp:include page="../default/user_header.jsp"></jsp:include>
    <!--본격 콘텐츠-->
    <a name="t"></a>
    <div id="wrap" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
        <div id="container">
            <!-- 빠른예매 -->
            <div id="ticket" class="ticket ko">
                <!-- 타이틀 -->
                <div class="navi">
                    <span class="right">
                        <a class="button button-english" href="#" onmousedown="javascript:logClick('옵션/ENGLISH');" onclick="switchLanguage(); return false;">
                            <span>ENGLISH</span>
                        </a>
                        <a class="button button-guide" href="#" onmousedown="javascript:logClick('옵션/예매가이드');" onclick="ticketPopupShow('popup_guide'); return false;">
                            <span>예매가이드 - 레이어로 서비스 되기 때문에 가상커서를 해지(Ctrl+Shift+F12)한 후 사용합니다.</span>
                        </a>
                        <a class="button button-discount" href="#" onmousedown="javascript:logClick('옵션/제휴할인혜택');" onclick="ticketNewWindow('http://www.cgv.co.kr/discount/discountlist.aspx');return false;" title="새창열기">
                            <span>제휴할인혜택</span>
                        </a>
                        <a class="button button-schedule" href="#" onmousedown="javascript:logClick('옵션/상영시간표');" onclick="openSchedulePopup();return false;" title="새창열기">
                            <span>상영시간표</span>
                        </a>
                        <a class="button button-reservation-restart" href="#" onmousedown="javascript:logClick('옵션/예매다시하기');" onclick="ticketRestart(); return false;">
                            <span>예매 다시하기</span>
                        </a>
                    </span>
                </div>
                <!-- //타이틀 -->
			    <!-- 메인컨텐츠 -->
                <div class="steps">
                    <!-- step1 -->
                    <div class="step step1" style="height: 595px; display: block;">
                        <!-- MOVIE 섹션 -->
                        <div class="section section-movie">
                            <!-- col-head -->
                            <div class="col-head" id="skip_movie_list">
                                <h3 class="sreader">영화</h3>
                                <a href="#" class="skip_to_something" onclick="skipToSomething('skip_theater_list');return false;">영화선택 건너뛰기</a>
                            </div>
                            <!-- col-body -->
                            <div class="col-body" style="height: 560px;overflow-y: scroll;">
                                <!-- 영화선택 -->
                                <div class="movie-select">
                                    <div class="tabmenu">
                                        <span class="side on"></span>
                                        <a href="#" class="button menu1 selected">전체</a>
                                        <span class="side on"></span>
                                        <a href="#" class="button menu2">
                                            아트하우스
                                            <span class="arrow"></span>
                                        </a>
                                        <div class="tabmenu-selectbox MOVIECOLLAGE" style="display:none;">
                                            <ul>
                                                <li>
                                                    <a href="#" onclick="return false;">전체</a>
                                                </li>
                                                <li>
                                                    <a href="#" onclick="return false;">최신작</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <span class="side"></span>
                                        <!-- 특별관 안한다고 하셔서 일단 보류함-->
                                    </div>
                                    <div class="sortmenu">
                                        <a href="#" onclick="sortMovieByRank();return false;" id="movieSortRankBtn" class="button btn-rank selected">예매율순</a>
                                        <a href="#" onclick="sortMovieByName();return false;" id="movieSortNameBtn" class="button btn-abc">가나다순
                                        </a>
                                    </div>
                                    <div class="movie-list nano has-scrollbar has-scrollbar-y" id="movie_list">
                                        <ul class="content scroll-y" onscroll="movieSectionScrollEvent();" tabindex="-1" style="right: -17px;padding: 0px;">
                                           <c:forEach var="movieList" items="${movieList}" varStatus="status">
                                            <li class="rating-15" data-index="${status.index}" >
                                                <button href="#" onclick="movieCode(${movieList.movie_num })" title="${movieList.movie_title }"  value="${movieList.movie_num }">
                                                	<div class="movie-info" style="display: flex;">
	                                                    <span class="age-icon">&nbsp;<img src="${movieList.age_img}" style="height: 33px; box-sizing: border-box; padding-top: 11%;"></span>
	                                                    <span class="movieTitleBtn" class="title-text" style="background-color: #f2f0e5;box-sizing: border-box; padding-top: 4%;">${movieList.movie_title }</span>
                                                    </div>
                                                    <span class="sreader"></span>
                                                </button>
                                            </li>
                                            </c:forEach>
                                        </ul>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- THEATER 섹션 -->
                        <div class="section section-theater">
                            <!-- col-head -->
                            <div class="col-head" id="skip_theater_list">
                                <h3 class="sreader">극장</h3>
                                <a href="#" class="skip_to_something" onclick="skipToSomething('skip_date_list');return false;">극장선택 건너뛰기</a>
                            </div>
                            <!-- col-body -->
                            <div class="col-body" style="height: 560px;overflow-y: scroll;">
                                <!-- 자주가는 DGV -->
                                <!-- 극장선택 -->
                                <div class="theater-select" style="height: 429px;">
                                    <div class="tabmenu">
                                        <span class="side on"></span>
                                        <a href="#" onclick="return false;" class="button menu1 selected">전체</a>
                                        <span class="side on"></span>
                                        <a href="#" onclick="return false;" class="button menu2">아트하우스</a>
                                        <span class="side"></span>
                                    </div>
                                    <div class="theater-list" style="height: 388px;">
                                        <div class="theater-area-list" id="theater_area_list" style="font-size: 13px;height: 388px;text-align-last: center;width: 89px;">
                                            <ul style="padding-left: 0px;">
                                           		 <c:forEach var="cityList" items="${cityList}" varStatus="status">
                                              		  <li class="selected" id="selectBtn${cityList.city_code}"  >
	                                                    <a href="#" class="cityNameBtn"  onclick="choiceCity(${cityList.city_code})">
	                                                        <span class="name" >${cityList.city_name}</span>
	                                                    </a>
	                                                    <div class="" style="z-index: 1;height: 0px;">
	                                                        <ul class="region-list" id="btn${cityList.city_code}" style="display: grid;"></ul>                                                       
	                                                    </div>
                                               		  </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                   
                                    </div>
                                </div>
                                </div>
                                </div>
                        <!-- DATE 섹션 -->
                        <div class="section section-date">
                            <div class="col-head" id="skip_date_list">
                                <h3 class="sreader">날짜</h3>
                                <a href="#" onclick="return false;" class="skip_to_something">날짜 건너뛰기</a>
                                
                            </div>
                            
                            <div class="col-body" style="height: 560px;">
                                <!-- 날짜선택 -->
                                <div class="day-part">
                                    <div class="reserve-date">
                                        
                                    </div>
                                    
                                </div>
                              
                            </div>
                        </div>
                        <!-- TIME 섹션 -->
                        <div class="section section-time">
                            <div class="col-head" id="skip_time_list">
                                <h3 class="sreader">시간</h3>
                                <a href="#" class="skip_to_something" onclick="skipToSomething('tnb_step_btn_right');return false;">시간선택 건너뛰기</a>                                
                            </div>
                            <div class="col-body" style="height: 560px;">
                                <!-- 시간선택 -->
                                <div class="placeholder hidden">영화, 극장, 날짜를 선택해주세요.</div>
               					<input type="text" id="hiddenTitle">
               					<input type="text" id="hiddenCity">
               					<input type="text" id="hiddenRegion">
               					<input type="text" id="hiddenDate">
               					<input type="text" id="hiddenTheater">
               					<input type="text" id="hiddenTime">
               					
                                <div class="time-list nano has-scrollbar">
                                    <div class="content scroll-y" tabindex="-1" style="right: -17px;">
                                        <div class="theater" screen_cd="001" movie_cd="20024619" style="border: none;"><span class="title"><span
                                                    class="name">2D</span><span class="floor">1관 5층</span><span class="seatcount">(총130석)</span></span>
                                            <ul id="timeChoice">
                                                <li data-index="0" data-remain_seat="130" play_start_tm="1400" screen_cd="001" movie_cd="20024619"
                                                    play_num="2"><a class="button" href="#" onclick="screenTimeClickListener(event);return false;"
                                                        title=""><span class="time"><span>14:00</span></span><span class="count">60석</span>
                                                        <div class="sreader">종료시간 16:17</div><span class="sreader mod"></span>
                                                    </a></li>
                                                <li data-index="1" data-remain_seat="130" play_start_tm="1910" screen_cd="001" movie_cd="20024619"
                                                    play_num="4"><a class="button" href="#" onclick="screenTimeClickListener(event);return false;"
                                                        title=""><span class="time"><span>19:10</span></span><span class="count">60석</span>
                                                        <div class="sreader">종료시간 21:27</div><span class="sreader mod"></span>
                                                    </a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <!-- step2는 seat섹션이라 일단 보류함-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../default/user_footer.jsp"></jsp:include>
	<script>
	$(function(){
		$(".movieTitleBtn").on('click',function(){
			
			if($(".movieTitleBtn").hasClass("onBtn")){
				$(".movieTitleBtn").removeClass("onBtn")
			}else{
				$(".movieTitleBtn").addClass("onBtn")
			}
			console.log("sksk"+$(this).val())
			//$("#hiddenTitle").val()
		})
// 		$(".cityNameBtn").on('click',function(){
// 			alert("¿?????")
// 			if($(".cityNameBtn").hasClass("onBtn")){
// 				$(".cityNameBtn").removeClass("onBtn")
// 			}else{
// 				$(".cityNameBtn").addClass("onBtn")
// 			}
// 		})
		$(".regionBtn").on('click',function(){
			alert("¿????3333?")
				$(".regionBtn").css("background-color","red")
// 			if($('.regionBtn').hasClass("onBtn")){
// 				$(".regionBtn").removeClass("onBtn")
// 			}else{
// 				$(".regionBtn").addClass("onBtn")
// 			}
		})
	})
	function movieCode(n){
		alert("movie code :" +n)
		$("#hiddenTitle").val(n)
	}
	function independence(n){
		alert("Ddd")
// 		if($("#selectBtn"+n).hasClass(".onBtn")){
// 			$("#selectBtn"+n).removeClass(".onBtn")
			
// 		}else{
// 			$("#selectBtn"+n).addClass(".onBtn")
// 		}
		$("#selectBtn"+n).on('click',function(){
			$("#selectBtn"+n).css("background-color","red")
		})
	}


	
	function choiceCity(cityCode){
	//	alert(cityCode)
	independence(cityCode)
	$("#hiddenCity").val(cityCode)		
// 	const li =$("<li>")
//  		.attr("class","cityName")
		$(".region-list").empty();
		$.ajax({
			method:"POST",
			url:"/regionList.do",
			contentType:"application/json",
			dataType:"json",
			data:JSON.stringify({"city_code":cityCode}),
			success:function(regionListInfo){
				const regionList =JSON.parse(regionListInfo)
				_(regionList).forEach(function(n){
					const button =$("<button>")
					.attr("class","regionBtn")
				//	.attr("onclick","choiceRegion()")
					.attr("value",n.region_code)
					.text(n.region_name)	
					console.log(n.region_name)
					$("#btn"+cityCode).append(button)
					
					$(".regionBtn").on('click',function(){
						console.log($(this).val())
						$("#hiddenRegion").val($(this).val())
						const regionClick = $(this).val()
						$("#timeChoice").empty();
						$.ajax({
							method:"POST",
							url:"/theaterTimeList.do",
							contentType:"application/json",
							dataType:"json",
							data:JSON.stringify({"region_code":regionClick}),
							success:function(TimeListInfo){
								const TimeList = JSON.parse(TimeListInfo)
								_(TimeList).forEach(function(i){	
								
								console.log("time = "+ i)
									const button1 =$("<button>")
												.attr("class","timeList")
												.attr("value",i)
												.text(i)
												$("#timeChoice").append(button1)
												
												$(".timeList").on('click',function(){
													$("#hiddenTime").val($(this).val())
												})
								})
							},
							error:function(e){
								console.log("통신실패" + e)
							}
						})	
					})
				})
				
			},
			error:function(){
				console.log("통신실패")
			}
		})
		//$(".region-list").append(li)
				
	}
	
          var test
        	 const date = new Date();
             console.log(date.getFullYear());
             const lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);
             const reserveDate = document.querySelector(".reserve-date");
             const weekOfDay = ["일", "월", "화", "수", "목", "금", "토"]
             const year = date.getFullYear();
             const month = date.getMonth();
             
             for (i = date.getDate(); i <= lastDay.getDate(); i++) {                          
                   const button = document.createElement("button");
               
                   const spanWeekOfDay = document.createElement("span");
                   const spanDay = document.createElement("span");
                   
 					//class넣기
                    button.classList = "movie-date-wrapper"
                    spanWeekOfDay.classList = "movie-week-of-day";
                    spanDay.classList = "movie-day";
                            
                    //weekOfDay[new Date(2020-03-날짜)]
                    const dayOfWeek = weekOfDay[new Date(year + "-" + month + "-" + i).getDay()];
                            
                    //요일 넣기
                    if (dayOfWeek === "토") {
                         spanWeekOfDay.classList.add("saturday");
                         spanDay.classList.add("saturday");
                    } else if (dayOfWeek === "일") {
                         spanWeekOfDay.classList.add("sunday");
                         spanDay.classList.add("sunday");
                    }
                    spanWeekOfDay.innerHTML = dayOfWeek;
                    button.append(spanWeekOfDay);
                    //날짜 넣기
                    spanDay.innerHTML = i;
                    test=this;
                    button.append(spanDay);
                    
                    //button.append(i);
                    reserveDate.append(button);                            
                    dayClickEvent(button);
                    }
                   
 
                    function dayClickEvent(button) {
                          button.addEventListener("click", function() {
                        	  console.log("날짜 : "+$(this).text())
                        		$("#hiddenDate").val($(this).text())
                        	  
                          const movieDateWrapperActive = document.querySelectorAll(".movie-date-wrapper-active");
                          movieDateWrapperActive.forEach((list) => {
                          list.classList.remove("movie-date-wrapper-active");
                     	 })
                    		 button.classList.add("movie-date-wrapper-active");
                     	})
                     }
                    
                    
</script>
</body>
</html>