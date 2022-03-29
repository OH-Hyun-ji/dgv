<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/png" sizes="192x192"  href="${pageContext.request.contextPath }/resources/images/banana_real.png">
<title>My Page</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=1024"/>
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/layout.css">
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/myPage.css">
    <link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/movieTheater.css"/>
    <link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/userModule.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css"> 
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/swiper-bundle.min.css">
	<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@700&display=swap" rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/swiper.min.js"></script>
	<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
							$("#btnMovie").click(function() {
								$("#myPage-movie-list").show();
								$("#myPage-movie-list-reser").hide();
								$(".movie-all-view").attr("href", "#");
							});
							$("#btnReserMovie").click(function() {
								$("#myPage-movie-list").hide();
								$("#myPage-movie-list-reser").show();
								$(".movie-all-view").attr("href", "#");
							});
							var movieChartSwiper = new Swiper(
									"#myPage-movie-list",
									{
										slidesPerView : 3,
										spaceBetween : 3,
										slidesPerGroup : 5,
										loopFillGroupWithBlank : true,
										navigation : {
											nextEl : ".swiper-button-next",
											prevEl : ".swiper-button-prev",
										},
										a11y : {
											prevSlideMessage : '이전 슬라이드',
											nextSlideMessage : '다음 슬라이드',
											slideLabelMessage : '총 {{slidesLength}}장의 슬라이드 중 {{index}}번 슬라이드 입니다.',
										},
									});
							var movieChartSwiper2 = new Swiper(
									"#myPage-movie-list-reser",
									{
										slidesPerView : 3,
										spaceBetween : 3,
										slidesPerGroup : 5,
										loopFillGroupWithBlank : true,
										navigation : {
											nextEl : ".swiper-button-next",
											prevEl : ".swiper-button-prev",
										},
										a11y : {
											prevSlideMessage : '이전 슬라이드',
											nextSlideMessage : '다음 슬라이드',
											slideLabelMessopenPopupage : '총 {{slidesLength}}장의 슬라이드 중 {{index}}번 슬라이드 입니다.',
										},
									});
							$("#myPage-movie-list-reser").hide(); //swiper 랜더링 완료 후 숨기기해야함
							var eventSwiper = new Swiper(
									".event_list",
									{
										autoplay : {
											delay : 2500,
											disableOnInteraction : false,
										},
										slidesPerView : 3,
										spaceBetween : 3,
										slidesPerGroup : 3,
										loopFillGroupWithBlank : true,
										navigation : {
											nextEl : ".swiper-button-next",
											prevEl : ".swiper-button-prev",
										},
										a11y : {
											prevSlideMessage : '이전 슬라이드',
											nextSlideMessage : '다음 슬라이드',
											slideLabelMessage : '총 {{slidesLength}}장의 슬라이드 중 {{index}}번 슬라이드 입니다.',
										},
									});
							if (eventSwiper.autoplay.running) {
								$('.btn_eventControl').addClass('active');
							}
							$('.btn_eventControl').on({click : function(e) {
									if (eventSwiper.autoplay.running) {
										$(this).removeClass('active');
										eventSwiper.autoplay.stop();
									} else {
										$(this).addClass('active');
										eventSwiper.autoplay.start();
									}
								}
							});
							$('.movie-chart-btn-wrap a').on({click : function(e) {
								var target = e.target;
								$(target).addClass('active').parent('h3').siblings().children('a').removeClass('active');
							 	}
							});
							$('.specialHall_list a').on({mouseenter : function(e) {
									var target = e.target;
									var idx = $(target).closest('li').index();
									var arrimgUrl = [	
														"https://img.cgv.co.kr//Front/Main/2021/1209/16390080561620.png",
														"https://img.cgv.co.kr//Front/Main/2021/1130/16382612659930.png",
														"https://img.cgv.co.kr//Front/Main/2021/1130/16382612660240.png",
														"https://img.cgv.co.kr//Front/Main/2021/1130/16382612660560.png" ];
	
									$(target).closest('li').addClass('active').siblings('li').removeClass('active');
									$('.specialHall_link img').attr('src',arrimgUrl[idx]);
									$('.specialHall_link img').attr('alt',$(target).children('strong').text());
								}
							});
							var movieSelectionVideoObj = $('.video_wrap video')[0];
							$('.video_wrap video').on({ended : function() {	
								$('.btn_movieSelection_playStop').removeClass('active');
								}
							});
							$('.btn_movieSelection_playStop').on({click : function() {
									if (movieSelectionVideoObj.paused) {
										movieSelectionVideoObj.play();
										$(this).addClass('active');
									} else {
										movieSelectionVideoObj.pause();
										$(this).removeClass('active');
									}
								}
							});
							$('.btn_movieSelection_soundOnOff').on({
								click : function() {
									if (movieSelectionVideoObj.muted) {
										movieSelectionVideoObj.muted = false;
										$(this).addClass('active');
									} else {
										movieSelectionVideoObj.muted = true;
										$(this).removeClass('active');
									}
								}
							});
							var noticeClientBannerSwiper = new Swiper(
									".noticeClient_banner_list", {
											autoplay : {
											delay : 2500,
											disableOnInteraction : false,
										},
										slidesPerView : 1,
										spaceBetween : 0,
										loopFillGroupWithBlank : true,
									});
							if (noticeClientBannerSwiper.autoplay.running) {
								$('.btn_noticeClientBannerControl').addClass('active');
							}
							$('.btn_noticeClientBannerControl').on({click : function(e) {
									if (noticeClientBannerSwiper.autoplay.running) {
										$(this).removeClass('active');
										noticeClientBannerSwiper.autoplay.stop();
									} else {
										$(this).addClass('active');
										noticeClientBannerSwiper.autoplay.start();
									}
								}
							});
							$.fn.openPopup = function(id) {
								var popObj = $('#' + id);
								popObj.parent('.pop_wrap').addClass('active');
								popObj.fadeIn();
								popObj.parent('.pop_wrap').on({click : function(e) {
										if (e.target === e.currentTarget) {
											$.fn.closePopup();
										}
									}
								});
								popObj.find('.btn_close').on({click : function(e) {
										$.fn.closePopup();
										}
								});
							};
							$.fn.closePopup = function() {
								$('.pop_wrap').removeClass('active');
								$('.popup').fadeOut();
							};
							const div = $("<div>").attr("class", "swiper-slide swiper-slide-movie swiper-slide-active")
							const imageDiv = $("<div>").attr("class","img-wrap").attr("data-scale","false")
							const titleImg = $("<img>").attr("src", "${pageContext.request.contextPath }/resources/images/")						
						});
	</script>
