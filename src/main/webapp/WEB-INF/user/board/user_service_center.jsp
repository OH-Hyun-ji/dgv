<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Service Center</title>
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
        <div id="cgvwrap">
        	<jsp:include page="../default/user_header.jsp"></jsp:include>
        
               <!-- Contaniner -->
            <div id="contaniner" class="">
                <!-- Contents Area -->
                <div id="contents" class="">
                    <!-- Contents Start -->
		<div class="myPage-cols-container">
             
                   <jsp:include page="../default/user_notice_side.jsp"></jsp:include>
                  <div class="myPage-content-wrap">
                  <span class="service-center-text">고객 센터</span>
	                  <div class="service-center-wrapping">
	                  <div class="service-center-01">
	                  	<a class="service-sub-01" href="#">
	                  		<i class="fas fa-allergies" style="height: 61px; width: 42%; place-self: center;"></i>
	                  		<span>자주찾는 질문</span>
	                  	</a>
	                  </div>
	                  <div class="service-center-02">
	                  	<a class="service-sub-01" href="/notice.do">
	                  		<i class="fas fa-apple-alt" style="height: 61px; width: 42%; place-self: center;"></i>
	                  		<span>공지사항</span>
	                  	</a>
	                  </div>
	                  <div class="service-center-03">
	                  	<a class="service-sub-01" href="#">
	                  		<i class="far fa-grin-squint-tears" style="height: 61px; width: 42%; place-self: center;"></i>
	                  		<span>나의 문의</span>
	                  	</a>
	                  </div>
                  </div>
                  <div class="service-table-wrap">
                  <div class="myPage-table-wrap" style="width: 47%;">
                  	<span><i class="fas fa-table me-1" style=" margin-right: 1%;"></i>공지사항</span>
                  	<table class="myPage-table">
								<thead class="myPage-table-wrapping">
									<tr>
										<th>번호</th>
										<th>내용</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td><a id="myPage-title" href="#">공지사항제목</a></td>
									</tr>							
								</tbody>
							</table>
                  	
                  </div>
                    <div class="myPage-table-wrap" style="width: 47%;">
                  	<span><i class="fas fa-table me-1" style=" margin-right: 1%;"></i>나의 문의내역</span>
                  	<table class="myPage-table">
								<thead class="myPage-table-wrapping">
									<tr>
										<th>번호</th>
										<th>내용</th>
										<th>답변완료</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td><a id="myPage-title" href="#">나의문의 제목</a></td>
										<td>나 자신</td>								
									</tr>							
								</tbody>
							</table>
                  	
                  </div>
                  </div>
                  <br><br><br><br><br>
                  <div class="bottom-text-wrap">
                   <span class="bottom-text">DGV 고객센터 : 1234-1234(상담가능 시간, 월~금 12:00~15:00) *이 외 시간은 자동 응답 안내 가능</span>
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