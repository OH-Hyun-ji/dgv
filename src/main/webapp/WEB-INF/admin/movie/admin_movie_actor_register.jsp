<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Actor Register</title>
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
    
   
    	function actorCheck() {
    		let regId = $("#regId").val();
    		let actorN = $("#actorName").val();
    		let groupC = $("#groupCode option:selected").val();
    		console.log(regId)
    		console.log(actorN)
    		$.ajax({
    			method:"POST",
    			url:"/adminInsertActor.mdo",
    			contentType:"application/json",
    			dataType:"json",
    			data:JSON.stringify({"movie_group_code":groupC,"reg_id":regId,"movie_actor":actorN}),
    			success:function(result){
    				const res = JSON.parse(result);
    				if(res.msg=="SUCCESS"){
    					alert("등록 완료!");
    					window.opener.location.reload();
    					window.close();
    				}else{
    					alert("등록실패");
    				}
    			},
    			error:function(){
    				console.log("통신실패 ");
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
				<h1 class="mt-4" style="background-color: rgba(0,0,0,0.4);">Actor</h1>

				<div class="card mb-4">
					<div class="card-header">
						<h3>
						Actor Register
                        </h3>
					</div>
					<div class="card-body">
                            <div id="table-container">
                            	<input type="hidden" id="regId" name="reg_id" value="${adminID}">
                            
								<table class="type02">			
									<tr>
										<th scope="row" style="font-ssize:18px;"">Group</th>
										<td>
											<select id="groupCode" >
												<c:forEach var="groupCode" items="${groupCode}">
												<option  name="movie_group_code" value="${groupCode.movie_group_code}">${groupCode.movie_group_code}</option>
												</c:forEach>
											</select>
										</td>
									</tr>	
									<tr>
										<th scope="row" style="font-size:18px;"">Actor Name</th>
										<td><input type="text" id="actorName" name="movie_actor" style="border-radius: 7px;line-height: 25px;"/></td>
									</tr>
								</table>
                            </div>
                            <div class="bottomBar">
                                <input type="submit" value="Register"  onclick="actorCheck()" style="margin-left: 10px;"/>
                            </div>
					</div>
				</div>
				<!-- 여기만 수정해서 사용하세요!! -->
			</div>
		</main>
	</div>
</html>
