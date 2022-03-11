<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/swiper.min.js"></script>
<script type="text/javascript" src=""></script>
<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script type="text/javascript">

window.Kakao.init('8e2df3e9bebf8b3982f4d23137e42962')
console.log(Kakao.isInitialized());

function loginWithKakao() {
  window.Kakao.Auth.login({
      scope:'profile_nickname, account_email, birthday',
      success:function(authObj){
          console.log("access  토큰값 : "+authObj)
          window.Kakao.API.request({
              url:'/v2/user/me',
              success:res =>{
				const kakao_account = res.kakao_account;
		         console.log(kakao_account);
		         const userEmail = kakao_account.email;
			      console.log(userEmail);
		          $.ajax({
					method:"POST",
					url:"/kakaoLogin.do",
					contentType:"application/json",
					dataType:"json",
					data:JSON.stringify({"user_email": userEmail}),
					success:function(result){
						if(result.msg=="SUCCESS"){
							alert("Kakao 로그인 성공♥ 환영합니다~!  ")
							location.href='/dgvMain.do';
						}else{
							alert("등록되지 않은 아이디입니다. 회원가입을 먼저 진행해주세요.")
							location.href='/join.do';
						}
					},
					error: function(e) {
						console.log(e);
					}
				})//ajax close

              },
              fail:function(err){
            	  alert(JSON.stringify(err));
              }
          })
      }
  })

}


	function loginCheck(){
		const id = $('#id').val()
		const pw = $('#password').val()
		
// 		console.log("내가입력한 id : "+ id)
// 		console.log("내가입력한 pw : "+ pw)
		$.ajax({
			method:"POST",
			url:"/login.do",
			contentType:"application/json",
			dataType:"json",
			data:JSON.stringify({"user_id":id, "user_pw": pw}),
			success:function(result){
				const reT = JSON.parse(result)
				
				if(reT.msg == "SUCCESS"){
					alert("로그인 성공!!")
					location.href='/dgvMain.do';
				}else{
					alert("실패")
				}
			},
			error:function(){
				console.log("통신실패!!!")
			}
		}); //ajax close()
		
		
	}
</script>
<style type="text/css">
.social-login-button {
    display: inline;
}
.naver-img{
    height: 58px;
    border-radius: 8px;
    margin-top: 3%;
}
input#thisLogin {
    height: 51px;
    margin-right: 2px;
}
</style>
</head>

<body class="block" style="">
	<jsp:include page="../default/user_header.jsp"></jsp:include>
	<div class="wrapper sign-up-background">
		<div class="inner">
			<div class="image-holder">
				<img id="poster"
					src="https://upload.wikimedia.org/wikipedia/ko/f/f2/%EC%96%B4%EB%B2%A4%EC%A0%B8%EC%8A%A4-_%EC%97%94%EB%93%9C%EA%B2%8C%EC%9E%84_%ED%8F%AC%EC%8A%A4%ED%84%B0.jpg"
					alt="">
			</div>
			<form action="login.do" id="loginForm" method="post"
				style="padding-top: 90px;">
				<p class="register-title">
					<img
						src="${pageContext.request.contextPath }/resources/images/dgvMainLogo.png">
					<span class="sign-up">Login♥</span>
				</p>
				<div class="id_wrapping">
				<div class="form-wrapper form-wrapper-id">
					<div class="form-wrapper">
						<input id="id" name="user_id" type="text" placeholder="아이디"
							class="form-control"> <i class="zmdi zmdi-accounts"></i>
					</div>
				</div>
				<div class="form-wrapper">
					<input type="password" name="user_pw" placeholder="비밀번호"
						id="password" class="form-control"> <i
						class="zmdi zmdi-lock"></i>
				</div>

				<div class="sort1">
					<input type="checkbox" id="checkSaveId" name="useCookie"> <span
						style="color: white;">아이디 저장</span>
				</div>
				</div>
				<div class="action-button"  style="display: flex;">
				<input type="button" id="thisLogin" class="w-btn w-btn-gra3 w-btn-gra-anim"
					onclick="loginCheck()" value="Login">

				<button type="button" id="thisJoin" onclick="location.href='/join.do'"
					class="w-btn w-btn-gra3 w-btn-gra-anim" >
					<span>Join</span> <i class="zmdi zmdi-arrow-right"></i>
				</button>
				</div>
				<div class="social-login-button">
					<div class="kakaoLogin-wrap">
					<a id="custom-login-btn" href="javascript:loginWithKakao()"> 
						<img
							src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
							width="222" alt="카카오 로그인 버튼" />
					</a>
						<p id="token-result"></p>
					</div>
					
				</div>	
			</form>
		</div>
	</div>
	<jsp:include page="../default/user_footer.jsp"></jsp:include>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>