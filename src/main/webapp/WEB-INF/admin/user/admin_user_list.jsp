<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Admin user List</title>
	<link href="${pageContext.request.contextPath }/resources/css/admin/styles.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath }/resources/css/user/button.css" rel="stylesheet"  />
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"	crossorigin="anonymous"></script>
	<script type="text/javascript">
		function userTrueCheck(statusNum) {
			const userStatus = false;
			
			const userVo ={
				"user_num":statusNum,
				"user_status":userStatus
			}
			
			$.ajax({
				method:"POST",
				url:"/userStatusChange.mdo",
				contentType:"application/json",
				dataTypt:"json",
				data:JSON.stringify(userVo),
				success:function(result){
					if(result.msg=="SUCCESS"){
						alert("비활성모드 전환")
						location.reload()
					}
						
				},
				error:function(){
					console.log("통신실패")
				}
			})//ajax close
			
		}
		function userFalseCheck(statusNum) {
			const userStatus = true;
			
			const userVo ={
				"user_num":statusNum,
				"user_status":userStatus
			}
			
			$.ajax({
				method:"POST",
				url:"/userStatusChange.mdo",
				contentType:"application/json",
				dataTypt:"json",
				data:JSON.stringify(userVo),
				success:function(result){
					if(result.msg=="SUCCESS"){
						alert("활성모드 전환")
						location.reload()
					}
						
				},
				error:function(){
					console.log("통신실패")
				}
			})//ajax close
			
		}
	</script>
	<style type="text/css">
		a#idDetail {
		    text-decoration: none;
		    color: black;
		}
		.dataTable-container {
		    text-align-last: center;
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
							<i class="fas fa-table me-1"></i> 회원목록
						</div>
						<div class="card-body">
							<table id="datatablesSimple" name="userTable">
								<thead>
									<tr>
										<th>No</th>
										<th>ID</th>
										<th>Name</th>
										<th>Phone</th>
										<th>Email</th>
										<th>Rank</th>
										<th>Point</th>
										<th>Status</th>
										<th>Update/Delete</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="userList" items="${userList}" varStatus="status">
									<tr id="trWrap">
										<td>${userListCount - status.index}</td>
										<td><a id="idDetail" href="userDetail.mdo?user_num=${userList.user_num}">${userList.user_id}</a></td>
										<td><a id="idDetail" href="userDetail.mdo?user_num=${userList.user_num}">${userList.user_name}</a></td>
										<td><a id="idDetail" href="userDetail.mdo?user_num=${userList.user_num}">${userList.user_phone}</a></td>
										<td><a id="idDetail" href="userDetail.mdo?user_num=${userList.user_num}">${userList.user_email}</a></td>										
									 	<td><a id="idDetail" href="userDetail.mdo?user_num=${userList.user_num}">${userList.user_rank}</a></td>
										<td>${userList.user_point}</td>
										<td>									
											<c:if test="${userList.user_status == true}">
												<button id="userTure" onclick="userTrueCheck(${userList.user_num})"  class="w-btn w-btn-gra3 w-btn-gra-anim" type="button"  style="width: 83px;height: 25px;padding: 0;">활성</button>
											</c:if>
											<c:if test="${userList.user_status == false}">
												<button id="userFalse" onclick="userFalseCheck(${userList.user_num})"  class="w-btn w-btn-gra3 w-btn-gra-anim" type="button" style="width: 83px;height: 25px;padding: 0; background:#777777;">비활성</button>
											</c:if>
										</td>
										<td style="text-align: center;"><button id="delBt"  onclick="deleteAction('${userList.user_id}')"><i class="fas fa-trash-alt"></i></button> <button  onclick="updateRank('${userList.user_num}')"><i class="fas fa-pencil-alt"></i></button></td>
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
