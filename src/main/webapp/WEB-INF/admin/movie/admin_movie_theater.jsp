<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"> 
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin Theater</title>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath }/resources/css/admin/styles.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath }/resources/css/admin/admin_seat_stages.css" rel="stylesheet" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>
   	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script> 
	<script type="text/javascript">
		toastr.options = {
				  "closeButton": true,
				  "debug": false,
				  "newestOnTop": false,
				  "progressBar": true,
				  "positionClass": "toast-top-right",
				  "preventDuplicates": true,
				  "onclick": null,
				  "showDuration": "300",
				  "hideDuration": "1000",
				  "timeOut": "5000",
				  "extendedTimeOut": "1000",
				  "showEasing": "swing",
				  "hideEasing": "linear",
				  "showMethod": "fadeIn",
				  "hideMethod": "fadeOut"
				}
	$(document).ready(function() {
		
		const totalList = ${totalListJson};
		const cityUl = $("#dgvCity")
		const cityChoice ='';
		const regionChoice ='';
		
		
		for(var i=0; i<totalList.length; i++) {
			const li = $("<li>").val(totalList[i].city_code)
			const a = $("<a>")
				.attr("class","dropdown-item")
				.attr("onclick","dgvCityResult(this)")
				.attr("href","#")
				.text(totalList[i].city_name);
			li.append(a)
			cityUl.append(li)		
		}
	
	})
	

	
	function dgvCityResult(cityResult) { // input에 선택한 도시 나타나게 함
		const city = $(cityResult).text();
		$("#cityChoice").val(city);  //선택한 요소의 속성값을 city로 변경한다.
		cityChoice = document.getElementById('cityChoice').value;
		console.log("input 현재값  :"+ cityChoice );
	}
	function dgvRegionResult(regionResult){ //input에 선택한 지역 나타나게함
		const region =$(regionResult).text();
		$("#regionChoice").val(region);
		regionChoice = document.getElementById('regionChoice').value;
		console.log("region 현재값 : " + regionChoice);
		
		
		
	}
	
	//카테고리~~~~~
	function regionBtnAction(){
		clean();
		console.log("선택한 도시  :"+ cityChoice );
		const totalList = ${totalListJson};
		console.log("선택한 도시  :"+ cityChoice );
		var chooseCity ='';
		for(var k=0; k<totalList.length;k++){
			if(totalList[k].city_name == cityChoice){
				chooseCity =totalList[k].city_code;
			}
			
		}
		console.log("코드로 변환한 값 : "+chooseCity);
		const regionUI = $("#dgvRegion")
		console.log("totalList.length : "+ totalList.length);
		for(var i=0;i<totalList.length;i++){
			for(var j=0;j<totalList[i].regionList.length;j++){
				if(chooseCity == totalList[i].regionList[j].city_code){
					console.log("비교1  :"+ totalList[i].city_code );
					console.log("비교2  :"+ totalList[i].regionList[j].city_code );
					const li = $("<li>").val(totalList[i].regionList[j].region_code)
					const a = $("<a>")
					.attr("class","dropdown-item")
					.attr("href","#")
					.attr("onclick","dgvRegionResult(this)")
					.text(totalList[i].regionList[j].region_name);
					li.append(a)
					regionUI.append(li)		
					console.log(totalList[i].regionList[j].region_name)
				}
			}
			
			//
// 			for(var j=0;j<totalList[i].regionList.length;j++){
// 				console.log("지역 이름 :  "+totalList[i].regionList[j].region_name);
// 				console.log("지역 코드 :  "+totalList[i].regionList[j].city_code);
// 				if(cityChoice == totalList[i].regionList[j].region_name ){
// 					console.log("무야무야");
// 				}
// 			console.log("!!!!!!!"+totalList[i].regionList.length);
// 			}
		
				
		}
		
	}
	
	//초기화 시키기
	function clean(){
		const cleanParent = $("#dgvRegion")
		cleanParent.empty();
		
	}
	
	function createSeat(){
			const seatRow = $("#maxRow").val();
			const seatCol = $("#maxColumn").val();
			console.log(parseInt(seatRow)+64);
			var aa =parseInt(seatCol)+64;
			console.log("seatRow = "+ aa)


 			var bb =String.fromCharCode(aa);
			console.log("bb : "+ bb)
 			var str_html ='';
 			for(let i=65;i<=(parseInt(seatRow)+64);i++){
 				console.log("행수 : "+seatCol);		
				str_html = str_html + '<br>';
 				for(let j=1;j<=(parseInt(seatCol));j++){
 					
 					var seat_btn = '<input type="button" class="seat-status" value={}>';			
 					var a1 = String.fromCharCode(i);
 					console.log("total =" +a1+j);
 		            seat_btn = seat_btn.replace('{}', a1+j);
 		            str_html = str_html + seat_btn;
			
 				}
 				str_html = str_html + '<br>';
 			}
 			
 			$('.adminSeatSite').html(str_html);	
 			const clickSeat = new Array();
 	
 			$(".seat-status").on('click',function(){
 				alert($(this).val())
 				
 				
 				
 				if($(this).hasClass("onBtn")){
 					$(this).removeClass("onBtn")
 					for(let i =0;i<clickSeat.length;i++){
 						if(clickSeat[i]==$(this).val()){
 							clickSeat.splice(i,1)
 						}
 					}
 					
 				}else{
 					$(this).addClass("onBtn")
	 				clickSeat.push($(this).val())
 				}
 				console.log("클릭한 좌석 "+clickSeat)
 				$("#seatStatus").val(clickSeat)
 				
 			})
	}
	
	function registerAll(){
			alert("눌렀다!!")
		const theaterN = $("#theaterName").val();
		const maxR =$("#maxRow").val();
		const maxC =$("#maxColumn").val();
		const city = $("#cityChoice").val();
		const region =$("#regionChoice").val();
		const seatCount=maxR*maxC
		const seatStatus =$("#seatStatus").val();
		if(city ==""){
			toastr.warning("도시를 선택해주세요")
		}
		if(region == ""){
			toastr.warning("지역을 선택해주세요")
		}
		console.log("_--"+maxR*maxC)
		
		console.log("지역값이다"+$("#cityChoice").val())
		const theaterVo = {
			"region_name" : region,
			"theater_name" :theaterN,
			"theater_max_row" : maxR,
			"theater_max_column" :maxC,
			"theater_seat_count":seatCount,
			"seat_status":seatStatus
		}
		$.ajax ({
			method:"POST",
			url:"/insertTheater.mdo",
			contentType:"application/json",
			dataType:"json",
			data:JSON.stringify(theaterVo),
			success:function(result){
				if(result.msg=="SUCCESS"){
					alert("상영관 등록 완료!")
				}else{
					alert("상영관 등록 실패")
					
				}
			},error:function(){
				console.log("통신오류")
			}
			
		})//ajax close 
		
		
	}
	function timeRegister(theaterCode){ // 영화 시간 설정 
		alert("ㅠㅠㅠ")
		var popupX =(window.screen.width/2)-(200/2);
        var popupY =(window.screen.height/2)-(300/2);

        window.open('/adminTime.mdo?theater_code='+theaterCode,'','width=500,height=400');
	}
	</script>
	<style type="text/css">
		.onBtn{
			background-color: #00000099;
		}
	</style>	
