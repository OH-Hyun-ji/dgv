<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Admin Event List</title>
	<link href="${pageContext.request.contextPath }/resources/css/admin/styles.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath }/resources/css/user/button.css" rel="stylesheet"  />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"	crossorigin="anonymous"></script>
	<script type="text/javascript">
		function adminEvent(){
			  window.open('/eventRegisterPage.mdo','','width=500,height=500')
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
					<h1 class="mt-4">이벤트관리</h1>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 이벤트목록
						</div>
						<div class="card-body">
							<table id="datatablesSimple" name="userTable">
								<thead>
										<button class="w-btn-outline w-btn-red-outline" style="margin-top: 1%; box-shadow: none; padding: 10px; width: 13%; left:500; top:400; margin-bottom: 10px; margin-bottom: 1%;" 
                                        type="button" onclick="adminEvent()">
                                            Register
                                        </button>	
									<tr>
										<th>번호</th>
										<th>이벤트 배너</th>
										<th>이벤트이름</th>
										<th>시작날짜</th>
										<th>종료날짜</th>
										<th>활성화여부</th>
										<th>당첨자</th>
										<th>작성자</th>
										<th>Update/Delete</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="eventList" items="${eventList}" varStatus="status">
										<tr id="trWrap" style="text-align-last: center;">
											<td style="padding-top: 4%;">${status.index+1}</td>
											<td><img src="${eventList.event_img }" style="width: 192px;box-sizing: border-box;"></td>
											<td style="padding-top: 4%;">${eventList.event_title }</td>
											<td style="padding-top: 4%;">${eventList.start_date }</td>
											<td style="padding-top: 4%;">${eventList.end_date }</td>
											<c:if test="${eventList.event_status == '0' }">
												<td style="padding-top: 4%;"><button>비활성(종료)</button></td>
											</c:if>
											<c:if test="${eventList.event_status == '1' }">
												<td style="padding-top: 4%;"><button>활성(진행중)</button></td>
											</c:if>											
											<td style="padding-top: 4%;">${eventList.event_winner }</td>
											<td style="padding-top: 4%;">${eventList.reg_id }</td>										
											<td style="text-align: center;padding-top: 4%;"><button id="delBt"  onclick="deleteAction('')"><i class="fas fa-trash-alt"></i></button> <button  onclick="updateRank('')"><i class="fas fa-pencil-alt"></i></button></td>
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