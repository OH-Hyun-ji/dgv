<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Admin Update</title>
	<link href="${pageContext.request.contextPath }/resources/css/admin/styles.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath }/resources/css/user/button.css" rel="stylesheet"  />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"	crossorigin="anonymous"></script>
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
  			alert("Ddd")
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
  		
		var arrUser = new Array()
		var userList = document.querySelectorAll("option")
		
		$("select[name=userSelectBtn]").on('change',function(){
			console.log(userList.length)
			if(arrUser.indexOf($(this).val()) == -1 ){
				arrUser.push($(this).val())
			}else{
				arrUser.splice(arrUser.indexOf($(this).val()),1)
			}

			
			console.log("uniqUser : "+arrUser.indexOf($(this).val()))
			$("#winnerUserId").val(arrUser)
		})
		
		
		
	
		
  		
  		
  		$("#eventUpdateBtn").click(function(){
  			alert("이벤트 수정 ")
  			const eventTitle =$("#eventTitle").val()
  			const startDate =$("#startDate").val()
  			const endDate = $("#endDate").val()
  			const eventText =$("#eventText").val()
  			const winner = $("#winnerUserId").val()
  			const eventTextImg =$("#event-updateImg2").val()
  			const eventImg =$("#event-updateImg1").val()
  			const eventCode = $("#eventCodeN").val()
  			
  			const Img =eventImg.split("\\")
  			const textImg = eventTextImg.split("\\")
  			
  			const eventImgName=Img[Img.length-1]
  			const eventTextImgName = textImg[textImg.length-1]
  			
  			const imgFile = $("#event-updateImg1")[0].files[0];
  			const imgFile1 = $("#event-updateImg2")[0].files[0];
  			
  			const eventVo ={
  					"event_code":eventCode,
  					"event_title":eventTitle,
  					"start_date":startDate,
  					"end_date":endDate,
  					"event_text":eventText,
  					"event_img":eventImgName,
  					"event_text_img":eventTextImgName,
  					"event_winner":winner
  			}
  			const form = new FormData();
  			form.append("imgFile",imgFile)
  			form.append("imgFile1",imgFile1)
  			form.append("eventVo",new Blob([JSON.stringify(eventVo)],{type:"application/json"}));
  			
  			$.ajax({
  				method:"POST",
  				url:"/eventUpdate.mdo",
  				enctype:"multipart/form-data",
  				contentType:false,
  				processData:false,
  				data:form,
  				success:function(result){
  					if(result.msg =="SUCCESS"){
  						alert("수정 성공!")
  						location.reload()
  						
  					}
  				},
  				error:function(e){
  					console.log("통신실패"+e)
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
		textarea#eventText {
		    width: 250px;
		    border-radius: 7px;
		    overflow-y: scroll;
		    border: 1px solid rgba(0, 0, 0, 0.125);
		    margin-left: 1rem;
		}
		th {
		    width: 179px;
		}
    </style>
</head>
<body class="sb-nav-fixed">
	<div id="layoutSidenav">
		<jsp:include page="../default/admin_top_menu.jsp"></jsp:include>
		<jsp:include page="../default/admin_side_menu.jsp"></jsp:include>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 style=" padding-top: 1rem;padding-bottom: 2px;border-bottom: 1px solid;">이벤트 상세보기</h1>
					<div class="card mb-4" style="background-color: #f7f7f7;">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 이벤트
						</div>
						<div class="card-body">
							<div class="update-style-area">
							 	 <div id="table-container">
	                            	<input type="hidden" id="eventCodeN" name="event_code" value="${eventVo.event_code}">                            
									<table class="type02">		
										<tr>
											<th scope="row" style="font-size:18px;">Event Title</th>
											<td><input type="text" id="eventTitle" class="sameInput" name="event_title" value="${eventVo.event_title }" /></td>
										</tr>	
										<tr>
											<th scope="row" style="font-size:18px;">Start Date</th>
											<td>
												<input type="text" id="startDate"class="sameInput" name="start_date" value="${eventVo.start_date}"/>
											</td>
										</tr>	
										<tr>
											<th scope="row" style="font-size:18px;">End Date</th>
											<td>
												<input type="text" id="endDate"class="sameInput" name="end_date" value="${eventVo.end_date}"/>
											</td>
										</tr>
										<tr>
											<th scope="row" style="font-size:18px;">Winner</th>
											<td>
												<select class="sameInput"  name="userSelectBtn" id="userSelect" style="height: 29px;outline: none;" >
													<option class="sameInput" >회원목록</option>
													<c:forEach var="userList" items="${ userList}">
														<option class="choiceUser" value="${ userList.user_id}">${ userList.user_id}</option>
													</c:forEach>
												</select>
											</td>
										</tr>
										<tr>
											<th></th>
											<td>
												<input id="winnerUserId" class="sameInput"  value="${ eventVo.event_winner}">
											</td>
										</tr>
										<tr>
											<th style="font-size:18px;">Coupon Select</th>											
											<td>
												<input class="sameInput" id="winnerCoupon" >
											</td>
										</tr>
										<tr>
											<th scope="row" style="font-size:18px;">Event Text</th>
											<td>
												<textarea id="eventText" name="event_text" cols="30" rows="10" style="margin-top: 1rem;">${eventVo.event_text}</textarea>
											</td>				
										</tr>		
									</table>
	                            </div>
	                            	
			                            <div class="eventImg-wrapper1">
			                            	<div class="event-label-wrapping1">
				                            	<label class="event-label1" style="font-weight:bolder;">Event Img</label>
				                            	<input type="file" multiple="multiple" id="event-updateImg1"  onchange="thumbNail(event)"  name="event_img" style=" border-radius: 7px;line-height: 25px;"/>
				                           	</div>
				                           	<div class="thImg-wrap">
													<img id="thImg1-style" src="${eventVo.event_img }" >
											</div>
			                            </div>
			                             <div class="eventImg-wrapper2">
			                             	<div class="event-label-wrapping">
				                            	<label class="event-label2" style="font-weight:bolder;">Event TextImg</label>
				                            	<input type="file" multiple="multiple"  id="event-updateImg2" onchange="thumbNail1(event)"  name="event_img" style=" border-radius: 7px;line-height: 25px;"/>
											</div>
											<div class="thImg-wrap2">
												<img id="thImg2-style" src="${eventVo.event_text_img }" >
											</div>                            
			                            </div>
			                        
			                        </div>
                            <div class="bottomBar">
                                <input type="button" value="수정하기" multiple="multiple"id="eventUpdateBtn" style="margin-left: 10px;"/>
                            </div>
						</div>
					</div>
				</div>
			</main>
			<jsp:include page="../default/admin_footer.jsp" />
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resources/js/admin/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resources/js/admin/datatables-simple-demo.js"></script>
</body>
</html>
