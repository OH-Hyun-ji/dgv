 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>My QNA</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=1024"/>
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/layout.css">
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/myPage.css">
    <link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/movieTheater.css"/>
    <link href="${pageContext.request.contextPath }/resources/css/user/button.css" rel="stylesheet"  />
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
                  <div class="button-wrapping">
                  <span class="service-center-text">나의 문의내역</span>                 
              		 <button class="w-btn-outline w-btn-red-outline qna-button" type="button" onclick="location.href='/qnaRegister.do'">
                      문의하기
                      </button>
                    </div>
                    <div class="myPage-table-wrap" >
                  	<span><i class="fas fa-table me-1" style=" margin-right: 1%;"></i>1:1문의내역 </span>
                  	<table class="myPage-table">
								<thead class="myPage-table-wrapping">
									<tr>
										<th>번호</th>
										<th>유형</th>
										<th>제목</th>
										<th>내용</th>
										<th>날짜</th>
										<th>답변완료</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="userQnaOneList" items="${userQnaOneList}">
									<tr>
										<td>${userQnaOneList.dgv_inquiry_code}</td>
										<td>${userQnaOneList.dgv_inquiry_tag}</td>
										<td><a id="myPage-title" href="#">${userQnaOneList.dgv_inquiry_title}</a></td>
										<td><a id="myPage-text" href="#">${userQnaOneList.dgv_inquiry_text}</a></td>
										<td>${userQnaOneList.dgv_inquiry_user}</td>								
										<td>${userQnaOneList.dgv_inquiry_date}</td>								
										<td></td>								
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