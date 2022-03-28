<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/png" sizes="192x192"  href="${pageContext.request.contextPath }/resources/images/banana_real.png">
<meta charset="UTF-8">
<title>Reserve View</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/button.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/movieChart.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/button.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css">    
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/reserveView.css">    
    <link href="https://fonts.googleapis.com/css2?family=Dongle:wght@700&display=swap" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery.twbsPagination.js"></script>
 	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>

<body class="block">
<jsp:include page="../default/user_header.jsp"></jsp:include>
    <!--본격 콘텐츠-->
    <div id="contaniner" class style="height: 850px;">
        <!-- Contents Area -->
		<div id="contents" class style="width: 609px">
		<div class="reserve_wrap">
			<div id="reserveLogo-wrap">
				<img id="reserveLogo" alt="" src="${pageContext.request.contextPath }/resources/images/dgvMainLogo.png">
			</div>
			<div class="insideInfo-wrap">
				<div class="insideInfo-wrapping">
					<input class="reserve-style" readonly="readonly" alt="회원ID" value="${reserveVo.user_id }">				
					<input class="reserve-style" readonly="readonly" alt="예매번호" value="${reserveVo.reserve_merchant_uid }"> 				
					<input class="reserve-style" readonly="readonly" alt="영화제목" value="${reserveVo.movie_title }">				
					<input class="reserve-style" readonly="readonly" alt="결제금액" value="${reserveVo.reserve_price }">				
					<input class="reserve-style" readonly="readonly" alt="결제수단" value="${reserveVo.reserve_method }"> 			
					<c:if test="${!empty reserveVo.reserve_apply_num }">										
						<input class="reserve-style" style="margin-left: 32px;"readonly="readonly" alt="카드 승인번호" value="${reserveVo.reserve_apply_num }">				
					</c:if>
					<c:if test="${empty reserveVo.reserve_apply_num }">										
						<input class="reserve-style" style="margin-left: 32px;"readonly="readonly" alt="카드 승인번호" value="카드 결제 x">				
					</c:if>
						
					<input class="reserve-style" readonly="readonly" alt="결제일" value="${reserveVo.reserve_date }">	
				</div>		
				
			</div>				
				<div class="firstBtn">
					<button class="w-btn w-btn-gra1" id="receiptPrint" onclick="location.href='/pdfDownload.do?reserve_merchant_uid=${reserveVo.reserve_merchant_uid }'">영수증 출력하기</button>				
					<input type="button" id="firstPage" onclick="location.href='/dgvMain.do'"> 
				</div>
			
		</div>
    </div>
</div>
   <jsp:include page="../default/user_bottom_reserve.jsp"></jsp:include>	
   <jsp:include page="../default/user_footer.jsp"></jsp:include>

</body>
</html>