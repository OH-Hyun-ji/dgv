<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Often QNA</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=1024"/>
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/layout.css">
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/myPage.css">
	<link href="${pageContext.request.contextPath }/resources/css/user/button.css" rel="stylesheet"  />
    <link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/movieTheater.css"/>
    <link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/userModule.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css"> 
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<style type="text/css">
		.often-qna-wrap {
		    box-sizing: border-box;
		    padding-top: 12px;
		}
		button.w-btn-outline.w-btn-gray-outline.btn1 {
		    box-shadow: none;
		    line-height: 3px;
		    border-bottom: none;
		}
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
                  <span class="service-center-text">자주찾는 질문</span>                 
              	<div class="often-qna-wrap">
              		 <button class="w-btn-outline w-btn-gray-outline btn1" type="button"> BUTTON</button>
              		 <button class="w-btn-outline w-btn-gray-outline btn1" type="button"> BUTTON</button>
              		 <button class="w-btn-outline w-btn-gray-outline btn1" type="button"> BUTTON</button>
              		 <button class="w-btn-outline w-btn-gray-outline btn1" type="button"> BUTTON</button>
              		 <button class="w-btn-outline w-btn-gray-outline btn1" type="button"> BUTTON</button>
              	</div>
                    <div class="myPage-table-wrap" style="margin-top: 0%;border-top: 4px solid rgba(0, 0, 0, 0.2);"">
                  	<span><i class="fas fa-table me-1" style=" margin-right: 1%;"></i>자주찾는 질문 </span>
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
										<td><a id="myPage-title" href="#">자주찾는질문제목</a></td>
										<td>나 자신</td>								
									</tr>							
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