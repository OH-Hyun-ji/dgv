<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/png" sizes="192x192"  href="${pageContext.request.contextPath }/resources/images/banana_real.png">
	<title>Admin user List</title>
	<link href="${pageContext.request.contextPath }/resources/css/admin/styles.css" rel="stylesheet" />
	 <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"	crossorigin="anonymous"></script>
	<script type="text/javascript">
		function deleteAction(id){
			
		let result = confirm("정말 삭제하시겠습니까??");
			console.log(id)
		if(result == true){
			console.log("쿄쿄");
			$.ajax({
				method:"POST",
				url:"/userDelete.mdo",
				contentType:"application/json",
				dataType:"json",
				data:JSON.stringify({"user_id":id}),
				success:function(num){
					
					location.replace("/userList.mdo");
				},
				error:function(){
					console.log("통신실패")
				}
			});//ajax close 

		}
	}
	function updateRank(num){
		 window.open('/rankChoice.mdo?user_num='+num,'','width=500,height=280');
	}
	</script>
</head>
<body class="sb-nav-fixed">
	<div id="layoutSidenav">
		<jsp:include page="../default/admin_top_menu.jsp"></jsp:include>
		<jsp:include page="../default/admin_side_menu.jsp"></jsp:include>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">영화매출순위</h1>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 베스트 영화
						</div>
						<div class="card-body" id="card-body-style">
							<table id="datatablesSimple" name="userTable">
								<thead style="background-color: antiquewhite;">
									<tr>
										<th>순위</th>
										<th>영화 제목</th>
										<th>영화 포스터</th>
										<th>예매횟수</th>
										<th>총 매출</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="bestMovieList" items="${bestMovieList}" varStatus="status">
									<tr>
										<td id="status-tool">${status.index+1}</td>
										<td id="status-tool">${bestMovieList.movie_title}</td>
										<td id="img-tool"><img id="bestImg" src="${bestMovieList.movie_img}"></td>
										<td id="status-tool">${bestMovieList.total_people}</td>
										<td id="status-tool">${bestMovieList.fomatter_price}</td>										
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
