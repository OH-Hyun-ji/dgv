<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
			$("#profile-picture").click(function(){
				var msg = confirm("프로필 사진을 등록하시겠습니까?")
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
								alert("프로필 등록 완료")
								location.href="/myPage.do"
							}else{
								alert("등록실패! 다시 등록해주세요")
							}
						},
						error:function(){
							console.log("통신실패")
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
							<h2>나의 정보</h2>
						</div>
						<div class="myProfile-sub-contain">
							<h2>나의 프로필/DGV정보</h2>
						</div>						
							<table id="myProfile-tableN" >
								<colgroup>
									<col width="19%">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th>이름</th>
										<td>바나나</td>
									</tr>
									<tr>
										<th>아이디</th>
										<td>바나나</td>
									</tr>
									<tr>
										<th>프로필 이미지</th>
										<td>
											<p class="profile-text-info">각 서비스(이벤트, 매거진, 영화리뷰 등)의 리뷰 및 덧글작성시 등록하신 대표이미지가 노출됩니다.
프로필 이미지 종류를 선택해 주세요</p>										
											<div class="select-user-img">
												<div class="user-box-img">
													<span class="thumb-box-img">
														<img id="myProfile-hwe" src="${pageContext.request.contextPath }/resources/images/default_profile.gif"">
														<span class="profile-mask-box"></span>
													</span>
												</div>
												<div class="profile-box-contents">
													<p style="margin: 10px 0;">jpg, gif, BMP 파일만 등록 가능합니다. (최대 3M)</p>
													<input type="file" onchange="Thumbnail(event)" id="profileUserImgInfo" name="user_img">
													<button id="profile-picture">등록</button>
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
																<th scope="col">항목</th>
																<th scope="col">이용목적</th>
																<th scope="col">보유기간</th>
																<th scope="col">동의여부</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<th>프로필 사진, 닉네임</th>															
																<td>
																	<ul class="agree-dep">
																		<li class="agree-dep-list">· 공개된 게시판 서비스의<br> 이미지 등록</li>
																		<li>· 공개된 게시판의 익명성 보장</li>
																	</ul>
																</td>
																<td>약관 철회후 1주일 까지</td>
																<td>
																	<span>
																		<input name="user_agree" id="userAgreeY" type="radio">
																		<label>동의함</label>
																	</span>
																	<span>
																		<input name="user_agree" id="userAgreeN" type="radio">
																		<label>동의안함</label>
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