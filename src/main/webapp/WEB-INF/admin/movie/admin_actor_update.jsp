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
 <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script> 			  
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
  <script type="text/javascript">
  	function actorUpdate(){
  		alert("정말로 수정하시겠습니까??")
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
 					  "timeOut": "5000000",
 					  "extendedTimeOut": "1000",
 					  "showEasing": "swing",
 					  "hideEasing": "linear",
 					  "showMethod": "fadeIn",
 					  "hideMethod": "fadeOut"
 					}
  		let actorBirth = $("#actorBirth").val();
  	
  		if(!actorBirth.match("-")){
  			toastr.warning("생일에 '-'을 입력해주세요")
  			
  		}else{
  			
  			let regId = $("#regId").val();
    		let actorN = $("#actorName").val();
    		let actorEn = $("#actorEName").val();
    		let actorNation = $("#actorNation").val();	
    		let actorInfo =$("#actorInfo").val();
    		let actorImgSample = $("#actorImg").val();
    		let groupCode =$("#groupN").val();
    		let actorCode =$("#actorCode").val();
    		const imgFile = $('#actorImg')[0].files[0];
    		    		
    		 if(actorImgSample==""){
    			 toastr.warning("이미지파일을 선택해주세요!!")
    			 
    		 }	
    		console.log("groupCode"+groupCode)
    		console.log(regId)
    		console.log(actorN)
    		console.log("생일 : " +actorBirth)
    		console.log("이미지 넣기전 : " +actorImgSample)
    		
    		const arr = actorImgSample.split('\\');
    		console.log(arr.length);
    		for(let i =0;i<arr.length;i++){
	    		console.log("arr("+i+")"+arr[i]);
    			
    		}
     		let actorImg = arr[arr.length-1];
     		console.log("??? "+arr[arr.length-1])
     		console.log(" send img name : "+ actorImg)
     		var formData = new FormData();
     		
//      		formData.append('movie_actor_name',actorN)
//      		formData.append('movie_actor_ename',actorEn)
//      		formData.append('movie_actor_birth',actorB)
//      		formData.append('movie_actor_nation',actorNation)
//      		formData.append('movie_actor_info',actorInfo)
//      		formData.append('movie_actor_img',actorImg)
	      		formData.append('imgFile', imgFile)
    		
    		const formJson = {
    			"movie_actor_name" : actorN,
    			"movie_actor_ename" :actorEn,
    			"movie_actor_birth" : actorBirth,
    			"movie_actor_nation" :actorNation,
    			"movie_actor_info":actorInfo,
    			"movie_actor_img":actorImg,
    			"movie_group_code":groupCode,
    			"movie_actor_code":actorCode
    		}    		
    		
    		formData.append('actorVo', new Blob([JSON.stringify(formJson)], { type: "application/json" }));
    		
    		$.ajax({
    			method:"POST",
    			url:"/actorUpdate.mdo",
    			enctype:"multipart/form-data",
    			processData: false,
    			data:formData,
    			contentType: false,
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
    		});//ajax close
  		}
  		
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
								<table class="type02">		
                            	<input type="hidden" id="actorCode" name="movie_actor_code" value='${actorList.movie_actor_code}'">                            
									<tr>
										<th scope="row" style="font-size:18px;">Actor Name</th>
										<td><input type="text" id="actorName" name="movie_actor_name" value="${actorList.movie_actor_name }" style="border-radius: 7px;line-height: 25px;"/></td>
									</tr>	
									<tr>
										<th scope="row" style="font-size:18px;">Actor Eng Name</th>
										<td><input type="text" id="actorEName" name="movie_actor_ename" value="${actorList.movie_actor_ename }" style="border-radius: 7px;line-height: 25px;"/></td>
									</tr>	
									<th scope="row" style="font-size:18px;">Actor Group</th>
										<td>
											<select id="groupN" name="movie_group_code"  style="border-radius: 7px; width: 22%; height: 27px;">
												<option  class="groupName" value='${actorList.movie_group_code}'>${actorList.movie_group_name}</option>
												<c:forEach var="groupList" items="${groupList}">
													<option value="${groupList.movie_group_code }">${groupList.movie_group_name}</option>
												</c:forEach>
											</select>
										</td>
									</tr>
									<tr>
										<th scope="row" style="font-size:18px;">Actor Birth</th>
										<td>
											<input type="text" id="actorBirth" name="movie_actor_birth" value='${actorList.movie_actor_birth}' style="border-radius: 7px; height: 27px;width: 67%;">
										</td>				
									</tr>	
									<tr>
										<th scope="row" style="font-size:18px;"">Actor Nation</th>
										<td><input type="text" id="actorNation" name="movie_actor_nation" value='${actorList.movie_actor_nation}' style="margin-bottom: 2%;border-radius: 7px;line-height: 25px;"/></td>
									</tr>	
									<tr>
										<th scope="row" style="font-size:18px;"">Actor Info</th>
										<td><textarea id="actorInfo" name="movie_actor_info" placeholder="참여자 소개"  style=" margin-bottom: 3%; border-radius: 7px;line-height: 25px; overflow-y:scroll; ">${actorList.movie_actor_info}</textarea></td>
									</tr>	
									<tr>
										<th scope="row" style="font-size:18px;"">Actor Img</th>
										<td><input type="file" multiple="multiple" id="actorImg" name="movie_actor_img" style=" border-radius: 7px;line-height: 25px;"/></td>
									</tr>	
									
								</table>
                            </div>
                            <div class="bottomBar">
                                <input type="button" value="Register"multiple="multiple"   onclick="actorUpdate()" style="margin-left: 10px;"/>
                            </div>
                           
					</div>
				</div>
				<!-- 여기만 수정해서 사용하세요!! -->
			</div>
		</main>
	</div>
</html>