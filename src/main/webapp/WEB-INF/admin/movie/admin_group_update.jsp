<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/png" sizes="192x192"  href="${pageContext.request.contextPath }/resources/images/banana_real.png">
<title>Admin Movie Director Update</title>
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
 <script type="text/javascript">
 	function groupUpdate(){
 		alert("정말로 수정하시겠습니까?")
	
 		const groupVo = {
 			"movie_group_code":$("#groupCode").val(),
 			"movie_group_name" :$("#groupName").val()
 		}
 			
    		$.ajax({
    			method:"POST",
    			url:"/groupUpdate.mdo",
    			contentType:"application/json",
    			dataType: "json",
    			data:JSON.stringify(groupVo),
    			success:function(result){
    				if(result.msg=="SUCCESS"){    					
    				alert("수정성공!!")
					window.opener.location.reload();
					window.close();
    				}else{
    					alert("수정실패");
    				}
    			},
    			error:function(){
    				console.log("통신실패 ");

    				
    			}
 		})//ajax close
 	}
 	
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
      <link rel='stylesheet'
    href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' />
<script
	src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
     
</head>
<body style="color: aliceblue;">
    <div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">

				<!-- 여기만 수정해서 사용하세요!! -->
				<h1 class="mt-4" style="background-color: rgba(0,0,0,0.4);">Group</h1>
			
				<div class="card mb-4">
					<div class="card-header">
						<h3>
						Movie Director Register
                        </h3>
					</div>
					<div class="card-body">
					
                            <div id="table-container">
                            	
								<table class="type02">				
									<input type="hidden" id="groupCode" name="movie_group_code" style="border-radius: 7px;line-height: 25px;" value="${groupList.movie_group_code }"/>
									<tr>
										<th scope="row" style="font-ssize:18px;">Movie Director Name</th>
										<td><input type="text" id="groupName" name="movie_group_name" style="border-radius: 7px;line-height: 25px;" value="${groupList.movie_group_name }"/></td>
									</tr>
								</table>
                            </div>
                            <div class="bottomBar">
                                <input type="submit" value="Register"  onclick="groupUpdate()" style="margin-left: 10px;"/>
                            </div>
				
					</div>
				</div>
		
			</div>
		</main>
	</div>
</html>
