<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
<title>Admin Group SMS</title>
<script type="text/javascript">
	$(function(){
		
		$(document).ready(function(){
			
			document.getElementById("smsUser").value = opener.document.getElementById("userPhoneList").value; 
		})
		
	
		$("#sendSMS").click(function(){
			const smsUser = $("#smsUser").val()
			const smsTitle = $("#smsTitle").val()
			const smsText = $("#smsText").val()	
			console.log("smsUser : "+smsUser)
			console.log("smsTitle : "+smsTitle)
			console.log("smsText : "+smsText)
			
			
			const smsVo = {
				"sms_user":smsUser,
				"sms_title":smsTitle,
				"sms_text":smsText
			}
			
			$.ajax({
				method:"POST",
				url:"groupSMS.mdo",
				contentType:"application/json",
				dataType:"json",
				data:JSON.stringify(smsVo),
				success:function(result){
					if(result.msg =="SUCCESS"){
						alert("문자전송완료!!")
					//	location.reload();
					}
				},
				error:function(){
					console.log("통신실패")
				}
			})//ajax close
			
		})
		
	});


</script>
</head>
<body>
	<!-- Main -->                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
	<div id="layoutSidenav_content">
		<main>			
            <div class="container-fluid px-4">
                <!-- 여기만 수정해서 사용 -->
                <h1 class="mt-4"><strong>Group SMS</strong></h1>
                <div class="card mb-4">
                    <div class="card-header">
                        <div class="col three">
                            <div style="font-size: 25px;  font-weight: bold; ">
                                단체 문자
                            </div>
                        </div>
                    </div>
                    <table border="1" style="border-color: snow;">               
                        <tr>
                            <td style="background-color: lightgray; ">보낼 회원들</td>
                            <td><input type="text" id="smsUser"   style="border-color: lightgray;"></td>
                        </tr>
                        <tr>
                            <td style="background-color: lightgray;"> 보낼문자 제목</td>
                         	<td><input type="text"  id="smsTitle" style="border-color: lightgray;"></td>
                        </tr>
                         <tr>
                            <td style="background-color: lightgray;"> 보낼문자 내용</td>
                            <td> <textarea rows="30" cols="65" name="smsText" id="smsText" style="border-color: lightgray;"></textarea></td>
                        </tr>
                    </table>
                    <div class="bottom">                 
                        <input type="button" id="sendSMS" value="전송">         
                	</div>  
            	</div>    
            </div>  
        </main>
       </div>
</body>
</html>
