<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Answer Completion</title>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/css/admin/styles.css" rel="stylesheet" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<div id="layoutSidenav">
		<jsp:include page="../default/admin_top_menu.jsp"></jsp:include>
		<jsp:include page="../default/admin_side_menu.jsp"></jsp:include>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">게시글 관리</h1>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i>고객문의(답변완료)목록
						</div>
						<div class="card-body">
							<table id="datatablesSimple" name="userTable">
								<thead>
									<tr>
										<th>No</th>
										<th>Category</th>
										<th>User Title</th>
										<th>Answer Title</th>
										<th>Answer Text</th>
										<th>User Id</th>
										<th>Writer</th>
										<th>Date</th>
										<th>Result</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="answerList" items="${answerList}" varStatus="status">
											<tr>
												<td>${status.index+1}</td>
												<td>${answerList.userInquiryVO.dgv_inquiry_tag}</td>
												<td>${answerList.userInquiryVO.dgv_inquiry_title}</td>
												<td>${answerList.admin_answer_title}</td>
												<td>${answerList.admin_answer_text}</td>
												<td>${answerList.dgv_inquiry_user}</td>
												<td>${answerList.reg_id}</td>
												<td>${answerList.reg_date}</td>
												<td><span>답변완료</span></td>												
											</tr>	
									</c:forEach>								
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</main>
			<jsp:include page="../default/admin_footer.jsp" />
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resources/js/admin/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resources/js/admin/datatables-simple-demo.js"></script>
</body>
</html>
