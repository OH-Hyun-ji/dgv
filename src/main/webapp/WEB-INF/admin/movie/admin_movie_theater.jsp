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
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
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
					<div div style=" margin-top: 1%; margin-left: 1%; margin-bottom: 2px;">
						<div>
						<span  style="font-size: 21px; font-weight: 800; margin-left: 1%;"><i class="fas fa-table me-1"></i>상영관 조회</span>
						</div>
						<div class="btn-group" style="width: 19%;">
							<button id="dgvCityBtn" type="button" style="width: 100%; margin-top:0;"class="btn btn-danger dropdown-toggle"
								data-bs-toggle="dropdown" aria-expanded="false" >City
							</button>
							<input class="cityZone city-code" id="cityChoice" readonly="readonly" value="">
									<ul id="dgvCity"  class="dropdown-menu" style="width: 100%;">
									</ul>
						</div>					
						<div class="btn-group" style="width: 19%;">
							<button id="dgvRegionBtn" type="button" style="width: 100%;margin-top:0;" class="btn btn-danger dropdown-toggle"
								data-bs-toggle="dropdown" aria-expanded="false" onclick="regionBtnAction()">Region
							</button>
							<input class="cityZone city-list" style="margin-left: 1px;" readonly="readonly">
							<ul id="dgvRegion" class="dropdown-menu" style="width: 100%;">
									
							</ul>
						</div>
<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<script type="text/javascript">
	
	$(document).ready(function() {
		
		const totalList = ${totalListJson};
		
		
		const cityUl = $("#dgvCity")
		const cityChoice ='';
		
		
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
		console.log("ddd "+ totalList[0].regionList[0].region_name);
		console.log("ffff"+ cityChoice);
		console.log(totalList);
		console.log("212121 : "+totalList[0].regionList.length);
		
	})
	
	function dgvCityResult(cityResult) { // input에 선택한 지역 나타나게 함
		var city = $(cityResult).text();
		$("#cityChoice").val(city);
		cityChoice = document.getElementById('cityChoice').value;
		console.log("input 현재값  :"+ cityChoice );
	}
	
	function regionBtnAction(){
	//	clean();
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
					.attr("onclick","#")
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
		const cleanParent = document.getElementById("dgvRegion");
		cleanParent.removeChild();
		
	}
		
	</script>	
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
						</div>
							<button id="registerCity">Register</button>
						</div>
						<div class="card-body">
							<table id="datatablesSimple">
								<thead>
									<tr>
										<th>Num</th>
										<th>CityCode</th>
										<th>City</th>
										<th>Region</th>
										<th>Theater</th>
										<th>Delete | Update</th>
									</tr>
								</thead>
								<tbody>

									<tr>
										<td>Tiger Nixon</td>
										<td>System Architect</td>
										<td>Edinburgh</td>
										<td></td>
										<td></td>
										<td><button id="delBT">
												<i class="fas fa-times"></i>
											</button>
											<button id="upBT">
												Update
											</button>
										</td>
									</tr>
								</tbody>
							</table>

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
