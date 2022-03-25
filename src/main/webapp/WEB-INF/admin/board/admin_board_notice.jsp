<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/png" sizes="192x192"  href="${pageContext.request.contextPath }/resources/images/banana_real.png">
<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/css/admin/styles.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath }/resources/css/user/button.css" rel="stylesheet"  />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"	crossorigin="anonymous"></script>
    
    <script>
       function adminNotice(){
             var popupX =(window.screen.width/2)-(200/2);
             var popupY =(window.screen.height/2)-(300/2);
                            
             window.open('/adminNoticeRegister.mdo','','width=650,height=850,left='+popupX+',top='+popupY+'screenX='+popupX+'.screenY='+popupY);
		}
 
       // 공지사항 삭제
       function deleteAction(e){
    	   console.log("내가찍은코드pk : "+ e)
			const res = confirm("정말로 삭제하시겠습니까?");
			 if(res == true){

				$.ajax({
					method:"POST",
					url:"deleteNotice.mdo",
					contentType:"application/json",
					dataType:"json",
					data:JSON.stringify({"notice_num":e}),
					success:function(result){
						if(result.msg=="SUCCESS"){
							alert("삭제 완료!")
							location.reload()
						}
					},
					error:function(){
						console.log("통신실패")
					}
				}) //close ajax
			 }
       }
    </script>
    <style type="text/css">
    	a.notice-detail {
		    color: black;
		    text-decoration: none;
		}
    </style>
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
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 목록							
						</div>
						<div style="display: flex;justify-content: space-between; margin-right: 2%;margin-left: 3%;">
							<div style="box-sizing: border-box; padding-top: 2%;">
								<h4 style="font-size: 36px; font-weight: bold;">Notice</h4>
							</div>						
							<button class="w-btn-outline w-btn-red-outline" style="margin-left: 1%;margin-top: 1%; box-shadow: none; padding: 10px; width: 13%; margin-bottom: 10px;" 
                                     type="button" onclick="adminNotice()">
                                        Register
                            </button>                          
						</div>
						<div class="card-body">
							<table class="table">
								<thead>
									<tr>
										<th>No</th>
										<th>Notice Title</th>
										<th>Notice Text</th>
										<th>Writer</th>
										<th>Date</th>
										<th>Count</th>
										<th>Delete</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="noticeList" items="${noticeList}">
									<tr>
										<td>${noticeList.notice_num }</td>
										<td><a class="notice-detail" href="/adminNoticeDetail.mdo?notice_num=${noticeList.notice_num }">${noticeList.notice_title }</a></td>
										<td><a class="notice-detail" href="/adminNoticeDetail.mdo?notice_num=${noticeList.notice_num }">${noticeList.notice_text }</a></td>
										<td>${noticeList.reg_id }</td>
										<td>${noticeList.reg_date }</td>
										<td>${noticeList.notice_count }</td>
										<td>
											<button id="delBt" onclick="deleteAction(${noticeList.notice_num })"><i class="fas fa-trash-alt"></i></button>
										</td>
									</tr>
								</c:forEach>	
								</tbody>
							</table>
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