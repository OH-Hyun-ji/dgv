<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Term</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>
<script type="text/javascript">

		function termNameCheck(e){
			alert("dfdf")
			console.log("this  : " +$("#termTitle"+e).val())
			var id = $(this).attr('id')				
			console.log("bodt id : " +id )
			var test;
			
			
			$(".termTR").empty()
			$(".thisTd").remove()
			$(".otherTd").empty()
			
			$.ajax({
				method:"POST",
				url:"termCheck.do",
				contentType:"application/json",
				dataType:"json",
				data:JSON.stringify({"term_num":e}),
				success:function(result){
				
					var termText = JSON.parse(result)
					test = this;
				
					console.log("termText : " + termText.term_text)
						const tr1 = $("<tr>")
								.attr("id","tr" + termText.term_num)
								.attr("class", "termTR")
						const td =$("<td>")
								.attr("id","termTd"+termText.term_num)
								.attr("class","thisTd")
						const td1 =$("<td>")
								.attr("class","otherTd")
						
								
						const textarea =$("<textarea>")
									.attr("id","termText")
									.text(termText.term_text)
						td.append(textarea)
						tr1.append(td1)
						$("#tr"+termText.term_num).append(td)
					$("#term-table").append(tr1)
						
					
				},
				error:function(f){
					console.log("통신 실패 : "+ f)
				}
			})//close ajax
			
		}
		function termCheck(){
			opener.document.getElementById("userRealCheck").value =document.getElementById("agree").value
 
			console.log( document.getElementById("agree").value)
			window.close()
		}

</script>
<style>
textarea#termText {
    width: 470px;
    height: 34rem;
}
button[type="button"] {
	    border: 0;
	    background-color: lightgrey;
	    font-weight: 900;
	    font-size: 18px;
}
table {
    border-color: #656567;
}
td {
    background-color: lightgray;
    width: 100px;
    text-align-last: center;
}

button.termTitle {
    width: 413px;
    height: 30px;
}
.term-check {
    font-size: 20px;
    margin-bottom: 1%;
    margin-left: 2%;
    margin-top: 5%;
}
textarea#noticeText {
    overflow-y: scroll;
    border-color: lightgray;
}
.bottom {
    display: flex;
    justify-content: end;
    margin-right: 3rem;
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
                            <div class="term-check" >
                                약관동의확인란
                            </div>
                        </div>
                    </div>          
                    <table border="1" id="term-table">      
                    	<c:forEach var="termList" items="${termList}" varStatus="status">
	                        <tr id="tr${termList.term_num}">
	                            <td>약관동의</td>
	                            <td>
	                            	<button type="button"  class="termTitle" id="termTitle${termList.term_num}" onclick="termNameCheck(${termList.term_num})" value="${termList.term_num}">${termList.term_name}</button>
	                            </td>
	                        </tr>
                        </c:forEach>                         
                    </table>
                    <div class="bottom" >     
                    	<input type="hidden" id="agree" value="true">            
                        <input type="button"  onclick="termCheck()" value="약관동의하기">         
                	</div>  
            	</div>    
            </div>  
        </main>
       </div>
</body>
</html>
