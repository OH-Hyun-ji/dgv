<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Movie Director Register</title>
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
     </style>
      <link rel='stylesheet'
    href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' />
<script
	src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
    <script type="text/javascript">
    
   
    	function groupCheck() {
			let groupName = $("#groupName").val();
			let regId =$("#regId").val();
			
    		
    		$.ajax({
    			method:"POST",
    			url:"/adminInsertGroup.mdo",
    			contentType:"application/json",
    			dataType:"json",
    			data:JSON.stringify({"movie_group_name":groupName,"reg_id":regId}),
    			success:function(result){
    				console.log(result)
    				const res = JSON.parse(result);
    				if(res.msg=="SUCCESS"){
    					alert("등록 완료!")
    					window.opener.location.reload();
    					window.close();
    					
    				}else{
    					alert("등록 실패")
    				}
    			},
    			error:function(){
    				console.log("통신실패")
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
				<h1 class="mt-4" style="background-color: rgba(0,0,0,0.4);">Group</h1>

				<div class="card mb-4">
					<div class="card-header">
						<h3>
						Movie Director Register
                        </h3>
					</div>
					<div class="card-body">
					
                            <div id="table-container">
                            	<input type="hidden" id="theaterCode" name="theater_code" value="">
								<table class="type02">				
									<tr>
										<th scope="row" style="font-ssize:18px;">Movie Director Name</th>
										<td><input type="text" id="groupName" name="movie_group_name" style="border-radius: 7px;line-height: 25px;"/></td>
									</tr>
								</table>
                            </div>
                            <div class="bottomBar">
                                <input type="submit" value="Register"  onclick="groupCheck()" style="margin-left: 10px;"/>
                            </div>
				
					</div>
				</div>
			</div>
		</main>
	</div>
</html>
