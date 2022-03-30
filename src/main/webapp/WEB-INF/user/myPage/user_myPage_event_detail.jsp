<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/png" sizes="192x192"  href="${pageContext.request.contextPath }/resources/images/banana_real.png">
<title>User Event Detail</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=1024" />
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/layout.css">
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/myPage.css">
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/movieTheater.css" />
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/profile.css" />
	<link rel="stylesheet" media="all" type="text/css"  href="${pageContext.request.contextPath }/resources/css/user/userModule.css" />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<script type="text/javascript">

	</script>
	<style type="text/css">
	h3 {
	    border-bottom: 1px solid #b6b6b6;
	    border-top: 1px solid #b6b6b6;
	    padding-top: 1rem;
	    padding-bottom: 1rem;
	    background-color: antiquewhite;
	    margin-bottom: 45px;
    	font-weight: bolder;
		}
	.myProfile-sub-contain > h2 {
	    font-size: 17px;
	    margin-top: 1rem;
	    margin-bottom: 1rem;
	    color: #6a6a6a;
	}
	</style>
</head>

<body class="">
	<div id="dgvwrap">
		<jsp:include page="../default/user_header.jsp"></jsp:include>

		<!-- Contaniner -->
		<div id="contaniner" class="">
			<!-- Contents Area -->
			<div id="contents" class="">
				<!-- Contents Start -->
				<jsp:include page="../default/user_myPage_top.jsp"></jsp:include>
				<div class="myPage-event-container">
					<jsp:include page="../default/user_myPage_side.jsp"></jsp:include>
					<div class="myEvent-wrap">
						<div class="myEvent-wrapper">
							<div class="myEvent-wrapping">
								<div class="event-notice-title"></div>
							</div>
							<div class="event-notice-btn-wrap">
								<button class="event-notice-prev">이전으로</button>
								<button class="event-notice-list">이벤트참여목록으로</button>
							</div>
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