<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
    
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
	$(function(){
		alert("인증번호를 입력해주세요")
		
		$("#authCheck").click(function(){		
		const authNumber = $("#userAuth").val();
		console.log("authNumber" + authNumber)
				$.ajax({
					method:"POST",
					url:"authNumberCheck.do",
					contentType:"application/json",
					dataType:"json",
					data:JSON.stringify({"user_auth":authNumber}),
					success:function(result){
						if(result.msg=="SUCCESS"){
							alert(authNumber)
							alert("인증이 성공하였습니다.")
							location.href="/find_updatePassword.do";
						}
					},error:function(e){
						console.log("통신실패"+e)
					}
				})
			
			
		})
		
	})

    </script>
       
</head>
<body style="color: aliceblue;">
    <div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">

				<!-- 여기만 수정해서 사용하세요!! -->
				<h1 class="mt-4" style="background-color: rgba(0,0,0,0.4);">인증번호 입력</h1>

				<div class="card mb-4">
					<div class="card-header">
						<h3>
							입력하신 메일을 확인 후 인증번호를 입력해 주시기 바랍니다.	
                        </h3>
					</div>
					<div class="card-body">
					
					<form action="pw_set.me" method="post">
						<input type="hidden" name ="user_num">
                            <div id="table-container">
								<table class="type02">				
									<tr >
										<th scope="row" style="font-size:18px;">인증번호를 입력해 주세요 : </th>
										<td><input type="text" id="userAuth" name="user_auth" style="border-radius: 7px;line-height: 25px; "/></td>	
			
									</tr>
								</table>
                            </div>
                            <div class="bottomBar">
                                <input type="button" value="인증번호 확인" id="authCheck"  style="margin-left: 10px;"/>
                            </div>
					</form>
					
					</div>
				</div>
			</div>
		</main>
	</div>
</html>
