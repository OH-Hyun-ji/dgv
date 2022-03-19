<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Admin user List</title>
	<link href="${pageContext.request.contextPath }/resources/css/admin/styles.css" rel="stylesheet" />
	 <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"	crossorigin="anonymous"></script>
	<script type="text/javascript">

	</script>
	<style type="text/css">
		a#idDetail {
		    text-decoration: none;
		    color: black;
		}
	</style>
</head>
<body class="sb-nav-fixed">
	<div id="layoutSidenav">
		<jsp:include page="../default/admin_top_menu.jsp"></jsp:include>
		<jsp:include page="../default/admin_side_menu.jsp"></jsp:include>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">회원관리</h1>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 회원 상세 
						</div>
						<div class="card-body">
							<table id="datatablesSimple" name="userInfo">
								<tbody style="text-align-last: center;">		
									<tr id="trWrap">
										<th><label>Name</label></th>
										<td>${userVo.user_name }</td>
										<th><label>Email</label></th>
										<td>${userVo.user_email }</td>																							
									</tr>	
									<tr>
										<th><label>id</label></th>										
									 	<td>${userVo.user_id }</td>		
									 	<th><label>Point</label></th>										
									 	<td>${detailVo.user_point }</td>	
									</tr>
									<tr>
										<th><label>Phone</label></th>										
									 	<td>${userVo.user_phone }</td>		
									 	<th><label>Rank</label></th>										
									 	<td>${detailVo.user_rank }</td>	
									</tr>			
									<tr><th colspan="6"> </th></tr>
									<tr><th colspan="6" style="background-color: antiquewhite;">결제 내역</th></tr>
									<tr>
										<th>번호</th>									
										<th>영화제목</th>									
										<th>상영관</th>									
										<th>예약날짜</th>									
										<th>결제수단</th>									
										<th>결제금액</th>																
									</tr>
									<c:forEach var="myReserveList" items="${myReserveList}" varStatus="status">
										<tr>
											<td>${status.index+1 }</td>
											<td>${myReserveList.movie_title }</td>
											<td>${myReserveList.theater_name}</td>
											<td>${myReserveList.reserve_date }</td>
											<td>${myReserveList.reserve_method }</td>
											<td>${myReserveList.reserve_price }</td>
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
