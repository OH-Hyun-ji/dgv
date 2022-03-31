<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/png" sizes="192x192"  href="${pageContext.request.contextPath }/resources/images/banana_real.png">
<meta charset="UTF-8">
	<title>DGV Theater</title>
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/reset.css">
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/layout.css">
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/movieTheater.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/swiper-bundle.min.css">
	<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@700&display=swap" rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d2551cba1f0fc7db3031725ad908c785"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/swiper.min.js"></script>
	<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			const container = document.getElementById('map');
			const options = {
				center: new kakao.maps.LatLng(37.57097949310122, 126.99264220428894),
				level: 3
			};
			const map = new kakao.maps.Map(container, options);			
		})
		
		function regionTitleClick() {
			const regionNum = $(this).val()
			console.log("지역번호   "+regionNum)
			$("#theater-title").empty();
			$(".theater-info").empty();
			$.ajax({
				method:"POST",
				url:"/mapRegion.do",
				contentType:"application/json",
				dataType:"json",
				data:JSON.stringify({"region_code":regionNum}),
				success:function(result){
					const mapVo = JSON.parse(result)
					console.log("map_name : "+mapVo.map_name)
							const span =$("<span>")
								.text(mapVo.map_name)
					$("#theater-title").append(span)
					
						const strong=$("<strong>")
							.text(mapVo.map_address)
					
					$(".theater-info").append(strong)		
					$("#map").empty();
					console.log("map : "+ mapVo.map_x)
					 const markers = [
					    {
					        position: new kakao.maps.LatLng(mapVo.map_x, mapVo.map_y)
					    },
					    {
					        position: new kakao.maps.LatLng(mapVo.map_x, mapVo.map_y), 
					        text: mapVo.map_name // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다     
					    }
					];
					const staticMapContainer  = document.getElementById('map'), // 이미지 지도를 표시할 div  
					    staticMapOption = { 
					        center: new kakao.maps.LatLng(mapVo.map_x, mapVo.map_y), // 이미지 지도의 중심좌표
					        level: 3,       // 이미지 지도의 확대 레벨
					        marker: markers // 이미지 지도에 표시할 마커 
					    };    					
					console.log(" TEST 1 : " + staticMapContainer + " TEST 2 : " + staticMapOption)
					// 이미지 지도를 생성합니다
					const staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);					
					//!!! 지도 하단 항목
				
							
				},
				error:function(){
					console.log("통신실패")
				}
				
			})
		}
		
		function appendRegionTitle(regionList){
			const regionL = JSON.parse(regionList)
			_(regionL).forEach(function(n){
				const li =$("<li>")
						.attr("class","regionTitle")
						.attr("value",n.region_code)
						.click(regionTitleClick)
						.text(n.region_name)
					
				$(".region-list").append(li)	
			
			});
		}
	
		function thisCityCode(cityCode){
	//		var cityCode =$(this).val()// $(this).children().val();
			test=this	
			console.log("cityCode :" +cityCode)
			
			const  ul = $("<ul>")
			.attr("class","region-list")
			$(".region-list").empty();
			$.ajax ({
				method:"POST",
				url:"cityViewList.do",
				contentType:"application/json",
				dataType:"json",
				data:JSON.stringify({"city_code":cityCode}),
				success:appendRegionTitle,
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
		cursor: pointer;
 	}
  .theater-info {
  		width: 400px;
	}
.nav:before {
	background-color: #ff0e0000;
}

.nav {
	padding: 6px 0;
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
							<!--  <a class="city-title">${cityList.city_name }</a> -->
								<li class="selected">
									<a class="city-title" onclick="thisCityCode(${cityList.city_code })">${cityList.city_name }</a>							
							<!-- 		<div class="regionThis" >
										<ul class="region-list" id="regionList${cityList.city_code }" ></ul>
									</div> -->
								</li>						
							</c:forEach>
								<li class="region-list" style="width: 861px;"></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- 실컨텐츠 시작 -->
			<div class="wrap-theater">
				<div id="map" style="width: 980px; height: 400px;"></div>
					<h3 class="theater-wrapping">
						<img
							src="https://dgvworld.s3.ap-northeast-2.amazonaws.com/theater.png"
							alt="THEATER">
					</h3>
					<div class="sect-theater ">
						<h4 id="theater-title">						
						<!--  <span>제목</span>-->
						</h4>
						<div class="wrap-theaterinfo">
							<div class="box-image">
								<div id="theater_img_container" class="thumb-image">
									<img src="https://dgvworld.s3.ap-northeast-2.amazonaws.com/TheatherBackImg.jpg">
								</div>
							</div>
							<div class="box-contents">
								<div class="theater-info"></div>
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
			</div>

		</div>
	</div>
	<!-- /Contents Area -->
	<jsp:include page="../default/user_bottom_reserve.jsp"></jsp:include>
	
	<!--footer!!!!!!!!!!-->
	<jsp:include page="../default/user_footer.jsp"></jsp:include>

</body>
</html>
