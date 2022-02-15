<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"> 
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin Theater</title>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath }/resources/css/admin/styles.css" rel="stylesheet" />
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
							<button type="button" style="width: 100%"class="btn btn-danger dropdown-toggle"
								data-bs-toggle="dropdown" aria-expanded="false">City
							</button>
							<ul class="dropdown-menu" style="width: 100%;">
								<li><a class="dropdown-item" href="#">Action</a></li>
								<li><a class="dropdown-item" href="#">Another action</a></li>
								<li><a class="dropdown-item" href="#">Something else
										here</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="#">Separated link</a></li>
							</ul>
						</div>
						
						<div class="btn-group" style="width: 19%;">
							<button type="button" style="width: 100%;" class="btn btn-danger dropdown-toggle"
								data-bs-toggle="dropdown" aria-expanded="false">Region
							</button>
							<ul class="dropdown-menu" style="width: 100%;">
								<li><a class="dropdown-item" href="#">Action</a></li>
								<li><a class="dropdown-item" href="#">Another action</a></li>
								<li><a class="dropdown-item" href="#">Something else
										here</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="#">Separated link</a></li>
							</ul>
						</div>
						<div class="btn-group" style="width: 19%;">
							<button type="button"style="width: 100%" class="btn btn-danger dropdown-toggle"
								data-bs-toggle="dropdown" aria-expanded="false">Theater
							</button>
							<ul class="dropdown-menu" style="width: 100%;">
								<li><a class="dropdown-item" href="#">Action</a></li>
								<li><a class="dropdown-item" href="#">Another action</a></li>
								<li><a class="dropdown-item" href="#">Something else here</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="#">Separated link</a></li>
							</ul>
						</div>
						
						</div>
						<div class="admin-theater-tb">
							<div class="city-zone-wrap" style="margin-left: 15px;" >
								<input class="cityZone city-code" readonly="readonly">
							</div>
							<div  class="city-zone-wrap" >
								<input class="cityZone city-list" style="margin-left: 1px;" readonly="readonly">
							</div>
							<div  class="city-zone-wrap">
								<input class="cityZone region-list" readonly="readonly">
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
