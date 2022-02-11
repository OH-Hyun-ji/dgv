<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 그 이상적인 감동을</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/style.css">
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

<body class="block" style="background-position-y: bottom;
    background-image: url('http://res.heraldm.com/content/image/2022/02/03/20220203000304_0.jpg');
    background-repeat : no-repeat;
    background-size : cover;">
<jsp:include page="../default/user_header.jsp"></jsp:include>
	<div class="wrapper" style="">
		<div class="inner">
			<div class="image-holder">
				<img id="poster" src="https://upload.wikimedia.org/wikipedia/ko/f/f2/%EC%96%B4%EB%B2%A4%EC%A0%B8%EC%8A%A4-_%EC%97%94%EB%93%9C%EA%B2%8C%EC%9E%84_%ED%8F%AC%EC%8A%A4%ED%84%B0.jpg" alt="">
			</div>
			<form action="register.do" id="registerForm" method="post">
				<p class="register-title">
					<img src="http://img.cgv.co.kr/R2014/images/title/h1_cgv.png">
					<span style="color: white;">회원가입</span>
				</p>
				<div class="form-wrapper form-wrapper-id">
					<div class="id-wrapper">
						<input id="id" name="id" type="text" placeholder="아이디"
							class="form-control">
						<!-- <i class="zmdi zmdi-id">아이디 체크</i> -->
						<button type="button" class="idCheckButton">아이디 체크</button>
					</div>
				</div>

				<div class="form-wrapper">
					<input type="password" name="password" placeholder="비밀번호"
						id="password" class="form-control"> <i
						class="zmdi zmdi-lock"></i>
				</div>
				<div class="form-wrapper">
					<input type="password" placeholder="비밀번호 확인" class="form-control"
						id="passwordRepeat" onChange="passwordValidate()"> <i
						class="zmdi zmdi-lock"></i>
				</div>

				<div class="form-wrapper">
					<input name="name" type="text" placeholder="이름"
						class="form-control"> <i class="zmdi zmdi-account-box"></i>
				</div>
				<!-- BIRTH -->

				<div class="form-wrapper">
					<!-- BIRTH_YY -->
					<div class="form-control"> 
						<input class="yy" style="width: 38%; height: 30px;"
						 type="text"  maxlength="4" placeholder="년(4자)">
						<!-- BIRTH_MM -->
						<select class="mm" style="width: 20%; height: 30px;">
							<option>월</option>
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
						<input type="text" class="dd" style="width: 96px;    height: 30px;" 
							maxlength="2" placeholder="일">
					</div>
				</div>

				<div class="form-wrapper">
					<input type="text" name="phoneNumber" placeholder="휴대폰번호"
						class="form-control"> <i class="zmdi  zmdi-phone"></i>
				</div>

				<div class="form-wrapper">
					<input type="email" name="email" placeholder="이메일"
						class="form-control"> <i class="zmdi zmdi-email"></i>
				</div>


				<button class="registerButton clickedButton" disabled="disabled">
					<span>회원가입 하기</span> <i class="zmdi zmdi-arrow-right"></i>
				</button>
			</form>
		</div>
	</div>
	<script src="./js/register.js"></script>
   <jsp:include page="../default/user_footer.jsp"></jsp:include>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>