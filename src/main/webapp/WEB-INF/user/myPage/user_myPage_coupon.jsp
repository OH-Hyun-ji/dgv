<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/png" sizes="192x192"  href="${pageContext.request.contextPath }/resources/images/banana_real.png">
<title>My Page</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=1024"/>
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/layout.css">
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/myPage.css">
    <link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/movieTheater.css"/>
    <link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/userModule.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css"> 
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(function(){
			$("#myDiscount").addClass("on")
			$(".feat-show").addClass("fix")
			$(".feat-show li a").css("color","red")
			$("#myMain").removeClass("on")
		})
	</script>
</head>
<body class="">
	<div id="cgvwrap">
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
						<div class="myPage-table-wrap">
							<span><i class="fas fa-table me-1"
								style="margin-right: 1%;"></i>나의 쿠폰목록</span>
							<table class="myPage-table">
								<thead class="myPage-table-wrapping">
									<tr>
										<th>번호</th>
										<th>쿠폰 코드</th>
										<th>쿠폰 명</th>
										<th>사용기한</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="CouponUseSelect" items="${CouponUseSelect}" varStatus="status">
										<tr>
											<td>${status.index+1 }</td>
											<td><a id="myPage-title" href="/userMyCouponDetail.do?coupon_num=${CouponUseSelect.coupon_num }">${CouponUseSelect.coupon_code }</a></td>
											<td><a href="/userMyCouponDetail.do?coupon_num=${CouponUseSelect.coupon_num }">${CouponUseSelect.coupon_name }</a></td>
											<td>${CouponUseSelect.coupon_date }</td>										
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

	<jsp:include page="../default/user_bottom_reserve.jsp"></jsp:include>
	<jsp:include page="../default/user_footer.jsp"></jsp:include>
</body>
</html>