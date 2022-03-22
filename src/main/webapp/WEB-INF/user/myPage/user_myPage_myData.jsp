<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>
   	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script> 
   <style type="text/css">
   .issetUser {
      box-shadow : 0px 0px 20px 11px tomato;
      background-color : pink;
   }
   
   .nonesetUser {
      box-shadow : 0px 0px 20px 11px aquamarine;
      background-color : rgb(177 224 205);
   }
   </style>
   
<script type="text/javascript">
      var getIdCheck = new RegExp(/^[a-zA-Z0-9]{4,14}$/);
      var getPwCheck= new RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
      var getName= new RegExp(/^[가-힣]+$/);
      var getPhone= new RegExp(/^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/);
      var getEmail= new RegExp(/^[a-zA-Z0-9]+@[a-zA-Z0-9.-]+$/);
      var getBirth= new RegExp(/^(19[0-9][0-9]|20\d{2})$/);


    //가입중재 참거짓판별을 위한 논리변수 
      var chk1 =false, chk2 = false, ch3 = false, chk4 = false, chk5 =false, chk6 =false, chk7 =false;
  
      
      $(function(){
         //keyup -> 마우스 눌렀다가 떼면 이벤트 발생
         console.log("???????");
         //pw 검증 메서드
         $('#password').on('keyup',function(){    
            if($(this).val() ==""){
               $("#password").removeClass("issetUser");
                $("#password").removeClass("nonesetUser");
                $("#password").addClass("issetUser");
                $("#psCK").html('<b style="color:orangered; font-size: smaller;">[ 비밀번호를 입력해주세요. ]');    
                 chk2 = false;
                
             }else if(!getPwCheck.test($("#password").val())){   
            	 $("#password").removeClass("nonesetUser");
                 $("#password").addClass("issetUser"); 
                 $("#psCK").html('<b style="color:orangered; font-size: smaller;">[ 비밀번호는 문자, 숫자, 특수문자의 조합으로<br> 8~16자리로 입력해주세요! ]');    
                 chk2 = false;
             }else{
                $("#password").removeClass("issetUser");
                $("#password").addClass("nonesetUser");
                $("#psCK").html('<b style="color:aquamarine; font-size: smaller;">[ 사용가능한 비밀번호입니다. ]');    
                chk2 = true;
             }                  
          }); //pw 검증 메서드 끝
          
          
         //pw 확인 메서드
         $('#passwordRepeat').on('keyup' ,function(){
            if($(this).val() ==""){
               $("#passwordRepeat").removeClass("issetUser");
                $("#passwordRepeat").removeClass("nonesetUser");
                $("#passwordRepeat").addClass("issetUser");
                $("#psCK").html('<b style="color:orangered; font-size: smaller;">[ 비밀번호를 확인해주세요. ]');    
                 chk3 = false;
            }else if($(this).val() != $("#password").val()){
            	$("#passwordRepeat").removeClass("nonesetUser");
                $("#passwordRepeat").addClass("issetUser");
                $("#psCK").html('<b style="color:orangered; font-size: smaller;">[ 비밀번호가 다릅니다. 다시 확인해 주세요. ]');    
                 chk3 = false;
            }else{
               $("#passwordRepeat").removeClass("issetUser");
                $("#passwordRepeat").addClass("nonesetUser");
                $("#psCK").html('<b style="color:aquamarine; font-size: smaller;">[ 비밀번호 확인이 완료되었습니다. ]');    
                chk3 = true;
            }
         });//pw 확인 메서드 끝 
         
          //휴대폰번호 확인 메서드
          $('#phone').on('keyup',function(){    
             if($(this).val() ==""){
                 $("#phone").removeClass("issetUser");
                 $("#phone").removeClass("nonesetUser");
                 $("#phone").addClass("issetUser");
                 $("#phoneCK").html('<b style="color:orangered; font-size: smaller;">[ 휴대폰번호를 입력해주세요.(-포함) ]');    
                 chk5 = false;
              }else if(!getPhone.test($("#phone").val())){     
            	 $("#phone").removeClass("nonesetUser");
                 $("#phone").addClass("issetUser"); 
                 $("#phoneCK").html('<b style="color:orangered; font-size: smaller;">[ 휴대폰번호를 확인해 주세요.(-포함) ]');    
                 chk5 = false;
              }else{
                 $("#phone").removeClass("issetUser");
                 $("#phone").addClass("nonesetUser");
                 $("#phoneCK").html('<b style="color:aquamarine; font-size: smaller;">[ 확인되었습니다. ]');    
                 chk5 = true;
              }                 
          });//휴대폰번호 확인 메서드 끝
          
      });
   // 회원정보 수정 검증
   function checkAll(){
	   toastr.options = {
				  "closeButton": true,
				  "debug": false,
				  "newestOnTop": false,
				  "progressBar": true,
				  "positionClass": "toast-top-right",
				  "preventDuplicates": true,
				  "onclick": null,
				  "showDuration": "300",
				  "hideDuration": "1000",
				  "timeOut": "5000",
				  "extendedTimeOut": "1000",
				  "showEasing": "swing",
				  "hideEasing": "linear",
				  "showMethod": "fadeIn",
				  "hideMethod": "fadeOut"
				}
			
	   
	   const pw = $("#password").val()
	   const phone =$("#phone").val()
	   console.log("pw : "+ pw)
	   console.log("phone"+phone)
	   
	   const updateVo = {
		   "user_pw": pw,
		   "user_phone":phone
	   }
	   
	   if(chk2 && chk3 && chk5){
			$.ajax({
	      		method:"POST",
	      		url:"/updateUser.do",
	      		contentType:"application/json",
	      		dataType:"json",
	      		data:JSON.stringify(updateVo),
	      		success:function(result){
	      			if(result.msg=="SUCCESS"){
	      				alert("수정완료!!!")
	      				location.href="/myPage.do";
	      				
	      			}else{
	      				alert("수정 실패 다시 시도해주세요 ")
	      			}
	      		},
	      		error:function(){
	      			console.log("통신실패")
	      		}
	      	})//ajax close
	   }else{
		   toastr.warning("유효하지 않은 값이 있습니다.","다시 확인해주세요!!!!")
	   }
	   
      
	}
   
   
         


