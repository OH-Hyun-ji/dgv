<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
						<ol>

							<li>
								<div class="box-image">
									<a href="#"><span class="thumb-image"><img
											src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85633/85633_320.jpg"
											alt="굿 보스" onerror="errorImage(this)"><span
											class="ico-grade grade-15">15세 이상</span></span></a><span
										class="screentype"> <a class="arthouse" href="#"
										title="아트하우스 상세정보 바로가기" data-regioncode="MovieCollage">아트하우스</a>

									</span>
								</div>
								<div class="box-contents">
									<a href="#"> <strong class="title">굿 보스</strong>
									</a>
									<div class="score">
										<strong class="percent">예매율<span>55.4%</span></strong>
										<!-- 2020.05.07 개봉전 프리에그 노출, 개봉후 골든에그지수 노출변경 -->
										<div class="egg-gage small"></div>
									</div>
									<span class="txt-info"> <i>2022.02.10</i> <strong>개봉</strong>
										<em class="dday">D-3</em>
									</span> <span class="like">
										<button class="w-btn w-btn-gra3 w-btn-gra-anim"
											style="padding: 9px 8px;" type="button">예매하기</button>
									</span>
								</div>
							</li>

							<li>
								<div class="box-image">
									<a href="#"><span class="thumb-image"><img
											src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000078/78723/78723_320.jpg"
											alt="캐롤" onerror="errorImage(this)"><span
											class="ico-grade grade-19">청소년 관람불가</span></span></a><span
										class="screentype"> <a class="arthouse" href="#"
										title="아트하우스 상세정보 바로가기" data-regioncode="MovieCollage">아트하우스</a>

									</span>
								</div>
								<div class="box-contents">
									<a href="#"> <strong class="title">캐롤</strong>
									</a>
									<div class="score">
										<strong class="percent">예매율<span>17.6%</span></strong>
										<!-- 2020.05.07 개봉전 프리에그 노출, 개봉후 골든에그지수 노출변경 -->
										<div class="egg-gage small"></div>
									</div>
									<span class="txt-info"> <i>2022.02.04</i> <strong>재개봉</strong>

									</span> <span class="like">
										<button class="w-btn w-btn-gra3 w-btn-gra-anim"
											style="padding: 9px 8px;" type="button">예매하기</button>
									</span>
								</div>
							</li>

							<li>
								<div class="box-image">
									<a href="#"><span class="thumb-image"><img
											src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000082/82987/82987_320.jpg"
											alt="타오르는 여인의 초상" onerror="errorImage(this)"><span
											class="ico-grade grade-15">15세 이상</span></span></a><span
										class="screentype"> <a class="arthouse" href="#"
										title="아트하우스 상세정보 바로가기" data-regioncode="MovieCollage">아트하우스</a>

									</span>
								</div>
								<div class="box-contents">
									<a href="#"> <strong class="title">타오르는 여인의 초상</strong>
									</a>
									<div class="score">
										<strong class="percent">예매율<span>14.7%</span></strong>
										<!-- 2020.05.07 개봉전 프리에그 노출, 개봉후 골든에그지수 노출변경 -->
										<div class="egg-gage small"></div>
									</div>
									<span class="txt-info"> <i>2022.02.03</i> <strong>재개봉</strong>

									</span> <span class="like">
										<button class="w-btn w-btn-gra3 w-btn-gra-anim"
											style="padding: 9px 8px;" type="button">예매하기</button>
									</span>
								</div>
							</li>

							<li>
								<div class="box-image">
									<a href="#"><span class="thumb-image"><img
											src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85607/85607_320.jpg"
											alt="더 마더" onerror="errorImage(this)"><span
											class="ico-grade grade-15">15세 이상</span></span></a><span
										class="screentype"> <a class="arthouse" href="#"
										title="아트하우스 상세정보 바로가기" data-regioncode="MovieCollage">아트하우스</a>

									</span>
								</div>
								<div class="box-contents">
									<a href="#"> <strong class="title">더 마더</strong>
									</a>
									<div class="score">
										<strong class="percent">예매율<span>7.6%</span></strong>
										<!-- 2020.05.07 개봉전 프리에그 노출, 개봉후 골든에그지수 노출변경 -->
										<div class="egg-gage small"></div>
									</div>
									<span class="txt-info"> <i>2022.02.10</i> <strong>개봉</strong>
										<em class="dday">D-3</em>
									</span> <span class="like">
										<button class="w-btn w-btn-gra3 w-btn-gra-anim"
											style="padding: 9px 8px;" type="button">예매하기</button>
									</span>
								</div>
							</li>

						</ol>
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
							<li>
								<dl>
									<dt>
										<img
											src="https://img.cgv.co.kr/R2014/images/arthouse/dt_talk_program1.jpg"
											alt="CINEMA TALK - 시네마톡">
									</dt>
									<dd>
										<img
											src="https://img.cgv.co.kr/R2014/images/arthouse/dd_talk_program1.jpg"
											alt="감독, 배우, 평론가, 다양한 분야의 전문가와 함께 하는 진짜 영화 이야기">
									</dd>
								</dl>
							</li>

							<li>
								<dl>
									<dt>
										<img
											src="https://img.cgv.co.kr/R2014/images/arthouse/dt_talk_program2.jpg"
											alt="LIVE TALK - 라이브톡">
									</dt>
									<dd>
										<img
											src="https://img.cgv.co.kr/R2014/images/arthouse/dd_talk_program2.jpg"
											alt="전국 주요 CGV아트하우스 전용관에서 생중계되는 이동진 평론가의 섬세하고 풍부한 ‘라이브’ 평론  프로그램">
									</dd>
								</dl>
							</li>

							<li>
								<dl>
									<dt>
										<img
											src="https://img.cgv.co.kr/R2014/images/arthouse/dt_talk_program5_re.jpg"
											alt="CURATOR - 큐레이터">
									</dt>
									<dd>
										<img
											src="https://img.cgv.co.kr/R2014/images/arthouse/dd_talk_program5.jpg"
											alt="영화 상영 후 신진영화 평론가가 진행하는 짧지만 알찬 관계밀착형 영화 해설">
									</dd>
								</dl>
							</li>
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
	<jsp:include page="../default/user_footer.jsp"></jsp:include>
</body>
</html>