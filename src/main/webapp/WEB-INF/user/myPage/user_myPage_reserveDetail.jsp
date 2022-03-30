<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/png" sizes="192x192"  href="${pageContext.request.contextPath }/resources/images/banana_real.png">
<title>My Reserve Detail</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=1024" />
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/layout.css">
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/myPage.css">
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/movieTheater.css" />
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/profile.css" />
	<link rel="stylesheet" media="all" type="text/css"  href="${pageContext.request.contextPath }/resources/css/user/userModule.css" />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<script type="text/javascript">	
	</script>
</head>

<body class="">
	<div id="dgvwrap">
		<jsp:include page="../default/user_header.jsp"></jsp:include>

		<!-- Contaniner -->
		<div id="contaniner" class="">
			<!-- Contents Area -->
			<div id="contents" class="">
				<!-- Contents Start -->
				<jsp:include page="../default/user_myPage_top.jsp"></jsp:include>
				<div class="myPage-cols-container">
					<jsp:include page="../default/user_myPage_side.jsp"></jsp:include>
					<div class="myPage-myReserve-wrap">
						<div class="myPage-myReserve-wrapper">
							<div class="myPage-myReserve-wrapping">
							<div class="myReservePage-title">
								<span>나의 예매 상세보기</span>	
							</div>
								<div class="myPage-myReserve-imgWrap"> 
									<div class="myPage-myReserve-movieImg">
										<img id="myReserveImg" src="${reserveVo.movie_img }">
									</div>
									<div class="myPage-myReserve-style">
										<div class="myReserve-number">
											<label>예매번호 : </label>
											<div class="info-style" >${reserveVo.reserve_merchant_uid}</div>
											<label style="margin-left: 10px;font-weight: normal;">사용한 포인트 : </label>
											<c:choose>
												<c:when test="${reserveVo.use_point == 0}">
													<div class="info-style myPointCheck">사용안함</div>
												</c:when>
												<c:otherwise>
													<div class="info-style myPointCheck">${reserveVo.use_point}</div>
												</c:otherwise>
											</c:choose>
										</div>
									<div class="myPage-myReserve-infoWrap">								
										<div class="myPage-reserveTitle-wrap">
											<label>영화제목 : </label>
											<label>상영관 : </label>
											<label>예약좌석 : </label>
										</div>								
										<div class="myPage-reserveInfo-wrap">
											<div class="reserve-info-style">${reserveVo.movie_title}</div>
											<div class="reserve-info-style">${reserveVo.region_name} ${reserveVo.theater_name}상영관</div>
											<div class="reserve-info-style">${reserveVo.seat_reservation}</div>
										</div>
										<div class="myPage-reserveTitle-wrap1">
											<label>예약날짜 : </label>
											<label>결제수단 : </label>
											<label>결제금액 : </label>
										</div>
										<div class="myPage-reserveInfo-wrap2">
											<div class="reserve-info-style">${reserveVo.reserve_date}</div>
											<div class="reserve-info-style">${reserveVo.reserve_method}</div>
											<div class="reserve-info-style">${reserveVo.reserve_price}</div>
										</div>
									</div>
									</div>
								</div>
							</div>
						</div>								
					</div>
				</div>
			</div>

		</div>

	</div>

	<jsp:include page="../default/user_bottom_reserve.jsp"></jsp:include>
	<jsp:include page="../default/user_footer.jsp"></jsp:include>
</body>
</html>