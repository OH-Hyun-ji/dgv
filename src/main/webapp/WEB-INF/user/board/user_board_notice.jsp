<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/png" sizes="192x192"  href="${pageContext.request.contextPath }/resources/images/banana_real.png">
<title>Notice</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=1024"/>
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/layout.css">
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/myPage.css">
    <link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/movieTheater.css"/>
    <link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/userModule.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css"> 
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
<style type="text/css">
table.myPage-table {
    height: 220px;
}
td {
    box-sizing: border-box;
    padding-top: 6px;
    border-right: 1px solid #8080807a;
}
th{
	box-sizing: border-box;
    padding-top: 3px;
    border-right: 1px solid #8080807a;
}
.myPage-table-wrap > span {
	height: 49px;
    box-sizing: border-box;
    padding-top: 2%;
    font-size: 18px;
}
thead.myPage-table-wrapping >tr {
	line-height: 40px;
}
</style>
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
                  <span class="service-center-text">공지사항</span>                 
              
                    <div class="myPage-table-wrap" >
                  	<span><i class="fas fa-table me-1" style=" margin-right: 1%;"></i>공지사항</span>
                  	<table class="myPage-table">
								<thead class="myPage-table-wrapping">
									<tr>
										<th style="width: 34px;">번호</th>
										<th style="width: 200px;">제목</th>
										<th style="width: 308px;">내용</th>
										<th style="width: 80px">관리자</th>
										<th style="width: 95px">날짜</th>
										<th>조회수</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="noticeList" items="${noticeList}" varStatus="status">
									<tr>
										<td>${status.index+1 }</td>
										<td><a href="/noticeDetail.do?notice_num=${noticeList.notice_num}">${noticeList.notice_title }</a></td>
										<td><a href="/noticeDetail.do?notice_num=${noticeList.notice_num}">${noticeList.notice_text }</a></td>
										<td>${noticeList.reg_id }</td>
										<td>${noticeList.reg_date }</td>
										<td>${noticeList.notice_count }</td>								
									</tr>
								</c:forEach>							
								</tbody>
							</table>
                  	
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