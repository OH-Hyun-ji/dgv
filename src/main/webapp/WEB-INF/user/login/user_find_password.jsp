<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
 
 <script type="text/javascript">
  
 	$(function(){
 		$("#check").click(function(){
 			const name = $("#name").val()
 			const email =$("#email").val()
 			
 			const userVo = {
 				"user_name":name,
 				"user_email":email
 			}
 			
 			$.ajax({
 				method:"POST",
 				url:"/send_auth.do",
 				contentType:"application/json",
 				dataType:"json",
 				data:JSON.stringify(userVo),
 				success:function(result){
 					alert("인증번호가 발송되었습니다.")
 					var number = JSON.parse(result)
 					console.log("number"+number)
 					
 					location.href="/find_auth.do"
 					
 				},
 				error:function(e){
 					console.log("통신실패 "+e)
 				}
 			})
 		})
 	})
 </script>  
    <style>
        .mt-4{
            text-align: center;
            margin-bottom: 0;
        }
        body{
        	background-image:url("./../../../resources/images/adminBackground01.png");
            background-size: contain;
            
        }
        h3{
        	text-align: center;
        	font-size: 25px;
		    color: lightgray;
		    font-weight: bold;
		    background-color: rgba(0,0,0,0.4);
		    margin: 0;
		    padding-bottom: 6px;
		}
        .bottomBar{
            margin-top: 5%;
            display: flex;
            justify-content: space-evenly
        }
        .bottomBar>input{
            background-color: lightgray;
            height: 45px;
            width: 25%;
            border-radius: 13px;
        }
        
       #table-container {
            display: flex;
    		place-content: center;
        }
        

    </style>
    
      <link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' />
<script src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
    
    
    <script>
    

    </script>
       
</head>
<body style="color: aliceblue;">
    <div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">

				<!-- 여기만 수정해서 사용하세요!! -->
				<h1 class="mt-4" style="background-color: rgba(0,0,0,0.4);">비밀번호 찾기</h1>

				<div class="card mb-4">
					<div class="card-header">
						<h3>
							이메일 인증을 통해 새로운 비밀번호를 설정할 수 있습니다.	
                        </h3>
					</div>
					<div class="card-body">
					
                            <div id="table-container">
								<table class="type02">				
									<tr >
										<th scope="row" style="font-size:18px;">이름을 입력해 주세요 : </th>
										<td><input type="text" class="name_input" id="name" name="user_name" style="border-radius: 7px;line-height: 25px; "/></td>
									</tr>
									<tr>
										<th scope="row" style="font-size:18px;">이메일을 입력해 주세요 : </th>
										<td><input type="text" class="mail_input" id="email" name="user_email" style="border-radius: 7px;line-height: 25px;"/></td>
									</tr>
									
								</table>
                            </div>
                            <div class="bottomBar">
                                <input type="button" class="mail_check_button" value="확인" id="check"  style="margin-left: 10px;"/>
                            </div>
				
					</div>
				</div>
			</div>
		</main>
	</div>
</html>
