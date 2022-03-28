<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/png" sizes="192x192"  href="${pageContext.request.contextPath }/resources/images/banana_real.png">
<title>Admin Genre Register</title>
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
   
    <style>
        .mt-4{
            text-align: center;
        }
        body{
        	background-image:url("./../../../resources/images/adminBackground01.png");
            background-size: contain;
            
        }
        h3{
        	font-size: 25px;
		    color: lightgray;
		    font-weight: bold;
		    padding-left: 10%;
		    background-color: rgba(0,0,0,0.4);
		}
        .bottomBar{
            margin-top: 5%;
            display: flex;
            justify-content: space-evenly
        }
        .bottomBar>input{
            background-color: lightgray;
            height: 45px;
            width: 25%;
            border-radius: 13px;
        }
        
       #table-container {
            padding-left: 15%;
        }
    </style>
      <link rel='stylesheet'
    href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' />
<script
	src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
    <script type="text/javascript">
    
   
    	function genreCheck() {
    
			$.ajax({
				method:"POST",
				url:"/adminInsertGenre.mdo",
				contentType:"application/json",
				dataType:"text",
				data:"{\"movie_genre_name\":\""+ $("#genreName").val()+"\"}",
				success:function(result){
					const resultT = JSON.parse(result);
					console.log(resultT);
					if(resultT.isSuccess){
		        	alert("등록이 완료되었습니다.♡")
		        	window.opener.location.reload();
					window.close();
					}else {
						alert("등록 실패!!!")
					}
				},
				error:function(e){
					console.log("통신실패" + e)
				}
			});//ajax close
				
			
		}
    </script>
       
	
</head>
<body style="color: aliceblue;">
    <div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">

				<!-- 여기만 수정해서 사용하세요!! -->
				<h1 class="mt-4" style="background-color: rgba(0,0,0,0.4);">Genre</h1>

				<div class="card mb-4">
					<div class="card-header">
						<h3>
						Genre Register
                        </h3>
					</div>
					<div class="card-body">
						
							
                            <div id="table-container">
								<table class="type02">
									<tr>
										<th scope="row" style="font-size:18px;">Genre name</th>
										<td><input type="text" id="genreName" name="movie_genre_name" style="border-radius: 7px;line-height: 29px;"/></td>
									</tr>

								</table>
                            </div>
                            <div class="bottomBar">
                                <input type="submit" value="Register" onclick="genreCheck()" style="margin-left: 10px;"/>
                            </div>
						
					</div>
				</div>
				<!-- 여기만 수정해서 사용하세요!! -->
			</div>
		</main>
	</div>
</html>
