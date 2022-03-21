<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event Detail</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user_event.css">
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/button.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
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
          <div class="event-list">
          		<button class="w-btn w-btn-gra3 w-btn-gra-anim event-list-btn" onclick="location.href='/event.do'">목록으로</button>
          </div>
        </div>
      </div>
     </div>
	 <jsp:include page="../default/user_bottom_reserve.jsp"></jsp:include>	
	 <jsp:include page="../default/user_footer.jsp"></jsp:include>
</body>
</html>