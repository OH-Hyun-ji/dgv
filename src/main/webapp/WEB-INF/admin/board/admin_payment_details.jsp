<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/png" sizes="192x192"  href="${pageContext.request.contextPath }/resources/images/banana_real.png">
	<title>Admin payment details</title>
	<link href="${pageContext.request.contextPath }/resources/css/admin/styles.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath }/resources/css/admin/managerDetail.css" rel="stylesheet" />
<%-- 	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script> --%>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script><!-- jQuery CDN --->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"	crossorigin="anonymous"></script>
	<script type="text/javascript">
		function cancelAction(reserveCode, reserveImpUid, reserveMerchantUid, reservePrice , userId, userPoint,couponDiscount,movieTitle){
			
			var msg = confirm("정말로 취소하시겠습니까?")
			console.log("userId : " + userId)
			if(msg){
			  $.ajax({
			      url: "/adminpaymentCancel.mdo", // 예: http://www.myservice.com/payments/cancel
			      type: "POST",
			      contentType: "application/json",
			      dataType: "json",
			      data: JSON.stringify({
			    	"reserve_imp_uid":reserveImpUid,
			        "reserve_merchant_uid": reserveMerchantUid, // 예: ORD20180131-0000011
			        "reserve_price": reservePrice, // 환불금액
			        "user_id":userId,
			        "use_point":userPoint,
			        "coupon_discount":couponDiscount,
			        "movie_title":movieTitle
			      //  "reason": "테스트 결제 환불" // 환불사유
			      })		     	
			    }).done(function(result){
			    	alert("환불 성공")
			    	location.reload()
			    }).fail(function(error){
			    	alert("환불 실패")
			    }) //close ajax
			}
		}
	function excelConverts() {
		var formData = $("#ExcelForm")
		formData.attr('action', 'excelConvert.mdo');
		formData.attr('method', 'post');
		formData.submit();
	}
	</script>
</head>
<body class="sb-nav-fixed">
	<div id="layoutSidenav">
		<jsp:include page="../default/admin_top_menu.jsp"></jsp:include>
		<jsp:include page="../default/admin_side_menu.jsp"></jsp:include>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">결제내역 관리</h1>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 결제목록
						</div>
						<div class="card-body">	
							<div class="excelConvert-wrap">
								<button id="excelConvert" onclick="excelConverts()">excel 출력</button>	
							</div>
							<table id="datatablesSimple" name="paymentDetails">
								<thead>
									<tr>
										<th>번호</th>
										<th>회원</th>
										<th>결제고유ID</th>
										<th>예매번호</th>
										<th>영화제목</th>
										<th>결제금액</th>
										<th>결제수단</th>
										<th>카드승인번호</th>
										<th>결제일</th>
										<th>결제취소여부</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="paymentList" items="${paymentList}" varStatus="status">
									<tr id="trWrap">
										<td>${status.index+1}</td>
										<td>${paymentList.user_id}</td>
										<td>${paymentList.reserve_imp_uid}</td>
										<td>${paymentList.reserve_merchant_uid}</td>
										<td>${paymentList.movie_title}</td>
										<td>${paymentList.fomatter_price}</td>
										<td>${paymentList.reserve_method}</td>
										<td>${paymentList.reserve_apply_num}</td>
										<td>${paymentList.reserve_date}</td>
										<td style="text-align: center;">
											<c:choose>
												<c:when test="${paymentList.reserve_status == 1 }">
													<button id="delBt"  disabled="disabled" onclick="cancelAction('${paymentList.reserve_code}','${paymentList.reserve_imp_uid}','${paymentList.reserve_merchant_uid}','${paymentList.reserve_price}','${paymentList.user_id}')">
														결제취소완료
													</button>
												</c:when>
												<c:otherwise>
													<button id="delBt" onclick="cancelAction('${paymentList.reserve_code}','${paymentList.reserve_imp_uid}','${paymentList.reserve_merchant_uid}','${paymentList.reserve_price}','${paymentList.user_id}','${paymentList.use_point }','${paymentList.coupon_discount }','${paymentList.movie_title}' )">
														결제취소
													</button>
												</c:otherwise>
											</c:choose>
										</td>
									</tr>		
								</c:forEach>						
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</main>
			<jsp:include page="../default/admin_footer.jsp" />
			<form id="ExcelForm">
				<input type="hidden">
			</form>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resources/js/admin/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resources/js/admin/datatables-simple-demo.js"></script>
</body>
</html>
