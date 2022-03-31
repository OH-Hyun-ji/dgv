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
    <link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/button.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css"> 
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/modal.css">  
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
					<div class="myPage-content-wrap">
						<div class="myPage-table-wrap">
							<span><i class="fas fa-table me-1"
								style="margin-right: 1%;"></i>나의 예매내역</span>
							<table class="myPage-table">
								<thead class="myPage-table-wrapping">
									<tr>
										<th>번호</th>
										<th>예매번호</th>
										<th>영화제목</th>
										<th>상영날짜</th>
										<th>예매날짜</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="myReserveList" items="${myReserveList}"
										varStatus="status">
										<tr>
											<td style="cursor: default;">${status.index+1 }</td>
											<td><a id="myPage-title" href="/myReserveMovieDetail.do?reserve_code=${myReserveList.reserve_code }">${myReserveList.reserve_merchant_uid }</a></td>
											<td><a href="/myReserveMovieDetail.do?reserve_code=${myReserveList.reserve_code }">${myReserveList.movie_title}</a></td>
											<td style="cursor: default;">${myReserveList.reserve_movie_date}</td>
											<td style="cursor: default;">${myReserveList.reserve_date}</td>
										</tr>
									</c:forEach>
								</tbody>

							</table>
							<div class="page-info-wrap">
								<div class="page-info-area">
									<ul id="pageInfo" class="pageInfo">
										<c:if test="${pageMake.prev}">
											<li class="pageInfo-btn previous"><a
												href="${pageMake.startPage-1}">Previous</a></li>
										</c:if>
										<c:forEach var="num" begin="${pageMake.startPage}"
											end="${pageMake.endPage}">
											<li class="pageInfo_btn ${pageMake.page.pageNum == num ? "active":""}"><a
												href="/myPage.do?pageNum=${num }&amount=${pageMake.page.amount }">${num}</a></li>
										</c:forEach>
										<c:if test="${pageMake.next}">
											<li class="pageInfo_btn next"><a
												href="${pageMake.endPage + 1}">Next</a></li>
										</c:if>
									</ul>
								</div>
							</div>
						</div>
						<div class="myPage-table-wrap">
							<span><i class="fas fa-table me-1"
								style="margin-right: 1%;"></i>나의 이벤트참여내역</span>
							<table class="myPage-table">
								<thead class="myPage-table-wrapping">
									<tr>
										<th>번호</th>
										<th>이벤트</th>
										<th>참여날짜</th>
										<th>이벤트종료일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="parEventList" items="${parEventList}"
										varStatus="status">
										<tr>
											<td style="cursor: default;">${status.index+1 }</td>
											<td><a id="myPage-title" href="eventDetail.do?event_code=${parEventList.event_code }">${parEventList.event_title }</a></td>
											<td style="cursor: default;">${parEventList.parUserEvent.par_date}</td>
											<c:if test="${parEventList.event_check == '1' }">
												<td>
													<button class="w-btn w-btn-gra3 w-btn-gra-anim" id="winnerStyle-change" onclick="javascript:location.href='/eventWinnerPage.do?event_code=${parEventList.event_code}'">당첨자 확인</button>
												</td>
											</c:if>
											<c:if test="${parEventList.event_check == '0' }">
												<td>
													<button type="button" class="btn btn-primary btn-lg" id="myModelBtnStyle" data-toggle="modal" data-target="#myModal">${parEventList.end_date }</button>
												</td>
											</c:if>
										</tr>
									</c:forEach>
								</tbody>
							</table>

						</div>
						<div class="myPage-table-wrap">
							<span><i class="fas fa-table me-1"
								style="margin-right: 1%;"></i>나의문의내역</span>
							<table class="myPage-table">
								<thead class="myPage-table-wrapping">
									<tr>
										<th>번호</th>
										<th>내용</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>조회</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="MyPageQnaOneList" items="${MyPageQnaOneList}"
										varStatus="status">
										<tr>
											<td>${MyPageQnaCount-status.index}</td>
											<td><a id="myPage-title" href="/myQna.do">${MyPageQnaOneList.dgv_inquiry_title}</a></td>
											<td>${userID}</td>
											<td>${MyPageQnaOneList.dgv_inquiry_date}</td>										
											<td>0</td>
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
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">DGV EVENT</h4>
      </div>
      <div class="modal-body">
      	<div class="modal-myImg">
       		<img id="modalEventInfo" src="https://dgvworld.s3.ap-northeast-2.amazonaws.com/KakaoTalk_20220329_002021793.png">
     	</div>
      </div>
      <div class="modal-footer" style="background: #fffff0;">
        <button type="button" class="btn btn-default" data-dismiss="modal" id="modal-myBtnX">Close</button>
      </div>
    </div>
  </div>
</div>
	<jsp:include page="../default/user_bottom_reserve.jsp"></jsp:include>
    <jsp:include page="../default/user_footer.jsp"></jsp:include>
</body>
</html>