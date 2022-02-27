<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Age Register</title>
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
        	font-size: 25px;
		    color: lightgray;
		    font-weight: bold;
		    padding-left: 10%;
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
            padding-left: 15%;
        }
    </style>
    <link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' />
	<script src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
    <script type="text/javascript">       
    	function bottonAction() {
    		let  ageName = $("#ageName").val();
    		let regId =$("#regId").val();
    		let ageImg  = $("#ageImg").val();
    		
    		console.log("ageName : "+ageName);
    		$.ajax({
    			method:"POST",
    			url:"/adminInsertAge.mdo",
    			contentType:"application/json",
    			dataType:"json",
    			data:JSON.stringify({"movie_age_name":ageName,"reg_id":regId,"ageImg":ageImg}),
    			success:function(result){
    				const reT = JSON.parse(result);
    				console.log("ageName"+ageName);
    				console.log(reT);
    				console.log("result :" + reT.msg);
    			
    				console.log("result.msg = "+ result.msg);
    				if(reT.msg=="SUCCESS"){
    					alert("등록 성공!!")
    					window.opener.location.reload();
    					window.close();
    					
    				}else{
    					alert("등록 실패!!")
    				}
    			},
    			error:function(e){
    				console.log("통신실패"+e)
    			}
    		});//ajax close
			
		}
    </script>
       
</head>
<body style="color: aliceblue;">
    <div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">

				<!-- 여기만 수정해서 사용하세요!! -->
				<h1 class="mt-4" style="background-color: rgba(0,0,0,0.4);">Age</h1>

				<div class="card mb-4">
					<div class="card-header">
						<h3>
						Age Register
                        </h3>
					</div>
					<div class="card-body">
						<!--  <form action="/upload" method="POST" enctype="multipart/form-data" >-->
                            <div id="table-container">
                            	<input type="hidden" id="regId" name="reg_id" value="관리자">
                            
								<table class="type02">				
									<tr>
										<th scope="row" style="font-size:18px;"">Age Name</th>
										<td><input type="text" id="ageName" name="movie_age_name" style="border-radius: 7px;line-height: 25px;"/></td>
									</tr>
									<tr>
										<th scope="row" style="font-size:18px;"">Age Img</th>
										<td><input type="file" id="ageImg" name="movie_age_img" accept="image/jpeg,.txt" /></td>
									</tr>
								</table>
                            </div>
                            <div class="bottomBar">
                                <input type="submit" value="Register"  onclick="bottonAction()" style="margin-left: 10px;"/>
                            </div>
						<!--  </form>-->
					</div>
				</div>
				<!-- 여기만 수정해서 사용하세요!! -->
			</div>
		</main>
	</div>
</html>
