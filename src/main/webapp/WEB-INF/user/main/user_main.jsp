<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>영화 그 이상적인 감동을</title>
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
								$("#movie-list").show();
								$("#movie-list-reser").hide();
								$(".movie-all-view").attr("href", "#");
							});
							$("#btnReserMovie").click(function() {
								$("#movie-list").hide();
								$("#movie-list-reser").show();
								$(".movie-all-view").attr("href", "#");
							});
							var movieChartSwiper = new Swiper(
									"#movie-list",
									{
										slidesPerView : 5,
										spaceBetween : 32,
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
									"#movie-list-reser",
									{
										slidesPerView : 5,
										spaceBetween : 32,
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
							$("#movie-list-reser").hide(); //swiper 랜더링 완료 후 숨기기해야함
							var eventSwiper = new Swiper(
									".event_list",
									{
										autoplay : {
											delay : 2500,
											disableOnInteraction : false,
										},
										slidesPerView : 3,
										spaceBetween : 24,
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
		

						function reservePage(movieNum){
							var form = document.createElement('form');
							var objs;
							objs =document.createElement('input')
							objs.setAttribute('type','text')
							objs.setAttribute('name','movie_num')
							objs.setAttribute('value',movieNum)
							form.appendChild(objs)
							form.setAttribute('method','post')
							form.setAttribute('action','/movieReserve.do')
							document.body.appendChild(form)
							form.submit()	
						}
	</script>
	<style type="text/css">
		video {
    			width: 104%;
   				box-sizing: border-box;
    			height: 100%;
		}
	</style>
</head>
<body class="block">
	<jsp:include page="../default/user_header.jsp"></jsp:include>
	<!--본격 콘텐츠-->
	<!--영상 콘텐츠-->
	<div class="container">
		<div class="movie-wrap">
			<div class="contents">
				<div class="video-wrap">
					<video autoplay muted loop>
						<source
							src="https://dgvworld.s3.ap-northeast-2.amazonaws.com/movie.mp4"
							type="video/mp4" >
					</video>
					<strong class="movie-title">스파이더맨: 노 웨이 홈 </strong> <span
						class="movie-txt">Spider-Man<br>
						: No Way Home
					</span>
				</div>
			</div>
		</div>

		<!--무비 차트 콘텐츠!!!-->
		<div class="movie-chart-wrap">
			<div class="contents">
				<div class="movie-chart-btn-wrap">
					<div class="chart-name-wrap">
						<h3>
							<a href="/movieChart.do" class="active" id="btnMovie"
								style="font-weight: bold; font-size: 31px;">Movie List</a>
						</h3>
						<h3>
							<a href="#" id="btnNextMovie" style="font-size: 30px;">상영예정작</a>
						</h3>
					</div>
					<a href="/movieChart.do" class="movie-all-view">전체보기</a>
				</div>
				<!-- swiper -->
				<!-- 1번 -->
				<div
					class="swiper swiper-container-initialized swiper-container-horizontal movie-list"
					id="movie-list">
					<div class="swiper-wrapper">
						<c:forEach var="movieList" items="${movieList}">
							<div class="swiper-slide swiper-slide-movie swiper-slide-active"
								style="width: 170px; margin-right: 32px;">
								<div class="img-wrap" data-scale="false">
									<img
										src="${movieList.movie_img}"
										alt="제목란인데ㅠ">
									<div class="movie-age-limit">
										<img
											src="${movieList.age_img }"
											alt="12세">
									</div>
									<div class="movie-hidden-btn">
										<a href="/movieDetail.do?movie_num=${movieList.movie_num}"${movieList.movie_num})" class="movie-detail">"상세보기"</a> 
										<a onclick="reservePage(${movieList.movie_num})" class="movie-ticketing">예매하기</a>
									</div>
								</div>
								<div class="movie-info-wrap">
									<strong class="movie-name">${movieList.movie_title }</strong> 
									<c:if test="${empty movieList.reservationRate }">
										<span><img class="star-style"
											src="https://dgvworld.s3.ap-northeast-2.amazonaws.com/starpreview.png"> 예매율 0 %</span>
									</c:if>
									<c:if test="${!empty movieList.reservationRate }">
										<span><img class="star-style"
											src="https://dgvworld.s3.ap-northeast-2.amazonaws.com/starpreview.png"> 예매율 ${movieList.reservationRate } %</span>
									</c:if>
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
		<!--이벤트!!!!!-->
		<div id="ctl00_PlaceHolderContent_event_wrap" class="event_wrap">
			<div class="contents">
				<div class="event_title_wrap">
					<h3>EVENT</h3>
					<a href="#" class="btn_allView">전체보기</a> <a href="/event.do"
						class="btn_eventControl">playStop</a>
				</div>
				<div class="event_list_wrap">
					<div
						class="swiper event_list swiper-container-initialized swiper-container-horizontal">
						<div class="swiper-wrapper"
							style="transition-duration: 300ms; transform: translate3d(-1004px, 0px, 0px);">
							<c:forEach var="eventList" items="${eventList }" varStatus="status">
								<div class="swiper-slide"
									style="width: 310.667px; margin-right: 24px;">
									<a href="eventDetail.do?event_code=${eventList.event_code}">
										<div class="img_wrap">
											<img src="${eventList.event_img }">
										</div> <strong>${eventList.event_title }</strong> <span>${eventList.start_date } ~ ${eventList.end_date }</span>
									</a>
								</div>	
							</c:forEach>			
						</div>
						<div class="swiper-button-next" tabindex="0" role="button"
							aria-label="다음 슬라이드" aria-disabled="false"></div>
						<div class="swiper-button-prev" tabindex="0" role="button"
							aria-label="이전 슬라이드" aria-disabled="false"></div>
						<span class="swiper-notification" aria-live="assertive"
							aria-atomic="true"></span>
					</div>
				</div>
			</div>
		</div>
		<!--공지사항!!!!!!!!!!!!!!!!!-->
		<div class="noticeClient_wrap">
			<div class="contents">
				<div class="noticeClient_container">
					<div class="noticeClient_content">
						<div id="ctl00_PlaceHolderContent_notice_wrap" class="notice_wrap">
							<strong>공지사항</strong> <a href="/notice.do" class="btn_more">더보기</a>
						</div>
						<div class="client_wrap">
							<dl class="client_list">
								<dt>
									<strong>고객센터</strong>
								</dt>
								<dd>
									<strong>1544-1122</strong> <span> "고객센터 운영기관(평일
										09:00~12:00)"
										<p>업무끝</p>
									</span>
								</dd>
							</dl>
							<div class="client_btn_wrap">
								<c:if test="${empty userID }">
									<a href="/oftenQna.do">FAQ</a> <a href="/loginForm.do">1:1 문의</a>							
								</c:if>
								<c:if test="${!empty userID }">
									<a href="/oftenQna.do">FAQ</a> <a href="/myQna.do">1:1 문의</a>
								</c:if>
							</div>
						</div>
					</div>
					<div class="qr_wrap">
						<strong>앱 다운로드</strong> <span>DGV앱 </span>
						<div class="img_wrap" data-scale="false">
							<img
								src="${pageContext.request.contextPath }/resources/images/mainQr.png"
								alt="code">
						</div>
						<p>
							"????????????" <br> "!!!!!!!!!!!!!!!"
						</p>
					</div>
				</div>
				<div class="noticeClient_banner_wrap">
					<div
						class="swiper noticeClient_banner_list swiper-container-initialized swiper-container-horizontal">
						<div class="swiper-wrapper"
							style="transform: translate3d(0px, 0px, 0px); transition-duration: 0ms;">
							<div class="swiper-slide swiper-slide-active"
								style="width: 211px;">
								<a href="#"> <img
									src="https://dgvworld.s3.ap-northeast-2.amazonaws.com/banner1.jpg">
								</a>
							</div>

						</div>
						<span class="swiper-notification" aria-live="assertive"
							aria-atomic="true"></span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--close .container-->
	<jsp:include page="../default/user_bottom_reserve.jsp"></jsp:include>
	<!--footer!!!!!!!!!!-->
	<jsp:include page="../default/user_footer.jsp"></jsp:include>

</body>

</html>