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
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	8e2df3e9bebf8b3982f4d23137e42962"></script>
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
			console.log("????????????   "+regionNum)
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
					        text: mapVo.map_name // text ????????? ???????????? ?????? ?????? ???????????? ?????? ????????? ??? ????????????     
					    }
					];
					const staticMapContainer  = document.getElementById('map'), // ????????? ????????? ????????? div  
					    staticMapOption = { 
					        center: new kakao.maps.LatLng(mapVo.map_x, mapVo.map_y), // ????????? ????????? ????????????
					        level: 3,       // ????????? ????????? ?????? ??????
					        marker: markers // ????????? ????????? ????????? ?????? 
					    };    					
					console.log(" TEST 1 : " + staticMapContainer + " TEST 2 : " + staticMapOption)
					// ????????? ????????? ???????????????
					const staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);					
					//!!! ?????? ?????? ??????
				
							
				},
				error:function(){
					console.log("????????????")
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
					console.log("????????????")
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
  		font-size: 23px;
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
		<!-- ?????? ??????????????? ?????? ??? class="bg-bricks" ?????? / ?????????????????? ?????? ?????? class ??????  -->
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
			<!-- ???????????? ?????? -->
			<div class="wrap-theater">
				<div id="map" style="width: 980px; height: 400px;"></div>
					<h3 class="theater-wrapping">
						<img
							src="https://dgvworld.s3.ap-northeast-2.amazonaws.com/theater.png"
							alt="THEATER">
					</h3>
					<div class="sect-theater ">
						<h4 id="theater-title">						
						<!--  <span>??????</span>-->
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
								
								
								</div>
						</div>
					</div>
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
