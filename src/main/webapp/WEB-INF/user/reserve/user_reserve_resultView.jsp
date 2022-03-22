<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reserve View</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/button.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/movieChart.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css">    
    <link href="https://fonts.googleapis.com/css2?family=Dongle:wght@700&display=swap" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery.twbsPagination.js"></script>
 	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
<style>
.reserve_wrap{
    background-image: url(https://dgvworld.s3.ap-northeast-2.amazonaws.com/reserve10.JPG);
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    height: 800px;
    margin-top: 9rem;

}
div#reserveLogo-wrap {
    text-align: center;
    box-sizing: border-box;
    padding-top: 4rem;
    padding-left: 2em;
}
img#reserveLogo {
    width: 100px;
}
</style>
</head>

<body class="block">
<jsp:include page="../default/user_header.jsp"></jsp:include>
    <!--본격 콘텐츠-->
    <div id="contaniner" class style="height: 850px;">
        <!-- Contents Area -->
		<div id="contents" class style="width: 609px">
		<div class="reserve_wrap">
			<div id="reserveLogo-wrap">
				<img id="reserveLogo" alt="" src="${pageContext.request.contextPath }/resources/images/dgvMainLogo.png">
			</div>

		</div>
    </div>
</div>
   <jsp:include page="../default/user_bottom_reserve.jsp"></jsp:include>	
   <jsp:include page="../default/user_footer.jsp"></jsp:include>

</body>
</html>