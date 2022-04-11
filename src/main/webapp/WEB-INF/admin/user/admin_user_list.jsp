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
			var openWin;
			function smsCheck(){
				let chk_val = [];
				
				window.name = "parentForm";
				const formDate = new FormData()
				 
				$('input:checkbox[id=userCheckMsg]').each(function(i){
					if($(this).is(":checked")==true && chk_val.indexOf($(this).val())== -1){
						chk_val.push($(this).val())						
					}				
				})
		
				
				$("#userPhoneList").val(chk_val)
				openWin = window.open('groupSMS.mdo','childForm','width=700,height=600')	
			//	opener.document.getElementById("userPhoneList").value = document.getElementById("smsUser").value
				openWin.document.getElementById("smsUser").value = document.getElementById("userPhoneList").value;        
		
				console.log("?? : "+ chk_val)
				console.log("??ss : "+ openWin.document.getElementById("smsUser").value)
	
			}
	
	
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
				dataType:"json",
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
				dataType:"json",
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
		function updateRank(userCode){
			window.open('/rankChoice.mdo?user_num='+userCode,'','width=430,height=500,scrollbars=yes')
		}
		function deleteAction(userCode){		
			const vo ={
					"user_num":userCode
			}
			$.ajax({
				method:"POST",
				url:"/userDelete.mdo",
				contentType:"application/json",
				dataType:"json",
				data:JSON.stringify(vo),
				success:function(result){
					if(result.msg=="SUCCESS"){
						window.location.reload()
					}
				},error:function(){
					console.log("통신실패")
				}
			})//close ajax
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
		input#userCheckMsg {
		    width: 31px;
		    height: 26px;
		}
		.movieC {
    
    margin: 10px;
    padding: 4px;
    text-align: center;
    text-transform: uppercase;
    transition: 0.5s;
    background-size: 200% auto;
    color: white;
    /* text-shadow: 0px 0px 10px rgb(0 0 0 / 20%); */
    box-shadow: 0 0 20px #eee;
    border-radius: 7px;
}
.movieC:hover {
    background-position: right center;
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
									<div style="display: flex;justify-content: end;">

										<button id="movieC" class = "movieC"style="width: 115px;height: 32px;margin-right: 45px;border-radius: 6px;color: black;font-weight: bolder;margin-bottom: 6px; 
											background-image: linear-gradient(to right, #fbc2eb 0%,#ef32d9 51%, #4286f4 100%);">SMS단체전송</button>

										

									</div>
									<tr>
										<th>No</th>
										<th>ID</th>
										<th>Name</th>
										<th>Phone</th>
										<th>Email</th>
										<th>Rank</th>
										<th>Point</th>
										<th>Status</th>
										<th>Rank Update/Choice</th>
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
										<td style="justify-content: center; display: flex;"><button  onclick="updateRank('${userList.user_num}')"><i class="fas fa-lightbulb"></i></button><input value="${userList.user_phone}" type="checkbox" id="userCheckMsg"></td>
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
		<form  method="post" name="formDataPhone">
			<input type="hidden" id="userPhoneList">
		</form>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resources/js/admin/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resources/js/admin/datatables-simple-demo.js"></script>
</body>
</html>
