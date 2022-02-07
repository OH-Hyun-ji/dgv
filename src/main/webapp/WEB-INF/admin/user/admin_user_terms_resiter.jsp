<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Term Register</title>
</head>
<body>
	<!-- Main -->
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">

				<!-- 여기만 수정해서 사용 -->
				<h1 class="mt-4">약관관리</h1>

				<div class="card mb-4">
					<div class="card-header">
						<div class="col three">
							<div style="font-size: 25px; color: #ff8818; font-weight: bold;">
								약관 등록</div>
						</div>
					</div>
					<div class="card-body">
						<form action="updateTerms.mdo" method="POST">
							<table class="type02">
								<tr>
									<th scope="row">약관번호</th>
									<td><input type="text" id="inpupu" name="terms_serial"
										readonly="readonly" value="" /></td>

								</tr>
								<tr>

									<th scope="row">약관이름</th>
									<td><input type="text" id="inpupu" class="*"
										name="terms_id" value="" /></td>
								</tr>
								<tr>
									<th scope="row">약관 필수여부</th>
									<td><input type="text" id="inpupu"
										name="terms_agree_status" readonly="readonly" value="" /></td>
								</tr>
								<tr>
									<th scope="row">약관내용</th>
									<td><textarea rows="30" name="terms_content"></textarea></td>
								</tr>

							</table>
							<br>
							<div style="margin-left: 10px">
								<input type="submit" value="등록" /> <input type="button"
									value="목록" onclick="location.href='terms_agreeList.mdo'" />
							</div>

						</form>
					</div>
				</div>
				<!-- 여기만 수정해서 사용하세요!! -->
			</div>
		</main>
</body>
</html>
