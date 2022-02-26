 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		function userQna(){
			var popupX =(window.screen.width/2)-(200/2);
	        var popupY =(window.screen.height/2)-(300/2);
	 	
	      window.open("/qnaRegister.do",'','width=650,height=700,left='+popupX+',top='+popupY+'screenX='+popupX+'.screenY='+popupY);

		}
	</script>
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
                  <span class="service-center-text">문의하기</span>                 
                    </div>
                    <div class="myPage-table-wrap" >
                  	<span><i class="fas fa-table me-1" style=" margin-right: 1%;"></i>문의작성</span>
                  	 <table border="1" style="border-color: coral;margin-left: 4%;">                      
                        <tr>
                            <td style="background-color: lightgray; ">Notice Title</td>
                            <td><input type="text" name="notice_title" id="noticeTitle"style="border-color: lightgray;"></td>
                        </tr>
             
                         <tr>
                            <td style="background-color: lightgray;">Notice Text</td>
                            <td> <textarea rows="25" cols="65" name="notice_text" id="noticeText" style="border-color: lightgray;"></textarea></td>
                        </tr>
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