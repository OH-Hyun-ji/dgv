<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event Register</title>
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" />
 <link href="${pageContext.request.contextPath }/resources/css/admin/managerDetail.css" rel="stylesheet" />
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" ></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" ></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script> 			  
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
 <script type="text/javascript">
  		
  		function thumbNail(event) {
  			
			var reader = new FileReader();
			$("#thImg1-style").empty()
			reader.onload= function(event){
				document.getElementById("thImg1-style").src=event.target.result;
			}
			reader.readAsDataURL(event.target.files[0])
		}
  		function thumbNail1(event) {
  			
			var reader = new FileReader();
			$("#thImg2-style").empty()
			reader.onload= function(event){
				document.getElementById("thImg2-style").src=event.target.result;
			}
			reader.readAsDataURL(event.target.files[0])
		}
  	$(function(){
  		$("input[name='start_date']").datepicker();
  		$("input[name='end_date']").datepicker();
  		
  		$.datepicker.setDefaults({
		    dateFormat: 'yy-mm-dd' //Input Display Format 변경
		});
  		
  		
  		$("#eventRegister").click(function(){
  			alert("이벤트 등록 ")
  			const eventTitle =$("#eventTitle").val()
  			const startDate =$("#startDate").val()
  			const endDate = $("#endDate").val()
  			const eventText =$("#eventText").val()
  			const regId =$("#regId").val()
  			
  			const eventTextImg =$("#eventTextImg").val()
  			const eventImg =$("#eventImg").val()
  			
  			const Img =eventImg.split("\\")
  			const textImg = eventTextImg.split("\\")
  			
  			const eventImgName=Img[Img.length-1]
  			const eventTextImgName = textImg[textImg.length-1]
  			
  			const imgFile = $("#eventImg")[0].files[0];
  			const imgFile1 = $("#eventTextImg")[0].files[0];
  			
  			const eventVo ={
  					"event_title":eventTitle,
  					"start_date":startDate,
  					"end_date":endDate,
  					"event_text":eventText,
  					"event_img":eventImgName,
  					"event_text_img":eventTextImgName,
  					"reg_id":regId
  			}
  			const form = new FormData();
  			form.append("imgFile",imgFile)
  			form.append("imgFile1",imgFile1)
  			form.append("eventVo",new Blob([JSON.stringify(eventVo)],{type:"application/json"}));
  			
  			$.ajax({
  				method:"POST",
  				url:"/insertEvent.mdo",
  				enctype:"multipart/form-data",
  				contentType:false,
  				processData:false,
  				data:form,
  				success:function(result){
  					if(result.msg =="SUCCESS"){
  						alert("등록 성공!")
  						window.opener.location.reload()
  						window.close();
  					}
  				},
  				error:function(){
  					console.log("통신실패")
  				}
  			})//close ajax
  			
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
        
		textarea#eventText {
		    width: 250px;
		    border-radius: 7px;
		    overflow-y: scroll;
		}
    </style>   
</head>
<body style="color: aliceblue;">
    <div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<!-- 여기만 수정해서 사용하세요!! -->
				<h1 class="mt-4" style="background-color: rgba(0,0,0,0.4);">Event</h1>
				<div class="card mb-4">
					<div class="card-header">
						<h3>
						Event Register
                        </h3>
					</div>
					<div class="card-body">
                            <div id="table-container">
                            	<input type="hidden" id="regId" name="reg_id" value="${adminID}">                            
								<table class="type02">		
									<tr>
										<th scope="row" style="font-size:18px;">Event Title</th>
										<td><input type="text" id="eventTitle" name="event_title" style="border-radius: 7px;line-height: 25px;width: 250px;"/></td>
									</tr>	
									<tr>
										<th scope="row" style="font-size:18px;">Start Date</th>
										<td>
											<input type="text" id="startDate" name="start_date" style="border-radius: 7px;line-height: 25px;width: 250px;"/>
										</td>
									</tr>	
									<tr>
										<th scope="row" style="font-size:18px;">End Date</th>
										<td>
											<input type="text" id="endDate" name="end_date" style="border-radius: 7px;line-height: 25px;width: 250px;"/>
										</td>
									</tr>
									<tr>
										<th scope="row" style="font-size:18px;">Event Text</th>
										<td>
											<textarea id="eventText" name="event_text" cols="30" rows="10"></textarea>
										</td>				
									</tr>	
									
									<tr>
										<th scope="row" style="font-size:18px;"">Event Img</th>
										<td><input type="file" multiple="multiple" id="eventImg"  onchange="thumbNail(event)"  name="event_img" style=" border-radius: 7px;line-height: 25px;"/></td>
										<th scope="row" style="font-size:18px;"">Event TextImg</th>
										<td><input type="file" multiple="multiple" id="eventTextImg"  onchange="thumbNail1(event)"  name="event_text_img" style=" border-radius: 7px;line-height: 25px;"/></td>
									</tr>	
									
								</table>
                            </div>
                            <div class="thImg-container">
								<div class="thImg-wrap">
									<img id="thImg1-style" >
								</div>
								<div>
									<img id="thImg2-style" >
								</div>
							</div>
                            <div class="bottomBar">
                                <input type="button" value="Register" multiple="multiple"id="eventRegister" style="margin-left: 10px;"/>
                            </div>
					</div>
				</div>
				
			</div>
		</main>
	</div>
</html>