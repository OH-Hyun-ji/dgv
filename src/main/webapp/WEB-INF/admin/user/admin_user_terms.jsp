<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin User Terms</title>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath }/resources/css/admin/styles.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath }/resources/css/user/button.css" rel="stylesheet"  />
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<script type="text/javascript">
	function termDetail(e){	
	    window.open('TermDetail.mdo?term_num='+e,'','width=650,height=800');
	 }
	function deleteTerm(e){
		const message = confirm("정말로 삭제하시겠습니까?")
		
		if(message){
			
			$.ajax({
				method:"POST",
				url:"deleteTerm.mdo",
				contentType:"application/json",
				dataType:"json",
				data:JSON.stringify({"term_num":e}),
				success:function(result){
					if(result.msg=="SUCCESS"){
						alert("삭제가 완료되었습니다.")
						window.opener.location.reload()
						window.close()
					}
					else{
						alert("오류발생! 삭제를 다시 시도해주세요!!")
					}
				},
				error:function(){
					console.log("통신실패")
				}
			})//ajax close
		}
	}
	</script>
	<style>
#delBT {
	border: none;
	background-color: rgb(255, 255, 255);
	color: red;
	font-weight: bolder;
}

#userLankAdd {
	width: 11%;
	margin-top: 17px;
	margin-left: 88%;
	height: 43px;
	background-color: #f1eeee;
	border-color: #f1eeee;
	box-shadow: 0px 0px 20px #000;
	border-radius: 2px;
	font-weight: bold;
}
a#termStyle {
    color: black;
    text-decoration: none;
    cursor: pointer;
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
					<h1 class="mt-4">약관관리</h1>

					<div class="card mb-4"></div>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 약관목록
						</div>
						<div>
							<!--약관 동의 등록 창띄우기-->
							<script>
                                    function adminTerms(){
                                    var popupX =(window.screen.width/2)-(200/2);
                                    var popupY =(window.screen.height/2)-(300/2);
                            
                                    window.open('/userTermRegister.mdo','','width=650,height=700,left='+popupX+',top='+popupY+'screenX='+popupX+'.screenY='+popupY);
                                    }
                                </script>

							<button id="userLankAdd" onclick='adminTerms()'>약관등록</button>
						</div>
						<div class="card-body">
							<table id="datatablesSimple">
								<thead>
									<tr>
										<th>No</th>
										<th>Term Name</th>
										<th>Term Status</th>
										<th>Term Agree User</th>
										<th>Writer</th>
										<th>Date</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="termList" items="${termList}" varStatus="status" >
									<tr>
										<td>${termListCount - status.index }</td>
										<td><a id="termStyle"  onclick="termDetail(${termList.term_num })">${termList.term_name }</a></td>
										<c:if test="${termList.term_status ==true }">
											<td style="text-align: center;"><button id="statusTrue"  class="w-btn w-btn-gra3 w-btn-gra-anim" type="button"  style="width: 70px;height: 25px;padding: 0;">활성</button></td>
										</c:if>
										<c:if test="${termList.term_status ==false }">
											<td style="text-align: center;"><button id="statusFalse"  class="w-btn w-btn-gra3 w-btn-gra-anim" type="button" style="width: 70px;height: 25px;padding: 0; background:#777777;">비활성</button></td>
										</c:if>
										<td>${termList.user_term }</td>
										<td>${termList.reg_id }</td>
										<td>${termList.reg_date }</td>
										<td><button id="delBt"  onclick="deleteTerm('${termList.term_num }')"><i class="fas fa-trash-alt"></i></button></td>
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/admin/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/admin/datatables-simple-demo.js"></script>

</body>

</html>
