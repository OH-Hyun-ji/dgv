<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>영화 그 이상적인 감동을</title>

<link type="text/css" rel="stylesheet" 
href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/user/swiper-bundle.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Dongle:wght@700&display=swap"
	rel="stylesheet">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/user/swiper.min.js"></script>
<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>

<script type="text/javascript">
	$(document)
			.ready(
					function() {

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

						$('.btn_eventControl').on({
							click : function(e) {
								if (eventSwiper.autoplay.running) {
									$(this).removeClass('active');
									eventSwiper.autoplay.stop();
								} else {
									$(this).addClass('active');
									eventSwiper.autoplay.start();
								}
							}
						});

						$('.movie-chart-btn-wrap a').on(
								{
									click : function(e) {
										var target = e.target;
										$(target).addClass('active').parent(
												'h3').siblings().children('a')
												.removeClass('active');
									}
								});

						$('.specialHall_list a')
								.on(
										{
											mouseenter : function(e) {
												var target = e.target;
												var idx = $(target).closest(
														'li').index();

												var arrimgUrl = [
														"https://img.cgv.co.kr//Front/Main/2021/1209/16390080561620.png",
														"https://img.cgv.co.kr//Front/Main/2021/1130/16382612659930.png",
														"https://img.cgv.co.kr//Front/Main/2021/1130/16382612660240.png",
														"https://img.cgv.co.kr//Front/Main/2021/1130/16382612660560.png" ];

												$(target).closest('li')
														.addClass('active')
														.siblings('li')
														.removeClass('active');
												//$('.specialHall_link').attr('href', '') // 링크 주소 넣을 곳
												$('.specialHall_link img')
														.attr('src',
																arrimgUrl[idx]);
												$('.specialHall_link img')
														.attr(
																'alt',
																$(target)
																		.children(
																				'strong')
																		.text());
											}
										});

						var movieSelectionVideoObj = $('.video_wrap video')[0];

						$('.video_wrap video').on(
								{
									ended : function() {
										$('.btn_movieSelection_playStop')
												.removeClass('active');
									}
								})
						// movieSelectionVideoObj.onended = function(){

						// }

						$('.btn_movieSelection_playStop').on({
							click : function() {
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
							$('.btn_noticeClientBannerControl').addClass(
									'active');
						}

						$('.btn_noticeClientBannerControl').on({
							click : function(e) {
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

							popObj.parent('.pop_wrap').on({
								click : function(e) {
									if (e.target === e.currentTarget) {
										$.fn.closePopup();
									}
								}
							});
							popObj.find('.btn_close').on({
								click : function(e) {
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
						
// 						<div class="swiper-slide swiper-slide-movie swiper-slide-active"
// 							style="width: 170px; margin-right: 32px;">
// 							<div class="img-wrap" data-scale="false">
// 								<img
// 									src="${pageContext.request.contextPath }/resources/images/85229_320.jpg"
// 									alt="제목란인데ㅠ">
// 								<div class="movie-age-limit">
// 									<img
// 										src="${pageContext.request.contextPath }/resources/images/grade-15.png"
// 										alt="12세">
// 								</div>
// 								<div class="movie-hidden-btn">
// 									<a href="#" class="movie-detail">"상세보기"</a> <a href--="#"
// 										class="movie-ticketing">예매하기</a>
// 								</div>
// 							</div>
// 							<div class="movie-info-wrap">
// 								<strong class="movie-name">바나나나</strong> <span> <img
// 									src="${pageContext.request.contextPath }/resources/images/star.png">
// 									10%
// 								</span> <span> 예매율 2.4% </span>
// 							</div>
// 						</div>
						
					});
</script>

</head>
<body class="block">
	<jsp:include page="../default/user_header.jsp"></jsp:include>
	<!--본격 콘텐츠-->
	<!--영상 콘텐츠-->
	<div class="container">
		<div class="movie-wrap">
			<div class="contents">
				<div class="video-wrap">
					<video autoplay muted>
						<source
							src="${pageContext.request.contextPath }/resources/video/01_01.mp4"
							type="video/mp4">
					</video>
					<strong class="movie-title"> movie-title </strong> <span
						class="movie-txt"> movie-sub-txt-1 <br>
						movie-sub-txt-2
					</span>
					<div class="movie-wrap-controller">
						<a class="movie-detail-btn" href="#">상세보기</a> <a
							class="movie-stop-btn" href="#">stop</a> <a
							class="movie-sound-off-btn" href="#">soundOn</a>
					</div>

				</div>
			</div>
		</div>

		<!--무비 차트 콘텐츠!!!-->
		<div class="movie-chart-wrap">
			<div class="contents">
				<div class="movie-chart-btn-wrap">
					<div class="chart-name-wrap">
						<h3>
							<a href="#" class="active" id="btnMovie"
								style="font-weight: bold; font-size: 31px;">무비차트</a>
						</h3>
						<h3>
							<a href="#" id="btnNextMovie" style="font-size: 30px;">상영예정작</a>
						</h3>
					</div>
					<a href="#" class="movie-all-view">전체보기</a>
				</div>
				<!-- swiper -->
				<!-- 1번 -->
				<div
					class="swiper swiper-container-initialized swiper-container-horizontal movie-list"
					id="movie-list">
					<div class="swiper-wrapper">
						<div class="swiper-slide swiper-slide-movie swiper-slide-active"
							style="width: 170px; margin-right: 32px;">
							<div class="img-wrap" data-scale="false">
								<img
									src="${pageContext.request.contextPath }/resources/images/84949_320.jpg"
									alt="제목란인데ㅠ">
								<div class="movie-age-limit">
									<img
										src="${pageContext.request.contextPath }/resources/images/grade-12.png"
										alt="12세">
								</div>
								<div class="movie-hidden-btn">
									<a href="#" class="movie-detail">"상세보기"</a> <a href--="#"
										class="movie-ticketing">예매하기</a>
								</div>
							</div>
							<div class="movie-info-wrap">
								<strong class="movie-name">바나나나</strong> <span> <img
									src="${pageContext.request.contextPath }/resources/images/star.png">
									10%
								</span> <span> 예매율 2.4% </span>
							</div>
						</div>
						<!-- 2번 -->
						<div class="swiper-slide swiper-slide-movie swiper-slide-active"
							style="width: 170px; margin-right: 32px;">
							<div class="img-wrap" data-scale="false">
								<img
									src="${pageContext.request.contextPath }/resources/images/85229_320.jpg"
									alt="제목란인데ㅠ">
								<div class="movie-age-limit">
									<img
										src="${pageContext.request.contextPath }/resources/images/grade-15.png"
										alt="12세">
								</div>
								<div class="movie-hidden-btn">
									<a href="#" class="movie-detail">"상세보기"</a> <a href--="#"
										class="movie-ticketing">예매하기</a>
								</div>
							</div>
							<div class="movie-info-wrap">
								<strong class="movie-name">바나나나</strong> <span> <img
									src="${pageContext.request.contextPath }/resources/images/star.png">
									10%
								</span> <span> 예매율 2.4% </span>
							</div>
						</div>
						<!-- 3번 -->
						<div class="swiper-slide swiper-slide-movie swiper-slide-active"
							style="width: 170px; margin-right: 32px;">
							<div class="img-wrap" data-scale="false">
								<img
									src="${pageContext.request.contextPath }/resources/images/85229_320.jpg"
									alt="제목란인데ㅠ">
								<div class="movie-age-limit">
									<img
										src="${pageContext.request.contextPath }/resources/images/grade-15.png"
										alt="12세">
								</div>
								<div class="movie-hidden-btn">
									<a href="#" class="movie-detail">"상세보기"</a> <a href--="#"
										class="movie-ticketing">예매하기</a>
								</div>
							</div>
							<div class="movie-info-wrap">
								<strong class="movie-name">바나나나</strong> <span> <img
									src="${pageContext.request.contextPath }/resources/images/star.png">
									10%
								</span> <span> 예매율 2.4% </span>
							</div>
						</div>
						<!-- 4번 -->
						<div class="swiper-slide swiper-slide-movie swiper-slide-active"
							style="width: 170px; margin-right: 32px;">
							<div class="img-wrap" data-scale="false">
								<img
									src="${pageContext.request.contextPath }/resources/images/84949_320.jpg"
									alt="제목란인데ㅠ">
								<div class="movie-age-limit">
									<img
										src="${pageContext.request.contextPath }/resources/images/grade-all.png"
										alt="12세">
								</div>
								<div class="movie-hidden-btn">
									<a href="#" class="movie-detail">"상세보기"</a> <a href--="#"
										class="movie-ticketing">예매하기</a>
								</div>
							</div>
							<div class="movie-info-wrap">
								<strong class="movie-name">바나나나</strong> <span> <img
									src="${pageContext.request.contextPath }/resources/images/star.png">
									10%
								</span> <span> 예매율 2.4% </span>
							</div>
						</div>
						<!-- 5번 -->
						<div class="swiper-slide swiper-slide-movie swiper-slide-active"
							style="width: 170px; margin-right: 32px;">
							<div class="img-wrap" data-scale="false">
								<img
									src="${pageContext.request.contextPath }/resources/images/84949_320.jpg"
									alt="제목란인데ㅠ">
								<div class="movie-age-limit">
									<img
										src="${pageContext.request.contextPath }/resources/images/grade-all.png"
										alt="12세">
								</div>
								<div class="movie-hidden-btn">
									<a href="#" class="movie-detail">"상세보기"</a> <a href--="#"
										class="movie-ticketing">예매하기</a>
								</div>
							</div>
							<div class="movie-info-wrap">
								<strong class="movie-name">바나나나</strong> <span> <img
									src="${pageContext.request.contextPath }/resources/images/star.png">
									10%
								</span> <span> 예매율 2.4% </span>
							</div>
						</div>
						<!-- 6번 -->
						<div class="swiper-slide swiper-slide-movie swiper-slide-active"
							style="width: 170px; margin-right: 32px;">
							<div class="img-wrap" data-scale="false">
								<img
									src="${pageContext.request.contextPath }/resources/images/1.png"
									alt="제목란인데ㅠ">
								<div class="movie-age-limit">
									<img
										src="${pageContext.request.contextPath }/resources/images/grade-12.png"
										alt="12세">
								</div>
								<div class="movie-hidden-btn">
									<a href="#" class="movie-detail">"상세보기"</a> <a href--="#"
										class="movie-ticketing">예매하기</a>
								</div>
							</div>
							<div class="movie-info-wrap">
								<strong class="movie-name">바나나나12</strong> <span> <img
									src="${pageContext.request.contextPath }/resources/images/star.png">
									10%
								</span> <span> 예매율 2.4% </span>
							</div>
						</div>
						<!-- 7번 -->
						<div class="swiper-slide swiper-slide-movie swiper-slide-active"
							style="width: 170px; margin-right: 32px;">
							<div class="img-wrap" data-scale="false">
								<img
									src="${pageContext.request.contextPath }/resources/images/1.png"
									alt="제목란인데ㅠ">
								<div class="movie-age-limit">
									<img
										src="${pageContext.request.contextPath }/resources/images/grade-15.png"
										alt="12세">
								</div>
								<div class="movie-hidden-btn">
									<a href="#" class="movie-detail">"상세보기"</a> <a href--="#"
										class="movie-ticketing">예매하기</a>
								</div>

							</div>

							<div class="movie-info-wrap">
								<strong class="movie-name">바나나나11</strong> <span> <img
									src="${pageContext.request.contextPath }/resources/images/star.png">
									10%
								</span> <span> 예매율 2.4% </span>
							</div>
						</div>
					</div>
					<div class="swiper-button-next" tabindex="0" role="button"
						aria-label="다음 슬라이드" aria-disabled="false"></div>
					<div class="swiper-button-prev swiper-button-disabled" tabindex="0"
						role="button" aria-label="이전 슬라이드" aria-disabled="true"></div>
					<span class="swiper-notification" aria-live="assertive"
						aria-atomic="true"></span>
				</div>
				<div
					class="swiper swiper-container-initialized swiper-container-horizontal movie-list"
					id="movie-list-reser" style="display: none;">
					<div class="swiper-wrapper">
						<div class="swiper-slide swiper-slide-movie swiper-slide-active"
							style="width: 170px; margin-right: 32px;">
							<div class="img-wrap" data-scale="false">
								<img
									src="${pageContext.request.contextPath }/resources/images/1.png"
									alt="제목란인데ㅠ">
								<div class="movie-age-limit">
									<img
										src="${pageContext.request.contextPath }/resources/images/grade-19.png"
										alt="12세">
								</div>
								<div class="movie-hidden-btn">
									<a href="#" class="movie-detail">"상세보기"</a> <a href--="#"
										class="movie-ticketing">예매하기</a>
								</div>
							</div>
							<div class="movie-info-wrap">
								<strong class="movie-name">바나나나</strong> <span> <img
									src="${pageContext.request.contextPath }/resources/images/star.png">
									10%
								</span> <span> 예매율 2.4% </span>
							</div>
						</div>
						<!-- 2번 -->
						<div class="swiper-slide swiper-slide-movie swiper-slide-active"
							style="width: 170px; margin-right: 32px;">
							<div class="img-wrap" data-scale="false">
								<img
									src="${pageContext.request.contextPath }/resources/images/1.png"
									alt="제목란인데ㅠ">
								<div class="movie-age-limit">
									<img
										src="${pageContext.request.contextPath }/resources/images/grade-19.png"
										alt="12세">
								</div>
								<div class="movie-hidden-btn">
									<a href="#" class="movie-detail">"상세보기"</a> <a href--="#"
										class="movie-ticketing">예매하기</a>
								</div>
							</div>
							<div class="movie-info-wrap">
								<strong class="movie-name">바나나나</strong> <span> <img
									src="${pageContext.request.contextPath }/resources/images/star.png">
									10%
								</span> <span> 예매율 2.4% </span>
							</div>
						</div>
						<!-- 3번 -->
						<div class="swiper-slide swiper-slide-movie swiper-slide-active"
							style="width: 170px; margin-right: 32px;">
							<div class="img-wrap" data-scale="false">
								<img
									src="${pageContext.request.contextPath }/resources/images/1.png"
									alt="제목란인데ㅠ">
								<div class="movie-age-limit">
									<img
										src="${pageContext.request.contextPath }/resources/images/grade-all.png"
										alt="12세">
								</div>
								<div class="movie-hidden-btn">
									<a href="#" class="movie-detail">"상세보기"</a> <a href--="#"
										class="movie-ticketing">예매하기</a>
								</div>
							</div>
							<div class="movie-info-wrap">
								<strong class="movie-name">바나나나</strong> <span> <img
									src="${pageContext.request.contextPath }/resources/images/star.png">
									10%
								</span> <span> 예매율 2.4% </span>
							</div>
						</div>
						<!-- 4번 -->
						<div class="swiper-slide swiper-slide-movie swiper-slide-active"
							style="width: 170px; margin-right: 32px;">
							<div class="img-wrap" data-scale="false">
								<img
									src="${pageContext.request.contextPath }/resources/images/1.png"
									alt="제목란인데ㅠ">
								<div class="movie-age-limit">
									<img
										src="${pageContext.request.contextPath }/resources/images/grade-12.png"
										alt="12세">
								</div>
								<div class="movie-hidden-btn">
									<a href="#" class="movie-detail">"상세보기"</a> <a href--="#"
										class="movie-ticketing">예매하기</a>
								</div>
							</div>
							<div class="movie-info-wrap">
								<strong class="movie-name">바나나나</strong> <span> <img
									src="${pageContext.request.contextPath }/resources/images/star.png">
									10%
								</span> <span> 예매율 2.4% </span>
							</div>
						</div>
						<!-- 5번 -->
						<div class="swiper-slide swiper-slide-movie swiper-slide-active"
							style="width: 170px; margin-right: 32px;">
							<div class="img-wrap" data-scale="false">
								<img
									src="${pageContext.request.contextPath }/resources/images/1.png"
									alt="제목란인데ㅠ">
								<div class="movie-age-limit">
									<img
										src="${pageContext.request.contextPath }/resources/images/grade-12.png"
										alt="12세">
								</div>
								<div class="movie-hidden-btn">
									<a href="#" class="movie-detail">"상세보기"</a> <a href--="#"
										class="movie-ticketing">예매하기</a>
								</div>
							</div>
							<div class="movie-info-wrap">
								<strong class="movie-name">바나나나</strong> <span> <img
									src="${pageContext.request.contextPath }/resources/images/star.png">
									10%
								</span> <span> 예매율 2.4% </span>
							</div>
						</div>
						<!-- 6번 -->
						<div class="swiper-slide swiper-slide-movie swiper-slide-active"
							style="width: 170px; margin-right: 32px;">
							<div class="img-wrap" data-scale="false">
								<img
									src="${pageContext.request.contextPath }/resources/images/1.png"
									alt="제목란인데ㅠ">
								<div class="movie-age-limit">
									<img
										src="${pageContext.request.contextPath }/resources/images/grade-12.png"
										alt="12세">
								</div>
								<div class="movie-hidden-btn">
									<a href="#" class="movie-detail">"상세보기"</a> <a href--="#"
										class="movie-ticketing">예매하기</a>
								</div>
							</div>
							<div class="movie-info-wrap">
								<strong class="movie-name">바나나나12</strong> <span> <img
									src="${pageContext.request.contextPath }/resources/images/star.png">
									10%
								</span> <span> 예매율 2.4% </span>
							</div>
						</div>
						<!-- 7번 -->
						<div class="swiper-slide swiper-slide-movie swiper-slide-active"
							style="width: 170px; margin-right: 32px;">
							<div class="img-wrap" data-scale="false">
								<img
									src="${pageContext.request.contextPath }/resources/images/1.png"
									alt="제목란인데ㅠ">
								<div class="movie-age-limit">
									<img
										src="${pageContext.request.contextPath }/resources/images/grade-15.png"
										alt="12세">
								</div>
								<div class="movie-hidden-btn">
									<a href="#" class="movie-detail">"상세보기"</a> <a href--="#"
										class="movie-ticketing">예매하기</a>
								</div>
							</div>
							<div class="movie-info-wrap">
								<strong class="movie-name">바나나나11</strong> <span> <img
									src="${pageContext.request.contextPath }/resources/images/star.png">
									10%
								</span> <span> 예매율 2.4% </span>
							</div>
						</div>
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
					<a href="#" class="btn_allView">전체보기</a> <a href="#"
						class="btn_eventControl">playStop</a>
				</div>
				<div class="event_list_wrap">
					<div
						class="swiper event_list swiper-container-initialized swiper-container-horizontal">
						<div class="swiper-wrapper"
							style="transition-duration: 300ms; transform: translate3d(-1004px, 0px, 0px);">
							<div class="swiper-slide"
								style="width: 310.667px; margin-right: 24px;">
								<a href="#">
									<div class="img_wrap">
										<img
											src="https://dgvworld.s3.ap-northeast-2.amazonaws.com/event3.jpg"
											alt="신년맞이??" onerror="errorImage(this)">
									</div> <strong>신년맞이!! dgv챌린지</strong> <span>2022.01.25~2022.02.13</span>
								</a>
							</div>
							<div class="swiper-slide"
								style="width: 310.667px; margin-right: 24px;">
								<a href="#">
									<div class="img_wrap">
										<img
											src="https://dgvworld.s3.ap-northeast-2.amazonaws.com/event2.jpg"
											alt="신년맞이??" onerror="errorImage(this)">
									</div> <strong>신년맞이!! dgv챌린지</strong> <span>2022.01.25~2022.02.13</span>
								</a>
							</div>
							<div class="swiper-slide"
								style="width: 310.667px; margin-right: 24px;">
								<a href="#">
									<div class="img_wrap">
										<img
											src="https://dgvworld.s3.ap-northeast-2.amazonaws.com/event3.jpg"
											alt="신년맞이??" onerror="errorImage(this)">
									</div> <strong>신년맞이!! dgv챌린지</strong> <span>2022.01.25~2022.02.13</span>
								</a>
							</div>
							<div class="swiper-slide"
								style="width: 310.667px; margin-right: 24px;">
								<a href="#">
									<div class="img_wrap">
										<img
											src="https://dgvworld.s3.ap-northeast-2.amazonaws.com/event2.jpg"
											alt="신년맞이??" onerror="errorImage(this)">
									</div> <strong>신년맞이!! dgv챌린지</strong> <span>2022.01.25~2022.02.13</span>
								</a>
							</div>
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
							<strong>공지사항</strong> <a href="#" class="btn_more">더보기</a>
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
								<a href="#">FAQ</a> <a href="#">1:1 문의</a> <a href="#">분실물
									문의</a> <a href="#">대관/단체 문의</a>
							</div>
						</div>
					</div>
					<div class="qr_wrap">
						<strong>앱 다운로드</strong> <span>dgv앱 </span>
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
							<div></div>
						</div>
						<span class="swiper-notification" aria-live="assertive"
							aria-atomic="true"></span>
					</div>
					<a href="#" class="btn_noticeClientBannerControl">playStop</a>
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