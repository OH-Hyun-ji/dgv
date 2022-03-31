<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/png" sizes="192x192"  href="${pageContext.request.contextPath }/resources/images/banana_real.png">
<title>Service Center</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=1024" />
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/layout.css">
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/myPage.css">
	<link href="${pageContext.request.contextPath }/resources/css/user/button.css" rel="stylesheet"  />
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/movieTheater.css" />
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/brightCat.css" />
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/userModule.css" />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/userService.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<style type="text/css">
		.nav:before {
			background-color: #ff0e0000;
			
		}
		.nav{
			padding: 6px 0;
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
				<div class="myPage-cols-container">

					<jsp:include page="../default/user_notice_side.jsp"></jsp:include>
					<div class="myPage-content-wrap">
						<span class="service-center-text">고객 센터</span>
						<div class="service-center-wrapping">
							<div class="service-center-01">
								<a class="service-sub-01" href="/oftenQna.do"> <i
									class="fas fa-allergies"
									style="height: 61px; width: 42%; place-self: center;"></i> <span>자주찾는
										질문</span>
								</a>
							</div>
							<div class="service-center-02">
								<a class="service-sub-01" href="/notice.do"> <i
									class="fas fa-apple-alt"
									style="height: 61px; width: 42%; place-self: center;"></i> <span>공지사항</span>
								</a>
							</div>
							<c:if test="${!empty userID }">
								<div class="service-center-03">
									<a class="service-sub-01" href="/myQna.do"> <i
										class="far fa-grin-squint-tears"
										style="height: 61px; width: 42%; place-self: center;"></i> <span>나의
											문의</span>
									</a>
								</div>
							</c:if>
							<c:if test="${empty userID }">
								<div class="service-center-03">
									<a class="service-sub-01" href="/loginForm.do"> <i
										class="far fa-grin-squint-tears"
										style="height: 61px; width: 42%; place-self: center;"></i> <span>나의
											문의</span>
									</a>
								</div>
							</c:if>
						</div>
						<div class="service-table-wrap">
							<c:if test="${!empty userID }">
								<div class="myPage-table-wrap" style="width: 714px;">
									<span><i class="fas fa-table me-1"
										style="margin-right: 1%;"></i>공지사항</span>
									<table class="myPage-table">
										<thead class="myPage-table-wrapping">
											<tr>
												<th>No</th>
												<th>Title</th>
												<th>Writer</th>
												<th>Date</th>
												<th>Count</th>
											</tr>
										</thead>
										<c:forEach var="noticeList" items="${noticeList}"
											varStatus="status">
											<tbody>
												<tr>
													<td>${status.index+1 }</td>
													<td><a id="myPage-title"
														href="/noticeDetail.do?notice_num=${noticeList.notice_num }">${noticeList.notice_title}</a></td>
													<td>${noticeList.reg_id}</td>
													<td>${noticeList.reg_date}</td>
													<td>${noticeList.notice_count}</td>
												</tr>
											</tbody>
										</c:forEach>
									</table>
								</div>
								
								</div>
							
							<div class="myPage-table-wrap" style=" width: 714px;margin-left: 28px;margin-bottom: 1rem;">
									<span><i class="fas fa-table me-1"
										style="margin-right: 1%;"></i>나의 문의내역</span>
									<table class="myPage-table">
										<thead class="myPage-table-wrapping">
											<tr>
												<th>번호</th>
												<th>내용</th>
												<th>답변완료</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="inquiryList" items="${inquiryList}" varStatus="status">
												<tr>
													<td>${status.index+1 }</td>
													<td><a id="myPage-title" href="adminAnswer.do?dgv_inquiry_code=${inquiryList.dgv_inquiry_code }">${inquiryList.dgv_inquiry_title }</a></td>													
													<td>
														<c:choose>
															<c:when test="${inquiryList.dgv_inquiry_status == 1}">
																<button id="finishAnswer" class="w-btn w-btn-gra3 w-btn-gra-anim" style="padding: 5px; width: 72px;margin: 2px;" type="button" onclick="location.href='/adminAnswer.do?dgv_inquiry_code=${inquiryList.dgv_inquiry_code}'">답변완료</button>																	
															</c:when>
															<c:otherwise>
																<input id="waitingAnswer" type="text" value="답변대기중" readonly="readonly">													
															</c:otherwise>											
														</c:choose>	
													</td>											
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:if>
							<c:if test="${empty userID }">
								<div class="myPage-table-wrap" style="width: 700px;">
									<span><i class="fas fa-table me-1"
										style="margin-right: 1%;"></i>공지/뉴스</span>
									<table class="myPage-table">
										<thead class="myPage-table-wrapping">
											<tr>
												<th>No</th>
												<th style="width: 350px;">Title</th>
												<th>Writer</th>
												<th>Date</th>
												<th>Count</th>
											</tr>
										</thead>
										<c:forEach var="noticeList" items="${noticeList}"
											varStatus="status">
											<tbody>
												<tr>
													<td>${status.index+1 }</td>
													<td><a id="myPage-title"
														href="/noticeDetail.do?notice_num=${noticeList.notice_num }">${noticeList.notice_title}</a></td>
													<td>${noticeList.reg_id}</td>
													<td>${noticeList.reg_date}</td>
													<td>${noticeList.notice_count}</td>
												</tr>
											</tbody>
										</c:forEach>
									</table>
								</div>
							</c:if>
						</div>
				
						<div class="bottom-text-wrap" style="text-align: -webkit-center;">
							<span class="bottom-text">DGV 고객센터 : 1234-1234(상담가능 시간,
								월~금 12:00~15:00) *이 외 시간은 자동 응답 안내 가능</span>
						</div>
					</div>
				</div>
			</div>
			<div class="the-container"
				style="margin: 755px;left: -480px;top: -230px;">

				<input type="checkbox" id="toggle" /> <label for="toggle"></label>

				<div class="day-night-cont">
					<span class="the-sun"></span>
					<div class="the-moon">
						<span class="moon-inside"></span>
					</div>
				</div>

				<div class="switch">
					<div class="button">
						<div class="b-inside"></div>
					</div>
				</div>

				<div class="c-window">

					<span class="the-sun"></span> <span class="the-moon"></span>

					<div class="the-cat">
						<div class="cat-face">
							<section class="eyes left">
								<span class="pupil"></span>
							</section>
							<section class="eyes right">
								<span class="pupil"></span>
							</section>

							<span class="nose"></span>
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