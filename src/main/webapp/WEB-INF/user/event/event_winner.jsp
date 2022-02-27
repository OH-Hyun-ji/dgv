<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event Winnder</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user_event.css">
  <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css">
 <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/board.css">
  <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
  <script src="js/scripts.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
  <script src="js/datatables-simple-demo.js"></script>
</head>

<body class="block">
<jsp:include page="../default/user_header.jsp"></jsp:include>
  <!--본격 콘텐츠-->
	<div id="contaniner" style="height: 1100px" class="">
		<!-- Contents Area -->
		<div class="event-board-wrap"> 
		<jsp:include page="../default/user_event_header.jsp"></jsp:include>
		<div class="cols-content" style="width: 100%;margin-top: -29px;margin-left: 0%;">
			<div class="col-detail event" style=" width: 98%; padding-left: 2%;">
				<div class="sect-evt-item-list">
				<div class="dgv_board_table">
				<table class="type10">
					<thead>
						<tr>
							<th scope="cols">NO.1</th>
							<th scope="cols">제목</th>
							<th scope="cols">작성자</th>
							<th scope="cols">날짜</th>
							<th scope="cols">조회수</th>

						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td><a href="#">내용.</a></td>
							<td>내용이다.</td>
							<td>내용이다.</td>
							<td>내용이다.</td>

						</tr>
						<tr>
							<th scope="row">2</th>
							<td><a href="#">내용.</a></td>
							<td>내용이다.</td>
							<td>내용이다.</td>
							<td>내용이다.</td>

						</tr>
						<tr>
							<th scope="row">3</th>
							<td><a href="#">내용.</a></td>
							<td>내용이다.</td>
							<td>내용이다.</td>
							<td>내용이다.</td>
						</tr>
					</tbody>
				</table>
			</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<jsp:include page="../default/user_footer.jsp"></jsp:include>
</body>
</html>