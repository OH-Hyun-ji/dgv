<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EventP1</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/user/user_event.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/user/board.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
	crossorigin="anonymous"></script>
<script src="js/datatables-simple-demo.js"></script>
</head>
<style>
.aaa {
	width: 100;
	height: auto;
}
</style>
<body>
	<jsp:include page="../default/user_header.jsp"></jsp:include>
	<!--본격 콘텐츠-->
	<div id="contaniner" class="">
		<!-- Contents Area -->
		<div class="event-board-wrap">
			<jsp:include page="../default/user_event_header.jsp"></jsp:include>


			<img class="aaa"
				src="https://dgvworld.s3.ap-northeast-2.amazonaws.com/eventP1.jpg">
		</div>
	</div>
	<jsp:include page="../default/user_footer.jsp"></jsp:include>
</body>
</html>