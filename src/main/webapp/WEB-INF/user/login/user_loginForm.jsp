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
                  alert("등록되지 않은 아이디입니다. 회원가입을 먼저 진행해주세요.")
                  location.href='/join.do';
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
		var count=1;
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
					//alert("로그인 성공!!")
					location.href='/dgvMain.do';
				}else if(reT.msg=="STATUS"){
					alert("비밀번호 5회 불일치로 계정이 비활성화 되었습니다.")	
					alert("비밀번호 찾기후 다시 시도해주세요")	
				}else{
					alert("실패!! 남은횟수 :"+(5-count)+"/5")
					count++;
				}
			},
			error:function(){
				console.log("통신실패!!!")
			}
		}); //ajax close()
		
			
	}
	
	function findId() {
		window.open('/find_id.do','','width=800 height=500')
	}
	
	function findPassword() {
		window.open('/find_password.do','','width=800 height=500')	
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
.sort1 {
    text-align: -webkit-center; 
    display: flex;
    justify-content: space-around;
}
.image-holder.loginPoster-wrap {
    padding: 0;
}
.nav{
    padding: 7px 0;
}
.all-wrap {
  animation: bob 7s cubic-bezier(0.5, 0, 0.5, 1) infinite both;
}

.all {
  top: 10rem;
  left: calc(50% - 2.5rem);
  position: absolute;
  width: 5rem;
  height: 5rem;
  transform-origin: center -20rem;
  animation: swing 7s cubic-bezier(0.5, 0, 0.5, 1) infinite both;
}
.all:before {
  height: 20rem;
  width: 2px;
  background-color: #DB242A;
  left: calc(50% - 1px);
  bottom: 20rem;
}

.yarn {
  position: absolute;
  top: 0;
  left: 0;
  width: 80px;
  height: 80px;
  border-radius: 50%;
  background-image: radial-gradient(circle at top left, #e97c7f, #DB242A 50%, #af1d22);
  z-index: 1;
}
.yarn:before, .yarn:after {
  position: absolute;
  width: 20px;
  height: 20px;
  border-radius: 50%;
  background-color: white;
  top: -1px;
}
.yarn:before {
  left: calc(50% + 7px);
  background-color: #b1bce6;
}
.yarn:after {
  right: calc(50% + 7px);
  background-color: #D5E8F8;
}

.cat-wrap {
  position: absolute;
  top: 0;
  left: calc(50% - 45px);
  width: 90px;
  height: 130px;
  animation: reverse-swing 7s cubic-bezier(0.5, 0, 0.5, 1) infinite both;
  transform-origin: top center;
}

.cat {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  animation: swing 7s 0.2s infinite both;
  transform-origin: top center;
}

.cat-upper {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  transform-origin: top center;
  z-index: 1;
}
.cat-upper .cat-leg {
  position: absolute;
  width: 20px;
  height: 100%;
  background-color: white;
  z-index: -1;
  background-image: linear-gradient(to right, #D5E8F8, #D5E8F8 20%, #8B9BD9);
}
.cat-upper .cat-leg:nth-child(1) {
  border-top-left-radius: 100px;
  left: 10px;
}
.cat-upper .cat-leg:nth-child(1):after {
  left: 50%;
}
.cat-upper .cat-leg:nth-child(2) {
  border-top-left-radius: 0;
  border-top-right-radius: 100px;
  right: 10px;
}
.cat-upper .cat-leg:nth-child(2):after {
  right: 50%;
}

.cat-lower-wrap {
  height: 90%;
  width: 100%;
  position: absolute;
  top: 100%;
  width: 75px;
  left: calc(50% - 37.5px);
  animation: reverse-swing 7s 0.2s infinite both;
  transform-origin: top center;
}

.cat-lower {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  animation: swing 7s 0.5s infinite both;
  transform-origin: top center;
}
.cat-lower:after {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  border-radius: 100px;
  background-image: radial-gradient(circle at 10px 50px, white, white 40%, #D5E8F8 65%, #8B9BD9);
  z-index: 1;
}
.cat-lower .cat-leg, .cat-lower .cat-paw {
  z-index: -1;
  position: absolute;
  height: 20px;
  width: 20px;
  animation: swing-leg 7s 0.3s infinite both;
  z-index: 1;
  transform-origin: top center;
  border-top-left-radius: 20px;
  border-top-right-radius: 20px;
  background-image: linear-gradient(to right, white, #D5E8F8, #8B9BD9);
}
.cat-lower > .cat-leg {
  bottom: 20px;
}
.cat-lower > .cat-leg .cat-leg {
  top: 25%;
}
.cat-lower > .cat-leg + .cat-leg {
  right: 0;
}
.cat-lower .cat-paw {
  top: 50%;
  border-radius: 50%;
  background-color: #fff;
}
.cat-lower .cat-tail {
  position: absolute;
  height: 15px;
  width: 10px;
  animation: swing-tail 7s cubic-bezier(0.5, 0, 0.5, 1) infinite both;
  transform-origin: top center;
  z-index: 0;
  background-image: linear-gradient(to right, white, #D5E8F8, #8B9BD9);
  border-bottom-left-radius: 10px;
  border-bottom-right-radius: 10px;
}
.cat-lower .cat-tail > .cat-tail {
  top: 50%;
}
.cat-lower > .cat-tail {
  left: calc(50% - 5px);
  top: 95%;
}

.cat-head {
  width: 90px;
  height: 90px;
  background-image: radial-gradient(circle at 10px 10px, white, white 40%, #D5E8F8 65%, #8B9BD9);
  border-radius: 50%;
  top: calc(100% - 45px);
}

.cat-face {
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  width: 100%;
  animation: face 7s cubic-bezier(0.5, 0, 0.5, 1) infinite both;
  transform-style: preserve-3d;
  perspective: 100px;
}

.cat-ears {
  position: absolute;
  top: 0;
  left: 0;
  height: 50%;
  width: 100%;
  z-index: -1;
}

.cat-ear {
  width: 20px;
  height: 100%;
  position: absolute;
  border-radius: 5px;
  top: -10px;
}
.cat-ear:first-child {
  left: 0;
  transform-origin: top left;
  transform: skewY(40deg);
  background-color: white;
}
.cat-ear:first-child:before {
  left: 0;
  border-top-right-radius: 50%;
  border-bottom-right-radius: 50%;
  background-color: #D7EBFB;
}
.cat-ear:last-child {
  right: 0;
  transform-origin: top right;
  transform: skewY(-40deg);
  background-color: #d1e6f7;
}
.cat-ear:last-child:before {
  right: 0;
  border-top-left-radius: 50%;
  border-bottom-left-radius: 50%;
  background-color: #e0f0fc;
}
.cat-ear:before {
  width: 60%;
  height: 100%;
  top: 10px;
  position: absolute;
  background-color: #fff;
}

.cat-eyes {
  position: absolute;
  top: 50%;
  width: 100%;
  height: 6px;
  animation: blink 7s step-end infinite both;
}
.cat-eyes:before, .cat-eyes:after {
  position: absolute;
  height: 6px;
  width: 6px;
  border-radius: 50%;
  background-color: #4B4D75;
}
.cat-eyes:before {
  left: 20px;
}
.cat-eyes:after {
  right: 20px;
}

.cat-mouth {
  position: absolute;
  width: 12px;
  height: 8px;
  background-color: #4B4D75;
  top: 60%;
  left: calc(50% - 6px);
  border-top-left-radius: 50% 30%;
  border-top-right-radius: 50% 30%;
  border-bottom-left-radius: 50% 70%;
  border-bottom-right-radius: 50% 70%;
  transform: translateZ(10px);
}
.cat-mouth:before, .cat-mouth:after {
  position: absolute;
  width: 90%;
  height: 100%;
  border: 2px solid #9FA2CB;
  top: 80%;
  border-radius: 100px;
  border-top-color: transparent;
  z-index: -1;
}
.cat-mouth:before {
  border-left-color: transparent;
  right: calc(50% - 1px);
  transform-origin: top right;
  transform: rotate(10deg);
}
.cat-mouth:after {
  border-right-color: transparent;
  left: calc(50% - 1px);
  transform-origin: top left;
  transform: rotate(-10deg);
}

.cat-whiskers {
  width: 50%;
  height: 8px;
  position: absolute;
  bottom: 25%;
  left: 25%;
  transform-style: preserve-3d;
  perspective: 60px;
}
.cat-whiskers:before, .cat-whiskers:after {
  position: absolute;
  height: 100%;
  width: 30%;
  border: 2px solid #9FA2CB;
  border-left: none;
  border-right: none;
}
.cat-whiskers:before {
  right: 100%;
  transform-origin: right center;
  transform: rotateY(70deg) rotateZ(-10deg);
}
.cat-whiskers:after {
  left: 100%;
  transform-origin: left center;
  transform: rotateY(-70deg) rotateZ(10deg);
}

@keyframes bob {
  0% {
    transform: translateY(0.4rem);
  }
  6.25% {
    transform: translateY(-0.4rem);
  }
  12.5% {
    transform: translateY(0.4rem);
  }
  18.75% {
    transform: translateY(-0.4rem);
  }
  25% {
    transform: translateY(0.4rem);
  }
  31.25% {
    transform: translateY(-0.4rem);
  }
  37.5% {
    transform: translateY(0.4rem);
  }
  43.75% {
    transform: translateY(-0.4rem);
  }
  50% {
    transform: translateY(0.4rem);
  }
  56.25% {
    transform: translateY(-0.4rem);
  }
  62.5% {
    transform: translateY(0.4rem);
  }
  68.75% {
    transform: translateY(-0.4rem);
  }
  75% {
    transform: translateY(0.4rem);
  }
  81.25% {
    transform: translateY(-0.4rem);
  }
  87.5% {
    transform: translateY(0.4rem);
  }
  93.75% {
    transform: translateY(-0.4rem);
  }
  100% {
    transform: translateY(0.4rem);
  }
}
@keyframes swing {
  0% {
    transform: rotate(5deg);
  }
  12.5% {
    transform: rotate(-10deg);
  }
  25% {
    transform: rotate(10deg);
  }
  37.5% {
    transform: rotate(-15deg);
  }
  50% {
    transform: rotate(23deg);
  }
  62.5% {
    transform: rotate(-23deg);
  }
  75% {
    transform: rotate(15deg);
  }
  87.5% {
    transform: rotate(-10deg);
  }
  100% {
    transform: rotate(5deg);
  }
}
@keyframes swing-leg {
  0% {
    transform: rotate(0.5deg);
  }
  12.5% {
    transform: rotate(-1deg);
  }
  25% {
    transform: rotate(1deg);
  }
  37.5% {
    transform: rotate(-1.5deg);
  }
  50% {
    transform: rotate(2.3deg);
  }
  62.5% {
    transform: rotate(-2.3deg);
  }
  75% {
    transform: rotate(1.5deg);
  }
  87.5% {
    transform: rotate(-1deg);
  }
  100% {
    transform: rotate(0.5deg);
  }
}
@keyframes swing-tail {
  0% {
    transform: rotate(-2deg);
  }
  12.5% {
    transform: rotate(4deg);
  }
  25% {
    transform: rotate(-4deg);
  }
  37.5% {
    transform: rotate(6deg);
  }
  50% {
    transform: rotate(-9.2deg);
  }
  62.5% {
    transform: rotate(9.2deg);
  }
  75% {
    transform: rotate(-6deg);
  }
  87.5% {
    transform: rotate(4deg);
  }
  100% {
    transform: rotate(-2deg);
  }
}
@keyframes reverse-swing {
  0% {
    transform: rotate(-5deg);
  }
  12.5% {
    transform: rotate(10deg);
  }
  25% {
    transform: rotate(-10deg);
  }
  37.5% {
    transform: rotate(15deg);
  }
  50% {
    transform: rotate(-23deg);
  }
  62.5% {
    transform: rotate(23deg);
  }
  75% {
    transform: rotate(-15deg);
  }
  87.5% {
    transform: rotate(10deg);
  }
  100% {
    transform: rotate(-5deg);
  }
}
@keyframes face {
  0% {
    transform: translateX(-2.5px);
  }
  12.5% {
    transform: translateX(5px);
  }
  25% {
    transform: translateX(-5px);
  }
  37.5% {
    transform: translateX(7.5px);
  }
  50% {
    transform: translateX(-11.5px);
  }
  62.5% {
    transform: translateX(11.5px);
  }
  75% {
    transform: translateX(-7.5px);
  }
  87.5% {
    transform: translateX(5px);
  }
  100% {
    transform: translateX(-2.5px);
  }
}
@keyframes fade-in {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}
@keyframes blink {
  from, to, 10%, 25%, 80% {
    transform: scaleY(1);
  }
  8%, 23%, 78% {
    transform: scaleY(0.1);
  }
}

*, *:before, *:after {
  box-sizing: border-box;
  position: relative;
  animation-timing-function: cubic-bezier(0.5, 0, 0.5, 1);
  animation-fill-mode: both;
}

*:before, *:after {
  content: "";
  display: block;
}

.all-wrap {
  animation: bob 7s cubic-bezier(0.5, 0, 0.5, 1) infinite both;
}

.all {
  top: 10rem;
  left: calc(50% - 2.5rem);
  position: absolute;
  width: 5rem;
  height: 5rem;
  transform-origin: center -20rem;
  animation: swing 7s cubic-bezier(0.5, 0, 0.5, 1) infinite both;
}
.all:before {
  height: 20rem;
  width: 2px;
  background-color: #DB242A;
  left: calc(50% - 1px);
  bottom: 20rem;
}

.yarn {
 position: absolute;
    top: -207px;
    left: 0;
    width: 84px;
    height: 75px;
    border-radius: 50%;
    background-image: radial-gradient(circle at top left, #e97c7f, #DB242A 50%, #af1d22);
    z-index: 1;
}
.yarn:before, .yarn:after {
  position: absolute;
  width: 20px;
  height: 20px;
  border-radius: 50%;
  background-color: white;
  top: -1px;
}
.yarn:before {
  left: calc(50% + 7px);
  background-color: #b1bce6;
}
.yarn:after {
  right: calc(50% + 7px);
  background-color: #D5E8F8;
}

.cat-wrap {
 position: absolute;
    top: -179px;
    left: calc(50% - 45px);
    width: 90px;
    height: 140px;
    animation: reverse-swing 7s cubic-bezier(0.5, 0, 0.5, 1) infinite both;
    transform-origin: top center;
}

.cat {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  animation: swing 7s 0.2s infinite both;
  transform-origin: top center;
}

.cat-upper {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  transform-origin: top center;
  z-index: 1;
}
.cat-upper .cat-leg {
  position: absolute;
  width: 20px;
  height: 100%;
  background-color: white;
  z-index: -1;
  background-image: linear-gradient(to right, #D5E8F8, #D5E8F8 20%, #8B9BD9);
}
.cat-upper .cat-leg:nth-child(1) {
  border-top-left-radius: 100px;
  left: 10px;
}
.cat-upper .cat-leg:nth-child(1):after {
  left: 50%;
}
.cat-upper .cat-leg:nth-child(2) {
  border-top-left-radius: 0;
  border-top-right-radius: 100px;
  right: 10px;
}
.cat-upper .cat-leg:nth-child(2):after {
  right: 50%;
}

.cat-lower-wrap {
  height: 90%;
  width: 100%;
  position: absolute;
  top: 100%;
  width: 75px;
  left: calc(50% - 37.5px);
  animation: reverse-swing 7s 0.2s infinite both;
  transform-origin: top center;
}

.cat-lower {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  animation: swing 7s 0.5s infinite both;
  transform-origin: top center;
}
.cat-lower:after {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  border-radius: 100px;
  background-image: radial-gradient(circle at 10px 50px, white, white 40%, #D5E8F8 65%, #8B9BD9);
  z-index: 1;
}
.cat-lower .cat-leg, .cat-lower .cat-paw {
  z-index: -1;
  position: absolute;
  height: 20px;
  width: 20px;
  animation: swing-leg 7s 0.3s infinite both;
  z-index: 1;
  transform-origin: top center;
  border-top-left-radius: 20px;
  border-top-right-radius: 20px;
  background-image: linear-gradient(to right, white, #D5E8F8, #8B9BD9);
}
.cat-lower > .cat-leg {
  bottom: 20px;
}
.cat-lower > .cat-leg .cat-leg {
  top: 25%;
}
.cat-lower > .cat-leg + .cat-leg {
  right: 0;
}
.cat-lower .cat-paw {
  top: 50%;
  border-radius: 50%;
  background-color: #fff;
}
.cat-lower .cat-tail {
  position: absolute;
  height: 15px;
  width: 10px;
  animation: swing-tail 7s cubic-bezier(0.5, 0, 0.5, 1) infinite both;
  transform-origin: top center;
  z-index: 0;
  background-image: linear-gradient(to right, white, #D5E8F8, #8B9BD9);
  border-bottom-left-radius: 10px;
  border-bottom-right-radius: 10px;
}
.cat-lower .cat-tail > .cat-tail {
  top: 50%;
}
.cat-lower > .cat-tail {
  left: calc(50% - 5px);
  top: 95%;
}

.cat-head {
  width: 90px;
  height: 90px;
  background-image: radial-gradient(circle at 10px 10px, white, white 40%, #D5E8F8 65%, #8B9BD9);
  border-radius: 50%;
  top: calc(100% - 45px);
}

.cat-face {
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  width: 100%;
  animation: face 7s cubic-bezier(0.5, 0, 0.5, 1) infinite both;
  transform-style: preserve-3d;
  perspective: 100px;
}

.cat-ears {
  position: absolute;
  top: 0;
  left: 0;
  height: 50%;
  width: 100%;
  z-index: -1;
}

.cat-ear {
  width: 20px;
  height: 100%;
  position: absolute;
  border-radius: 5px;
  top: -10px;
}
.cat-ear:first-child {
  left: 0;
  transform-origin: top left;
  transform: skewY(40deg);
  background-color: white;
}
.cat-ear:first-child:before {
  left: 0;
  border-top-right-radius: 50%;
  border-bottom-right-radius: 50%;
  background-color: #D7EBFB;
}
.cat-ear:last-child {
  right: 0;
  transform-origin: top right;
  transform: skewY(-40deg);
  background-color: #d1e6f7;
}
.cat-ear:last-child:before {
  right: 0;
  border-top-left-radius: 50%;
  border-bottom-left-radius: 50%;
  background-color: #e0f0fc;
}
.cat-ear:before {
  width: 60%;
  height: 100%;
  top: 10px;
  position: absolute;
  background-color: #fff;
}

.cat-eyes {
  position: absolute;
  top: 50%;
  width: 100%;
  height: 6px;
  animation: blink 7s step-end infinite both;
}
.cat-eyes:before, .cat-eyes:after {
  position: absolute;
  height: 6px;
  width: 6px;
  border-radius: 50%;
  background-color: #4B4D75;
}
.cat-eyes:before {
  left: 20px;
}
.cat-eyes:after {
  right: 20px;
}

.cat-mouth {
  position: absolute;
  width: 12px;
  height: 8px;
  background-color: #4B4D75;
  top: 60%;
  left: calc(50% - 6px);
  border-top-left-radius: 50% 30%;
  border-top-right-radius: 50% 30%;
  border-bottom-left-radius: 50% 70%;
  border-bottom-right-radius: 50% 70%;
  transform: translateZ(10px);
}
.cat-mouth:before, .cat-mouth:after {
  position: absolute;
  width: 90%;
  height: 100%;
  border: 2px solid #9FA2CB;
  top: 80%;
  border-radius: 100px;
  border-top-color: transparent;
  z-index: -1;
}
.cat-mouth:before {
  border-left-color: transparent;
  right: calc(50% - 1px);
  transform-origin: top right;
  transform: rotate(10deg);
}
.cat-mouth:after {
  border-right-color: transparent;
  left: calc(50% - 1px);
  transform-origin: top left;
  transform: rotate(-10deg);
}

.cat-whiskers {
  width: 50%;
  height: 8px;
  position: absolute;
  bottom: 25%;
  left: 25%;
  transform-style: preserve-3d;
  perspective: 60px;
}
.cat-whiskers:before, .cat-whiskers:after {
  position: absolute;
  height: 100%;
  width: 30%;
  border: 2px solid #9FA2CB;
  border-left: none;
  border-right: none;
}
.cat-whiskers:before {
  right: 100%;
  transform-origin: right center;
  transform: rotateY(70deg) rotateZ(-10deg);
}
.cat-whiskers:after {
  left: 100%;
  transform-origin: left center;
  transform: rotateY(-70deg) rotateZ(10deg);
}

@keyframes bob {
  0% {
    transform: translateY(0.4rem);
  }
  6.25% {
    transform: translateY(-0.4rem);
  }
  12.5% {
    transform: translateY(0.4rem);
  }
  18.75% {
    transform: translateY(-0.4rem);
  }
  25% {
    transform: translateY(0.4rem);
  }
  31.25% {
    transform: translateY(-0.4rem);
  }
  37.5% {
    transform: translateY(0.4rem);
  }
  43.75% {
    transform: translateY(-0.4rem);
  }
  50% {
    transform: translateY(0.4rem);
  }
  56.25% {
    transform: translateY(-0.4rem);
  }
  62.5% {
    transform: translateY(0.4rem);
  }
  68.75% {
    transform: translateY(-0.4rem);
  }
  75% {
    transform: translateY(0.4rem);
  }
  81.25% {
    transform: translateY(-0.4rem);
  }
  87.5% {
    transform: translateY(0.4rem);
  }
  93.75% {
    transform: translateY(-0.4rem);
  }
  100% {
    transform: translateY(0.4rem);
  }
}
@keyframes swing {
  0% {
    transform: rotate(5deg);
  }
  12.5% {
    transform: rotate(-10deg);
  }
  25% {
    transform: rotate(10deg);
  }
  37.5% {
    transform: rotate(-15deg);
  }
  50% {
    transform: rotate(23deg);
  }
  62.5% {
    transform: rotate(-23deg);
  }
  75% {
    transform: rotate(15deg);
  }
  87.5% {
    transform: rotate(-10deg);
  }
  100% {
    transform: rotate(5deg);
  }
}
@keyframes swing-leg {
  0% {
    transform: rotate(0.5deg);
  }
  12.5% {
    transform: rotate(-1deg);
  }
  25% {
    transform: rotate(1deg);
  }
  37.5% {
    transform: rotate(-1.5deg);
  }
  50% {
    transform: rotate(2.3deg);
  }
  62.5% {
    transform: rotate(-2.3deg);
  }
  75% {
    transform: rotate(1.5deg);
  }
  87.5% {
    transform: rotate(-1deg);
  }
  100% {
    transform: rotate(0.5deg);
  }
}
@keyframes swing-tail {
  0% {
    transform: rotate(-2deg);
  }
  12.5% {
    transform: rotate(4deg);
  }
  25% {
    transform: rotate(-4deg);
  }
  37.5% {
    transform: rotate(6deg);
  }
  50% {
    transform: rotate(-9.2deg);
  }
  62.5% {
    transform: rotate(9.2deg);
  }
  75% {
    transform: rotate(-6deg);
  }
  87.5% {
    transform: rotate(4deg);
  }
  100% {
    transform: rotate(-2deg);
  }
}
@keyframes reverse-swing {
  0% {
    transform: rotate(-5deg);
  }
  12.5% {
    transform: rotate(10deg);
  }
  25% {
    transform: rotate(-10deg);
  }
  37.5% {
    transform: rotate(15deg);
  }
  50% {
    transform: rotate(-23deg);
  }
  62.5% {
    transform: rotate(23deg);
  }
  75% {
    transform: rotate(-15deg);
  }
  87.5% {
    transform: rotate(10deg);
  }
  100% {
    transform: rotate(-5deg);
  }
}
@keyframes face {
  0% {
    transform: translateX(-2.5px);
  }
  12.5% {
    transform: translateX(5px);
  }
  25% {
    transform: translateX(-5px);
  }
  37.5% {
    transform: translateX(7.5px);
  }
  50% {
    transform: translateX(-11.5px);
  }
  62.5% {
    transform: translateX(11.5px);
  }
  75% {
    transform: translateX(-7.5px);
  }
  87.5% {
    transform: translateX(5px);
  }
  100% {
    transform: translateX(-2.5px);
  }
}
@keyframes fade-in {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}
@keyframes blink {
  from, to, 10%, 25%, 80% {
    transform: scaleY(1);
  }
  8%, 23%, 78% {
    transform: scaleY(0.1);
  }
}


*, *:before, *:after {
  box-sizing: border-box;
  position: relative;
  animation-timing-function: cubic-bezier(0.5, 0, 0.5, 1);
  animation-fill-mode: both;
}

*:before, *:after {
  content: "";
  display: block;
}
img#posterCat {
    width: 346px;
    height: 149px;
    margin-bottom: 387px;
    margin-left: 111px;
}

</style>

</head>

<body class="block" style="">
	<jsp:include page="../default/user_header.jsp"></jsp:include>
	<div class="wrapper sign-up-background">
		<div class="inner">
			<div style="width: 409px;">
				<div class="image-holder loginPoster-wrap"  style="width: 450px;" >
					<img id="posterCat" class="loginPoster"
						src="${pageContext.request.contextPath }/resources/images/dgvMainLogo.png"
						alt="">
				</div>
				<div style="bottom:324px"class="all-wrap">  
  <div class="all">
    <div class="yarn"></div>
    <div class="cat-wrap">    
      <div class="cat">
        <div class="cat-upper">
          <div class="cat-leg"></div>
          <div class="cat-leg"></div>
          <div class="cat-head">
            <div class="cat-ears">
              <div class="cat-ear"></div>
              <div class="cat-ear"></div>
            </div>
            <div class="cat-face">
              <div class="cat-eyes"></div>
              <div class="cat-mouth"></div>
              <div class="cat-whiskers"></div>
            </div>
          </div>
        </div>
        <div class="cat-lower-wrap">
          <div class="cat-lower">
            <div class="cat-leg">
              <div class="cat-leg">
                <div class="cat-leg">
                  <div class="cat-leg">
                    <div class="cat-leg">
                      <div class="cat-leg">
                        <div class="cat-leg">
                          <div class="cat-leg">
                            <div class="cat-leg">
                              <div class="cat-leg">
                                <div class="cat-leg">
                                  <div class="cat-leg">
                                    <div class="cat-leg">
                                      <div class="cat-leg">
                                        <div class="cat-leg">
                                          <div class="cat-leg">
                                            <div class="cat-paw"></div>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="cat-leg">
              <div class="cat-leg">
                <div class="cat-leg">
                  <div class="cat-leg">
                    <div class="cat-leg">
                      <div class="cat-leg">
                        <div class="cat-leg">
                          <div class="cat-leg">
                            <div class="cat-leg">
                              <div class="cat-leg">
                                <div class="cat-leg">
                                  <div class="cat-leg">
                                    <div class="cat-leg">
                                      <div class="cat-leg">
                                        <div class="cat-leg">
                                          <div class="cat-leg">
                                            <div class="cat-paw"></div>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="cat-tail">
              <div class="cat-tail">
                <div class="cat-tail">
                  <div class="cat-tail">
                    <div class="cat-tail">
                      <div class="cat-tail">
                        <div class="cat-tail">
                          <div class="cat-tail">
                            <div class="cat-tail">
                              <div class="cat-tail">
                                <div class="cat-tail">
                                  <div class="cat-tail">
                                    <div class="cat-tail">
                                      <div class="cat-tail">
                                        <div class="cat-tail">
                                          <div class="cat-tail -end"></div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
			</div>
			<form action="login.do" id="loginForm" method="post"
				style="padding-top: 127px;">
					<div style="display: flex;margin-left: 29px;">
						<p class="register-title">
							<span style="right:-19px"class="sign-up">Login♥</span>
						</p>
					</div>
				<div class="id_wrapping" style="text-align: -webkit-center;">
				<div class="form-wrapper form-wrapper-id">
					<div class="form-wrapper">
						<input id="id" name="user_id" type="text" placeholder="아이디"
							class="form-control" style="width: 345px;height: 50px;"> <i class="zmdi zmdi-accounts"></i>
					</div>
				</div>
				<div class="form-wrapper">
					<input type="password" name="user_pw" placeholder="비밀번호"
						id="password" class="form-control"style="width: 345px;height: 50px;"> <i
						class="zmdi zmdi-lock"></i>
				</div>

            <div class="sort1">
         <!--      <input type="checkbox" id="checkSaveId" name="useCookie"> 
                <span style="color: white;">아이디 저장</span> -->
               <a onclick="findId()" style="color: white; cursor: pointer;" >[ 아이디 찾기 ]</a>
               <a onclick="findPassword()" style="color: white; cursor: pointer;">[ 비밀번호 찾기 ]</a>
            </div>
            </div>
            <div class="action-button"  style="display: flex;justify-content: space-around;">
            <input type="button" id="thisLogin" class="w-btn w-btn-gra3 w-btn-gra-anim"
               onclick="loginCheck()" value="Login">

            <button type="button" id="thisJoin" onclick="location.href='/join.do'"
               class="w-btn w-btn-gra3 w-btn-gra-anim" style="margin-left: 0;margin-right: 0;">
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