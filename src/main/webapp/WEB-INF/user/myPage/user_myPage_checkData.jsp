<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>My Page Check Data</title>
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
						<div class="myPage-password">
							<div class="myPage-password-title"><span>비밀번호 확인</span></div>
							<div class="myPage-check-title">
								<div class="myPage-check-title-wrap"><span>고객님의 개인정보 보호를 위한 절차이오니 DGV 로그인시 사용하는 비밀번호를 입력해주세요.</span></div>
								<div class="myPage-mydata-all">
									<ul>
										<li id="myId">아이디</li>
										<li>비밀번호</li>
									</ul>
									<ul>
										<li id="myIdCk">idNumber</li>
										<li><input class="myPwCk"></li>
									</ul>
								</div>
							</div>
							<div class="myPage-button-wrap">
								<input class="myPage-button-wrap01" type="button" value="확인">
								<input class="myPage-button-wrap02" type="button" value="DGV 첫화면으로">
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