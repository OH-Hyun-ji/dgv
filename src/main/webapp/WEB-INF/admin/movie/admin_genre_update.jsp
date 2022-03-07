<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Genre Update</title>
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
 <link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' />
 <script src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script> 
 <script type="text/javascript">
    
   
    	function genreUpdate() {
    		alert("정말로 수정하시겠습니까?")
    		
    		const genreVo = {
    			"movie_genre_code":$("#genreCode").val(),
    			"movie_genre_name":$("#genreName").val()
    		}

    			$.ajax({
				method:"POST",
				url:"/genreUpdate.mdo",
				contentType:"application/json",
				dataType:"text",
				data:JSON.stringify(genreVo),
				success:function(result){			
					if(result.msg="SUCCESS"){
			        	alert("수정이 완료되었습니다.♡")
			        	window.opener.location.reload();
						window.close();
					}else {
						alert("수정 실패!!!")
					}
				},
				error:function(e){
					console.log("통신실패" + e)
				}
			});//ajax close
    		
    		
    	
    	}
 </script>
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
</head>
<body style="color: aliceblue;">
    <div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">

				<!-- 여기만 수정해서 사용하세요!! -->
				<h1 class="mt-4" style="background-color: rgba(0,0,0,0.4);">Genre</h1>

				<div class="card mb-4">
				<form action="/genreUpdate.mdo" method="post">
					<div class="card-header">
						<h3>
						Genre Update
                        </h3>
					</div>
					<div class="card-body">
						
							
                            <div id="table-container">
								<table class="type02">
								<input type="hidden" id="genreCode" name="movie_genre_code" value='${genreList.movie_genre_code }'>
									<tr>
										<th scope="row" style="font-size:18px;">Genre name</th>
										<td><input type="text" id="genreName" name="movie_genre_name" value='${genreList.movie_genre_name}' style="border-radius: 7px;line-height: 29px;"/></td>
									</tr>

								</table>
                            </div>
                            <div class="bottomBar">
                                <input type="submit" value="Register" onclick="genreUpdate()" style="margin-left: 10px;"/>
                            </div>
						
					</div>
					</form>
				</div>
				
			</div>
		</main>
	</div>
</html>
