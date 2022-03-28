<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<title>Admin Movie Seat</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" type="image/png" sizes="192x192"  href="${pageContext.request.contextPath }/resources/images/banana_real.png">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<link href="${pageContext.request.contextPath}/resources/css/admin/styles.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/css/user/button.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/css/admin/admin_seat_stages.css" rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<div id="layoutSidenav">
		<jsp:include page="../default/admin_top_menu.jsp"></jsp:include>
		<jsp:include page="../default/admin_side_menu.jsp"></jsp:include>
		<div id="layoutSidenav_content">
			<div class="container-fluid px-4">
				<h1 class="mt-4">좌석관리</h1>
				<div class="card mb-4"></div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 좌석관리
					</div>
					<div class="admin_seat_container">
						<div class="admin_seat_wrapper">
							<div class="button-container-stage"></div>
							<div class="admin_seat_wrap">
								<div class="admin_seat_title">
									<span class="admin_seat_screen">SCREEN</span>
									<button class="w-btn w-btn-gray" type="button"
										style="padding: 6px 11px; color: white; border: 2px solid;">
										상영관 생성</button>
								</div>
								<div class="admin_seat_view">
									<div class="admin_seat_line">
										<form action="#" id="adminTheaterSeatResult">
											<div class="adminSeatSite">
												
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
												<th>Theater Name</th>
												<th>Region Name</th>
												<th>Total Seat</th>
												<th>Max Row</th>
												<th>Max Column</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Tiger Nixon</td>
												<td>System Architect</td>
												<td>Edinburgh</td>
												<td><button id="delBT">
														<i class="fas fa-times"></i>
													</button></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<jsp:include page="../default/admin_footer.jsp" />
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/datatables-simple-demo.js" ></script>
</body>
</html>
