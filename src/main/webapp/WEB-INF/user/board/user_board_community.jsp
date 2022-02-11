<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DGV Community Board</title>
 <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css">
 <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/board.css">
 <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="dgv_all_container">
	<jsp:include page="../default/user_header.jsp"></jsp:include>
		<div class="dgv_board_container">
			<div class="dgv_board_title">
				<span>속닥속닥 DGV</span>
			</div>
			<div class="dgv_board_img">
				<img src="https://dgvworld.s3.ap-northeast-2.amazonaws.com/owl.png">
			</div>
			<div class="dgv_board_table">
				<table class="type09">
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
	<jsp:include page="../default/user_footer.jsp"></jsp:include>
</body>
</html>