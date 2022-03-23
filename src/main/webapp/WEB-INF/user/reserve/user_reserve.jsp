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
	<script type="text/javascript">
		function ticketRestart() {
			location.reload();
		}
		$(function(){
			const num =10
			$("#changeArtChart").on('click',function(){
				$("#changeAllChart").css("background-color","")		
				$("#changeArtChart").css("background-color","")					
				$("#changeArtChart").css("background-color","#adadadb8")
				
				$("#artHouseCome").empty();
				$.ajax({
					method:"POST",
					url:"/artChatList.do",
					contentType:"application/json",
					dataType:"json",
					data:JSON.stringify({"movie_genre_code":num}),
					success:function(result){
						var artList=JSON.parse(result)
						
						_(artList).forEach(function(n){
							const li = $("<li>")
									.attr("class","rating-15")
							const btn = $("<button>")
									.attr("href","#")
									.attr("class","movieStyle")
									.attr("onclick","movieCode("+n.movie_num+")")
									.attr("id","movieTT"+n.movie_num)
									.attr("value",n.movie_num)
									
							const div = $("<div>")
									.attr("class","movie-info")
									.css("display","flex")
							const span1 = $("<span>")
									.attr("class","age-icon")
							const img =$("<img>")
									.attr("src",n.age_img)
									.css("height","33px")
									.css("box-sizing","border-box")
									.css("padding-top","11%")
							const span2 =$("<span>")
									.attr("class","movieTitleBtn")
									.attr("class", "title-text")
									.css("box-sizing","border-box")
									.css("padding-top","4%")
									.text(n.movie_title)
							const span3 =$("<span>")
									.attr("class","sreader")
							
									div.append(span1)
									span1.append(img)
									div.append(span2)
									btn.append(span3)
									btn.append(div)
									li.append(btn)
															
						$("#artHouseCome").append(li)
						}) //lodash close
						
					},
					error:function(e){
						console.log("통신실패"+e)
					}
				})// ajax close
			})//click artHouse
			$("#changeAllChart").on('click',function(){
				$("#changeArtChart").css("background-color","")			
				$("#changeAllChart").css("background-color","")					
				$("#changeAllChart").css("background-color","#adadadb8")
				
				
				$("#artHouseCome").empty();
				$.ajax({
					method:"POST",
					url:"movieAllChartView.do",
					contentType:"application/json",
					dataType:"json",
					data:JSON.stringify({"movie_num":1}),
					success:function(result){
						var allChart = JSON.parse(result)
						
						_(allChart).forEach(function(n){
							const li = $("<li>")
							.attr("class","rating-15")
					const btn = $("<button>")
							.attr("href","#")
							.attr("class","movieStyle")
							.attr("onclick","movieCode("+n.movie_num+")")
							.attr("id","movieTT"+n.movie_num)
							.attr("value",n.movie_num)
							
					const div = $("<div>")
							.attr("class","movie-info")
							.css("display","flex")
					const span1 = $("<span>")
							.attr("class","age-icon")
					const img =$("<img>")
							.attr("src",n.age_img)
							.css("height","33px")
							.css("box-sizing","border-box")
							.css("padding-top","11%")
					const span2 =$("<span>")
							.attr("class","movieTitleBtn")
							.attr("class", "title-text")
							.css("box-sizing","border-box")
							.css("padding-top","4%")
							.text(n.movie_title)
					const span3 =$("<span>")
							.attr("class","sreader")
					
							div.append(span1)
							span1.append(img)
							div.append(span2)
							btn.append(span3)
							btn.append(div)
							li.append(btn)
							$("#artHouseCome").append(li)
						});//lodash close
					},
					error:function(e){
						console.log("통신실패"+e)
					}
				})//ajax close
				
			})
		})
	</script>
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
  			background-color: #9e9d9ba1;
			color:white;
		}
		button.regionBtn {
    		line-height: 36px;
    		z-index: 10;
    		background-color: #f2f0e5;
    		cursor: pointer;
		}
		button.regionBtn:hover {
			background-color: #9e9d9ba1;
			
    		
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
		.movieStyle{
			background-color: #f2f0e5;
		}
		.CheckHiddenBtn {
		    display: flex;
		    justify-self: center;
   			margin-left: 149px;
		}
		input#next-page1 {
		    width: 150px;
		    height: 93px;
		    border-radius: 3px;
		    font-size: 18px;
		    color: white;
		    background-color: gray;
		    margin-right: 2%;
		}
		input.dgvR{
		background-color: green;
		}
		ul.theater-name{
			display: flex;
		}
		li.timeList {
		    margin-right: 13px;
		    border: 1px solid #8080809e;
		    font-size: 18px;
		    border-radius: 4px;
		    width: 60px;
		    text-align: center;
		    margin-bottom: 9px;
		    margin-top: 6px;
		    margin-left: 12px;
		    background-color: #f0f8ff80;
		    height: 28px;
		}
		li.timeList:hover {
			background-color: gray;
			color: white;
			cursor: pointer;
		}
		span.theaterName {
		    font-weight: bolder;
		    color: #482416;
		}
		span.movieTitleBtn {
		    cursor: pointer;
		}
		.lay-style{
			display: grid;
		}
	</style>