// 회원탈퇴
	function deleteUser(){  
	const id = $("#id").val()
	   let result = confirm("정말 삭제하시겠습니까??");
	   console.log("ddddd")
  
	   if(result == true){  
	      $.ajax({
	         method:"POST",
	         url:"/deleteUser.do",
	         contentType:"application/json",
	         dataType:"json",
	         data:JSON.stringify({"user_id":id}),
	         success:function(num){               
	            if(num.msg=="SUCCESS"){
	               alert("삭제완료")
	               location.replace("/loginForm.do");
	            }else{
	               alert('삭제를 다시 진행해주세요')
	            }
	         },
	         error:function(){
	            
	            console.log("통신실패")
	            }
	         
	         });//ajax close 
	
	}
}

</script>
      
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
	                                 <li>아이디&nbsp;&nbsp;&nbsp;</li>
	                                 <li><input type="text" id="id" readonly="readonly" value="${userData.user_id}"></li>
	                              </ul>
	                           </div>
	                           <div class="myPage-myName">
	                              <ul>
	                                 <li>성명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
	                                 <li><input type="text" readonly="readonly" value="${userData.user_name}"></li>
	                              </ul>                              
	                           </div>
	                           <div class="myPage-myPass">
	                              <ul>
	                                 <li>비밀번호</li>
	                                 <li><input type="password" name="user_pw" placeholder="비밀번호" id="password" class="form-control" maxlength="16" min="8"> 
	                                          <i class="zmdi zmdi-lock"></i></li>
	                              </ul>                                 
	                           </div>
	                           <div class="myPage-myPassCk">
	                              <ul>
	                                 <li >비밀번호 확인</li>
	                                 <li><input type="password" placeholder="비밀번호 확인" class="form-control" id="passwordRepeat" maxlength="16" min="8" style="margin-left: 224px;"> 
	                                          <i class="zmdi zmdi-lock"></i></li>
	                              </ul>                                 
	                           </div>
	                           <div class="myPage-myEmail">
	                              <ul>
	                                 <li>이메일&nbsp;&nbsp;&nbsp;</li>
	                                 <li><input type="text" readonly="readonly" value="${userData.user_email}"></li>
	                              </ul>                                 
	                           </div>
	                           <div class="myPage-myPhone">
	                              <ul>
	                                 <li>전화번호</li>
	                                 <li>
	                                    <input type="text" id="phone" name="user_phone" placeholder="${userData.user_phone}" class="form-control"> 
	                                          <i class="zmdi zmdi-phone"></i>
	                                       </li>
	                              </ul>                           
	                           </div>
	                           <div class="myPage-myBirth">
	                              <ul>
	                                 <li>생년월일</li>
	                                 <li><input type="text" readonly="readonly" value="${userData.user_year}.${userData.user_month}.${userData.user_day}"></li>
	                              </ul>                                 
	                           </div>
	                           <div style="text-align: center;"><span id="psCK"></span></div>
	                           <div style="text-align: center;"><span id="phoneCK"></span></div>
	                        </div>
              
                     </div>
                  </div>
                  <div class="myPage-update-allButton">
                     <input type="button" onclick="checkAll()" value="회원정보수정">
                     <input type="button" onclick="deleteUser()" value="회원탈퇴">
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