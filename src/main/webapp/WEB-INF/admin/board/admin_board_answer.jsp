<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Answer Register</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
<script type="text/javascript">

const waitInfo = {
	"dgv_inquiry_code" : "${user.dgv_inquiry_code}"
}
	function answerCheck(){
		
		const answerT = $("#answerTitle").val();
		const answerV =$("#answerText").val();
		const userId = $("#userId").val();
		const regId =$("#regId").val();
		
		const answerVo ={
				"admin_answer_title":answerT,
				"admin_answer_text":answerV,
				"reg_id":regId,
				"dgv_inquiry_user":userId,
				"wait_code":waitInfo.dgv_inquiry_code
		}
		
		$.ajax({
			method:"POST",
			url:"insertAnswer.mdo",
			contentType:"application/json",
			dataType:"json",
			data:JSON.stringify(answerVo),
			success:function(result){
				const res = JSON.parse(result)
				if(res.msg == "SUCCESS"){
					alert('등록 성공')
					window.opener.location.reload();
					window.close();
				}else{
					alert('등록 실패')
				}
			},
			error:function(){
				console.log("통신 실패")
			}
		});//ajax close
	}
</script>
<style>
	input[type="button"] {
    font-size: 22px;
    border-radius: 8px;
    width: 34%;
    height: 50px;
    margin-top: 1%;
}
</style>
</head>
<body>
	<!-- Main -->
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">
					<strong>Notice</strong>
				</h1>
				<div class="card mb-4">
					<div class="card-header">
						<div class="col three">
							<div style="font-size: 25px; font-weight: bold;">Answer</div>
						</div>
					</div>
					<input type="hidden" id="regId" name="reg_id" value="${adminID}">
					<table border="1" style="border-color: snow;">
						<tr>
							<td style="background-color: lightgray;">User Id</td>
							<td><input type="text" name="dgv_inquiry_user" id="userId" value="${user.dgv_inquiry_user}"
								style="border-color: lightgray;"></td>
						</tr>
						<tr>
							<td style="background-color: lightgray;">Inquiry Text</td>
							<td><textarea rows="15" cols="65" style="border-color: lightgray;">${user.dgv_inquiry_text}
								</textarea>
							</td>
						</tr>
						<tr>
							<td style="background-color: lightgray;">Answer Title</td>
							<td><input type="text" name="admin_answer_title" id="answerTitle"
								style="border-color: lightgray;"></td>
						</tr>
						<tr>
							<td style="background-color: lightgray;">Answer Text</td>
							<td><textarea rows="15" cols="65" name="admin_answer_text"
									id="answerText" style="border-color: lightgray;"></textarea></td>
						</tr>
					</table>
					<div class="bottom" style="text-align-last: center;">
						<input type="button" onclick="answerCheck()" value="등록하기">
					</div>
				</div>
			</div>
		</main>
	</div>
</body>
</html>