</head>
<body class="sb-nav-fixed">
	<div id="layoutSidenav">
		<jsp:include page="../default/admin_top_menu.jsp"></jsp:include>
		<jsp:include page="../default/admin_side_menu.jsp"></jsp:include>
	
	<!--여기서 부터 수정가능!!-->
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">극장관리</h1>
        
				<div class="card mb-4"></div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i>지역별 상영관관리
					</div>
					<div style="border: 1px solid #9e9e9ead;margin-top: 1%;">
					<div style=" margin-top: 1%; margin-left: 1%; margin-bottom: 2px;">
						<div>
						<span  style="font-size: 21px; font-weight: 800; margin-left: 1%;"><i class="fas fa-table me-1"></i>상영관 생성</span>
						</div>
						<div class="btn-group" style="width: 19%;">
							<button id="dgvCityBtn" type="button" style="width: 100%; margin-top:0;"class="btn btn-danger dropdown-toggle"
								data-bs-toggle="dropdown" aria-expanded="false" >City
							</button>
							<input class="cityZone city-code" id="cityChoice" readonly="readonly" >
									<ul id="dgvCity"  class="dropdown-menu" style="width: 100%;">
									</ul>
						</div>					
						<div class="btn-group" style="width: 19%;">
							<button id="dgvRegionBtn" type="button" style="width: 100%;margin-top:0;" class="btn btn-danger dropdown-toggle"
								data-bs-toggle="dropdown" aria-expanded="false" onclick="regionBtnAction()">Region
							</button>
							<input class="cityZone city-list" id="regionChoice" style="margin-left: 1px;" readonly="readonly">
							<ul id="dgvRegion" class="dropdown-menu" style="width: 100%;">
							<input type="hidden" name="region_name" id="regionName" >		
							</ul>
						</div>
