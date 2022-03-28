<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/png" sizes="192x192"  href="${pageContext.request.contextPath }/resources/images/banana_real.png">
<title>Admin-main</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/admin/styles.css"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
<style type="text/css">
	span#userCount {
	    margin-left: 105px;
	}
	span#totalMyMoney {
	    margin-left: 106px;
	}
	.dataTable-container {
	    text-align-last: center;
	}
</style>
</head>
<body class="sb-nav-fixed">
	<div id="layoutSidenav">
		<jsp:include page="../default/admin_top_menu.jsp"></jsp:include>
		<jsp:include page="../default/admin_side_menu.jsp"></jsp:include>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4" style="font-weight: 800; font-size: 32px;">AdminMain</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active"
							style="font-size: 27px; margin-left: 2%; margin-top: 1%;">Dashboard</li>
					</ol>
					<div class="row">
						<div class="col-xl-3 col-md-6">
							<div class="card bg-primary text-white mb-4">
								<div class="card-body">전체 회원수 <span id="userCount" >${userList} 명</span> </div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link" href="userList.mdo">자세히 보기</a>
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-warning text-white mb-4">
								<div class="card-body">총 매출 <span id="totalMyMoney">${totalMyMoney}</span></div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link" href="adminChart.mdo">자세히 보기</a>
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-success text-white mb-4">
								<div class="card-body">공지사항</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link" href="adminNotice.mdo">자세히보기</a>
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-danger text-white mb-4">
								<div class="card-body">고객문의</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link" href="adminEnquriy.mdo">자세히보기</a>
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-6">
							<div class="card mb-4">
								<c:forEach var="dataList" items="${dataList}" varStatus="status">
									<input type="hidden" value="${dataList }"
										id="today${status.index+1}">
								</c:forEach>
								<div class="card-header">
									<i class="fas fa-chart-area me-1"></i> 일일 총 매출
								</div>
								<div class="card-body">
									<canvas id="myAreaChart" width="100%" height="40"></canvas>
								</div>
							</div>
						</div>
						<div class="col-xl-6">
							<div class="card mb-4">
								<c:forEach var="totalMovieList" items="${totalMovieList }"
									varStatus="status">
									<c:if test="${empty totalMovieList.movie_genre_name}">
										<input type="hidden" value="${0}" id="genre${status.index+1 }">
									</c:if>
									<c:if test="${!empty totalMovieList.movie_genre_name }">
										<input type="hidden"
											value="${totalMovieList.movie_genre_name }"
											id="genre${status.index+1 }">
										<input type="hidden" value="${totalMovieList.genre_count }"
											id="genreCount${status.index+1 }">
									</c:if>
								</c:forEach>
								<div class="card-header">
									<i class="fas fa-chart-bar me-1"></i> 장르별 예매수
								</div>
								<div class="card-body">
									<canvas id="myBarChart" width="100%" height="40"></canvas>
								</div>
							</div>
						</div>
					</div>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i>영화 구매 순위
						</div>
						<div class="card-body">
							<table id="datatablesSimple">
								<thead>
									<tr>
										<th>순위</th>
										<th>영화제목</th>
										<th>영화 포스터</th>
										<th>예매횟수</th>
										<th>총매출</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach var="bestMovieList" items="${bestMovieList}" varStatus="status">
									<tr>
										<td id="status-tool">${status.index+1}</td>
										<td id="status-tool">${bestMovieList.movie_title}</td>
										<td id="img-tool"><img id="bestImg" src="${bestMovieList.movie_img}"></td>
										<td id="status-tool">${bestMovieList.total_people}</td>
										<td id="status-tool">${bestMovieList.fomatter_price}</td>										
									</tr>		
								</c:forEach>					
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
		src="${pageContext.request.contextPath}/resources/js/admin/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	s
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/admin/chart-area-demo.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/admin/chart-bar-demo.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/admin/chart-pie-demo.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/admin/datatables-simple-demo.js"></script>
</body>
</html>