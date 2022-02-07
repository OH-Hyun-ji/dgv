<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin User Rank Register</title>
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <style>
        .mt-4{
            text-align: center;
        }
        body{
            background-image: url('images/6.png');
            background-size: contain;
            
        }
        h3{
            font-size: 25px;
            color: #504d4a;
            font-weight: bold;
            padding-left: 10%;
            background-color: lightgray;
        }
        .bottomBar{
            margin-top: 10%;
            display: flex;
            justify-content: space-evenly
        }
        .bottomBar>input{
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
						<h3>
						등급 등록
                        </h3>
					</div>
					<div class="card-body">
						<form action="#" method="POST" >
                            <div id="table-container">
								<table class="type02">
									<tr>
										<th scope="row">등급 이름</th>
										<td><input type="text" name="user_membership_name" /></td>
									</tr>
									<tr>
										<th scope="row" >등급 적립률</th>
										<td><input type="text" name="user_membership_point_rate" /></td>
									</tr>	
									<tr>
										<th scope="row">등급 전월실적</th>
										<td><input type="text" name="user_membership_performance"/></td>
									</tr>

								</table>
                            </div>
                            <div class="bottomBar">
                                <input type="submit" value="등록하기"  style="margin-left: 10px"/>
                                <input type="button" value="목록보기" onclick="location.href='#'"/>
                            </div>
						</form>
					</div>
				</div>
				<!-- 여기만 수정해서 사용하세요!! -->
			</div>
		</main>
	</div>
</body>
</html>
