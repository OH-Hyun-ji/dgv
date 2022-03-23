<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/css/admin/styles.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/css/admin/noticeStyle.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath }/resources/css/user/button.css" rel="stylesheet"  />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"	crossorigin="anonymous"></script>
    
    <script type="text/javascript">
   
       // 공지사항 수정
       function updateAction(e){
			const res = confirm("정말로  수정하시겠습니까?");
			const noticeTitle = $("#notice-title").val();
			const noticeText = $("#noticeText").val();
			
			const noticeVo = {
					"notice_num":e,
					"notice_title":noticeTitle,
					"notice_text" :noticeText
			}
			 if(res == true){

				$.ajax({
					method:"POST",
					url:"updateNotice.mdo",
					contentType:"application/json",
					dataType:"json",
					data:JSON.stringify(noticeVo),
					success:function(result){
						if(result.msg=="SUCCESS"){
							alert("수정 완료!")
							location.href="adminNotice.mdo"
						}
					},
					error:function(){
						console.log("통신실패")
					}
				}) //close ajax
			 }
       }
    </script>
</head>
<body class="sb-nav-fixed">
	<div id="layoutSidenav">
	    <jsp:include page="../default/admin_top_menu.jsp" />
		<jsp:include page="../default/admin_side_menu.jsp" />   
		  	<div id="layoutSidenav_content">
            <main>
				<div class="container-fluid px-4">
					<h1 class="mt-4" style="margin: 0.5rem;">공지사항</h1>
					<ol class="breadcrumb mb-4">
					</ol>
					<div class="card mb-4" id="mbId">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 목록							
						</div>
						<div style="display: flex;justify-content: space-between; margin-right: 2%;margin-left: 3%;">
							<div style="box-sizing: border-box; padding-top: 2%;">
								<h4 style="font-size: 36px; font-weight: bold;">Notice Detail</h4>
							</div>						                  
						</div>
						<div class="card-body" id="backBody">
							<div class="notice-total-wrapper">
								<div class="notice-title-wrap">
									<label class="notice-Tlabel">Title</label>
									<label class="notice-textLabel">TextView</label>
								</div>
								<div class="notice-text">
									<input type="text" id="notice-title"  value="${noticeVo.notice_title }">
									<textarea class="notice-textarea" id="noticeText" rows="20" cols="100" >${noticeVo.notice_text }</textarea>
								</div>
							</div>
							<div class="notice-updateBtn">
								<button class="w-btn-outline w-btn-gray-outline id="updateBtn" onclick="updateAction(${noticeVo.notice_num })" >수정하기</button>
							</div>
						</div>
					</div>

				</div>
			</main>
			<jsp:include page="../default/admin_footer.jsp" />
			
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
</body>
</html>