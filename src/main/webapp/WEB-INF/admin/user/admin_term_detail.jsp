<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Term Detail</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		const checkedBox = $("#TermResult").val()
		console.log(checkedBox)
		if( checkedBox == 'true'){
			$('#termStatusT').prop('checked',true);
		}else{
			$('#termStatusF').prop('checked',true);
		}
		
	})
	
	function checkStatus(n){
		const check = document.getElementsByName("term_status")
		
		for(let i =0;i<check.length;i++){
			if(check[i] != n){
				check[i].checked=false;
			}
		}
		
	}
	function TermUpdateCheck(e){
		const ms = confirm("수정하시겠습니까?")
		const termName = $("#termTitle").val()
		const termStatus = $("input[name=term_status]:checked").val()
		const termText = $("#termText").val()
		console.log("termStatus : "+termStatus )
		
		const termVo = {
			"term_num":e,
			"term_name":termName,
			"term_text":termText,
			"term_status":termStatus
		}
		
		if(ms){
			$.ajax({
				method:"POST",
				url:"termUpdate.mdo",
				contentType:"application/json",
				dataType:"json",
				data:JSON.stringify(termVo),
				success:function(result){
					if(result.msg=="SUCCESS"){
						alert("수정 성공")
						window.opener.location.reload()
						window.close()
					}
				},
				error:function(){
					console.log("통신 실패 ")
				}
			})//ajax close
		}else{
			
		}
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
input#termTitle {
    width: 480px;
    outline: none;
    border: 0;
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
                                Term Detail
                            </div>
                        </div>
                    </div>
                    
                    <table border="1" style="border-color: coral;margin-left: 4%;">                      
                        <tr>
                            <td style="background-color: lightgray; ">Term Title</td>
                            <td><input type="text" id="termTitle" name="term_name" style="border-color: lightgray;" value="${termVo.term_name }"></td>
                        </tr>
                        <tr>
                            <td style="background-color: lightgray; ">Term Status</td>
                            <td>
	                            <input type="checkbox" name="term_status" onclick="checkStatus(this)" id="termStatusT" value="true">활성
	                            <input type="checkbox" name="term_status" onclick="checkStatus(this)" id="termStatusF" value="false" >비활성
	                            <input type="hidden"  id="TermResult" value="${termVo.term_status}">
                            </td>
                        </tr>
             
                         <tr>
                            <td style="background-color: lightgray;">Term Text</td>
                            <td> <textarea rows="30" cols="65" name="term_text" id="termText" style="border-color: lightgray;">${termVo.term_text }</textarea></td>
                        </tr>
                    </table>
                    <div class="bottom" style="text-align-last: center;">                 
                        <input type="button" onclick="TermUpdateCheck(${termVo.term_num})" value="수정하기">         
                	</div>  
            	</div>    
            </div>  
        </main>
       </div>
</body>
</html>
