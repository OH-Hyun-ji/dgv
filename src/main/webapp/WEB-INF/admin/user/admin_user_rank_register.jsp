<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Admin User Rank Register</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#rankRegister").click(function(){
				alert("!!!!")
				const rankName = $("#rankName").val()
				const rankEarn = $("#rankEarn").val()
				const rankStandard =$("#rankStandard").val()
				const rankImg = $("#rankImg").val()
				const imgFile = $("#rankImg")[0].files[0];
				
				const imgArr = rankImg.split("\\")
				let ImgName = imgArr[imgArr.length-1]
				
				const formData = new FormData();
				
				formData.append("imgFile",imgFile)
				
				const formJson={
					"rank_name":rankName,
					"rank_earn" :rankEarn,
					"rank_standard":rankStandard,
				}
				
				formData.append('rankVo', new Blob([JSON.stringify(formJson)], {type:"application/json"}));
				
				$.ajax({
					method:"POST",
					url:"/insertRank.mdo",
					enctype:"multipart/form-data",
					processData:false,
					data:formData,
					contentType:false,
					success:function(result){
						if(result.msg=="SUCCESS"){
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
				})//ajax close
				
			})
		});
	</script>
	
	<style>
	.mt-4 {
		text-align: center;
	}
	
	body {
		background-image: url('images/6.png');
		background-size: contain;
	}
	
	h3 {
		font-size: 25px;
		color: #504d4a;
		font-weight: bold;
		padding-left: 10%;
		background-color: lightgray;
	}
	
	.bottomBar {
		margin-top: 10%;
		display: flex;
		justify-content: space-evenly
	}
	
	.bottomBar>input {
		background-color: rgb(252, 192, 143);
		height: 45px;
		width: 25%;
	}
	
	#table-container {
		padding-left: 15%;
	}
	</style>
	</head>
	<body>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
	
					<!-- 여기만 수정해서 사용하세요!! -->
					<h1 class="mt-4">등급</h1>
	
					<div class="card mb-4">
						<div class="card-header">
							<h3>등급 등록</h3>
						</div>
						<div class="card-body">
							<div id="table-container">
								<table class="type02">
									<tr>
										<th scope="row">등급 이름</th>
										<td><input type="text" name="rank_name" id="rankName" /></td>
									</tr>
									<tr>
										<th scope="row">등급 적립률</th>
										<td><input type="text" name="rank_earn" id="rankEarn" /></td>
									</tr>
									<tr>
										<th scope="row">등급 전월실적</th>
										<td><input type="text" name="rank_standard" id="rankStandard" /></td>
									</tr>
									<tr>
										<th scope="row">등급 이미지</th>
										<td><input type="file" name="rank_img" id="rankImg" /></td>
									</tr>
	
								</table>
							</div>
							<div class="bottomBar">
								<input type="button" value="register" id="rankRegister" style="margin-left: 10px" />
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</body>
	</html>
