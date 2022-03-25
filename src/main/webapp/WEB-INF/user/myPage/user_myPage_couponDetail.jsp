<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/png" sizes="192x192"  href="${pageContext.request.contextPath }/resources/images/banana_real.png">
<title>My Coupon</title>
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
	<style type="text/css">
	h3 {
	    border-bottom: 1px solid #b6b6b6;
	    border-top: 1px solid #b6b6b6;
	    padding-top: 1rem;
	    padding-bottom: 1rem;
	    background-color: antiquewhite;
	    margin-bottom: 45px;
    	font-weight: bolder;
		}
	.myProfile-sub-contain > h2 {
	    font-size: 17px;
	    margin-top: 1rem;
	    margin-bottom: 1rem;
	    color: #6a6a6a;
	}
	</style>
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
					<div class="myPage-content-wrap">
						<div class="myProfile-sub-contain">
							<h3>나의 쿠폰 상세보기</h3>
						</div>						
							<div class="select-coupon-img">
												<div class="user-box-img" style="height: 133px;text-align: center;">
													<span class="thumb-box-img" style="width: 724px;height: 101px;">
														<img id="coupon-img" src="${couponVo.coupon_img}">
														<span class="profile-mask-box"></span>
													</span>
												</div>
											</div>
						<table id="myProfile-tableN" style="margin-top: 1rem;">
							<colgroup>
								<col width="19%">
								<col width="*">
							</colgroup>
							<tbody>
								<tr style="background-color: antiquewhite;">
									<th style="width: 27%;">쿠폰 명</th>
									<th style="width: 185px;">쿠폰 코드</th>
									<th>쿠폰 할인률</th>
									<th>사용종료일</th>
								</tr>
								<tr>
									<td>${couponVo.coupon_name}</td>
									<td>${couponVo.coupon_code}</td>
									<td>${couponVo.coupon_discount} 원</td>
									<td> ~ ${couponVo.coupon_date} 까지</td>
								</tr>
								<tr>
									<th style="background-color: antiquewhite;box-sizing: border-box; vertical-align: middle;">쿠폰 설명</th>
									<td colspan="3">
										<div class="profile-agree-status">
											<table id="userAgree-info" style="width: 530px;margin-bottom: 1rem;">
												<colgroup>
													<col style="width: 16%;">
													<col style="width: 34%;">
													<col style="width: 34%;">
													<col style="width: 16%;">
												</colgroup>
												<thead>
													<tr>
														<th scope="col">항목</th>
														<th scope="col">이용목적</th>
														<th scope="col">보유기간</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th>쿠폰</th>
														<td>
															<ul class="agree-dep">
																<li class="agree-dep-list">예매시 할인</li>
															</ul>
														</td>
														<td>~ ${couponVo.coupon_date} 까지</td>
													</tr>
												</tbody>
											</table>
										</div>
									</td>
								</tr>
							</tbody>
						</table>

					</div>
				</div>
			</div>

		</div>

	</div>

	<jsp:include page="../default/user_bottom_reserve.jsp"></jsp:include>
	<jsp:include page="../default/user_footer.jsp"></jsp:include>
</body>
</html>