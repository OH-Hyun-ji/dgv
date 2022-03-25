 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Answer Detail</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/png" sizes="192x192"  href="${pageContext.request.contextPath }/resources/images/banana_real.png">
<meta name="viewport" content="width=1024"/>
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/layout.css">
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/myPage.css">
    <link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/movieTheater.css"/>
    <link href="${pageContext.request.contextPath }/resources/css/user/button.css" rel="stylesheet"  />
    <link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/userModule.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css"> 
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>
   	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script> 
	<script type="text/javascript">
	
	</script>
	<style type="text/css">
	#noT{
	    line-height: 46px;
	    text-align: center;
	    font-weight: bolder;
	    width: 90px;
	}
	input#inquiryTitle {
	    height: 25px;
	    border: none;
	    border-bottom: 2px solid #b7b7b794;
	    background-color: #f2f2e6;
	    width: 474px;
	}
	
	input#inquiryUser {
	    height: 25px;
	    border: none;
	    border-bottom: 2px solid #b7b7b794;
	    background-color: #f2f2e6;
	    outline: none;
	}
	textarea#inquiryText {
	    border-color: lightgray;
	    overflow-y: scroll;
	    outline: none;
	}
	.qnaBtn {
	    display: flex;
	    justify-content: end;
	    margin-right: 30px;
	    margin-top: 47px;
	    margin-bottom: 37px;
	}
	.qnaBtn >button:hover {
		background-color: gray;
		color: white;
		border:none;
	}
	h3{
		margin: 0;
	    text-align: inherit;
	    box-sizing: border-box;
	    padding-left: 2rem;
	    background: none;
	    font-weight: bold;
	    border-bottom: 1px solid #808080d4;
	    margin-top: 3rem;
	}
	</style>
</head>
      <body class="">
        <div id="dgvwrap">
        	<jsp:include page="../default/user_header.jsp"></jsp:include>
        
               <!-- Contaniner -->
            <div id="contaniner" class="">
                <!-- Contents Area -->
                <div id="contents" class="">
                    <!-- Contents Start -->
		<div class="myPage-cols-container">
             
                <jsp:include page="../default/user_notice_side.jsp"></jsp:include>
                  <div class="myPage-content-wrap">
                  <div class="button-wrapping">
                  <span class="service-center-text">Answer</span>                 
                    </div>
                    <div class="myPage-table-wrap" >
                  	<span><i class="fas fa-table me-1" style=" margin-right: 1%;"></i>나의문의</span>            
                  	 <table border="1" style="border-color: coral;margin-left: 4%;background-color: #ffffff7d;margin-right: 6%;border-radius: 17px;">                      
                        <tr>
                            <th id="noT">Title</th>
                            <td><input type="text" readonly="readonly" name="dgv_inquiry_user" id="inquiryUser" value="${inquiryVo.dgv_inquiry_title }" style="color: #6c5944;font-weight: 700;background-color: #f0f0e9;text-align: center;border-bottom: 1px solid #8080802e;width: 542px;"  readonly="readonly" ></td>
                        </tr>
                         <tr>
                            <th id="noT" style="position: absolute; box-sizing: border-box;padding-top: 39px;">Text</th>
                            <td><textarea rows="10" cols="65" name="dgv_inquiry_text" id="inquiryText" style="border-color: lightgray;background-color: #f8f8f2; font-weight: bolder;" readonly="readonly" >${inquiryVo.dgv_inquiry_text}</textarea></td>
                        </tr>
                     </table>
                     <div>
                     	<h3 style="font-size: 16px;"><i class="fas fa-table me-1" style=" margin-right: 1%;"></i>관리자 답변</h3>
                     </div>
                     <table  style="border-color: coral;margin-left: 4%;background-color: #f0f0e9a1;margin-right: 6%;border-radius: 17px;margin-top: 2rem;">
                     
                        <tr>
                            <td id="noT">Title</td>
                            <td><input type="text" readonly="readonly" name="dgv_inquiry_user" id="inquiryUser" value="${answerVo.admin_answer_title }" style="color: #6c5944;font-weight: 700;background-color: #ebebe1;text-align: center;border-bottom: 1px solid #8080802e;width: 542px;"  readonly="readonly" ></td>
                        </tr>
                        <tr>
                            <td id="noT">Writer</td>
                            <td><input type="text" name="dgv_inquiry_title" id="inquiryTitle"  value="${answerVo.reg_id }" style="font-weight: 700;background-color: #ebebe1;text-align: center;border-bottom: 1px solid #8080802e;width: 542px;"  readonly="readonly" ></td>
                        </tr>
                         <tr>
                            <td id="noT" style="position: absolute; box-sizing: border-box;  padding-top: 39px;">Text</td>
                            <td> <textarea rows="10" cols="65" name="dgv_inquiry_text" id="inquiryText" style="border-color: lightgray;background-color: #f2f2e6; font-weight: bolder;" readonly="readonly" >${answerVo.admin_answer_text}</textarea></td>
                        </tr>
                    </table>  

                    <div class="qnaBtn">
                    	 <button class="w-btn-outline w-btn-grey-outline qna-button" id="myNoticeBtn" type="button" onclick="location.href='/myQna.do'" >
                      		목록으로
                      </button>
                    </div>               	
                  </div>
                
                  <br><br><br><br><br>
                  <div class="bottom-text-wrap">
                   <span class="bottom-text">DGV 고객센터 : 1234-1234(상담가능 시간, 월~금 12:00~15:00) *이 외 시간은 자동 응답 안내 가능</span>
                  </div>
                  </div>
               </div> 
                </div>
               
            </div>
          
        </div>
    
      <jsp:include page="../default/user_bottom_reserve.jsp"></jsp:include>
        <jsp:include page="../default/user_footer.jsp"></jsp:include>
</body>
</html>