<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 
	
						<div class="btn-group" style="width: 19%;">
							<button type="button"style="width: 100%; margin-top:0;" class="btn btn-danger dropdown-toggle"
								data-bs-toggle="dropdown" aria-expanded="false">Theater
							</button>
							<input class="cityZone region-list" readonly="readonly">
							<ul class="dropdown-menu" style="width: 100%;">
								<li><a class="dropdown-item" href="#">Action</a></li>
								<li><a class="dropdown-item" href="#">Another action</a></li>
								<li><a class="dropdown-item" href="#">Something else here</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="#">Separated link</a></li>
							</ul>
						</div>-->
							<button id="registerCity"  style="background: linear-gradient(#f3e057 -32%, #ffc800f0);color: slategray;" onclick="registerAll()">Register</button>
						</div>
						<div class="seat_count_total" style="display: inline-flex;margin-top: 2%;height: 37px; margin-bottom: 1%;">
							<label class="btn btn-danger max_title" style="margin-top: 0%;margin-left: 1%;">상영관 이름 : </label>
							<input id="theaterName" name="theater_name" type="text"  placeholder="상영관 입력">
							<label class="max_title btn btn-danger" style="margin-top: 0%;">최대 열수 : </label>
							<input id="maxRow" name="theater_max_row" type="text" placeholder="열 입력">
							<label class="max_title btn btn-danger" style="margin-top: 0%;">최대 행수 : </label>
							<input id="maxColumn" name="theater_max_column" type="text" placeholder="행 입력">
							<button class="theater_seat_making btn btn-danger" style="margin: 0;width: 132px;background: linear-gradient(#f3e057 -32%, #ffc800f0);color: slategray;" onclick="createSeat()">Create</button>
						</div>
						<div style="display: flex;">
							<label id="seatTitle" class="btn btn-danger " style="margin-top: 0%;margin-left: 1%; width: 160px;margin-right: 1%;">비활성화 좌석 => </label>
							<input id="seatStatus" name="theater_name" type="text" style="width: 1000px;border: none;" readonly="readonly" >
						</div>
						</div>
					
				<div class="admin_seat_container">
						<div class="admin_seat_wrapper">
							<div class="button-container-stage"></div>
							<div class="admin_seat_wrap">
								<div class="admin_seat_title">
									<span class="admin_seat_screen">SCREEN</span>
								</div>
								<div class="admin_seat_view" style="overflow-y:scroll ">
									<div class="admin_seat_line">
										<form action="#" id="adminTheaterSeatResult">
											<div class="adminSeatSite" id="seatWrap">

											</div>
										</form>
									</div>
								</div>
							</div>
							<div>
								<div class="card-body">
									<table id="datatablesSimple">
										<thead>
											<tr>
												<th>No</th>
												<th>Region Name</th>
												<th>Theater Name</th>
												<th>Total Seat</th>
												<th>Max Row</th>
												<th>Max Column</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach var="theaterList" items="${adminTheater}" varStatus="status">
											<tr>
												<td>${adminTheaterCount - status.index }</td>
												<td>${theaterList.region_name }</td>												
												<td>${theaterList.theater_name }</td>
												<td>${theaterList.theater_max_row }</td>
												<td>${theaterList.theater_max_column }</td>
												<td><button id="deleteTheater"  onclick="deleteAction('${theaterList.theater_code}')"><i class="fas fa-trash-alt"></i></button> <button><i class="fas fa-pencil-alt"></i></button><button style="margin-left: 3%;" onclick="timeRegister('${theaterList.theater_code}')"><i class="fas fa-clock"></i></button></td>
											</tr>
										</c:forEach>	
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					</div>
			</div>
		</main>
		<jsp:include page="../default/admin_footer.jsp" />
	</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/admin/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/admin/datatables-simple-demo.js"></script>

</body>

</html>
