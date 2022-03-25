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
    <link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/movieTheater.css"/>
    <link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/userModule.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css"> 
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
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
                  	<span><i class="fas fa-table me-1" style=" margin-right: 1%;"></i>나의 예매내역</span>
                  	<table class="myPage-table">
								<thead class="myPage-table-wrapping">
									<tr>
										<th>번호</th>
										<th>예매번호</th>
										<th>영화제목</th>
										<th>상영날짜</th>
										<th>예매날짜</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="myReserveList" items="${myReserveList}" varStatus="status">
										<tr>
											<td>${status.index+1 }</td>
											<td><a id="myPage-title" href="#">${myReserveList.reserve_merchant_uid }</a></td>
											<td>${myReserveList.movie_title}</td>
											<td>${myReserveList.reserve_movie_date}</td>
											<td>${myReserveList.reserve_date}</td>
										</tr>
									</c:forEach>						
								</tbody>
							</table>
                  	
                  </div>
                    <div class="myPage-table-wrap">
                  	<span><i class="fas fa-table me-1" style=" margin-right: 1%;"></i>나의 이벤트참여내역</span>
                  	<table class="myPage-table">
								<thead class="myPage-table-wrapping">
									<tr>
										<th>번호</th>
										<th>이벤트</th>
										<th>참여날짜</th>
										<th>이벤트종료일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="parEventList" items="${parEventList }" varStatus="status">
										<tr>
											<td>${status.index+1 }</td>
											<td><a id="myPage-title" href="#">${parEventList.event_title }</a></td>
											<td>${parEventList.par_date}</td>
											<td>${parEventList.event_end_date}</td>
										</tr>	
									</c:forEach>						
								</tbody>
							</table>
                  	
                  </div>
                     <div class="myPage-table-wrap">
                  	<span><i class="fas fa-table me-1" style=" margin-right: 1%;"></i>나의문의내역</span>
                  	<table class="myPage-table">
								<thead class="myPage-table-wrapping">
									<tr>
										<th>번호</th>
										<th>내용</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>조회</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="MyPageQnaOneList" items="${MyPageQnaOneList}" varStatus="status">
									<tr>
<!-- 번호 -->								<td>${MyPageQnaCount-status.index}</td>
<!-- 내용 -->								<td><a id="myPage-title" href="/myQna.do">${MyPageQnaOneList.dgv_inquiry_title}</a></td>
<!-- MyPage - 작성자 -->					<td>${userID}</td>
<!-- MyPage - 날짜, MyQna - 작성일 -->		<td>${MyPageQnaOneList.dgv_inquiry_date}</td>
<!-- MyPage - 조회수 있는것 -->				<td>0</td>
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