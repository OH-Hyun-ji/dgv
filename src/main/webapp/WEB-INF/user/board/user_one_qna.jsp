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
	<script type="text/javascript">
	</script>
	<style type="text/css">

table.myPage-table {
      height: 160px;
      table-layout:fixed;
      
}

td {
    box-sizing: border-box;
    padding-top: 6px;
    border-right: 1px solid #8080807a;

    line-height: 46px;
    overflow:hidden;
    white-space:nowrap;
    text-overflow:ellipsis;
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
.myPage-table-wrap {
    height: 78%;
}
#qna-often-btn, #qna-btn{
    background-color: darkgray;
    border: 0;
    height: 25px;
    width: 85px;
    color:white;
    font-weight: bolder;
    border-radius: 3px;
}
#qna-often-btn:hover, #qna-btn:hover{
	background-color: wheat;
	font-weight: bolder;
	color:gray;
	border-radius: 2px;
}
input#waitingAnswer {
    background-color: #80808042;
    width: 73px;
    height: 21px;
    border: 1px solid #8080807a;
    border-radius: 4px;
    text-align: center;
}
#finishAnswer {
    width: 79px;
    height: 28px;
    padding: 0;
    border-radius: 6px;
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
                  <div class="button-wrapping">
                  <span class="service-center-text">자주찾는 질문</span>                 
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
										<th>답변상태</th>
									</tr>
								</thead>
								<tbody>	
								<c:forEach var="userQnaOneList" items="${userQnaOneList}" varStatus="status">
									<tr>
										<td>${status.index+1}</td>
										<td>${userQnaOneList.dgv_inquiry_tag}</td>
										<td><a id="myPage-title" href="#">${userQnaOneList.dgv_inquiry_title}</a></td>
										<td><a id="myPage-text" href="#">${userQnaOneList.dgv_inquiry_text}</a></td>																		
										<td>${userQnaOneList.dgv_inquiry_date}</td>								
										<td>
											<c:choose>
												<c:when test="${userQnaOneList.dgv_inquiry_status == 1}">
													<button id="finishAnswer" class="w-btn w-btn-gra3 w-btn-gra-anim" type="button" onclick="location.href='/adminAnswer.do?dgv_inquiry_code=${userQnaOneList.dgv_inquiry_code}'">답변완료</button>																	
												</c:when>
												<c:otherwise>
													<input id="waitingAnswer" type="text" value="답변대기중" readonly="readonly">													
												</c:otherwise>											
											</c:choose>	
										</td>										
									</tr>	
								</c:forEach>							
								</tbody>
							</table>
							<div class="qna-one-wrap">
								<div class="qna-one-wrap01">
									<div class="qna-often-icon">									
										<i class="far fa-smile-wink" style="width: 66px; height: 49px; color: dimgrey;"></i>
									</div>
									<div class="qna-often-wrapping">
									<div class="qna-often-title">
										<span>자주하시는 질문</span>
										<input type="button" id="qna-btn" onclick="location.href='/oftenQna.do'" value="바로가기">
									</div >
									<div class="qna-often-text">
										<span>고객님들께서 주로 하시는 질문에 대한 답변을 한곳에 모아두었습니다.</span>
									</div>
									</div>
								</div>
								<div class="qna-one-wrap02">
									<div class="qna-often-icon">									
										<i class="fas fa-head-side-cough" style="width: 66px; height: 49px; color: dimgrey;"></i>
									</div>
									<div class="qna-often-wrapping">
										<div class="qna-often-title"style="margin-top: 18%;">
											<span>고객의 말씀</span>
											<input type="button" id="qna-often-btn" onclick="location.href='/qnaRegister.do'" value="바로가기">
										</div >
										<div class="qna-often-text" style="margin-top: 4%;">
											<span>불편사항과 문의사항을 남겨주시면 <br>친절히 답변드리겠습니다.</span>
											
										</div>
									</div>
								</div>
							</div>
                  	
                  </div>
                
                  <br>
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