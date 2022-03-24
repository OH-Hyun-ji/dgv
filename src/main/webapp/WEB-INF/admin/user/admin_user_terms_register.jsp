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
<title>Admin Term Register</title>
<script type="text/javascript">
	$(function(){

		$("#register").click(function(){
			
			$("input:checkbox[name=checkBox]:checked").each(function(){
				const termName = $("#termName").val()	
				const checkVal = $(this).val();
				const termText = $("#termText").val()
				
				const termVO = {
					"term_name":termName,
					"term_status":checkVal,
					"term_text":termText
				}
				
				$.ajax({
					method:"POST",
					url:"/termInsert.mdo",
					contentType:"application/json",
					dataType:"json",
					data:JSON.stringify(termVO),
					success:function(result){
						if(result.msg=="SUCCESS"){
							alert("약관 등록 완료");
							window.opener.location.reload();
							window.close()
						}else{
							alert("등록실패!! 다시 등록해주세요!!")
						}					
					},
					error:function(){
						console.log("통신오류")
					}
				});//ajax close
			});
			
			
			
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
                <h1 class="mt-4"><strong>약관관리</strong></h1>

                <div class="card mb-4">
                    <div class="card-header">
                        <div class="col three">
                            <div style="font-size: 25px;  font-weight: bold; ">
                                약관 등록
                            </div>
                        </div>
                    </div>
                    <table border="1" style="border-color: snow;">
                
                        <tr>
                            <td style="background-color: lightgray; ">약관이름</td>
                            <td><input type="text" name="term_name" id="termName" style="border-color: lightgray;"></td>
                        </tr>
                        <tr>
                            <td style="background-color: lightgray;"> 약관 필수여부</td>
                         <td><label><input type="checkbox" name="checkBox" value="true">TRUE</label> 
                         <label><input type="checkbox" name="checkBox" value="false">FALSE</label></td>
                        </tr>
                         <tr>
                            <td style="background-color: lightgray;"> 약관 내용</td>
                            <td> <textarea rows="30" cols="65" name="term_text" id="termText" style="border-color: lightgray;"></textarea></td>
                        </tr>
                    </table>
                    <div class="bottom">                 
                        <input type="button" id="register" value="등록하기">         
                	</div>  
            	</div>    
            </div>  
        </main>
       </div>
</body>
</html>
