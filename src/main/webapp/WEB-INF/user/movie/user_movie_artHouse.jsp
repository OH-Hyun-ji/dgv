<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" type="image/png" sizes="192x192"  href="${pageContext.request.contextPath }/resources/images/banana_real.png">
	<meta charset="UTF-8">
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/button.css">
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/reset.css">
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/layout.css">
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/movieTheater.css">
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
		.swiper-button-next {
		    right: -13px !important;
		}
		.swiper-button-prev {
		    left: -12px !important;
		}
		.w-btn:hover {
		   transform: none!important;
		}
		.img-wrap:before {
   			background-image: none!important;
   			 border-radius: none!important;
		}	
		.img-wrap > img {
			height: 100%!important;
		}
		.fixedBtn_wrap.topBtn {
		    display: block!important;
		}
		
	</style>
</head>
<body class="block">
	<jsp:include page="../default/user_header.jsp"/>	
	<div id="contaniner" class="">
		<div id="contents" class="">
			<div class="wrap-movie-collage">
				<div class="tit-heading-wrap">
					<h3 style="margin-top: 1%;">아트하우스</h3>
					<a href="#" class="link-question" id="btn_aboutCollage"
						title="아트하우스란?"></a>
					<div class="submenu">
						<ul>
							<li class="on"><a href="#" title="현재 선택">HOME</a></li>
							<li><a href="#">영화</a></li>
							<li><a href="#">톡프로그램</a></li>
						</ul>
					</div>
				</div>
				<div class="sect-arthouse-visual">
					<a href="#"> 
					<img src="https://dgvworld.s3.ap-northeast-2.amazonaws.com/KakaoTalk_20220220_175402868.png">
					</a>
				</div>
				<div class="wrap-collage-chart">
					<h3>
						<img src="https://dgvworld.s3.ap-northeast-2.amazonaws.com/now-showing.png" alt="now showing">
					</h3>
					<div class="sect-collage-chart">
						<h4 class="hidden"></h4>
							<div
					class="swiper swiper-container-initialized swiper-container-horizontal movie-list"
					id="movie-list">
					<div class="swiper-wrapper">
						<c:forEach var="artHouseList" items="${artHouseList}">
							<div class="swiper-slide swiper-slide-movie swiper-slide-active"
								style="width: 170px; margin-right: 32px;">
								<div class="img-wrap" data-scale="false" style="border-radius: none;">
									<img
										src="${artHouseList.movie_img}"
										alt="제목란인데ㅠ">
						
									<div class="movie-hidden-btn">
										<a href="/movieDetail.do?movie_num=${artHouseList.movie_num}"${artHouseList.movie_num})" class="movie-detail">"상세보기"</a> 
										<a onclick="reservePage(${artHouseList.movie_num})" class="movie-ticketing">예매하기</a>
									</div>
								</div>
								<div class="movie-info-wrap">
									<strong class="movie-name">${artHouseList.movie_title }</strong> 
									<span> <img class="star-style"
											src="https://dgvworld.s3.ap-northeast-2.amazonaws.com/starpreview.png">
											10%
									</span> <span> 예매율 2.4% </span>
								</div>
								 <span class="like" style=" text-align-last: center;">
										<button class="w-btn w-btn-gra3 w-btn-gra-anim"style="padding: 9px 8px; box-shadow: none;" onclick="reservePage(${artHouseList.movie_num})">예매하기</button>
                                </span>
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
					<!-- .sect-collage-chart -->
					<a class="link-more" href="./movies.aspx">영화 차트 자세히보기</a>
				</div>
				<!-- .wrap-collage-chart -->

				<!-- WEEKLY PLAN -->


				<div class="sect_art_hd_trailer cf">
					<div class="thumb">
						<h3>
							<a href="#"> <img src="https://dgvworld.s3.ap-northeast-2.amazonaws.com/artHouse_trailer_banner.jpg"
								alt="CGV 아트하우스 한국 영화인 헌정 프로젝트 The Respect - CGV 아트하우스 한국영화인 헌정 프로젝트는 한국 영화의 위상을 높인 영화인에게 존경과 감사의 마음으로 상영관을 헌정하고 헌정인의 업적을 조명하는 프로젝트입니다.">
							</a>
						</h3>
					</div>
					<div class="player_area">
						<script type="text/javascript">
							function artHouseVideo(){
								var popupX = (window.screen.width+100) - (200 / 2);
								
								var popupY= (window.screen.height/2)-(800/2) ;
								
								window.open('/arthouseVideo.do', '', 'status=no, height=800, width=1100, left='+ popupX + ', bottom='+ popupY);
							}
								</script>
						<a href="#" title="닮은 역사 예고편 트레일러 영상보기(새창열림)"
							class="movie_player_popup" data-gallery-idx="190327"> <span
							class="thumb-image"
							style="background-image: url(https://dgvworld.s3.ap-northeast-2.amazonaws.com/artHouse_Trailer.jpg);" onclick='artHouseVideo()'>
								<span>닮은 역사 예고편 트레일러</span> <span class="ico-play">
									<i class="ico-play fas fa-play-circle"></i>
								</span>
						</span>
						</a>

					</div>

				</div>

				<div class="sect-talkprogram cf">
					<h3>
						<img src="https://dgvworld.s3.ap-northeast-2.amazonaws.com/talk_program.gif" alt="TALK PROGRAM">
					</h3>
					<div class="program_list type3">
						<ul>
							<img src="https://dgvworld.s3.ap-northeast-2.amazonaws.com/12313123312.png">
						</ul>
					</div>
					<div class="program_desc def cf">
						<div class="col1">
							<h4>클래스 프로그램</h4>
							<ul>
								<li class="oddnum"><img
									src="https://img.cgv.co.kr/R2014/images/arthouse/desc_talk_programre1_1.png"
									alt="CGV 시네마 클래스 : 대학생 대상  입문 영화강좌로  창작, 산업, 평론 등 각 분야의 전문가들이 강의">
								</li>
								<li><img
									src="https://img.cgv.co.kr/R2014/images/arthouse/desc_talk_programre1_2.png"
									alt="KAFA+ 마스터클래스 : 봉준호, 김태용 등 명감독을 배출한 한국영화아카데미(KAFA)와 함께 연출, 연기, 촬영 등 각 분야 마스터를 초빙해 강연 및 특별전을 개최">
								</li>
							</ul>
						</div>
						<div class="col2">
							<h4>기획전·영화제</h4>
							<ul>
								<li class="oddnum"><img
									src="https://img.cgv.co.kr/R2014/images/arthouse/desc_talk_programre2_1.png"
									alt="김혜리의 월간 배우 : 매월 국내외 명배우 1명을 선정하여 대표작을 특별 상영하는 기획전">
								</li>
								<li><img
									src="https://img.cgv.co.kr/R2014/images/arthouse/desc_talk_programre2_2.png"
									alt="아트하우스 DAY : 매월 화제의 독립.예술영화 1편을 선정하여 전국 CGV 40여개 극장에서 동시에 1회 특별 상영. 매월 첫째주 화요일 20시 진행">
								</li>
								<li class="oddnum"><img
									src="https://img.cgv.co.kr/R2014/images/arthouse/desc_talk_programre2_3.png"
									alt="주문형극장 TOD : ‘관객이 모여 극장을 여는’ 차별화된 기획전. 관객들의 온라인 투표를 통해 선정된 영화를 상영">
								</li>
								<li><img
									src="https://img.cgv.co.kr/R2014/images/arthouse/desc_talk_programre2_4.png"
									alt="이상용의 영화독서 : 영화가 품은 원작의 세계를 읽어보고 원작을 통한 영화의 확장을 경험하는 책과 영화의 만남">
								</li>
								<li class="oddnum"><img
									src="https://img.cgv.co.kr/R2014/images/arthouse/desc_talk_programre2_5.png"
									alt="이다혜의 북클럽 : 고전에서 최신 장르 소설까지 풍부한 설명과 낭독이 함께하는 넓고도 깊이 있는 전천후 책 읽기">
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!--/ Contents End -->
		</div>
		<!-- /Contents Area -->
	</div>
	<jsp:include page="../default/user_bottom_reserve.jsp"></jsp:include>
	<jsp:include page="../default/user_footer.jsp"></jsp:include>
</body>
</html>