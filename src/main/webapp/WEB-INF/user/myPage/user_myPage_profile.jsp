<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/png" sizes="192x192"  href="${pageContext.request.contextPath }/resources/images/banana_real.png">
<title>My ProfileImg</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=1024" />
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/layout.css">
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/myPage.css">
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/movieTheater.css" />
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/profile.css" />
	<link rel="stylesheet" media="all" type="text/css"  href="${pageContext.request.contextPath }/resources/css/user/userModule.css" />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<script type="text/javascript">
	
		function Thumbnail(event){
			var reader = new FileReader();
			$("#myProfile-hwe").empty()
			reader.onload = function(event){
				document.getElementById("myProfile-hwe").src=event.target.result;
			}
			reader.readAsDataURL(event.target.files[0]);
		}
		
		$(function(){
		
			$("#myInfo").addClass("on")
			$(".feat-show1").addClass("fix")
			$(".feat-show1 li a#profileInfo").css("color","red")
			$("#myMain").removeClass("on")
			
			$("#profile-picture").click(function(){
				var msg = confirm("????????? ????????? ?????????????????????????")
				var userImg = $("#profileUserImgInfo").val()
				console.log(userImg)
				var Img = userImg.split("\\")
				console.log(Img)
				console.log(Img.length-1)
				console.log(Img[Img.length-1])
				var profileImg = Img[Img.length-1]
				var imgFile = $("#profileUserImgInfo")[0].files[0]
				
				var formData = new FormData()
				const detailVo ={
					"user_img":profileImg
				}
				formData.append("profileImg", new Blob([JSON.stringify(detailVo)],{type:"application/json"}));
				formData.append("imgFile",imgFile)
				if(msg){
					$.ajax({
						method:"POST",
						url:"/profileImgInsert.do",
						enctype:"multipart/form-data",
						contentType:false,
						processData:false,
						data:formData,
						success:function(result){
							if(result.msg=="SUCCESS"){
								alert("????????? ?????? ??????")
								location.href="/myPage.do"
							}else{
								alert("????????????! ?????? ??????????????????")
							}
						},
						error:function(){
							console.log("????????????")
						}
					})//close ajax
				}
			})
		})
		
		
		
	</script>
</head>

<body class="">
	<div id="dgvwrap">
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
						<div class="myProfile-container">
							<h2>?????? ??????</h2>
						</div>
						<div class="myProfile-sub-contain">
							<h2>?????? ?????????/DGV??????</h2>
						</div>						
							<table id="myProfile-tableN" >
								<colgroup>
									<col width="19%">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th>?????????</th>
										<td>${userID}</td>
									</tr>
									<tr>
										<th>?????????</th>
										<td>${userEmail }</td>
									</tr>
									<tr>
										<th>????????? ?????????</th>
										<td>
											<p class="profile-text-info">??? ?????????(?????????, ?????????, ???????????? ???)??? ?????? ??? ??????????????? ???????????? ?????????????????? ???????????????.
????????? ????????? ????????? ????????? ?????????</p>										
											<div class="select-user-img">
												<div class="user-box-img">
													<span class="thumb-box-img">
														<img id="myProfile-hwe" src="${pageContext.request.contextPath }/resources/images/default_profile.gif"">
														<span class="profile-mask-box"></span>
													</span>
												</div>
												<div class="profile-box-contents">
													<p style="margin: 10px 0;">jpg, gif, BMP ????????? ?????? ???????????????. (?????? 3M)</p>
													<input type="file" onchange="Thumbnail(event)" id="profileUserImgInfo" name="user_img">
													<button id="profile-picture">??????</button>
												</div>
												<div class="profile-agree-status">
													<table id="userAgree-info">
														<colgroup>
															<col style="width:16%;">
															<col style="width:34%;">
															<col style="width:34%;">
															<col style="width:16%;">
														</colgroup>
														<thead>
															<tr>
																<th scope="col">??????</th>
																<th scope="col">????????????</th>
																<th scope="col">????????????</th>
																<th scope="col">????????????</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<th>????????? ??????, ?????????</th>															
																<td>
																	<ul class="agree-dep">
																		<li class="agree-dep-list">?? ????????? ????????? ????????????<br> ????????? ??????</li>
																		<li>?? ????????? ???????????? ????????? ??????</li>
																	</ul>
																</td>
																<td>?????? ????????? 1?????? ??????</td>
																<td>
																	<span>
																		<input name="user_agree" id="userAgreeY" type="radio">
																		<label>?????????</label>
																	</span>
																	<span>
																		<input name="user_agree" id="userAgreeN" type="radio">
																		<label>????????????</label>
																	</span>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</td>
									</tr>							
								</tbody>
							</table>						
					</div>
				</div>
			</div>

		</div>

	</div>

	<jsp:include page="../default/user_bottom_reserve.jsp"></jsp:include>
	<jsp:include page="../default/user_footer.jsp"></jsp:include>
</body>
</html>