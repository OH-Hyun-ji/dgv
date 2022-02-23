<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/css/admin/styles.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath }/resources/css/user/button.css" rel="stylesheet"  />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    <script>
       function adminNotice(){
             var popupX =(window.screen.width/2)-(200/2);
             var popupY =(window.screen.height/2)-(300/2);
                            
             window.open('/adminNoticeRegister.mdo','','width=650,height=850,left='+popupX+',top='+popupY+'screenX='+popupX+'.screenY='+popupY);
		}
    </script>
</head>
<body class="sb-nav-fixed">
	<div id="layoutSidenav">
	    <jsp:include page="../default/admin_top_menu.jsp" />
		<jsp:include page="../default/admin_side_menu.jsp" />   
		  	<div id="layoutSidenav_content">
            <main>
				<div class="container-fluid px-4">
					<h1 class="mt-4" style="margin: 0.5rem;">공지사항</h1>
					<ol class="breadcrumb mb-4">
					</ol>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 목록							
						</div>
						<div style="display: flex; justify-content: end;margin-right: 2%;">
							<button class="w-btn-outline w-btn-red-outline" style="margin-left: 1%;margin-top: 1%; box-shadow: none; padding: 10px; width: 13%; margin-bottom: 10px;" 
                                     type="button" onclick="adminNotice()">
                                        Register
                            </button>
						</div>
						<div class="card-body">
							<table class="table">
								<thead>
									<tr>

										<th>번호</th>
										<th>작성자</th>
										<th>내용</th>
										<th>작성일</th>
										<th>조회</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>사고</td>
										<td><button id="checkButton"
												onclick="window.open('admin-notice.html','window_name','width=500,height=420,scrollbars=yes' );"
												style="background-color: white; border: white;">
												<u>공지사항 내용 나타날 곳</u>
											</button></td>
										<td>이거 살짝 엑시던트임</td>
										<td>2022-02-09</td>
									</tr>
									<tr>
										<td>2</td>
										<td>사고</td>
										<td><button id="checkButton"
												onclick="window.open('admin-notice.html','window_name','width=500,height=420,scrollbars=yes' );"
												style="background-color: white; border: white;">
												<u>공지사항 내용 나타날 곳</u>
											</button></td>
										<td>이거 살짝 엑시던트임</td>
										<td>2022-02-09</td>
									</tr>
									<tr>
										<td>3</td>
										<td>사고</td>
										<td><button id="checkButton"
												onclick="window.open('admin-notice.html','window_name','width=500,height=420,scrollbars=yes' );"
												style="background-color: white; border: white;">
												<u>공지사항 내용 나타날곳</u>
											</button></td>
										<td>이거 살짝 엑시던트임</td>
										<td>2022-02-09</td>
									</tr>
									<tr>
										<td>4</td>
										<td>사고</td>
										<td><button id="checkButton"
												onclick="window.open('admin-notice.html','window_name','width=500,height=420,scrollbars=yes' );"
												style="background-color: white; border: white;">
												<u>공지사항 내용 나타날 곳</u>
											</button></td>
										<td>이거 살짝 엑시던트임</td>
										<td>2022-02-09</td>
									</tr>
									<tr>
										<td>5</td>
										<td>사고</td>
										<td><button id="checkButton"
												onclick="window.open('admin-notice.html','window_name','width=500,height=420,scrollbars=yes' );"
												style="background-color: white; border: white;">
												<u>공지사항 내용 나타날 곳</u>
											</button></td>
										<td>이거 살짝 엑시던트임</td>
										<td>2022-02-09</td>
									</tr>
									<tr>
										<td>6</td>
										<td>사고</td>
										<td><button id="checkButton"
												onclick="window.open('admin-notice.html','window_name','width=500,height=420,scrollbars=yes' );"
												style="background-color: white; border: white;">
												<u>공지사항 내용 나타날 곳</u>
											</button></td>
										<td>이거 살짝 엑시던트임</td>
										<td>2022-02-09</td>
									</tr>
									<tr>
										<td>7</td>
										<td>사고</td>
										<td><button id="checkButton"
												onclick="window.open('admin-notice.html','window_name','width=500,height=420,scrollbars=yes' );"
												style="background-color: white; border: white;">
												<u>공지사항 내용 나타날 곳</u>
											</button></td>
										<td>이거 살짝 엑시던트임</td>
										<td>2022-02-09</td>
									</tr>
									<tr>
										<td>8</td>
										<td>사고</td>
										<td><button id="checkButton"
												onclick="window.open('admin-notice.html','window_name','width=500,height=420,scrollbars=yes' );"
												style="background-color: white; border: white;">
												<u>공지사항 내용 나타날 곳</u>
											</button></td>
										<td>이거 살짝 엑시던트임</td>
										<td>2022-02-09</td>
									</tr>
									<tr>
										<td>9</td>
										<td>사고</td>
										<td><button id="checkButton"
												onclick="window.open('admin-notice.html','window_name','width=500,height=420,scrollbars=yes' );"
												style="background-color: white; border: white;">
												<u>공지사항 내용 나타날 곳</u>
											</button></td>
										<td>이거 살짝 엑시던트임</td>
										<td>2022-02-09</td>
									</tr>
									<tr>
										<td>10</td>
										<td>사고</td>
										<td><button id="checkButton"
												onclick="window.open('admin-notice.html','window_name','width=500,height=420,scrollbars=yes' );"
												style="background-color: white; border: white;">
												<u>공지사항 내용 나타날 곳</u>
											</button></td>
										<td>이거 살짝 엑시던트임</td>
										<td>2022-02-09</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>

				</div>
			</main>
			<jsp:include page="../default/admin_footer.jsp" />
			
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