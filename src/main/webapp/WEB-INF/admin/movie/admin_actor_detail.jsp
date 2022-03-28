<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/png" sizes="192x192"  href="${pageContext.request.contextPath }/resources/images/banana_real.png">
	<title>Admin user List</title>
	<link href="${pageContext.request.contextPath }/resources/css/admin/styles.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath }/resources/css/user/button.css" rel="stylesheet"  />
	<link href="${pageContext.request.contextPath }/resources/css/admin/managerDetail.css" rel="stylesheet"  />
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"	crossorigin="anonymous"></script>
	<script type="text/javascript">
		function thumbNail(event){
			var reader = new FileReader();
			$("#actor-img-style").empty()
			reader.onload =function(event){
				document.getElementById("actor-img-style").src=event.target.result;
				
			}
			reader.readAsDataURL(event.target.files[0]);
		}
		function actorUpdate(e){
	  		const ms =confirm("정말로 수정하시겠습니까??")
	  		if(ms){
	    		let actorN = $("#actorName").val();
	    		let actorEn = $("#actorEName").val();
	    		let actorNation = $("#actorNation").val();	
	    		let actorBirth =$("#actorBirth").val()
	    		let actorInfo =$("#actorInfo").val();
	    		let actorImgSample = $("#actorImg").val();
	    		let groupCode =$("#groupN").val();
	    		let actorCode = e
	    		const imgFile = $('#actorImg')[0].files[0];
				console.log("e : " + e)
	    		
	    		const arr = actorImgSample.split('\\');
	    		console.log(arr.length);
	    		for(let i =0;i<arr.length;i++){
		    		console.log("arr("+i+")"+arr[i]);
	    			
	    		}
	     		let actorImg = arr[arr.length-1];
	     		var formData = new FormData();
	     		      		
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
	    			error:function(r,e){
	    				console.log("통신실패 "+e+"  code : "+r.status+"\n"+"message : "+r.responseText+"\n"+"error:"+e);

	    				
	    			}
	    		});//ajax close
	  		
	  		}
	  		else{
	  			
	  		}
	  	}
	</script>
</head>
<body class="sb-nav-fixed">
	<div id="layoutSidenav">
		<jsp:include page="../default/admin_top_menu.jsp"></jsp:include>
		<jsp:include page="../default/admin_side_menu.jsp"></jsp:include>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">배우 관리</h1>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 배우 상세 
						</div>
						<div class="card-body" id="main-detail">
							<div class="total-detail-container">
								<div class="detail-container">
									<div class="actor-detail-wrapping">
										<div class="actor-detail-wrapper">
											<div class="actor-detail-img">
												<img id="actor-img-style" src="${actorList.movie_actor_img}">						
											</div>
											<div>
												<input type="file" onchange="thumbNail(event)" id="actorImg" name="movie_actor_img">
											</div>
										</div>
										<div class="actor-detail-info">
											<div class="actor-detail-wrap">
												<div class="detail-actor-groupCode ">
													<label class="labelN">그룹</label>
													<select class="groupChoice detail-input"id="groupN" name="movie_group_code">
														<c:forEach var="groupList" items="${groupList}">
															<option value="${groupList.movie_group_code }">${groupList.movie_group_name}</option>
														</c:forEach>
													</select>
												</div>
												<div class="detail-actor-name">
													<label class="labelN">이름</label>
													<input class="detail-input" type="text" id="actorName"  value="${actorList.movie_actor_name}">
												</div>
												<div class="detail-actor-nameEn">
													<label class="labelN">영문이름</label>
													<input class="detail-input"  type="text" id="actorEName" value="${actorList.movie_actor_ename}">
												</div>
												<div class="detail-actor-birth">
													<label class="labelN">생년월일</label>
													<input class="detail-input"  type="text" id="actorBirth" value="${actorList.movie_actor_birth}" >
												</div>
												<div class="detail-actor-nation">
													<label class="labelN">국적</label>
													<input class="detail-input"  type="text" id="actorNation" value="${actorList.movie_actor_nation}">
												</div>
											</div>
										</div>
									</div>
									<div class="actorText">
										<textarea id="actorInfo" name="movie_actor_info"  >${actorList.movie_actor_info}</textarea>
									</div>
								</div>
								<div class="updateDetail-style">
									<input type="hidden" name="movie_actor_code" id="actorCode">
									<button class="w-btn w-btn-gra2 w-btn-gra-anim" type="button" onclick="actorUpdate('${actorList.movie_actor_code}')">수정하기</button>
								</div>
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
