<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DGV Review Board</title>
 <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css">
 <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/board.css">
 <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="dgv_all_container">
	<jsp:include page="../default/user_header.jsp"></jsp:include>
		<div class="dgv_board_container">
			<div class="dgv_board_title">
				<span>모두의 Review</span>
			</div>
			<div class="dgv_board_img">
				<img src="https://dgvworld.s3.ap-northeast-2.amazonaws.com/banner3.PNG">
			</div>
			<div class="dgv_board_table">
				<table class="type09">
					<thead>
						<tr>
							<th scope="cols" style="width: 8%;">NO.1</th>
							<th scope="cols" >내가 본 영화</th>
							<th scope="cols">작성자</th>
							<th scope="cols">날짜</th>
							<th scope="cols">조회수</th>

						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td style="width: 50%;">
								<textarea cols="10" rows="3" readonly="readonly" >리뷰남겨용</textarea>
								<input class="w-btn-outline w-btn-red-outline" type="button" value="작성하기" style="margin-left: 81%;"> 
								</td>
							<td style="padding-top: 50px; padding-left: 11px;">내용이다.</td>
							<td style="padding-top: 50px; padding-left: 11px;">내용이다.</td>
							<td style="padding-top: 50px; padding-left: 11px;">내용이다.</td>

						</tr>
						<tr>
							<th scope="row">2</th>
							<td>
								<textarea cols="30" rows="3" readonly="readonly"></textarea>
								<input type="button" value="작성하기"> 
								</td>
							<td>내용이다.</td>
							<td>내용이다.</td>
							<td>내용이다.</td>

						</tr>
						<tr>
							<th scope="row">3</th>
						<td>
								<textarea cols="30" rows="3" readonly="readonly"></textarea>
								<input type="button" value="작성하기"> 
								</td>
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