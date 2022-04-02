<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/png" sizes="192x192"  href="${pageContext.request.contextPath }/resources/images/banana_real.png">
<title>Event Detail</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user_event.css">
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/button.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
	<script type="text/javascript">
		function eventAction(event){
			const eventCode = event;
			
			$.ajax({
				method:"POST",
				url:"/userParEvent.do",
				contentType:"application/json",
				dataType:"json",
				data:JSON.stringify({"event_code": eventCode}),
				success:function(result){
					if(result.msg=="SUCCESS"){
						alert("이벤트 참여 완료!")
						location.href='myPage_event.do';
					}else if(result.msg=="EXIST"){
						alert("이미 참여한 이벤트 입니다. ")
						location.href='myPage_event.do'
					}
				},
				error:function(){
					
					console.log("통신실패")
				}
,			})
		}
	</script>
</head>
<body class="block">
<jsp:include page="../default/user_header.jsp"></jsp:include>
  <!--본격 콘텐츠-->
  <div id="contaniner" class="" style="height: 9000px;">
    <!-- Contents Area -->
    <div class="event-board-wrap" style="height: 9000px;
"> 
    <jsp:include page="../default/user_event_header.jsp"></jsp:include>
        <div class="cols-content" style="width: 980px;padding: 0;">
          <div class="col-detail event">
				<div class="user-eventT-wrap">
					<span class="user-eventT">${eventVo.event_title }</span>
				</div>
         	   <img class="event-text-img" src="${eventVo.event_text_img}">          
          </div>
          <div class="event-list" style="display: inline-flex;">
          		<button class="w-btn w-btn-gra3 w-btn-gra-anim event-list-btn" onclick="location.href='/eventWinner.do'" style="margin-left: 0px;">목록으로</button>
          		<c:if test="${eventVo.button_status == true}">
	          		<button class="w-btn w-btn-gra3 w-btn-gra-anim event-list-btn" onclick="eventAction(${eventVo.event_code})" style="width: 150px;margin-left: 558px;">이벤트 참여하기</button>          		
          		</c:if>
          		<c:if test="${eventVo.button_status == false}">
	          		<button class="event-list-disables-btn" disabled="disabled" style="width: 150px;margin-left: 558px;">이벤트 참여하기</button>          		
          		</c:if>
          </div>
        </div>
      </div>
     </div>
	 <jsp:include page="../default/user_bottom_reserve.jsp"></jsp:include>	
	 <jsp:include page="../default/user_footer.jsp"></jsp:include>
</body>
</html>