<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/png" sizes="192x192"  href="${pageContext.request.contextPath }/resources/images/banana_real.png">
<title>My Page</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=1024"/>
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/layout.css">
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/myPage.css">
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/button.css">
    <link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/movieTheater.css"/>
    <link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/userModule.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css"> 
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<script type="text/javascript">
	
	function classAction(list){
	    list.forEach(li => {
	        console.log('TEST 2:');
	        cleanList(list, li);
	    });
	}
	function cleanList(list, li){
		li.addEventListener('click',function(){
			list.forEach(li => {
				li.classList.remove('on')
			})
			
		})
		const selectLi = document.querySelectorAll('.mySide li')
		classAction(selectLi)
	}
	$(function(){
		$("#myEventJoin").addClass("on")
		$("#myMain").removeClass("on")
	})
	</script>
</head>
<body class="">
	<div id="dgvwrap">
		<jsp:include page="../default/user_header.jsp"></jsp:include>

		<!-- Contaniner -->
		<div id="contaniner" class="">
			<!-- Contents Area -->
			<div id="contents" class="">
				<!-- Contents Start -->
				  <jsp:include page="../default/user_myPage_top.jsp"></jsp:include>
				<div class="myPage-cols-container">
					<jsp:include page="../default/user_myPage_side.jsp"></jsp:include>
					<div class="myPage-content-wrap">
						<div class="myPage-table-wrap">
							<span><i class="fas fa-table me-1"
								style="margin-right: 1%;"></i>나의 이벤트 참여내역</span>
							<table class="myPage-table">
								<thead class="myPage-table-wrapping">
									<tr>
										<th>NO</th>
										<th>Event</th>									
										<th>JoinDate</th>
										<th>EndDate</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="parEventList" items="${parEventList }" varStatus="status">
									<tr>
										<td>${status.index+1 }</td>
										<td>
											<a id="myPage-title" href="eventDetail.do?event_code=${parEventList.event_code}">${parEventList.event_title }</a>
										</td>										
										<td>${parEventList.par_date }</td>
										<c:if test="${parEventList.event_check == '1' }">
											<td><button class="w-btn w-btn-gra3 w-btn-gra-anim" id="winnerStyle-change" onclick="javascript:location.href='/eventWinnerPage.do?event_code=${parEventList.event_code}'">당첨자 확인</button></td>
										</c:if>
										<c:if test="${parEventList.event_check == '0' }">
											<td>${parEventList.event_end_date }</td>
										</c:if>
									</tr>
								</c:forEach>
								</tbody>
							</table>

						</div>

					</div>
				</div>
			</div>

		</div>

	</div>

	<jsp:include page="../default/user_bottom_reserve.jsp"></jsp:include>
	<jsp:include page="../default/user_footer.jsp"></jsp:include>
</body>
</html>