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
	function answerCheck(){
		
	}
</script>
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
							<td><input type="text" name="notice_title" id="noticeTitle"
								style="border-color: lightgray;"></td>
						</tr>
						<tr>
							<td style="background-color: lightgray;">Answer Title</td>
							<td><input type="text" name="notice_title" id="noticeTitle"
								style="border-color: lightgray;"></td>
						</tr>
						<tr>
							<td style="background-color: lightgray;">Answer Text</td>
							<td><textarea rows="40" cols="65" name="notice_text"
									id="noticeText" style="border-color: lightgray;"></textarea></td>
						</tr>
					</table>
					<div class="bottom">
						<input type="button" onclick="answerCheck()" value="등록하기">
					</div>
				</div>
			</div>
		</main>
	</div>
</body>
</html>