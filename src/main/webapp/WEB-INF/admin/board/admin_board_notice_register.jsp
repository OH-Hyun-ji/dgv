<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Notice Register</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function noticeCheck(){
		const regId = $("#regId").val();
		const noticeT = $("#noticeTitle").val();
		const noticeV = $("#noticeText").val();
		
		console.log(noticeV)
		$.ajax({
			method:"POST",
			url:"/InsertNotice.mdo",
			contentType:"application/json",
			dataType:"json",
			data:JSON.stringify({"reg_id":regId,"notice_title":noticeT,"notice_text": noticeV}),
			success:function(result){
				const res = JSON.parse(result);
				if(res.msg == "SUCCESS"){
					alert("등록 성공 ");
					window.opener.location.reload();
					window.close();
				}else{
					alert("등록실패");
				}
			},
			error:function(){
				console.log("통신실패 ");
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

                <!-- 여기만 수정해서 사용 -->
              
                <div class="card mb-4">
                    <div class="card-header">
                        <div class="col three">
                            <div style="font-size: 42px;font-weight: bold;margin-bottom: 11%;margin-left: 2%;margin-top: 5%;">
                                Notice
                            </div>
                        </div>
                    </div>
                    <input type="hidden" id="regId" name="reg_id" value="${adminID}">
                    <table border="1" style="border-color: coral;margin-left: 4%;">                      
                        <tr>
                            <td style="background-color: lightgray; ">Notice Title</td>
                            <td><input type="text" name="notice_title" id="noticeTitle"style="border-color: lightgray;"></td>
                        </tr>
             
                         <tr>
                            <td style="background-color: lightgray;">Notice Text</td>
                            <td> <textarea rows="30" cols="65" name="notice_text" id="noticeText" style="border-color: lightgray;"></textarea></td>
                        </tr>
                    </table>
                    <div class="bottom" style="text-align-last: center;">                 
                        <input type="button" onclick="noticeCheck()" value="등록하기">         
                	</div>  
            	</div>    
            </div>  
        </main>
       </div>
</body>
</html>
