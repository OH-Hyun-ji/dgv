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
                <h1 class="mt-4"><strong>r=공지사항</strong></h1>

                <div class="card mb-4">
                    <div class="card-header">
                        <div class="col three">
                            <div style="font-size: 25px;  font-weight: bold; ">
                                공지사항 등록
                            </div>
                        </div>
                    </div>
                    <table border="1" style="border-color: snow;">
                        <tr>
                            <td style="background-color: lightgray;">약관번호</td>
                            <td> <input type="text" name="productName" id="productName" style="border-color: lightgray;" ></td>
                        </tr>
                        <tr>
                            <td style="background-color: lightgray; ">약관이름</td>
                            <td><input type="text" name="productPrice" id="productPrice"style="border-color: lightgray;"></td>
                        </tr>
                        <tr>
                            <td style="background-color: lightgray;"> 약관 필수여부</td>
                         <td><label><input type="checkbox" name="a-check"> 필수</label> 
                         <label><input type="checkbox" name="b-check">선택</label></td>
                        </tr>
                         <tr>
                            <td style="background-color: lightgray;"> 약관 내용</td>
                            <td> <textarea rows="40" cols="65" name="productImage" id="productImage"style="border-color: lightgray;"></textarea></td>
                        </tr>
                    </table>
                    <div class="bottom">                 
                        <input type="button" value="수정하기">
                        <input type="button" value="등록하기">         
                	</div>  
            	</div>    
            </div>  
        </main>
       </div>
</body>
</html>
