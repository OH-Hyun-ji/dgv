<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Answer Waiting</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/admin/styles.css" rel="stylesheet" />
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>

<style type="text/css">
table.table{
	table-layout:fixed;
	
}

td{
	overflow:hidden;
    white-space:nowrap;
    text-overflow:ellipsis;
}
</style>

<script type="text/javascript">
 	function answerPage(url){
 		console.log("넘어온 값 : "+ url)
 		 var popupX =(window.screen.width/2)-(200/2);
         var popupY =(window.screen.height/2)-(300/2);
 	
      window.open(url,'','width=650,height=700,left='+popupX+',top='+popupY+'screenX='+popupX+'.screenY='+popupY);
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
					<h1 class="mt-4" style="font-size: 1.5rem;">게시글 관리</h1>
					<div class="card mb-4">
						<div class="card-header" >
							<i class="fas fa-table me-1"></i> 고객문의(답변대기)목록
								</div>
								<div class="card-body">
									<table class="table">
										<thead>
											<tr>
												<th>No</th>
												<th>Category</th>
												<th>Title</th>
												<th>Text</th>
												<th>Writer</th>
												<th>Date</th>
												<th>Action</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach var="inquiryList" items="${inquiryList}">
											<tr>
												<td>${inquiryList.dgv_inquiry_code}</td>
												<td>${inquiryList.dgv_inquiry_tag}</td>
												<td>${inquiryList.dgv_inquiry_title}</td>
												<td>${inquiryList.dgv_inquiry_text}</td>
												<td>${inquiryList.dgv_inquiry_user}</td>
												<td>${inquiryList.dgv_inquiry_date}</td>
												<td><input type="button" id="answer" onclick="answerPage('/answerRegister.mdo?dgv_inquiry_code=${inquiryList.dgv_inquiry_code}')" value="답변하기"/></td>
											</tr>	
										</c:forEach>										
										</tbody>
									</table>
								</div>
							</div>
						</div>
			</main>
			<jsp:include page="../default/admin_footer.jsp"/>
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">by DGV © DGV COMPANY</div>

					</div>
				</div>
			</footer>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
</body>
</html>