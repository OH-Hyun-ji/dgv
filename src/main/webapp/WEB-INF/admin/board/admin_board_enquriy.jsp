<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/admin/styles.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>

</head>
<body>

	<jsp:include page="../default/admin_top_menu.jsp" />
	<jsp:include page="../default/admin_side_menu.jsp" />
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">게시글 관리</h1>
					<ol class="breadcrumb mb-4">


					</ol>
					<div class="card mb-4">
						<div class="card-header" >고객문의(답변대기)</div>
					</div>
					<div class="card mb-4">
						<div class="card-body">
							<i class="fas fa-table me-1"></i> 목록
						</div>
						<div class="card-body">
							<table class="table">
								<thead>
									<tr>

										<th>번호</th>
										<th>유형</th>
										<th>제목</th>
										<th>DGV문의</th>
										<th>등록일</th>
										<th></th>


									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>사고</td>
										<td>않이 이게 웨 안뒈</td>
										<td>이거 살짝 엑시던트임</td>
										<td>2022-02-09</td>
										<td>등록된 답변이 있다면 여기에 몇자 보이게 할 예정</td>
										<td><button id="checkButton"
												onclick="window.open('admin-customer-answer-modi.html','window_name','width=500,height=450, scrollbars=yes' );"
												style="background-color: white; border: white;">확인하기</button></td>


									</tr>
									<tr>
										<td>1</td>
										<td>사고</td>
										<td>않이 이게 웨 안뒈</td>
										<td>이거 살짝 엑시던트임</td>
										<td>2022-02-09</td>
										<td></td>
										<td><button id="checkButton"
												onclick="window.open('admin-customer-answer-modi.html','window_name','width=500,height=450, scrollbars=yes' );"
												style="background-color: white; border: white;">확인하기</button></td>
									</tr>
									<tr>
										<td>1</td>
										<td>사고</td>
										<td>않이 이게 웨 안뒈</td>
										<td>이거 살짝 엑시던트임</td>
										<td>2022-02-09</td>
										<td></td>
										<td><button id="checkButton"
												onclick="window.open('admin-customer-answer-modi.html','window_name','width=500,height=450, scrollbars=yes' );"
												style="background-color: white; border: white;">확인하기</button></td>


									</tr>
									<tr>
										<td>1</td>
										<td>사고</td>
										<td>않이 이게 웨 안뒈</td>
										<td>이거 살짝 엑시던트임</td>
										<td>2022-02-09</td>
										<td></td>
										<td><button id="checkButton"
												onclick="window.open('admin-customer-answer-modi.html','window_name','width=500,height=450, scrollbars=yes' );"
												style="background-color: white; border: white;">확인하기</button></td>
									</tr>
									<tr>
										<td>1</td>
										<td>사고</td>
										<td>않이 이게 웨 안뒈</td>
										<td>이거 살짝 엑시던트임</td>
										<td>2022-02-09</td>
										<td></td>
										<td><button id="checkButton"
												onclick="window.open('admin-customer-answer-modi.html','window_name','width=500,height=450, scrollbars=yes' );"
												style="background-color: white; border: white;">확인하기</button></td>


									</tr>
									<tr>
										<td>1</td>
										<td>사고</td>
										<td>않이 이게 웨 안뒈</td>
										<td>이거 살짝 엑시던트임</td>
										<td>2022-02-09</td>
										<td></td>
										<td><button id="checkButton"
												onclick="window.open('admin-customer-answer-modi.html','window_name','width=500,height=450, scrollbars=yes' );"
												style="background-color: white; border: white;">확인하기</button></td>
									</tr>
									<tr>
										<td>1</td>
										<td>사고</td>
										<td>않이 이게 웨 안뒈</td>
										<td>이거 살짝 엑시던트임</td>
										<td>2022-02-09</td>
										<td></td>
										<td><button id="checkButton"
												onclick="window.open('admin-customer-answer-modi.html','window_name','width=500,height=450, scrollbars=yes' );"
												style="background-color: white; border: white;">확인하기</button></td>


									</tr>
									<tr>
										<td>1</td>
										<td>사고</td>
										<td>않이 이게 웨 안뒈</td>
										<td>이거 살짝 엑시던트임</td>
										<td>2022-02-09</td>
										<td></td>
										<td><button id="checkButton"
												onclick="window.open('admin-customer-answer-modi.html','window_name','width=500,height=450, scrollbars=yes' );"
												style="background-color: white; border: white;">확인하기</button></td>
									</tr>
									<tr>
										<td>1</td>
										<td>사고</td>
										<td>않이 이게 웨 안뒈</td>
										<td>이거 살짝 엑시던트임</td>
										<td>2022-02-09</td>
										<td></td>
										<td><button id="checkButton"
												onclick="window.open('admin-customer-answer-modi.html','window_name','width=500,height=450, scrollbars=yes' );"
												style="background-color: white; border: white;">확인하기</button></td>


									</tr>
									<tr>
										<td>1</td>
										<td>사고</td>
										<td>않이 이게 웨 안뒈</td>
										<td>이거 살짝 엑시던트임</td>
										<td>2022-02-09</td>
										<td></td>
										<td><button id="checkButton"
												onclick="window.open('admin-customer-answer-modi.html','window_name','width=500,height=450, scrollbars=yes' );"
												style="background-color: white; border: white;">확인하기</button></td>
									</tr>



								</tbody>


							</table>
						</div>
					</div>
				</div>
			</main>
			<jsp:include page="../default/admin_footer.jsp"/>
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">by DGV © DGV COMPANY</div>

					</div>
				</div>
			</footer>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
</body>
</html>