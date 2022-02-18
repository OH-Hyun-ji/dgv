<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 그 이상적인 감동을</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/style.css">
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/button.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/swiper-bundle.min.css">
	<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@700&display=swap" rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
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
						<input id="id" name="user_id" type="text" placeholder="아이디" class="form-control" maxlength="15">
							<div style="text-align: center;"><span id="idCK"></span></div>
					</div>
				</div>

				<div class="form-wrapper">
					<input type="password" name="user_pw" placeholder="비밀번호" id="password" class="form-control"> 
						<i class="zmdi zmdi-lock"></i>
							
				</div>
				<div class="form-wrapper">
					<input type="passwordCK" placeholder="비밀번호 확인" class="form-control" id="passwordRepeat" onChange="passwordValidate()"> 
						<i class="zmdi zmdi-lock"></i>
							<div style="text-align: center;"><span id="psCK"></span></div>
				</div>

				<div class="form-wrapper">
					<input name="user_name" type="text" placeholder="이름" class="form-control"> 
						<i class="zmdi zmdi-account-box"></i>
							<div style="text-align: center;"><span id="nameCK"></span></div>
				</div>
				<!-- BIRTH -->

				<div class="form-wrapper">
					<!-- BIRTH_YY -->
					<div class="user-birth"> 
						<input id="userYY" name="user_year" class="userYear"  placeholder="년(4자)">
						<!-- BIRTH_MM -->
						<select class="userMonth" id="userMM" name="user_month">	
							<option class="optionMonth">월</option>
							<c:forEach var="i" begin="1" end="12" >
							<c:choose>
								<c:when test="${i <10 }">
									<option value="0${i}">0${i}월</option>
								</c:when>
								<c:otherwise>
									<option value="${i}">${i}월</option>
								</c:otherwise>
							</c:choose>
							</c:forEach>
						</select>
						<!-- BIRTH_DD -->
						<input class="userDay" id="userDD" name="user_day" placeholder="일">
						<div style="text-align: center;"><span id="birthCK"></span></div>
					</div>
				</div>

				<div class="form-wrapper">
					<input type="text" name="user_phone" placeholder="휴대폰번호" class="form-control"> 
						<i class="zmdi zmdi-phone"></i>
							<div style="text-align: center;"><span id="phoneCK"></span></div>
				</div>

				<div class="form-wrapper">
					<input type="email" name="user_email" placeholder="이메일" class="form-control"> 
						<i class="zmdi zmdi-email"></i>
							<div style="text-align: center;"><span id="emailCK"></span></div>
				</div>
				<div style=" text-align: center;">
					 <input type="checkbox" name="user_term" value="OK" >
					 <span style="color: orange;">약관동의여부</span>
				</div>
				<div style="display: flex; justify-content: space-evenly;">
					<a id="findId" href="#">ID 찾기 ></a>
					<a id="findPw" href="#">PW 찾기 ></a>
				</div>
				<button class="w-btn w-btn-gra3 w-btn-gra-anim" type="submit" style="width: 80%; margin-left: 11%; padding-top: 6px;">
        			<span class="sign-up-font">Register</span>
   				 </button>
				</form>
		</div>
	</div>

   <jsp:include page="../default/user_footer.jsp"></jsp:include>

<script type="text/javascript">
	$(function(){
		const getIdCheck = new RegExp(/^[a-zA-Z0-9]{4,14}$/);
		const getPwCheck= new RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
		const getName= new RegExp(/^[가-힣]+$/);
		const getEmail= new RegExp(/^[a-zA-Z0-9]+@[a-zA-Z0-9.-]+$/);
		
		//가입중재 참거짓판별을 위한 논리변수 
		let chk1 =false, chk2 = false, ch3 = false, chk4 = false, chk5 =false, chk6 =false;
		
		//회원가입 유효성 검사
		//keyup -> 마우스 눌렀다가 떼면 이벤트 발생
		
		$("#id").on('keyup', function(){
			if($("#id").val() === ""){ //빈칸 막기
				$("#id").css("box-shadow","0px 0px 20px 11px tomato");
				$("#id").css("background-color","pink");
				$("#idCK").html('<b style="color:orangered; font-size: smaller;">[ 아이디는 필수 입력값입니다! ]');
				chk1 =false;
			}else if(!getIdCheck.test($("#id").val())){
				$("#id").css("box-shadow","0px 0px 20px 11px tomato");
				$("#id").css("background-color","pink");
				$("#idCK").html('<b style="color:orangered; font-size: smaller;;">[ 영문/숫자 최대 15자입니다! ]');
				chk1=false;
			}
			
		//아이디 중복검사 
			let userId = $('#id').val(); //input에 사용자가 입력한값 받아오고 
			console.log("userId : " + userId)
			$.ajax({
				method:"POST", //서버전송
				url:"/join.do", //controller쪽 url
				contentType: "text/plain", // 서버에 보내는 데이터 형식
				dataType:"text", //서버응답!
				data: userId,
				success:function(result){
					console.log(userId);
					console.log("응답성공 : "+result);
					if(result == "YES"){
						if(!getIdCheck.test($("#id").val())){
							$("#id").css("box-shadow","0px 0px 20px 11px tomato");
							$("#id").css("background-color","pink");
							$("#idCK").html('<b style="color:orangered; font-size: smaller;">[ 영문/숫자포함 최대 15자입니다! ]');
							chk1=false;
						}else {
						$("#id").css("box-shadow","0px 0px 20px 11px aquamarine");
						$("#id").css("background-color","rgb(177 224 205)");
						$("#idCK").html('<b style="color:aquamarine; font-size: smaller;">[ 사용가능한 아이디입니다. ]');
					chk1 = true;
					}
					return ture;
					}else if (result == "NO"){	
						$("#id").css("box-shadow","0px 0px 20px 11px tomato");
						$("#id").css("background-color","pink");
						$("#idCK").html('<b style="color:orangered; font-size: smaller;;">[ 이미 사용중인 아이디입니다.  ]');
						chk1=false;
						return false;
					}else {
						alert("결과값을 받지 못했습니다. ");
						return false;
					}
				},//success function
				error:function(){
					console.log("통신실패");
				}
			});//ajax
			
		});
		
	});
</script>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>