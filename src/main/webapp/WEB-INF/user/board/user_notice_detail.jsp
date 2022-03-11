 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Notice Detail</title>
<meta charset="UTF-8">
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
	
		$(document).ready(function(){
			toastr.options = {
 					  "closeButton": true,
 					  "debug": false,
 					  "newestOnTop": false,
 					  "progressBar": true,
 					  "positionClass": "toast-top-right",
 					  "preventDuplicates": true,
 					  "onclick": null,
 					  "showDuration": "300",
 					  "hideDuration": "1000",
 					  "timeOut": "5000",
 					  "extendedTimeOut": "1000",
 					  "showEasing": "swing",
 					  "hideEasing": "linear",
 					  "showMethod": "fadeIn",
 					  "hideMethod": "fadeOut"
 					}
			
			$("#myNoticeBtn").click(function(){
				location.href="/notice.do";
				
			});
		});
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
	}
	textarea#inquiryText {
	    border-color: lightgray;
	    overflow-y: scroll;
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
	</style>
</head>
      <body class="">
        <div id="cgvwrap">
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
                  <span class="service-center-text">Notice View</span>                 
                    </div>
                    <div class="myPage-table-wrap" >
                  	<span><i class="fas fa-table me-1" style=" margin-right: 1%;"></i>문의작성</span>
                  	<form action="/qnaInsert.do" method="post" name="QnaSendForm">
                  	 <table border="1" style="border-color: coral;margin-left: 4%;">                      
                          <tr>
                            <td id="noT">Title</td>
                            <td><input type="text" readonly="readonly" name="dgv_inquiry_user" id="inquiryUser" value="${noticeVo.notice_title }" style="color: #6c5944; font-weight: 700; border-color: lightgray; text-align: center;"  readonly="readonly" ></td>
                        </tr>
                        <tr>
                            <td id="noT">Writer</td>
                            <td><input type="text" name="dgv_inquiry_title" id="inquiryTitle"  value="${noticeVo.reg_id }" style="color: #6c5944; font-weight: 700; border-color: lightgray;padding-left: 60px;"  readonly="readonly" ></td>
                        </tr>
                         <tr>
                            <td id="noT" style="position: absolute; box-sizing: border-box;  padding-top: 120px;">Text</td>
                            <td> <textarea rows="20" cols="65" name="dgv_inquiry_text" id="inquiryText" style="border-color: lightgray;background-color: #f2f2e6; font-weight: bolder;" readonly="readonly" >${noticeVo.notice_text}</textarea></td>
                        </tr>
                    </table>  
                    </form>  
                    <div class="qnaBtn">
                    	 <button class="w-btn-outline w-btn-grey-outline qna-button" id="myNoticeBtn" type="button" >
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