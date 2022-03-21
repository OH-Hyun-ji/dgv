<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event Winner</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user_event.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/board.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
</head>
<body class="block">
	<jsp:include page="../default/user_header.jsp"></jsp:include>
	<!--본격 콘텐츠-->
	<div id="contaniner" class="" style="height: 1000px;">
		<!-- Contents Area -->
		<div class="event-board-wrap">
			<jsp:include page="../default/user_event_header.jsp"></jsp:include>
			<div class="cols-content"
				style="width: 100%; margin-top: -29px; margin-left: 0%;">
				<div class="col-detail event" style="width: 100%;">
					<img
						src="https://dgvworld.s3.ap-northeast-2.amazonaws.com/112233.png">
					<div class="sect-evt-item-list">
						<table class="type10">
							<thead>
								<tr>
									<th>번호</th>
									<th>이벤트 제목</th>
									<th>이벤트 내용</th>
									<th>이벤트 종료일</th>
									<th>작성자</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="winnerList" items="${winnerList }" varStatus="status">
									<tr>
										<th>${status.index+1 }</th>
										<td><a href="eventDetail.do?event_code=${winnerList.event_code}">${winnerList.event_title }</a></td>
										<td><a href="eventWinnerPage.do?event_code=${winnerList.event_code}">♥ 당첨자 발표 ♥</a></td>								
										<td>${winnerList.end_date }</td>								
										<td>${winnerList.reg_id }</td>
										<td>${winnerList.reg_date }</td>
									</tr>
								</c:forEach>								
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../default/user_footer.jsp"></jsp:include>
</body>
</html>