<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>
	
	<script type="text/javascript">
		function thisCityCode(cityCode){
		
	//		var cityCode =$(this).val()// $(this).children().val();
		test=this	
			console.log("cityCode :" +cityCode)
			alert(cityCode)
			const  ul = $("<ul>")
			.attr("class","region-list")
			$(".region-list").empty();
			$.ajax ({
				method:"POST",
				url:"cityViewList.mdo",
				contentType:"application/json",
				dataType:"json",
				data:JSON.stringify({"city_code":cityCode}),
				success:function(regionList){
					const regionL = JSON.parse(regionList)
					_(regionL).forEach(function(n){
						const li =$("<li>")
								.attr("class","regionTitle")
								.attr("value",n.region_code)
								.text(n.region_name)
							
						$("#regionList"+cityCode).append(li)	
					
						$(".regionTitle").on('click',function(){
							const regionNum = $(this).val()
							console.log("지역번호   "+regionNum)
						})
					})
				},
				error:function(){
					console.log("통신실패")
				}
				
		})//  $(".cityName") click close
		//$(".regionThis").append(ul)	
		
		}
	
	
	
		
	

</script>

<style type="text/css">

	.cityCss{
		display: flex;
	}
	.regionTitle{
		color:white;
  }
</style>
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
								src= "https://dgvworld.s3.ap-northeast-2.amazonaws.com/dgvOften-removebg-preview.png"
								style="width: 200px;">
						</h4>
					</div>
					<div class="sect-city">
						<ul id="city-list">
							<c:forEach var="cityList" items="${cityList}">
								<li class="selected">
									<a class="city-title" onclick="thisCityCode(${cityList.city_code })">${cityList.city_name }</a>							
									<div class="regionThis" >
										<ul class="region-list" id="regionList${cityList.city_code }" ></ul>
									</div>
								</li>								
							
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			<!-- 실컨텐츠 시작 -->
			<div class="wrap-theater">
				<div id="map" style="width: 980px; height: 400px;"></div>
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d2551cba1f0fc7db3031725ad908c785"></script>
				<script>
				var container = document.getElementById('map');
				var options = {
					center: new kakao.maps.LatLng(37.57097949310122, 126.99264220428894),
					level: 3
				};
		
				var map = new kakao.maps.Map(container, options);
				</script>
					<h3>
						<img
							src="https://dgvworld.s3.ap-northeast-2.amazonaws.com/theater.png"
							alt="THEATER">
					</h3>
					<div class="sect-theater ">
						<h4 class="theater-tit">
							<span>CGV강남</span>
						</h4>
						<a href="/support/lease/default.aspx" class="round inred btn_lease"><span
							style="padding: 0 14px; font-weight: bold; color: white;">단체/대관문의</span></a>
	
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
	</div>
	<!-- /Contents Area -->
	<div class="fixedBtn_wrap">
		<a href="/ticket/" class="btn_fixedTicketing">예매하기</a> <a href="#none"
			class="btn_gotoTop"><img
			src="https://img.cgv.co.kr/R2014/images/common/btn/gotoTop.png"
			alt="최상단으로 이동" /></a>
	</div>
	<!--footer!!!!!!!!!!-->
	<jsp:include page="../default/user_footer.jsp"></jsp:include>

</body>
</html>