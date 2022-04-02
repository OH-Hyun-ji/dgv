<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/png" sizes="192x192"  href="${pageContext.request.contextPath }/resources/images/banana_real.png">
<title>My Point Log</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=1024" />
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/layout.css">
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/myPage.css">
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/movieTheater.css" />
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/profile.css" />
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/pointLog.css" />
	<link rel="stylesheet" media="all" type="text/css"  href="${pageContext.request.contextPath }/resources/css/user/userModule.css" />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<script type="text/javascript">	
		$(function(){
			$("#myDiscount").addClass("on")
			$(".feat-show1").addClass("fix")
			$(".feat-show1 li a#pointLog").css("color","red")
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
					<div class="myPage-myReserve-wrap">
						<div class="myPage-myReserve-wrapper">
							<div class="myPage-myReserve-wrapping">
								<section class="pointBoard">
									<div class="page-title">
									      <div class="container">
									          <h3>포인트 사용내역</h3>
									      </div>
									  </div>   
									    <div id="board-list">
									        <div class="container">
									            <table class="board-table">
									                <thead>
										                <tr>
										                    <th scope="col" class="th-num">번호</th>
										                    <th scope="col" class="th-title" style="width: 124px;">유형</th>
										                    <th scope="col" class="th-title" style="width: 200px;">사용 포인트</th>
										                    <th scope="col" class="th-title" style="width: 200px;">적립 포인트</th>
										                    <th scope="col" class="th-date" style="width: 200px;">잔여 포인트</th>
										                    <th scope="col" class="th-date">포인트 사용일</th>
										                </tr>								              
									                </thead>
									                <tbody>
									                 <c:forEach var="userMyPointLog" items="${userMyPointLog}" varStatus="status">
										                <tr>
										                    <td>${status.index+1 }</td>
										                    <th>
										                     <c:if test="${userMyPointLog.reserve_status ==1 }">
										                     	<span>환불</span>
										                     </c:if>
										                     <c:if test="${userMyPointLog.reserve_status ==0 }">
										                     	<span>사용</span>
										                     </c:if>									                     
										                    </th>
										                    <td>
										                    	<c:if test="${userMyPointLog.reserve_status ==1 }">
										                     		<span>- ${userMyPointLog.use_point } P</span>
											                     </c:if>
											                     <c:if test="${userMyPointLog.reserve_status ==0 }">
											                     	<span>${userMyPointLog.use_point } P</span>
											                     </c:if>					
															</td>
										                    <td>${userMyPointLog.earn_point } P </td>
										                    <td>${userMyPointLog.reserve_mypoint } P</td>
										                    <td>${userMyPointLog.reserve_date }</td>
										                </tr>
									                 </c:forEach>									
									                </tbody>
									            </table>
									        </div>
									    </div>
								</section>
							</div>
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