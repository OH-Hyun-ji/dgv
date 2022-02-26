<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
        <div id="cgvwrap">
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
										<th>내용</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>조회</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td><a id="myPage-title" href="#">참여이벤트이름</a></td>
										<td>나 자신</td>
										<td>2022-02-09</td>
										<td>0</td>
									</tr>							
								</tbody>
							</table>
                  	
                  </div>
                    <div class="myPage-table-wrap">
                  	<span><i class="fas fa-table me-1" style=" margin-right: 1%;"></i>나의 이벤트참여내역</span>
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
									<tr>
										<td>1</td>
										<td><a id="myPage-title" href="#">참여이벤트이름</a></td>
										<td>나 자신</td>
										<td>2022-02-09</td>
										<td>0</td>
									</tr>							
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
									<tr>
										<td>1</td>
										<td><a id="myPage-title" href="#">나의문의</a></td>
										<td>나 자신</td>
										<td>2022-02-09</td>
										<td>0</td>
									</tr>		
									<tr>
										<td>1</td>
										<td><a id="myPage-title" href="#">나의문의</a></td>
										<td>나 자신</td>
										<td>2022-02-09</td>
										<td>0</td>
									</tr>							
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