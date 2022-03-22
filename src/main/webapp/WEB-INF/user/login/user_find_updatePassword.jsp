<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>

<style>
.mt-4 {
	text-align: center;
	margin-bottom: 0;
}

body {
	background-image:
		url("./../../../resources/images/adminBackground01.png");
	background-size: contain;
}

h3 {
	text-align: center;
	font-size: 25px;
	color: lightgray;
	font-weight: bold;
	background-color: rgba(0, 0, 0, 0.4);
	margin: 0;
	padding-bottom: 6px;
}

.bottomBar {
	margin-top: 5%;
	display: flex;
	justify-content: space-evenly
}

.bottomBar>input {
	background-color: lightgray;
	height: 45px;
	width: 25%;
	border-radius: 13px;
}

#table-container {
	display: flex;
	place-content: center;
}

.issetUser {
	box-shadow: 0px 0px 20px 11px tomato;
	background-color: pink;
}

.nonesetUser {
	box-shadow: 0px 0px 20px 11px aquamarine;
	background-color: rgb(177, 224, 205);
}
</style>



<link rel='stylesheet'
	href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' />
<script
	src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
<script type="text/javascript">
	var getPwCheck= new RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
	//가입중재 참거짓판별을 위한 논리변수 
    var chk1 =false, chk2 = false, ch3 = false, chk4 = false, chk5 =false, chk6 =false, chk7 =false;
	
     
        
    
	// 비밀번호 수정
	$(function() {
		//pw 검증 메서드
        $('#userPw').on('keyup',function(){    
           if($(this).val() ==""){
              $("#userPw").removeClass("issetUser");
              $("#userPw").removeClass("nonesetUser");
              $("#userPw").addClass("issetUser");
              $("#psCK").html('<b style="color:orangered; font-size: smaller;">[ 비밀번호를 입력해주세요. ]');    
                chk1 = false;
               
            }else if(!getPwCheck.test($("#userPw").val())){  
              $("#userPw").removeClass("nonesetUser");
              $("#userPw").addClass("issetUser"); 
              $("#psCK").html('<b style="color:orangered; font-size: smaller;">[ 비밀번호는 문자, 숫자, 특수문자의 조합으로<br> 8~16자리로 입력해주세요! ]');    
                chk1 = false;
            }else{
               $("#userPw").removeClass("issetUser");
               $("#userPw").addClass("nonesetUser");
               $("#psCK").html('<b style="color:aquamarine; font-size: smaller;">[ 사용가능한 비밀번호입니다. ]');    
               chk1 = true;
            }                  
         }); //pw 검증 메서드 끝
         
         
        //pw 확인 메서드
        $('#checkPw').on('keyup' ,function(){
           if($(this).val() ==""){
              $("#checkPw").removeClass("issetUser");
              $("#checkPw").removeClass("nonesetUser");
              $("#checkPw").addClass("issetUser");
              $("#psCK").html('<b style="color:orangered; font-size: smaller;">[ 비밀번호를 확인해주세요. ]');    
                chk2 = false;
           }else if(!getPwCheck.test($("#checkPw").val())){  
               $("#checkPw").removeClass("nonesetUser");
               $("#checkPw").addClass("issetUser"); 
               $("#psCK").html('<b style="color:orangered; font-size: smaller;">[ 비밀번호는 문자, 숫자, 특수문자의 조합으로<br> 8~16자리로 입력해주세요! ]');    
                 chk2 = false;
           }else if($(this).val() != $("#userPw").val()){
        	  $("#checkPw").removeClass("nonesetUser");
              $("#checkPw").addClass("issetUser");
              $("#psCK").html('<b style="color:orangered; font-size: smaller;">[ 비밀번호가 다릅니다. 다시 확인해 주세요. ]');    
                chk2 = false;
           }else{
              $("#checkPw").removeClass("issetUser");
              $("#checkPw").addClass("nonesetUser");
              $("#psCK").html('<b style="color:aquamarine; font-size: smaller;">[ 비밀번호 확인이 완료되었습니다. ]');    
               chk2 = true;
           }
        });//pw 확인 메서드 끝 
        
        

		
		
		$("#checkNewpw").click(function() {
			const userPW = $("#userPw").val();
			const pwCheck = $("#checkPw").val();
			if (chk1 && chk2) {

				$.ajax({
					method : "POST",
					url : "/changeMyPw.do",
					contentType : "application/json",
					dataType : "json",
					data : JSON.stringify({
						"user_pw" : userPW
					}),
					success : function(result) {
						if (result.msg == "SUCCESS") {
							alert("비밀번호가 성공적으로 변경되었습니다.")
							window.opener.location.reload()
							window.close();
						} else {
							alert("변경오류 다시시작해주세요")
						}
					}

				})//ajax close
			} else {
				alert("잘못된 패스워드 입니다. 다시 입력해주세요.")
			}

		})
	})

</script>

</head>
<body style="color: aliceblue;">
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">

				<!-- 여기만 수정해서 사용하세요!! -->
				<h1 class="mt-4" style="background-color: rgba(0, 0, 0, 0.4);">새
					비밀번호 설정</h1>

				<div class="card mb-4">
					<div class="card-header">
						<h3>새로운 비밀번호를 설정해 주시기 바랍니다.</h3>
					</div>
					<div class="card-body">

						<div id="table-container">
							<table class="type02">
								<tr>
									<th scope="row" style="font-size: 18px;">새 비밀번호를 입력해 주세요 :</th>
									<td><input type="password" id="userPw" name="user_pw"
										style="border-radius: 7px; line-height: 25px;" /></td>

								</tr>
								<tr>
									<th scope="row" style="font-size: 18px;">새 비밀번호를 확인해 주세요 :</th>
									<td><input type="password" id="checkPw"
										style="border-radius: 7px; line-height: 25px;" /></td>
								</tr>
							</table>
						</div>
						<div style="text-align: center;"><span id="psCK"></span></div>
						<div class="bottomBar">
							<input type="button" value="비밀번호 변경" id="checkNewpw" onclick="checkAll()"
								style="margin-left: 10px;" />


						</div>

					</div>
				</div>
			</div>
		</main>
	</div>
</html>
