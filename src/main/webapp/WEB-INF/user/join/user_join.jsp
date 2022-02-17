<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 그 이상적인 감동을</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/style.css">
<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/button.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/user/swiper-bundle.min.css">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@700&display=swap" rel="stylesheet">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/user/swiper.min.js"></script>
<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
</head>

<body class="block" style="">
<jsp:include page="../default/user_header.jsp"></jsp:include>
	<div class="wrapper sign-up-background">
		<div class="inner">
			<div class="image-holder">
				<img id="poster" src="https://upload.wikimedia.org/wikipedia/ko/f/f2/%EC%96%B4%EB%B2%A4%EC%A0%B8%EC%8A%A4-_%EC%97%94%EB%93%9C%EA%B2%8C%EC%9E%84_%ED%8F%AC%EC%8A%A4%ED%84%B0.jpg" alt="">
			</div>
			<form action="register.do" id="registerForm" method="post">
				<p class="register-title">
					<img src="${pageContext.request.contextPath }/resources/images/dgvMainLogo.png">
					<span class="sign-up">Sign Up</span>
				</p>
				<div class="form-wrapper form-wrapper-id">
					<div class="form-wrapper">
						<input id="id" name="user_id" type="text" placeholder="아이디"
							class="form-control">
					</div>
				</div>

				<div class="form-wrapper">
					<input type="password" name="user_pw" placeholder="비밀번호"
						id="password" class="form-control"> <i
						class="zmdi zmdi-lock"></i>
				</div>
				<div class="form-wrapper">
					<input type="password" placeholder="비밀번호 확인" class="form-control"
						id="passwordRepeat" onChange="passwordValidate()"> <i
						class="zmdi zmdi-lock"></i>
				</div>

				<div class="form-wrapper">
					<input name="user_name" type="text" placeholder="이름"
						class="form-control"> <i class="zmdi zmdi-account-box"></i>
				</div>
				<!-- BIRTH -->

				<div class="form-wrapper">
					<!-- BIRTH_YY -->
					<div class="user-birth"> 
						<input class="userYear"  placeholder="년(4자)">
						<!-- BIRTH_MM -->
						<select class="userMonth">
							<option class="optionMonth">월</option>
							<option value="01">1월</option>
							<option value="02">2월</option>
							<option value="03">3월</option>
							<option value="04">4월</option>
							<option value="05">5월</option>
							<option value="06">6월</option>
							<option value="07">7월</option>
							<option value="08">8월</option>
							<option value="09">9월</option>
							<option value="10">10월</option>
							<option value="11">11월</option>
							<option value="12">12월</option>
						</select>
						<!-- BIRTH_DD -->
						<input class="userDay" placeholder="일">
					</div>
				</div>

				<div class="form-wrapper">
					<input type="text" name="user_phone" placeholder="휴대폰번호"
						class="form-control"> <i class="zmdi zmdi-phone"></i>
				</div>

				<div class="form-wrapper">
					<input type="email" name="user_email" placeholder="이메일"
						class="form-control"> <i class="zmdi zmdi-email"></i>
				</div>

				<button class="w-btn w-btn-gra3 w-btn-gra-anim" type="submit" style="width: 80%; margin-left: 11%; padding-top: 6px;">
        			<span class="sign-up-font">Register</span>
   				 </button>
				</form>
		</div>
	</div>
	<script src="./js/register.js"></script>
   <jsp:include page="../default/user_footer.jsp"></jsp:include>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>