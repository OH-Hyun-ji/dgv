<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>DGV Theater</title>
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
	<jsp:include page="../default/user_header.jsp"></jsp:include>
	<div id="contaniner" class="">
		<!-- 벽돌 배경이미지 사용 시 class="bg-bricks" 적용 / 배경이미지가 없을 경우 class 삭제  -->
		<!-- Contents Area -->
		<div id="contents" class="">
			<!-- Contents Start -->
			<div class="sect-common">
				<div class="favorite-wrap">
					<div class="sect-favorite">
						<h4>
							<img
								src="https://img.cgv.co.kr/R2014/images/title/h4_favorite_cgv.png"
								alt="dgv있는지역 찾기">
						</h4>
					</div>
					<div class="sect-city">
						<ul>
							<li class="on"><a href="#">서울</a>
								<div class="area">
									<ul>
										<li class="on"><a title="CGV강남"
											href="/theaters/?areacode=01&amp;theaterCode=0056&amp;date=20220207">CGV강남</a>
										</li>
										<li><a title="CGV강변"
											href="/theaters/?areacode=01&amp;theaterCode=0001&amp;date=20220207">CGV강변</a>
										</li>
										<li><a title="CGV건대입구"
											href="/theaters/?areacode=01&amp;theaterCode=0229&amp;date=20220207">CGV건대입구</a>
										</li>
										<li><a title="CGV구로"
											href="/theaters/?areacode=01&amp;theaterCode=0010&amp;date=20220207">CGV구로</a>
										</li>
										<li><a title="CGV대학로"
											href="/theaters/?areacode=01&amp;theaterCode=0063&amp;date=20220207">CGV대학로</a>
										</li>
										<li><a title="CGV동대문"
											href="/theaters/?areacode=01&amp;theaterCode=0252&amp;date=20220207">CGV동대문</a>
										</li>
										<li><a title="CGV등촌"
											href="/theaters/?areacode=01&amp;theaterCode=0230&amp;date=20220207">CGV등촌</a>
										</li>
										<li><a title="CGV명동"
											href="/theaters/?areacode=01&amp;theaterCode=0009&amp;date=20220207">CGV명동</a>
										</li>
										<li><a title="CGV명동역 씨네라이브러리"
											href="/theaters/?areacode=01&amp;theaterCode=0105&amp;date=20220207">CGV명동역
												씨네라이브러리</a></li>
										<li><a title="CGV목동"
											href="/theaters/?areacode=01&amp;theaterCode=0011&amp;date=20220207">CGV목동</a>
										</li>
										<li><a title="CGV미아"
											href="/theaters/?areacode=01&amp;theaterCode=0057&amp;date=20220207">CGV미아</a>
										</li>
										<li><a title="CGV불광"
											href="/theaters/?areacode=01&amp;theaterCode=0030&amp;date=20220207">CGV불광</a>
										</li>
										<li><a title="CGV상봉"
											href="/theaters/?areacode=01&amp;theaterCode=0046&amp;date=20220207">CGV상봉</a>
										</li>
										<li><a title="CGV성신여대입구"
											href="/theaters/?areacode=01&amp;theaterCode=0300&amp;date=20220207">CGV성신여대입구</a>
										</li>
										<li><a title="CGV송파"
											href="/theaters/?areacode=01&amp;theaterCode=0088&amp;date=20220207">CGV송파</a>
										</li>
										<li><a title="CGV수유"
											href="/theaters/?areacode=01&amp;theaterCode=0276&amp;date=20220207">CGV수유</a>
										</li>
										<li><a title="CGV신촌아트레온"
											href="/theaters/?areacode=01&amp;theaterCode=0150&amp;date=20220207">CGV신촌아트레온</a>
										</li>
										<li><a title="CGV압구정"
											href="/theaters/?areacode=01&amp;theaterCode=0040&amp;date=20220207">CGV압구정</a>
										</li>
										<li><a title="CGV여의도"
											href="/theaters/?areacode=01&amp;theaterCode=0112&amp;date=20220207">CGV여의도</a>
										</li>
										<li><a title="CGV연남"
											href="/theaters/?areacode=01&amp;theaterCode=0292&amp;date=20220207">CGV연남</a>
										</li>
										<li><a title="CGV영등포"
											href="/theaters/?areacode=01&amp;theaterCode=0059&amp;date=20220207">CGV영등포</a>
										</li>
										<li><a title="CGV왕십리"
											href="/theaters/?areacode=01&amp;theaterCode=0074&amp;date=20220207">CGV왕십리</a>
										</li>
										<li><a title="CGV용산아이파크몰"
											href="/theaters/?areacode=01&amp;theaterCode=0013&amp;date=20220207">CGV용산아이파크몰</a>
										</li>
										<li><a title="CGV중계"
											href="/theaters/?areacode=01&amp;theaterCode=0131&amp;date=20220207">CGV중계</a>
										</li>
										<li><a title="CGV천호"
											href="/theaters/?areacode=01&amp;theaterCode=0199&amp;date=20220207">CGV천호</a>
										</li>
										<li><a title="CGV청담씨네시티"
											href="/theaters/?areacode=01&amp;theaterCode=0107&amp;date=20220207">CGV청담씨네시티</a>
										</li>
										<li><a title="CGV피카디리1958"
											href="/theaters/?areacode=01&amp;theaterCode=0223&amp;date=20220207">CGV피카디리1958</a>
										</li>
										<li><a title="CGV하계"
											href="/theaters/?areacode=01&amp;theaterCode=0164&amp;date=20220207">CGV하계</a>
										</li>
										<li><a title="CGV홍대"
											href="/theaters/?areacode=01&amp;theaterCode=0191&amp;date=20220207">CGV홍대</a>
										</li>
										<li><a title="CINE de CHEF 압구정"
											href="/theaters/special/show-times.aspx?regioncode=103&amp;theatercode=0040">CINE
												de CHEF 압구정</a></li>
										<li><a title="CINE de CHEF 용산아이파크몰"
											href="/theaters/special/show-times.aspx?regioncode=103&amp;theatercode=0013">CINE
												de CHEF 용산아이파크몰</a></li>
									</ul>
								</div></li>
							<li><a href="#">경기</a>
								<div class="area">
									<ul>
										<li><a title="CGV경기광주"
											href="/theaters/?areacode=02&amp;theaterCode=0260&amp;date=20220207">CGV경기광주</a>
										</li>
										<li><a title="CGV고양행신"
											href="/theaters/?areacode=02&amp;theaterCode=0255&amp;date=20220207">CGV고양행신</a>
										</li>
										<li><a title="CGV광교"
											href="/theaters/?areacode=02&amp;theaterCode=0257&amp;date=20220207">CGV광교</a>
										</li>
										<li><a title="CGV광교상현"
											href="/theaters/?areacode=02&amp;theaterCode=0266&amp;date=20220207">CGV광교상현</a>
										</li>
										<li><a title="CGV구리"
											href="/theaters/?areacode=02&amp;theaterCode=0232&amp;date=20220207">CGV구리</a>
										</li>
										<li><a title="CGV기흥"
											href="/theaters/?areacode=02&amp;theaterCode=0344&amp;date=20220207">CGV기흥</a>
										</li>
										<li><a title="CGV김포"
											href="/theaters/?areacode=02&amp;theaterCode=0278&amp;date=20220207">CGV김포</a>
										</li>
										<li><a title="CGV김포운양"
											href="/theaters/?areacode=02&amp;theaterCode=0188&amp;date=20220207">CGV김포운양</a>
										</li>
										<li><a title="CGV김포한강"
											href="/theaters/?areacode=02&amp;theaterCode=0298&amp;date=20220207">CGV김포한강</a>
										</li>
										<li><a title="CGV동백"
											href="/theaters/?areacode=02&amp;theaterCode=0124&amp;date=20220207">CGV동백</a>
										</li>
										<li><a title="CGV동수원"
											href="/theaters/?areacode=02&amp;theaterCode=0041&amp;date=20220207">CGV동수원</a>
										</li>
										<li><a title="CGV동탄"
											href="/theaters/?areacode=02&amp;theaterCode=0106&amp;date=20220207">CGV동탄</a>
										</li>
										<li><a title="CGV동탄역"
											href="/theaters/?areacode=02&amp;theaterCode=0265&amp;date=20220207">CGV동탄역</a>
										</li>
										<li><a title="CGV동탄호수공원"
											href="/theaters/?areacode=02&amp;theaterCode=0233&amp;date=20220207">CGV동탄호수공원</a>
										</li>
										<li><a title="CGV배곧"
											href="/theaters/?areacode=02&amp;theaterCode=0226&amp;date=20220207">CGV배곧</a>
										</li>
										<li><a title="CGV범계"
											href="/theaters/?areacode=02&amp;theaterCode=0155&amp;date=20220207">CGV범계</a>
										</li>
										<li><a title="CGV부천"
											href="/theaters/?areacode=02&amp;theaterCode=0015&amp;date=20220207">CGV부천</a>
										</li>
										<li><a title="CGV부천역"
											href="/theaters/?areacode=02&amp;theaterCode=0194&amp;date=20220207">CGV부천역</a>
										</li>
										<li><a title="CGV부천옥길"
											href="/theaters/?areacode=02&amp;theaterCode=0287&amp;date=20220207">CGV부천옥길</a>
										</li>
										<li><a title="CGV북수원"
											href="/theaters/?areacode=02&amp;theaterCode=0049&amp;date=20220207">CGV북수원</a>
										</li>
										<li><a title="CGV산본"
											href="/theaters/?areacode=02&amp;theaterCode=0242&amp;date=20220207">CGV산본</a>
										</li>
										<li><a title="CGV서현"
											href="/theaters/?areacode=02&amp;theaterCode=0196&amp;date=20220207">CGV서현</a>
										</li>
										<li><a title="CGV성남모란"
											href="/theaters/?areacode=02&amp;theaterCode=0304&amp;date=20220207">CGV성남모란</a>
										</li>
										<li><a title="CGV소풍"
											href="/theaters/?areacode=02&amp;theaterCode=0143&amp;date=20220207">CGV소풍</a>
										</li>
										<li><a title="CGV수원"
											href="/theaters/?areacode=02&amp;theaterCode=0012&amp;date=20220207">CGV수원</a>
										</li>
										<li><a title="CGV스타필드시티위례"
											href="/theaters/?areacode=02&amp;theaterCode=0274&amp;date=20220207">CGV스타필드시티위례</a>
										</li>
										<li><a title="CGV시흥"
											href="/theaters/?areacode=02&amp;theaterCode=0073&amp;date=20220207">CGV시흥</a>
										</li>
										<li><a title="CGV안산"
											href="/theaters/?areacode=02&amp;theaterCode=0211&amp;date=20220207">CGV안산</a>
										</li>
										<li><a title="CGV안성"
											href="/theaters/?areacode=02&amp;theaterCode=0279&amp;date=20220207">CGV안성</a>
										</li>
										<li><a title="CGV야탑"
											href="/theaters/?areacode=02&amp;theaterCode=0003&amp;date=20220207">CGV야탑</a>
										</li>
										<li><a title="CGV양주옥정"
											href="/theaters/?areacode=02&amp;theaterCode=0262&amp;date=20220207">CGV양주옥정</a>
										</li>
										<li><a title="CGV역곡"
											href="/theaters/?areacode=02&amp;theaterCode=0338&amp;date=20220207">CGV역곡</a>
										</li>
										<li><a title="CGV오리"
											href="/theaters/?areacode=02&amp;theaterCode=0004&amp;date=20220207">CGV오리</a>
										</li>
										<li><a title="CGV오산"
											href="/theaters/?areacode=02&amp;theaterCode=0305&amp;date=20220207">CGV오산</a>
										</li>
										<li><a title="CGV오산중앙"
											href="/theaters/?areacode=02&amp;theaterCode=0307&amp;date=20220207">CGV오산중앙</a>
										</li>
										<li><a title="CGV용인"
											href="/theaters/?areacode=02&amp;theaterCode=0271&amp;date=20220207">CGV용인</a>
										</li>
										<li><a title="CGV의정부"
											href="/theaters/?areacode=02&amp;theaterCode=0113&amp;date=20220207">CGV의정부</a>
										</li>
										<li><a title="CGV의정부태흥"
											href="/theaters/?areacode=02&amp;theaterCode=0187&amp;date=20220207">CGV의정부태흥</a>
										</li>
										<li><a title="CGV이천"
											href="/theaters/?areacode=02&amp;theaterCode=0205&amp;date=20220207">CGV이천</a>
										</li>
										<li><a title="CGV일산"
											href="/theaters/?areacode=02&amp;theaterCode=0054&amp;date=20220207">CGV일산</a>
										</li>
										<li><a title="CGV정왕"
											href="/theaters/?areacode=02&amp;theaterCode=0320&amp;date=20220207">CGV정왕</a>
										</li>
										<li><a title="CGV죽전"
											href="/theaters/?areacode=02&amp;theaterCode=0055&amp;date=20220207">CGV죽전</a>
										</li>
										<li><a title="CGV파주문산"
											href="/theaters/?areacode=02&amp;theaterCode=0148&amp;date=20220207">CGV파주문산</a>
										</li>
										<li><a title="CGV파주야당"
											href="/theaters/?areacode=02&amp;theaterCode=0310&amp;date=20220207">CGV파주야당</a>
										</li>
										<li><a title="CGV판교"
											href="/theaters/?areacode=02&amp;theaterCode=0181&amp;date=20220207">CGV판교</a>
										</li>
										<li><a title="CGV평촌"
											href="/theaters/?areacode=02&amp;theaterCode=0195&amp;date=20220207">CGV평촌</a>
										</li>
										<li><a title="CGV평택"
											href="/theaters/?areacode=02&amp;theaterCode=0052&amp;date=20220207">CGV평택</a>
										</li>
										<li><a title="CGV평택고덕"
											href="/theaters/?areacode=02&amp;theaterCode=0334&amp;date=20220207">CGV평택고덕</a>
										</li>
										<li><a title="CGV평택소사"
											href="/theaters/?areacode=02&amp;theaterCode=0214&amp;date=20220207">CGV평택소사</a>
										</li>
										<li><a title="CGV포천"
											href="/theaters/?areacode=02&amp;theaterCode=0309&amp;date=20220207">CGV포천</a>
										</li>
										<li><a title="CGV하남미사"
											href="/theaters/?areacode=02&amp;theaterCode=0326&amp;date=20220207">CGV하남미사</a>
										</li>
										<li><a title="CGV화성봉담"
											href="/theaters/?areacode=02&amp;theaterCode=0301&amp;date=20220207">CGV화성봉담</a>
										</li>
										<li><a title="CGV화정"
											href="/theaters/?areacode=02&amp;theaterCode=0145&amp;date=20220207">CGV화정</a>
										</li>
										<li><a title="DRIVE IN 곤지암"
											href="/theaters/?areacode=02&amp;theaterCode=0342&amp;date=20220207">DRIVE
												IN 곤지암</a></li>
									</ul>
								</div></li>
							<li><a href="#">인천</a>
								<div class="area">
									<ul>
										<li><a title="CGV계양"
											href="/theaters/?areacode=202&amp;theaterCode=0043&amp;date=20220207">CGV계양</a>
										</li>
										<li><a title="CGV남주안"
											href="/theaters/?areacode=202&amp;theaterCode=0198&amp;date=20220207">CGV남주안</a>
										</li>
										<li><a title="CGV부평"
											href="/theaters/?areacode=202&amp;theaterCode=0021&amp;date=20220207">CGV부평</a>
										</li>
										<li><a title="CGV송도타임스페이스"
											href="/theaters/?areacode=202&amp;theaterCode=0325&amp;date=20220207">CGV송도타임스페이스</a>
										</li>
										<li><a title="CGV연수역"
											href="/theaters/?areacode=202&amp;theaterCode=0247&amp;date=20220207">CGV연수역</a>
										</li>
										<li><a title="CGV인천"
											href="/theaters/?areacode=202&amp;theaterCode=0002&amp;date=20220207">CGV인천</a>
										</li>
										<li><a title="CGV인천논현"
											href="/theaters/?areacode=202&amp;theaterCode=0254&amp;date=20220207">CGV인천논현</a>
										</li>
										<li><a title="CGV인천도화"
											href="/theaters/?areacode=202&amp;theaterCode=0340&amp;date=20220207">CGV인천도화</a>
										</li>
										<li><a title="CGV인천연수"
											href="/theaters/?areacode=202&amp;theaterCode=0258&amp;date=20220207">CGV인천연수</a>
										</li>
										<li><a title="CGV인천학익"
											href="/theaters/?areacode=202&amp;theaterCode=0269&amp;date=20220207">CGV인천학익</a>
										</li>
										<li><a title="CGV주안역"
											href="/theaters/?areacode=202&amp;theaterCode=0308&amp;date=20220207">CGV주안역</a>
										</li>
										<li><a title="CGV청라"
											href="/theaters/?areacode=202&amp;theaterCode=0235&amp;date=20220207">CGV청라</a>
										</li>
										<li><a title="DRIVE IN 스퀘어원"
											href="/theaters/?areacode=202&amp;theaterCode=0339&amp;date=20220207">DRIVE
												IN 스퀘어원</a></li>
									</ul>
								</div></li>
							<li><a href="#">강원</a>
								<div class="area">
									<ul>
										<li><a title="CGV강릉"
											href="/theaters/?areacode=12&amp;theaterCode=0139&amp;date=20220207">CGV강릉</a>
										</li>
										<li><a title="CGV원주"
											href="/theaters/?areacode=12&amp;theaterCode=0144&amp;date=20220207">CGV원주</a>
										</li>
										<li><a title="CGV인제"
											href="/theaters/?areacode=12&amp;theaterCode=0281&amp;date=20220207">CGV인제</a>
										</li>
										<li><a title="CGV춘천"
											href="/theaters/?areacode=12&amp;theaterCode=0070&amp;date=20220207">CGV춘천</a>
										</li>
									</ul>
								</div></li>
							<li><a href="#">대전/충청</a>
								<div class="area">
									<ul>
										<li><a title="CGV논산"
											href="/theaters/?areacode=03%2C205&amp;theaterCode=0261&amp;date=20220207">CGV논산</a>
										</li>
										<li><a title="CGV당진"
											href="/theaters/?areacode=03%2C205&amp;theaterCode=0207&amp;date=20220207">CGV당진</a>
										</li>
										<li><a title="CGV대전"
											href="/theaters/?areacode=03%2C205&amp;theaterCode=0007&amp;date=20220207">CGV대전</a>
										</li>
										<li><a title="CGV대전가수원"
											href="/theaters/?areacode=03%2C205&amp;theaterCode=0286&amp;date=20220207">CGV대전가수원</a>
										</li>
										<li><a title="CGV대전가오"
											href="/theaters/?areacode=03%2C205&amp;theaterCode=0154&amp;date=20220207">CGV대전가오</a>
										</li>
										<li><a title="CGV대전탄방"
											href="/theaters/?areacode=03%2C205&amp;theaterCode=0202&amp;date=20220207">CGV대전탄방</a>
										</li>
										<li><a title="CGV대전터미널"
											href="/theaters/?areacode=03%2C205&amp;theaterCode=0127&amp;date=20220207">CGV대전터미널</a>
										</li>
										<li><a title="CGV보령"
											href="/theaters/?areacode=03%2C205&amp;theaterCode=0275&amp;date=20220207">CGV보령</a>
										</li>
										<li><a title="CGV서산"
											href="/theaters/?areacode=03%2C205&amp;theaterCode=0091&amp;date=20220207">CGV서산</a>
										</li>
										<li><a title="CGV세종"
											href="/theaters/?areacode=03%2C205&amp;theaterCode=0219&amp;date=20220207">CGV세종</a>
										</li>
										<li><a title="CGV유성노은"
											href="/theaters/?areacode=03%2C205&amp;theaterCode=0206&amp;date=20220207">CGV유성노은</a>
										</li>
										<li><a title="CGV천안"
											href="/theaters/?areacode=03%2C205&amp;theaterCode=0044&amp;date=20220207">CGV천안</a>
										</li>
										<li><a title="CGV천안시청"
											href="/theaters/?areacode=03%2C205&amp;theaterCode=0332&amp;date=20220207">CGV천안시청</a>
										</li>
										<li><a title="CGV천안터미널"
											href="/theaters/?areacode=03%2C205&amp;theaterCode=0293&amp;date=20220207">CGV천안터미널</a>
										</li>
										<li><a title="CGV천안펜타포트"
											href="/theaters/?areacode=03%2C205&amp;theaterCode=0110&amp;date=20220207">CGV천안펜타포트</a>
										</li>
										<li><a title="CGV청주(서문)"
											href="/theaters/?areacode=03%2C205&amp;theaterCode=0228&amp;date=20220207">CGV청주(서문)</a>
										</li>
										<li><a title="CGV청주성안길"
											href="/theaters/?areacode=03%2C205&amp;theaterCode=0297&amp;date=20220207">CGV청주성안길</a>
										</li>
										<li><a title="CGV청주율량"
											href="/theaters/?areacode=03%2C205&amp;theaterCode=0282&amp;date=20220207">CGV청주율량</a>
										</li>
										<li><a title="CGV청주지웰시티"
											href="/theaters/?areacode=03%2C205&amp;theaterCode=0142&amp;date=20220207">CGV청주지웰시티</a>
										</li>
										<li><a title="CGV청주터미널"
											href="/theaters/?areacode=03%2C205&amp;theaterCode=0319&amp;date=20220207">CGV청주터미널</a>
										</li>
										<li><a title="CGV충북혁신"
											href="/theaters/?areacode=03%2C205&amp;theaterCode=0284&amp;date=20220207">CGV충북혁신</a>
										</li>
										<li><a title="CGV충주교현"
											href="/theaters/?areacode=03%2C205&amp;theaterCode=0328&amp;date=20220207">CGV충주교현</a>
										</li>
										<li><a title="CGV홍성"
											href="/theaters/?areacode=03%2C205&amp;theaterCode=0217&amp;date=20220207">CGV홍성</a>
										</li>
									</ul>
								</div></li>
							<li><a href="#">대구</a>
								<div class="area">
									<ul>
										<li><a title="CGV대구수성"
											href="/theaters/?areacode=11&amp;theaterCode=0157&amp;date=20220207">CGV대구수성</a>
										</li>
										<li><a title="CGV대구스타디움"
											href="/theaters/?areacode=11&amp;theaterCode=0108&amp;date=20220207">CGV대구스타디움</a>
										</li>
										<li><a title="CGV대구아카데미"
											href="/theaters/?areacode=11&amp;theaterCode=0185&amp;date=20220207">CGV대구아카데미</a>
										</li>
										<li><a title="CGV대구연경"
											href="/theaters/?areacode=11&amp;theaterCode=0343&amp;date=20220207">CGV대구연경</a>
										</li>
										<li><a title="CGV대구월성"
											href="/theaters/?areacode=11&amp;theaterCode=0216&amp;date=20220207">CGV대구월성</a>
										</li>
										<li><a title="CGV대구칠곡"
											href="/theaters/?areacode=11&amp;theaterCode=0071&amp;date=20220207">CGV대구칠곡</a>
										</li>
										<li><a title="CGV대구한일"
											href="/theaters/?areacode=11&amp;theaterCode=0147&amp;date=20220207">CGV대구한일</a>
										</li>
										<li><a title="CGV대구현대"
											href="/theaters/?areacode=11&amp;theaterCode=0109&amp;date=20220207">CGV대구현대</a>
										</li>
									</ul>
								</div></li>
							<li><a href="#">부산/울산</a>
								<div class="area">
									<ul>
										<li><a title="CGV대연"
											href="/theaters/?areacode=05%2C207&amp;theaterCode=0061&amp;date=20220207">CGV대연</a>
										</li>
										<li><a title="CGV동래"
											href="/theaters/?areacode=05%2C207&amp;theaterCode=0042&amp;date=20220207">CGV동래</a>
										</li>
										<li><a title="CGV부산명지"
											href="/theaters/?areacode=05%2C207&amp;theaterCode=0337&amp;date=20220207">CGV부산명지</a>
										</li>
										<li><a title="CGV서면"
											href="/theaters/?areacode=05%2C207&amp;theaterCode=0005&amp;date=20220207">CGV서면</a>
										</li>
										<li><a title="CGV서면삼정타워"
											href="/theaters/?areacode=05%2C207&amp;theaterCode=0285&amp;date=20220207">CGV서면삼정타워</a>
										</li>
										<li><a title="CGV서면상상마당"
											href="/theaters/?areacode=05%2C207&amp;theaterCode=0303&amp;date=20220207">CGV서면상상마당</a>
										</li>
										<li><a title="CGV센텀시티"
											href="/theaters/?areacode=05%2C207&amp;theaterCode=0089&amp;date=20220207">CGV센텀시티</a>
										</li>
										<li><a title="CGV아시아드"
											href="/theaters/?areacode=05%2C207&amp;theaterCode=0160&amp;date=20220207">CGV아시아드</a>
										</li>
										<li><a title="CGV울산동구"
											href="/theaters/?areacode=05%2C207&amp;theaterCode=0335&amp;date=20220207">CGV울산동구</a>
										</li>
										<li><a title="CGV울산삼산"
											href="/theaters/?areacode=05%2C207&amp;theaterCode=0128&amp;date=20220207">CGV울산삼산</a>
										</li>
										<li><a title="CGV울산신천"
											href="/theaters/?areacode=05%2C207&amp;theaterCode=0264&amp;date=20220207">CGV울산신천</a>
										</li>
										<li><a title="CGV울산진장"
											href="/theaters/?areacode=05%2C207&amp;theaterCode=0246&amp;date=20220207">CGV울산진장</a>
										</li>
										<li><a title="CGV정관"
											href="/theaters/?areacode=05%2C207&amp;theaterCode=0306&amp;date=20220207">CGV정관</a>
										</li>
										<li><a title="CGV하단아트몰링"
											href="/theaters/?areacode=05%2C207&amp;theaterCode=0245&amp;date=20220207">CGV하단아트몰링</a>
										</li>
										<li><a title="CGV해운대"
											href="/theaters/?areacode=05%2C207&amp;theaterCode=0318&amp;date=20220207">CGV해운대</a>
										</li>
										<li><a title="CGV화명"
											href="/theaters/?areacode=05%2C207&amp;theaterCode=0159&amp;date=20220207">CGV화명</a>
										</li>
										<li><a title="CINE de CHEF 센텀"
											href="/theaters/special/show-times.aspx?regioncode=103&amp;theatercode=0089">CINE
												de CHEF 센텀</a></li>
									</ul>
								</div></li>
							<li><a href="#">경상</a>
								<div class="area">
									<ul>
										<li><a title="CGV거제"
											href="/theaters/?areacode=204&amp;theaterCode=0263&amp;date=20220207">CGV거제</a>
										</li>
										<li><a title="CGV경산"
											href="/theaters/?areacode=204&amp;theaterCode=0330&amp;date=20220207">CGV경산</a>
										</li>
										<li><a title="CGV고성"
											href="/theaters/?areacode=204&amp;theaterCode=0323&amp;date=20220207">CGV고성</a>
										</li>
										<li><a title="CGV구미"
											href="/theaters/?areacode=204&amp;theaterCode=0053&amp;date=20220207">CGV구미</a>
										</li>
										<li><a title="CGV김천율곡"
											href="/theaters/?areacode=204&amp;theaterCode=0240&amp;date=20220207">CGV김천율곡</a>
										</li>
										<li><a title="CGV김해"
											href="/theaters/?areacode=204&amp;theaterCode=0028&amp;date=20220207">CGV김해</a>
										</li>
										<li><a title="CGV김해율하"
											href="/theaters/?areacode=204&amp;theaterCode=0311&amp;date=20220207">CGV김해율하</a>
										</li>
										<li><a title="CGV김해장유"
											href="/theaters/?areacode=204&amp;theaterCode=0239&amp;date=20220207">CGV김해장유</a>
										</li>
										<li><a title="CGV마산"
											href="/theaters/?areacode=204&amp;theaterCode=0033&amp;date=20220207">CGV마산</a>
										</li>
										<li><a title="CGV북포항"
											href="/theaters/?areacode=204&amp;theaterCode=0097&amp;date=20220207">CGV북포항</a>
										</li>
										<li><a title="CGV안동"
											href="/theaters/?areacode=204&amp;theaterCode=0272&amp;date=20220207">CGV안동</a>
										</li>
										<li><a title="CGV양산삼호"
											href="/theaters/?areacode=204&amp;theaterCode=0234&amp;date=20220207">CGV양산삼호</a>
										</li>
										<li><a title="CGV진주혁신"
											href="/theaters/?areacode=204&amp;theaterCode=0324&amp;date=20220207">CGV진주혁신</a>
										</li>
										<li><a title="CGV창원"
											href="/theaters/?areacode=204&amp;theaterCode=0023&amp;date=20220207">CGV창원</a>
										</li>
										<li><a title="CGV창원더시티"
											href="/theaters/?areacode=204&amp;theaterCode=0079&amp;date=20220207">CGV창원더시티</a>
										</li>
										<li><a title="CGV창원상남"
											href="/theaters/?areacode=204&amp;theaterCode=0283&amp;date=20220207">CGV창원상남</a>
										</li>
										<li><a title="CGV통영"
											href="/theaters/?areacode=204&amp;theaterCode=0156&amp;date=20220207">CGV통영</a>
										</li>
										<li><a title="CGV포항"
											href="/theaters/?areacode=204&amp;theaterCode=0045&amp;date=20220207">CGV포항</a>
										</li>
									</ul>
								</div></li>
							<li><a href="#">광주/전라/제주</a>
								<div class="area">
									<ul>
										<li><a title="CGV광양"
											href="/theaters/?areacode=206%2C04%2C06&amp;theaterCode=0220&amp;date=20220207">CGV광양</a>
										</li>
										<li><a title="CGV광양 엘에프스퀘어"
											href="/theaters/?areacode=206%2C04%2C06&amp;theaterCode=0221&amp;date=20220207">CGV광양
												엘에프스퀘어</a></li>
										<li><a title="CGV광주금남로"
											href="/theaters/?areacode=206%2C04%2C06&amp;theaterCode=0295&amp;date=20220207">CGV광주금남로</a>
										</li>
										<li><a title="CGV광주상무"
											href="/theaters/?areacode=206%2C04%2C06&amp;theaterCode=0193&amp;date=20220207">CGV광주상무</a>
										</li>
										<li><a title="CGV광주용봉"
											href="/theaters/?areacode=206%2C04%2C06&amp;theaterCode=0210&amp;date=20220207">CGV광주용봉</a>
										</li>
										<li><a title="CGV광주첨단"
											href="/theaters/?areacode=206%2C04%2C06&amp;theaterCode=0218&amp;date=20220207">CGV광주첨단</a>
										</li>
										<li><a title="CGV광주충장로"
											href="/theaters/?areacode=206%2C04%2C06&amp;theaterCode=0244&amp;date=20220207">CGV광주충장로</a>
										</li>
										<li><a title="CGV광주터미널"
											href="/theaters/?areacode=206%2C04%2C06&amp;theaterCode=0090&amp;date=20220207">CGV광주터미널</a>
										</li>
										<li><a title="CGV광주하남"
											href="/theaters/?areacode=206%2C04%2C06&amp;theaterCode=0215&amp;date=20220207">CGV광주하남</a>
										</li>
										<li><a title="CGV군산"
											href="/theaters/?areacode=206%2C04%2C06&amp;theaterCode=0277&amp;date=20220207">CGV군산</a>
										</li>
										<li><a title="CGV나주"
											href="/theaters/?areacode=206%2C04%2C06&amp;theaterCode=0237&amp;date=20220207">CGV나주</a>
										</li>
										<li><a title="CGV목포"
											href="/theaters/?areacode=206%2C04%2C06&amp;theaterCode=0289&amp;date=20220207">CGV목포</a>
										</li>
										<li><a title="CGV목포평화광장"
											href="/theaters/?areacode=206%2C04%2C06&amp;theaterCode=0280&amp;date=20220207">CGV목포평화광장</a>
										</li>
										<li><a title="CGV서전주"
											href="/theaters/?areacode=206%2C04%2C06&amp;theaterCode=0225&amp;date=20220207">CGV서전주</a>
										</li>
										<li><a title="CGV순천"
											href="/theaters/?areacode=206%2C04%2C06&amp;theaterCode=0114&amp;date=20220207">CGV순천</a>
										</li>
										<li><a title="CGV순천신대"
											href="/theaters/?areacode=206%2C04%2C06&amp;theaterCode=0268&amp;date=20220207">CGV순천신대</a>
										</li>
										<li><a title="CGV여수웅천"
											href="/theaters/?areacode=206%2C04%2C06&amp;theaterCode=0315&amp;date=20220207">CGV여수웅천</a>
										</li>
										<li><a title="CGV익산"
											href="/theaters/?areacode=206%2C04%2C06&amp;theaterCode=0020&amp;date=20220207">CGV익산</a>
										</li>
										<li><a title="CGV전주고사"
											href="/theaters/?areacode=206%2C04%2C06&amp;theaterCode=0213&amp;date=20220207">CGV전주고사</a>
										</li>
										<li><a title="CGV전주에코시티"
											href="/theaters/?areacode=206%2C04%2C06&amp;theaterCode=0336&amp;date=20220207">CGV전주에코시티</a>
										</li>
										<li><a title="CGV전주효자"
											href="/theaters/?areacode=206%2C04%2C06&amp;theaterCode=0179&amp;date=20220207">CGV전주효자</a>
										</li>
										<li><a title="CGV정읍"
											href="/theaters/?areacode=206%2C04%2C06&amp;theaterCode=0186&amp;date=20220207">CGV정읍</a>
										</li>
										<li><a title="CGV제주"
											href="/theaters/?areacode=206%2C04%2C06&amp;theaterCode=0302&amp;date=20220207">CGV제주</a>
										</li>
										<li><a title="CGV제주노형"
											href="/theaters/?areacode=206%2C04%2C06&amp;theaterCode=0259&amp;date=20220207">CGV제주노형</a>
										</li>
									</ul>
								</div></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- 실컨텐츠 시작 -->
			<div class="wrap-theater">
				<h3>
					<img src="https://dgvworld.s3.ap-northeast-2.amazonaws.com/theater.png" alt="THEATER">
				</h3>
				<div class="sect-theater ">
					<h4 class="theater-tit">
						<span>CGV강남</span>
					</h4>
					<a href="/support/lease/default.aspx" class="round inred btn_lease"><span
						style="padding: 0 14px;font-weight: bold;color: white;">단체/대관문의</span></a>

					<div class="wrap-theaterinfo">
						<div class="box-image">
							<div id="theater_img_container" class="thumb-image">
								<img
									src="https://img.cgv.co.kr/Theater/Theater/2014/1211/CGVgangnam.jpg"
									alt="CGV강남 극장이미지">
							</div>
						</div>
						<div class="box-contents">
							<div class="theater-info">
								<strong class="title">서울특별시 강남구 역삼동 814-6 스타플렉스<br>서울특별시
									강남구 강남대로 438 (역삼동)<a
									href="./?page=location&amp;theaterCode=0056#menu">위치/주차 안내
										&gt;</a></strong> <span class="txt-info"> <em>1544-1122</em> <em>6관
										/ 874석</em> <span></span>
								</span>
								<!-- 최대 10개까지만 보여집니다 -->

							</div>
							<div class="noti-theater">
								<h5>공지사항</h5>
								<ul>

									<li><a
										href="http://section.cgv.co.kr/support/news/view.aspx?Idx=7883"
										target="_blank" title="새창 열림">22년 문화가 있는 날 가격 조정 안내</a></li>

									<li><a
										href="http://section.cgv.co.kr/support/news/view.aspx?Idx=7872"
										target="_blank" title="새창 열림">PAYCO 서비스 개선 작업에 따른 서비스 이용
											일시중지 (12/8 04:00~04:30)</a></li>

								</ul>
								<a class="link-more"
									href="http://section.cgv.co.kr/support/news/Default.aspx?TheaterCode=0056&amp;Category=2"
									target="_blank" title="새창 열림">공지사항 더보기</a>
							</div>
						</div>
					</div>
				</div>
				<!-- .sect-theater -->
				<div class="theater-ad">
					<iframe
						src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@SponsorBar_980"
						width="980" height="90" title="" frameborder="0" scrolling="no"
						marginwidth="0" marginheight="0" name="SponsorBar_980"
						id="SponsorBar_980"></iframe>
				</div>
				<ul class="tab-menu" id="menu">
					<li class="on"><a
						href="./?areacode=01&amp;theaterCode=0056&amp;date=20220207#menu"
						title="현재 선택됨">상영시간표</a></li>
					<li class="last"><a
						href="./?page=location&amp;theaterCode=0056#menu">위치/주차안내</a></li>
				</ul>
			</div>
		</div>
		<!-- 실컨텐츠 끝 -->
		<script type="text/javascript">

