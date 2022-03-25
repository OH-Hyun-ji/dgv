<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DGV Community Board</title>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/board.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<script type="text/javascript">
		
			
			$(function(){	
				$("#writeFinish").click(function(){		
					const communityTitle= $("#writeTitle").val()
					const communityText =$("#writeText").val()
					console.log(communityKind)
					const img1 = $("#thisImg").val();
					var imgArr = img1.split("\\")
					var communityImg = imgArr[imgArr.length-1]
					console.log(communityImg)
					var imgFile = $("#thisImg")[0].files[0];
					
					const vo = {
							"community_title":communityTitle,
							"community_kind":communityKind,
							"community_text":communityText,
							"commuity_img":communityImg
							
					}
					const formData = new FormData()
					formData.append("imgFile",imgFile)
					formData.append("vo",new Blob([JSON.stringify(vo)],{type:"application/json"}));
					
					
					$.ajax({
						method:"POST",
						url:"/communityRegister.do",
						enctype:"multipart/form-data",
						contentType:false,
						processData:false,
						data:formData,
						success:function(result){
							if(result.msg=="SUCCESS"){
								location.href="/board.do"
							}
						},
						error:function(){
							console.log("통신실패")
						}
					})//close ajax
					
					
				})
		
			})
			
	</script>
</head>
<body>
	<div class="dgv_all_container">
		<jsp:include page="../default/user_header.jsp"></jsp:include>
		<div class="sokdak-header">
			<div class="sokdak-sokdak">
				<h1><span class="sokdak-header-title">커뮤니티</span></h1>
				<button class="sokdak-writer" id="writePage"><i class="fas fa-pencil-alt" style="margin-right: 6px;"></i><span class="buttonName" id="writeFinish">작성완료</span></button>
			</div>
			<div class="sokdak-write-wrap">
				<span>REVIEW</span>
			</div>
		</div>
		<div class="sokdak-dgv-total">
			<div class="sokdak-dgv" style="background-color: #fdfdfd;">
				<div class="board-sok-container">
					<div class="sokdak-kind" style="margin: 0;margin-top: 18px;">
						
					</div>
					<div class="sokdak-write-wrapper">												
							<label class="sokdak-writer-title1"><span>영화제목</span></label>																											
						<div class="sokdak-input-title">
							<input class="sokdak-writer-title" id="writeTitle" name="community_title" >
						</div>																									
							<label class="sokdak-writer-text1"><span>내용</span></label>											
						<div class="sokdak-write-textarea">
							<textarea class="sokdak-writer-text" id="writeText" name="community_text" placeholder="최대 5000자"></textarea>						
						</div>
					</div>
				
					<div class="sokdak-submenu-wrap">
						<div class="sokdak-submenu">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../default/user_footer.jsp"></jsp:include>
</body>
</html>