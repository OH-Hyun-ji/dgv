<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/png" sizes="192x192"
	href="${pageContext.request.contextPath }/resources/images/banana_real.png">
<title>Notice</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=1024" />
<link rel="stylesheet" media="all" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/user/layout.css">
<link rel="stylesheet" media="all" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/user/myPage.css">
<link rel="stylesheet" media="all" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/user/movieTheater.css" />
<link rel="stylesheet" media="all" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/user/userModule.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css">
<link rel="stylesheet" media="all" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/user/user_board_notice.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
<style type="text/css">

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
					<div style="height: 1100px" class="myPage-content-wrap">
						<span class="service-center-text">공지사항</span>

						<div class="myPage-table-wrap">
							<span><i class="fas fa-table me-1"
								style="margin-right: 1%;"></i>공지사항</span>
							<table class="myPage-table">
								<thead class="myPage-table-wrapping">
									<tr>
										<th style="width: 34px;">번호</th>
										<th style="width: 200px;">제목</th>
										<th style="width: 308px;">내용</th>
										<th style="width: 80px">관리자</th>
										<th style="width: 90px">날짜</th>
										<th>조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="noticeList" items="${noticeList}"
										varStatus="status">
										<tr>
											<td>${status.index+1 }</td>
											<td><a
												href="/noticeDetail.do?notice_num=${noticeList.notice_num}">${noticeList.notice_title }</a></td>
											<td><a
												href="/noticeDetail.do?notice_num=${noticeList.notice_num}">${noticeList.notice_text }</a></td>
											<td>${noticeList.reg_id }</td>
											<td>${noticeList.reg_date }</td>
											<td>${noticeList.notice_count }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

						</div>

						<br>
						<br>
						<br>
						<br>
						<br>

						<div style="right: 16px" class="bar">
							<div class="background-1"></div>
							<div class="background-2"></div>
							<div class="background-3"></div>
							<div class="background-4"></div>
							<div class="background-5"></div>
							<div class="background-6"></div>

							<div class="tree-1"></div>
							<div class="tree-2"></div>
							<div class="tree-3"></div>
							<div class="tree-4"></div>
							<div class="tree-5"></div>
							<div class="tree-6"></div>
							<div class="tree-7"></div>
							<div class="tree-8"></div>
							<div class="tree-9"></div>
							<div class="tree-10"></div>
							<div class="tree-11"></div>
							<div class="tree-12"></div>
							<div class="tree-13"></div>
							<div class="tree-14"></div>
							<div class="tree-15"></div>
							<div class="tree-16"></div>
							<div class="tree-17"></div>
							<div class="tree-18"></div>
							<div class="tree-19"></div>
							<div class="tree-20"></div>
							<div class="tree-21"></div>
							<div class="tree-22"></div>
							<div class="tree-23"></div>
							<div class="tree-24"></div>
							<div class="tree-25"></div>
							<div class="tree-26"></div>
							<div class="tree-27"></div>
							<div class="tree-28"></div>
							<div class="tree-29"></div>

							<div class="balcony"></div>

							<div class="back-sofa">
								<div></div>
								<div></div>
								<div></div>
								<div class="coctail">
									<div></div>
								</div>
								<div class="rabbit-1">
									<div class="rabbit-1__back-leg"></div>
									<div class="rabbit-1__body"></div>
									<div class="rabbit-1__arm1"></div>
									<div class="rabbit-1__head">
										<div class="rabbit-1__ear1"></div>
										<div class="rabbit-1__ear2">
											<div></div>
										</div>
										<div class="rabbit-1__mouth">
											<div></div>
										</div>
										<div class="rabbit-1__nose"></div>
										<div class="rabbit-1__eye1"></div>
										<div class="rabbit-1__eye2"></div>
									</div>
									<div class="rabbit-1__leg"></div>
									<div class="rabbit-1__arm2"></div>
								</div>
								<div></div>
							</div>

							<div class="table">
								<div></div>
								<div class="lightning">
									<div></div>
									<div></div>
								</div>
							</div>

							<div class="front-sofa">
								<div class="rabbit-2">
									<div class="rabbit-2__body"></div>
									<div class="rabbit-2__arm1"></div>
									<div class="rabbit-2__head">
										<div class="rabbit-2__ear1">
											<div></div>
										</div>
										<div class="rabbit-2__ear2"></div>
										<div class="rabbit-2__mouth">
											<div></div>
										</div>
										<div class="rabbit-2__nose"></div>
										<div class="rabbit-2__eye1"></div>
										<div class="rabbit-2__eye2"></div>
									</div>
									<div class="rabbit-2__leg"></div>
									<div class="rabbit-2__arm2">
										<div class="coctail">
											<div></div>
										</div>
									</div>
								</div>
								<div></div>
							</div>
						</div>
						<div class="bottom-text-wrap" style="margin-top: 1rem">
							<span class="bottom-text">DGV 고객센터 : 1234-1234(상담가능 시간,
								월~금 12:00~15:00) *이 외 시간은 자동 응답 안내 가능</span>
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