function fnPricePage(){
    var strTheaterCode = "0056";
    location.href='/theaters/theaterPrice.aspx?tc='+strTheaterCode;
}

//<![CDATA[
    (function ($) {
        $(function () {

            var now = new Date();
            var _edate = new Date(2014, 7, 15, 23, 50, 0); //7/23
			
		   if (now < _edate) {
			   var theatercode = "0056";
			   if(theatercode == "0014")
			   {
			   
					window.open('http://img.cgv.co.kr/popup/pop_notice_sangam.html','CGV상암','width=280,height=380,left=0,top=0');
			   }
		   }
            document.iFrame = $('#ifrm_movie_time_table').sameHeightFrame({ 'callback': successHandler });
            function successHandler() {
                //iframe resize 후 아이콘 보여준다
                $('.descri-info').show();
            }

	        var theaterJsonData = [
    {
        "AreaTheaterDetailList": [
            {
                "RegionCode": "01",
                "TheaterCode": "0056",
                "TheaterName": "CGV강남",
                "TheaterName_ENG": null,
                "IsSelected": true
            }, {
                "RegionCode": "01",
                "TheaterCode": "0001",
                "TheaterName": "CGV강변",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "01",
                "TheaterCode": "0229",
                "TheaterName": "CGV건대입구",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "01",
                "TheaterCode": "0010",
                "TheaterName": "CGV구로",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "01",
                "TheaterCode": "0063",
                "TheaterName": "CGV대학로",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "01",
                "TheaterCode": "0252",
                "TheaterName": "CGV동대문",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "01",
                "TheaterCode": "0230",
                "TheaterName": "CGV등촌",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "01",
                "TheaterCode": "0009",
                "TheaterName": "CGV명동",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "01",
                "TheaterCode": "0105",
                "TheaterName": "CGV명동역 씨네라이브러리",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "01",
                "TheaterCode": "0011",
                "TheaterName": "CGV목동",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "01",
                "TheaterCode": "0057",
                "TheaterName": "CGV미아",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "01",
                "TheaterCode": "0030",
                "TheaterName": "CGV불광",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "01",
                "TheaterCode": "0046",
                "TheaterName": "CGV상봉",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "01",
                "TheaterCode": "0300",
                "TheaterName": "CGV성신여대입구",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "01",
                "TheaterCode": "0088",
                "TheaterName": "CGV송파",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "01",
                "TheaterCode": "0276",
                "TheaterName": "CGV수유",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "01",
                "TheaterCode": "0150",
                "TheaterName": "CGV신촌아트레온",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "01",
                "TheaterCode": "0040",
                "TheaterName": "CGV압구정",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "01",
                "TheaterCode": "0112",
                "TheaterName": "CGV여의도",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "01",
                "TheaterCode": "0292",
                "TheaterName": "CGV연남",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "01",
                "TheaterCode": "0059",
                "TheaterName": "CGV영등포",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "01",
                "TheaterCode": "0074",
                "TheaterName": "CGV왕십리",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "01",
                "TheaterCode": "0013",
                "TheaterName": "CGV용산아이파크몰",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "01",
                "TheaterCode": "0131",
                "TheaterName": "CGV중계",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "01",
                "TheaterCode": "0199",
                "TheaterName": "CGV천호",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "01",
                "TheaterCode": "0107",
                "TheaterName": "CGV청담씨네시티",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "01",
                "TheaterCode": "0223",
                "TheaterName": "CGV피카디리1958",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "01",
                "TheaterCode": "0164",
                "TheaterName": "CGV하계",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "01",
                "TheaterCode": "0191",
                "TheaterName": "CGV홍대",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "01",
                "TheaterCode": "P001",
                "TheaterName": "CINE de CHEF 압구정",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "01",
                "TheaterCode": "P013",
                "TheaterName": "CINE de CHEF 용산아이파크몰",
                "TheaterName_ENG": null,
                "IsSelected": false
            }
        ],
        "RegionCode": "01",
        "RegionName": "서울",
        "RegionName_ENG": "Seoul",
        "DisplayOrder": "1",
        "IsSelected": true
    }, {
        "AreaTheaterDetailList": [
            {
                "RegionCode": "02",
                "TheaterCode": "0260",
                "TheaterName": "CGV경기광주",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0255",
                "TheaterName": "CGV고양행신",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0257",
                "TheaterName": "CGV광교",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0266",
                "TheaterName": "CGV광교상현",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0232",
                "TheaterName": "CGV구리",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0344",
                "TheaterName": "CGV기흥",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0278",
                "TheaterName": "CGV김포",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0188",
                "TheaterName": "CGV김포운양",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0298",
                "TheaterName": "CGV김포한강",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0124",
                "TheaterName": "CGV동백",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0041",
                "TheaterName": "CGV동수원",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0106",
                "TheaterName": "CGV동탄",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0265",
                "TheaterName": "CGV동탄역",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0233",
                "TheaterName": "CGV동탄호수공원",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0226",
                "TheaterName": "CGV배곧",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0155",
                "TheaterName": "CGV범계",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0015",
                "TheaterName": "CGV부천",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0194",
                "TheaterName": "CGV부천역",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0287",
                "TheaterName": "CGV부천옥길",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0049",
                "TheaterName": "CGV북수원",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0242",
                "TheaterName": "CGV산본",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0196",
                "TheaterName": "CGV서현",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0304",
                "TheaterName": "CGV성남모란",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0143",
                "TheaterName": "CGV소풍",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0012",
                "TheaterName": "CGV수원",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0274",
                "TheaterName": "CGV스타필드시티위례",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0073",
                "TheaterName": "CGV시흥",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0211",
                "TheaterName": "CGV안산",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0279",
                "TheaterName": "CGV안성",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0003",
                "TheaterName": "CGV야탑",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0262",
                "TheaterName": "CGV양주옥정",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0338",
                "TheaterName": "CGV역곡",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0004",
                "TheaterName": "CGV오리",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0305",
                "TheaterName": "CGV오산",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0307",
                "TheaterName": "CGV오산중앙",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0271",
                "TheaterName": "CGV용인",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0113",
                "TheaterName": "CGV의정부",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0187",
                "TheaterName": "CGV의정부태흥",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0205",
                "TheaterName": "CGV이천",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0054",
                "TheaterName": "CGV일산",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0320",
                "TheaterName": "CGV정왕",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0055",
                "TheaterName": "CGV죽전",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0148",
                "TheaterName": "CGV파주문산",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0310",
                "TheaterName": "CGV파주야당",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0181",
                "TheaterName": "CGV판교",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0195",
                "TheaterName": "CGV평촌",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0052",
                "TheaterName": "CGV평택",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0334",
                "TheaterName": "CGV평택고덕",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0214",
                "TheaterName": "CGV평택소사",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0309",
                "TheaterName": "CGV포천",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0326",
                "TheaterName": "CGV하남미사",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0301",
                "TheaterName": "CGV화성봉담",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0145",
                "TheaterName": "CGV화정",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "02",
                "TheaterCode": "0342",
                "TheaterName": "DRIVE IN 곤지암",
                "TheaterName_ENG": null,
                "IsSelected": false
            }
        ],
        "RegionCode": "02",
        "RegionName": "경기",
        "RegionName_ENG": "Gyeonggi",
        "DisplayOrder": "2",
        "IsSelected": false
    }, {
        "AreaTheaterDetailList": [
            {
                "RegionCode": "202",
                "TheaterCode": "0043",
                "TheaterName": "CGV계양",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "202",
                "TheaterCode": "0198",
                "TheaterName": "CGV남주안",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "202",
                "TheaterCode": "0021",
                "TheaterName": "CGV부평",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "202",
                "TheaterCode": "0325",
                "TheaterName": "CGV송도타임스페이스",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "202",
                "TheaterCode": "0247",
                "TheaterName": "CGV연수역",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "202",
                "TheaterCode": "0002",
                "TheaterName": "CGV인천",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "202",
                "TheaterCode": "0254",
                "TheaterName": "CGV인천논현",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "202",
                "TheaterCode": "0340",
                "TheaterName": "CGV인천도화",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "202",
                "TheaterCode": "0258",
                "TheaterName": "CGV인천연수",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "202",
                "TheaterCode": "0269",
                "TheaterName": "CGV인천학익",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "202",
                "TheaterCode": "0308",
                "TheaterName": "CGV주안역",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "202",
                "TheaterCode": "0235",
                "TheaterName": "CGV청라",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "202",
                "TheaterCode": "0339",
                "TheaterName": "DRIVE IN 스퀘어원",
                "TheaterName_ENG": null,
                "IsSelected": false
            }
        ],
        "RegionCode": "202",
        "RegionName": "인천",
        "RegionName_ENG": "Incheon",
        "DisplayOrder": "3",
        "IsSelected": false
    }, {
        "AreaTheaterDetailList": [
            {
                "RegionCode": "12",
                "TheaterCode": "0139",
                "TheaterName": "CGV강릉",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "12",
                "TheaterCode": "0144",
                "TheaterName": "CGV원주",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "12",
                "TheaterCode": "0281",
                "TheaterName": "CGV인제",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "12",
                "TheaterCode": "0070",
                "TheaterName": "CGV춘천",
                "TheaterName_ENG": null,
                "IsSelected": false
            }
        ],
        "RegionCode": "12",
        "RegionName": "강원",
        "RegionName_ENG": "Kangwon",
        "DisplayOrder": "4",
        "IsSelected": false
    }, {
        "AreaTheaterDetailList": [
            {
                "RegionCode": "205",
                "TheaterCode": "0261",
                "TheaterName": "CGV논산",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "205",
                "TheaterCode": "0207",
                "TheaterName": "CGV당진",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "03",
                "TheaterCode": "0007",
                "TheaterName": "CGV대전",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "03",
                "TheaterCode": "0286",
                "TheaterName": "CGV대전가수원",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "03",
                "TheaterCode": "0154",
                "TheaterName": "CGV대전가오",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "03",
                "TheaterCode": "0202",
                "TheaterName": "CGV대전탄방",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "03",
                "TheaterCode": "0127",
                "TheaterName": "CGV대전터미널",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "205",
                "TheaterCode": "0275",
                "TheaterName": "CGV보령",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "205",
                "TheaterCode": "0091",
                "TheaterName": "CGV서산",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "205",
                "TheaterCode": "0219",
                "TheaterName": "CGV세종",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "03",
                "TheaterCode": "0206",
                "TheaterName": "CGV유성노은",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "205",
                "TheaterCode": "0044",
                "TheaterName": "CGV천안",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "205",
                "TheaterCode": "0332",
                "TheaterName": "CGV천안시청",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "205",
                "TheaterCode": "0293",
                "TheaterName": "CGV천안터미널",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "205",
                "TheaterCode": "0110",
                "TheaterName": "CGV천안펜타포트",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "205",
                "TheaterCode": "0228",
                "TheaterName": "CGV청주(서문)",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "205",
                "TheaterCode": "0297",
                "TheaterName": "CGV청주성안길",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "205",
                "TheaterCode": "0282",
                "TheaterName": "CGV청주율량",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "205",
                "TheaterCode": "0142",
                "TheaterName": "CGV청주지웰시티",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "205",
                "TheaterCode": "0319",
                "TheaterName": "CGV청주터미널",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "205",
                "TheaterCode": "0284",
                "TheaterName": "CGV충북혁신",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "205",
                "TheaterCode": "0328",
                "TheaterName": "CGV충주교현",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "205",
                "TheaterCode": "0217",
                "TheaterName": "CGV홍성",
                "TheaterName_ENG": null,
                "IsSelected": false
            }
        ],
        "RegionCode": "03,205",
        "RegionName": "대전/충청",
        "RegionName_ENG": "Daejeon/Chungcheong",
        "DisplayOrder": "5",
        "IsSelected": false
    }, {
        "AreaTheaterDetailList": [
            {
                "RegionCode": "11",
                "TheaterCode": "0157",
                "TheaterName": "CGV대구수성",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "11",
                "TheaterCode": "0108",
                "TheaterName": "CGV대구스타디움",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "11",
                "TheaterCode": "0185",
                "TheaterName": "CGV대구아카데미",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "11",
                "TheaterCode": "0343",
                "TheaterName": "CGV대구연경",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "11",
                "TheaterCode": "0216",
                "TheaterName": "CGV대구월성",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "11",
                "TheaterCode": "0071",
                "TheaterName": "CGV대구칠곡",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "11",
                "TheaterCode": "0147",
                "TheaterName": "CGV대구한일",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "11",
                "TheaterCode": "0109",
                "TheaterName": "CGV대구현대",
                "TheaterName_ENG": null,
                "IsSelected": false
            }
        ],
        "RegionCode": "11",
        "RegionName": "대구",
        "RegionName_ENG": "Daegu",
        "DisplayOrder": "6",
        "IsSelected": false
    }, {
        "AreaTheaterDetailList": [
            {
                "RegionCode": "05",
                "TheaterCode": "0061",
                "TheaterName": "CGV대연",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "05",
                "TheaterCode": "0042",
                "TheaterName": "CGV동래",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "05",
                "TheaterCode": "0337",
                "TheaterName": "CGV부산명지",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "05",
                "TheaterCode": "0005",
                "TheaterName": "CGV서면",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "05",
                "TheaterCode": "0285",
                "TheaterName": "CGV서면삼정타워",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "05",
                "TheaterCode": "0303",
                "TheaterName": "CGV서면상상마당",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "05",
                "TheaterCode": "0089",
                "TheaterName": "CGV센텀시티",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "05",
                "TheaterCode": "0160",
                "TheaterName": "CGV아시아드",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "207",
                "TheaterCode": "0335",
                "TheaterName": "CGV울산동구",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "207",
                "TheaterCode": "0128",
                "TheaterName": "CGV울산삼산",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "207",
                "TheaterCode": "0264",
                "TheaterName": "CGV울산신천",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "207",
                "TheaterCode": "0246",
                "TheaterName": "CGV울산진장",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "05",
                "TheaterCode": "0306",
                "TheaterName": "CGV정관",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "05",
                "TheaterCode": "0245",
                "TheaterName": "CGV하단아트몰링",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "05",
                "TheaterCode": "0318",
                "TheaterName": "CGV해운대",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "05",
                "TheaterCode": "0159",
                "TheaterName": "CGV화명",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "05",
                "TheaterCode": "P004",
                "TheaterName": "CINE de CHEF 센텀",
                "TheaterName_ENG": null,
                "IsSelected": false
            }
        ],
        "RegionCode": "05,207",
        "RegionName": "부산/울산",
        "RegionName_ENG": "Busan/Ulsan",
        "DisplayOrder": "7",
        "IsSelected": false
    }, {
        "AreaTheaterDetailList": [
            {
                "RegionCode": "204",
                "TheaterCode": "0263",
                "TheaterName": "CGV거제",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "204",
                "TheaterCode": "0330",
                "TheaterName": "CGV경산",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "204",
                "TheaterCode": "0323",
                "TheaterName": "CGV고성",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "204",
                "TheaterCode": "0053",
                "TheaterName": "CGV구미",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "204",
                "TheaterCode": "0240",
                "TheaterName": "CGV김천율곡",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "204",
                "TheaterCode": "0028",
                "TheaterName": "CGV김해",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "204",
                "TheaterCode": "0311",
                "TheaterName": "CGV김해율하",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "204",
                "TheaterCode": "0239",
                "TheaterName": "CGV김해장유",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "204",
                "TheaterCode": "0033",
                "TheaterName": "CGV마산",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "204",
                "TheaterCode": "0097",
                "TheaterName": "CGV북포항",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "204",
                "TheaterCode": "0272",
                "TheaterName": "CGV안동",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "204",
                "TheaterCode": "0234",
                "TheaterName": "CGV양산삼호",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "204",
                "TheaterCode": "0324",
                "TheaterName": "CGV진주혁신",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "204",
                "TheaterCode": "0023",
                "TheaterName": "CGV창원",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "204",
                "TheaterCode": "0079",
                "TheaterName": "CGV창원더시티",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "204",
                "TheaterCode": "0283",
                "TheaterName": "CGV창원상남",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "204",
                "TheaterCode": "0156",
                "TheaterName": "CGV통영",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "204",
                "TheaterCode": "0045",
                "TheaterName": "CGV포항",
                "TheaterName_ENG": null,
                "IsSelected": false
            }
        ],
        "RegionCode": "204",
        "RegionName": "경상",
        "RegionName_ENG": "Gyeongsang",
        "DisplayOrder": "8",
        "IsSelected": false
    }, {
        "AreaTheaterDetailList": [
            {
                "RegionCode": "04",
                "TheaterCode": "0220",
                "TheaterName": "CGV광양",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "04",
                "TheaterCode": "0221",
                "TheaterName": "CGV광양 엘에프스퀘어",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "206",
                "TheaterCode": "0295",
                "TheaterName": "CGV광주금남로",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "206",
                "TheaterCode": "0193",
                "TheaterName": "CGV광주상무",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "206",
                "TheaterCode": "0210",
                "TheaterName": "CGV광주용봉",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "206",
                "TheaterCode": "0218",
                "TheaterName": "CGV광주첨단",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "206",
                "TheaterCode": "0244",
                "TheaterName": "CGV광주충장로",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "206",
                "TheaterCode": "0090",
                "TheaterName": "CGV광주터미널",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "206",
                "TheaterCode": "0215",
                "TheaterName": "CGV광주하남",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "04",
                "TheaterCode": "0277",
                "TheaterName": "CGV군산",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "04",
                "TheaterCode": "0237",
                "TheaterName": "CGV나주",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "04",
                "TheaterCode": "0289",
                "TheaterName": "CGV목포",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "04",
                "TheaterCode": "0280",
                "TheaterName": "CGV목포평화광장",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "04",
                "TheaterCode": "0225",
                "TheaterName": "CGV서전주",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "04",
                "TheaterCode": "0114",
                "TheaterName": "CGV순천",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "04",
                "TheaterCode": "0268",
                "TheaterName": "CGV순천신대",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "04",
                "TheaterCode": "0315",
                "TheaterName": "CGV여수웅천",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "04",
                "TheaterCode": "0020",
                "TheaterName": "CGV익산",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "04",
                "TheaterCode": "0213",
                "TheaterName": "CGV전주고사",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "04",
                "TheaterCode": "0336",
                "TheaterName": "CGV전주에코시티",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "04",
                "TheaterCode": "0179",
                "TheaterName": "CGV전주효자",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "04",
                "TheaterCode": "0186",
                "TheaterName": "CGV정읍",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "06",
                "TheaterCode": "0302",
                "TheaterName": "CGV제주",
                "TheaterName_ENG": null,
                "IsSelected": false
            }, {
                "RegionCode": "06",
                "TheaterCode": "0259",
                "TheaterName": "CGV제주노형",
                "TheaterName_ENG": null,
                "IsSelected": false
            }
        ],
        "RegionCode": "206,04,06",
        "RegionName": "광주/전라/제주",
        "RegionName_ENG": "Gwangju/Jeonlla/Jeju",
        "DisplayOrder": "9",
        "IsSelected": false
    }
];
	
        });
    })(jQuery);
//]]>
</script>
		<!--/ Contents End -->
	</div>
	<!-- /Contents Area -->
	 <div class="fixedBtn_wrap">
        <a href="/ticket/" class="btn_fixedTicketing">예매하기</a>
        <a href="#none" class="btn_gotoTop"><img src="https://img.cgv.co.kr/R2014/images/common/btn/gotoTop.png" alt="최상단으로 이동" /></a>
    </div>
    <!--footer!!!!!!!!!!-->
    <jsp:include page="../default/user_footer.jsp"></jsp:include>
   
</body>
</html>