</head>
      <body class="">
        <div id="cgvwrap">
        	<jsp:include page="../default/user_header.jsp"></jsp:include>
        
               <!-- Contaniner -->
            <div id="contaniner" class="">
                <!-- Contents Area -->
                <div id="contents" class="">
                    <!-- Contents Start -->
                    <jsp:include page="../default/user_myPage_top.jsp"></jsp:include>
		<div class="myPage-cols-container">
                    <jsp:include page="../default/user_myPage_side.jsp"></jsp:include>
                  <div class="myPage-content-wrap">
                  <div class="myPage-table-wrap">
                  	<span><i class="fas fa-table me-1" style=" margin-right: 1%;"></i>나의 예매내역<button onclick="#" >내가본영화</button></span>
                  	<table class="myPage-table">
								<thead class="myPage-table-wrapping">
									<tr>
										<th>번호</th>
										<th>예매번호</th>
										<th>영화제목</th>
										<th>상영날짜</th>
										<th>가격</th>
										<th>구매날짜</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="userReserveList" items="${userReserveList}" varStatus="status">
										<tr>
											<td>${status.index +1 }</td>
											<td>${userReserveList.reserve_merchant_uid }</td>
											<td><a id="myPage-title" href="#">${userReserveList.movie_title}</a></td>
											<td>${userReserveList.reserve_movie_date }</td>
											<td>${userReserveList.fomatter_price }</td>
											<td>${userReserveList.reserve_date }</td>
										</tr>
									</c:forEach>						
								</tbody>
							</table>
									<div class="page-info-wrap">
								<div class="page-info-area">
									<ul id="pageInfo" class="pageInfo">
										<c:if test="${pageMake.prev}">
											<li class="pageInfo-btn previous"><a
												href="${pageMake.startPage-1}">Previous</a></li>
										</c:if>
										<c:forEach var="num" begin="${pageMake.startPage}"
											end="${pageMake.endPage}">
											<li class="pageInfo_btn ${pageMake.page.pageNum == num ? "active":""}"><a
												href="/myPage_reserve.do?pageNum=${num }&amount=${pageMake.page.amount }">${num}</a></li>
										</c:forEach>
										<c:if test="${pageMake.next}">
											<li class="pageInfo_btn next"><a
												href="${pageMake.endPage + 1}">Next</a></li>
										</c:if>
									</ul>
								</div>
							</div>
                  </div>
                 	<!-- swiper -->
				<!-- 1번 -->
				<div
					class="swiper swiper-container-initialized swiper-container-horizontal myPage-movie-list"
					id="myPage-movie-list">
					<div class="swiper-wrapper">
						<c:forEach var="movieList" items="${movieList}">
							<div class="swiper-slide swiper-slide-movie swiper-slide-active"
								style="width: 170px; margin-right: 32px;">
								<div class="img-wrap" data-scale="false">
									<img src="${movieList.movie_img }">
									<div class="movie-age-limit">
										<img
											src="${movieList.age_img }"
											alt="12세">
									</div>
									<div class="movie-hidden-btn">
										<a href="/movieDetail.do" class="movie-detail">"상세보기"</a> <a href="#"
											class="movie-ticketing">예매하기</a>
									</div>
								</div>
								<div class="movie-info-wrap">
									<strong class="movie-name">${movieList.movie_title }</strong>
									<span> 예매율 2.4% </span>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="swiper-button-next" tabindex="0" role="button"
						aria-label="다음 슬라이드" aria-disabled="false"></div>
					<div class="swiper-button-prev swiper-button-disabled" tabindex="0"
						role="button" aria-label="이전 슬라이드" aria-disabled="true"></div>
					<span class="swiper-notification" aria-live="assertive"
						aria-atomic="true"></span>
				</div>
                  </div>
               </div> 
                </div>
               
            </div>
          
        </div>
    
      <jsp:include page="../default/user_bottom_reserve.jsp"></jsp:include>
        <jsp:include page="../default/user_footer.jsp"></jsp:include>
</body>
</html>