</head>
<body class="seatPage" >
<jsp:include page="../default/user_header.jsp"></jsp:include>
    <!--본격 콘텐츠-->
    <a name="t"></a>
    <div class="lay-style">
    <div id="wrap" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
        <div id="container">
            <!-- 빠른예매 -->
            <div id="ticket" class="ticket ko">
                <!-- 타이틀 -->
                <div class="navi">
                    <span class="right">
                        <a class="button button-reservation-restart" href="#" onclick="ticketRestart()">
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
                                        <a href="#" id="changeAllChart" class="button menu1 selected">전체</a>
                                        <span class="side on"></span>
                                        <a href="#" id="changeArtChart" class="button menu2">
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
                                        <ul class="content scroll-y" id="artHouseCome"onscroll="movieSectionScrollEvent();" tabindex="-1" style="right: -17px;padding: 0px;">
                                           <c:forEach var="movieList" items="${movieList}" varStatus="status">
	                                           <c:if test="${movieList.movie_status=='true' }">
		                                            <li class="rating-15" data-index="${status.index}" >
		                                                <button href="#" class="movieStyle" onclick="movieCode(${movieList.movie_num })" id="movieTT${movieList.movie_num }" title="${movieList.movie_title }"  value="${movieList.movie_num }">
		                                                	<div class="movie-info" style="display: flex;">
			                                                    <span class="age-icon">&nbsp;<img src="${movieList.age_img}" style="height: 33px; box-sizing: border-box; padding-top: 11%;"></span>
			                                                    <span class="movieTitleBtn" class="title-text" style="box-sizing: border-box; padding-top: 4%;">${movieList.movie_title }</span>
		                                                    </div>
		                                                    <span class="sreader"></span>
		                                                </button>
		                                            </li>
	                                            </c:if>
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
               				
                                <div class="time-list nano has-scrollbar">
                                    <div class="content scroll-y" tabindex="-1" style="right: -17px;">
                                        <div id="theater"  screen_cd="001" movie_cd="20024619" style="border: none;"><span class="title">
                                        	
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
 <div class="CheckHiddenBtn">
 	<img style="width: 996px;" src="https://dgvworld.s3.ap-northeast-2.amazonaws.com/banner0007.png">
	 <form  method="post" name="reserveInfo" action="/reserveSeat.do">
		<input class="dgvR" type="hidden" id="hiddenTitle" name="movie_num">
		<input class="dgvR" type="hidden" id="hiddenCity" name="city_code">
		<input class="dgvR" type="hidden" id="hiddenRegion" name="region_code">
		<input class="dgvR" type="hidden" id="hiddenDate" name="reserve_date">
		<input class="dgvR" type="hidden" id="hiddenTheater" name="theater_code">
		<input class="dgvR" type="hidden" id="hiddenTime" name="movie_time_start">
        <input type="button" id="next-page1"  value="좌석선택=>" >
	</form>	
   </div>
   </div>
    <jsp:include page="../default/user_footer.jsp"></jsp:include>
	<script>
	var test;
	$(function(){
		test = this;
 		console.log("num : "+${movieInfo.movie_num})
 		const movieNumber = ${movieInfo.movie_num}
		
		if(movieNumber != -1 ){
			console.log("post방식")
			movieCode(movieNumber)
		}else{
			console.log("get방식")
		}
		
	})
	function movieCode(n){
		alert("movie code :" +n)
		$(".movieStyle").css("background-color","")	
		$("#movieTT"+n).css("background-color","#9e9d9ba1")
	
		$("#hiddenTitle").val(n)
	}
	
	
	function init(){
		$(".selected").css("background-color","")
	}
	function independence(n){
		$("#selectBtn"+n).on('click',function(){
			$("#selectBtn"+n).css("background-color","#9e9d9ba1")
		})
	}

	
	function choiceCity(cityCode){
	//	alert(cityCode)
	init()
	independence(cityCode)
	$("#hiddenCity").val(cityCode)		
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
					.click(regionChoicBtn)
					.attr("value",n.region_code)
					.text(n.region_name)	
					console.log(n.region_name)
					$("#btn"+cityCode).append(button)
					
				
				})
				
			},
			error:function(){
				console.log("통신실패")
			}
		})//ajax close
		//$(".region-list").append(li)
				
	}

	
		 	
	
	
	function regionChoicBtn(){
		
		
		$(this).on('click',function(){
			$(".regionBtn").css("background-color","")
			console.log($(this).val())
			$(this).css("background-color","#9e9d9ba1")
			$("#hiddenRegion").val($(this).val())
			const regionClick = $(this).val()
			
		
			$.ajax({
				method:"POST",
				url:"/theaterList.do",
				contentType:"application/json",
				dataType:"json",
				data:JSON.stringify({"region_code":regionClick}),
				success:function(TheaterInfo){
					const TheaterL = JSON.parse(TheaterInfo)
						$("#theater").empty();
					_(TheaterL).forEach(function(i){	
					
					console.log("theater11 = "+i.theater_name)
					console.log("theater = "+ i.theater_code)
						const div =$("<div>")
								.attr("id","theater-title")
						const ul =$("<ul>")
								.attr("class","theater-name")
								.attr("id","theater"+i.theater_code)
						const totalSeat = i.theater_max_row * i.theater_max_column
						const seat = (i.seat_status).split(",")
						const seatLength = seat.length
						const remainSeat = totalSeat-seatLength
						const span = $("<span>")
								.attr("class","theaterName")
								.text(i.theater_name+" 상영관 ("+remainSeat +"/"+ totalSeat+ "석 )" )
						
						const timeSplit = (i.movie_time_start).split("/")
						const timeSplitLength = timeSplit.length
							console.log("timeSplitLength : "+timeSplitLength)
							div.append(span)
						const div1 = $("<div>")
								.attr("class","fixed")
						for(let j=0;j<timeSplitLength-1;j++){
						const li =$("<li>")
								.attr("class","timeList")
								.attr("value",i.theater_code)
					//			.click(timeChoice)
								.text(timeSplit[j])
								console.log("timeSplit[j]"+timeSplit[j])
								ul.append(li)
						}							
								console.log("/.////" + i.movie_time_code)
								div.append(ul)
								$("#theater").append(div)	
								
					})
									$(".timeList").on('click',function(){
									//	console.log($(this).val())
							 			alert($(this).val())
							 			$(".timeList").css("background-color","")	
										$(this).css("background-color","#9e9d9ba1")
							 			$("#hiddenTheater").val($(this).val())
							 			$("#hiddenTime").val($(this).text())
									})
				},
				error:function(e){
					console.log("통신실패" + e)
				}
			})	//ajax close
							
			
		}) 
		
	}
	//////////////////////////////////////////////////////////////////////////////

	
	$("#next-page1").on('click',function(){
		alert("////")
		
		const title = $("#hiddenTitle").val()
		const city =$("#hiddenCity").val()
		const region = $("#hiddenRegion").val()
		const date =$("#hiddenDate").val()
		const theater =$("#hiddenTheater").val()
		const time =$("#hiddenTime").val()
		
		console.log(title)
		console.log(city)
		console.log(region)
		console.log(date)
		console.log(time)
		console.log("////")
		
		if(title != ""&& city !=""&& region != ""&&date != "" &&time != "" &&theater != ""){
			let result = confirm("좌석선택하시겠습니까??")
			if(result){
				const reserveVo ={
						"movie_num":title,
						"city_code":city,
						"region_code":region,
						"reserve_date":date,
						"movie_time_start":time,
						"theater_code":theater
				}
				const target = document.getElementById('next-page1');
				$("#next-page1").css("background-color","red")
				
	 				document.reserveInfo.submit();
				
			}else{
					
			}
		
		}else{
			alert("선택안한 항목이 있습니다, 다시 확인해 주세요 ")
			const target = document.getElementById('next-page1');
				location.reload();
		}
	})


	
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