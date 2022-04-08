<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/png" sizes="192x192"  href="${pageContext.request.contextPath }/resources/images/banana_real.png">
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
			  window.open('/eventRegisterPage.mdo','','width=700,height=700')
		}
		function eventContinueCheck(e){
			
			const eventT = $("#eventContinueNum").val()
			var eventStatus ="0"
			
			console.log("현재 value : " + eventStatus)
			const eventVo ={
				"event_code": e,
				"event_status": eventStatus
			}
			
			$.ajax({
				method:"POST",
				url:"/changeEventStatus.mdo",
				contentType:"application/json",
				dataType:"json",
				data:JSON.stringify(eventVo),
				success:function(result){
					alert("비활성모드입니다. ")
					location.reload()
				
				},
				error:function(){
					console.log("통신 실패")
				}
			})//ajax close
			
		}
		function eventEndCheck(e){
			
			const eventT = $("#eventEndNum").val()
			var eventStatus ="1"
			
			console.log("현재 value : " + eventStatus)
			const eventVo ={
				"event_code": e,
				"event_status": eventStatus
			}
			
			$.ajax({
				method:"POST",
				url:"/changeEventStatus.mdo",
				contentType:"application/json",
				dataType:"json",
				data:JSON.stringify(eventVo),
				success:function(result){
					alert("비활성모드입니다. ")
					location.reload()
				
				},
				error:function(){
					console.log("통신 실패")
				}
			})//ajax close
			
		}
		
		
		//이벤트 삭제
		function deleteAction(e){
			console.log("내가찍은코드pk : "+ e)
			const res = confirm("정말로 삭제하시겠습니까?");
			 if(res == true){

				$.ajax({
					method:"POST",
					url:"deleteEvent.mdo",
					contentType:"application/json",
					dataType:"json",
					data:JSON.stringify({"event_code":e}),
					success:function(result){
						if(result.msg=="SUCCESS"){
							alert("삭제 완료!")
							location.reload()
						}
					},
					error:function(){
						console.log("통신실패")
					}
				}) //close ajax
			 }
		}
		
	</script>
	<style type="text/css">
.w-btn:hover {
    letter-spacing: 0;
    transform: 0;
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
					<h1 class="mt-4">이벤트관리</h1>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 이벤트목록
						</div>
						<div class="card-body">
							
							<table id="datatablesSimple" name="userTable">
								<thead>
									<div class="eventListBtn-container">
										<div class="eventListBtn-wrap">
											<button class="w-btn-outline w-btn-red-outline" style="margin-top: 1%; box-shadow: none; padding: 10px; width: 13%; left:500; top:400; margin-bottom: 10px; margin-bottom: 1%;" 
	                                        type="button" onclick="adminEvent()">
	                                            Register
	                                        </button>
	                                    </div>
										<div class="eventStatusBtn">
											<button id="currentEventList" class="w-btn w-btn-red" onclick="location.href='/adminEventList.mdo';">전체 이벤트목록</button>
											<button id="endEventList" class="w-btn w-btn-red" onclick="location.href='endEventList.mdo';">종료된이벤트</button>
											<button id="continueEventList" class="w-btn w-btn-red" onclick="location.href='continueList.mdo';">진행중인이벤트</button>
										</div>
									</div>
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
											<td style="padding-top: 64px;">${status.index+1}</td>
											<td><a href="/eventDetail.mdo?event_code=${eventList.event_code}"><img src="${eventList.event_img }" style="height: 129px;width: 192px;box-sizing: border-box;"></a></td>
											<td style="padding-top: 64px;;">${eventList.event_title }</td>
											<td style="padding-top: 64px;">${eventList.start_date }</td>
											<td style="padding-top: 64px;">${eventList.end_date }</td>
											<c:if test="${eventList.event_check != '1' }">
												<c:if test="${eventList.event_status == '0' }">
													<td style="padding-top: 64px;">
														<button id="eventEndNum" onclick="eventEndCheck(${eventList.event_code})" value="0" class="w-btn w-btn-gra3 w-btn-gra-anim" type="button" style="width: 83px;height: 25px;padding: 0; background:#777777;">비활성(예정)</button>
													</td>
												</c:if>
												<c:if test="${eventList.event_status == '1' }">
													<td style="padding-top: 64px;">
														<button id="eventContinueNum"  onclick="eventContinueCheck(${eventList.event_code})" value="1" class="w-btn w-btn-gra3 w-btn-gra-anim" type="button"  style="width: 83px;height: 25px;padding: 0;">활성(진행중)</button>
													</td>
												</c:if>		
											</c:if>
											<c:if test="${eventList.event_check == '1' }">
												<td style="padding-top: 64px;">
													<input id="eventEnd" disabled="disabled" type="button" value="기간 종료" readonly="readonly">
												</td>
											</c:if>									
												<td style="padding-top: 64px;">${eventList.event_winner }</td>
												<td style="padding-top: 64px;">${eventList.reg_id }</td>										
												<td style="text-align: center;padding-top: 64px;">
													<button id="delBt" onclick="deleteAction(${eventList.event_code })"><i class="fas fa-trash-alt"></i></button>
												</td>
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
