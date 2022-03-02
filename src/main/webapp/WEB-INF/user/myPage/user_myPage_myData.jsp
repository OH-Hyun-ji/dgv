<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
						<div class="myPage-password">
							<div class="myPage-update-title"><span>나의 정보</span></div>
							<div class="myPage-update-title-wrap">
								<div class="myPage-update-title-wrapper"><span>나의 프로필/DGV 정보</span></div>
								<div class="myPage-update-all">
									<div class="myPage-myId">
										<ul>
											<li>아이디  </li>
											<li><input  readonly="readonly"></li>
											 <c:if test="${!empty userID}">
	                   							  <span>${userID}</span>
	          							      </c:if>
										</ul>
									</div>
									<div class="myPage-myName">
										<ul>
											<li>이름  </li>
											<li><input type="text" readonly="readonly"></li>
											<c:if test="${!empty userID}">
	                   							  <span>${user_name}</span>
	          							      </c:if>
										</ul>										
									</div>
									<div class="myPage-myPass">
										<ul>
											<li>비밀번호  </li>
											<li><input type="password"></li>
										</ul>											
									</div>
									<div class="myPage-myPassCk">
										<ul>
											<li>비밀번호 확인  </li>
											<li><input type="password"></li>
										</ul>											
									</div>
									<div class="myPage-myEmail">
										<ul>
											<li>이메일  </li>
											<li><input type="text" readonly="readonly"></li>
										</ul>											
									</div>
									<div class="myPage-myPhone">
										<ul>
											<li>전화번호  </li>
											<li><input type="text" readonly="readonly"></li>
										</ul>									
									</div>
									<div class="myPage-myBirth">
										<ul>
											<li>생년월일  </li>
											<li><input type="text" readonly="readonly"></li>
										</ul>											
									</div>
								</div>
							</div>
						</div>
						<div class="myPage-update-allButton">
							<input type="submit" id="userUpdateBtn" value="회원정보수정" onclick="location.href='/logout.do'">
							<input type="button" value="회원탈퇴">
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