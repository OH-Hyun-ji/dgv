<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Movie List</title>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath }/resources/css/admin/styles.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath }/resources/css/user/button.css" rel="stylesheet"  />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<script>
           function adminTerms(){
                 var popupX =(window.screen.width/2)-(300/2);
                 var popupY =(window.screen.height/2)-(300/2);                            
                 window.open('/movieRegister.mdo','','width=1200,height=700,left='+popupX+',top='+popupY+'screenX='+popupX+'.screenY='+popupY);
            }
    </script>
<style>
#delBT {
	border: none;
	background-color: rgb(255, 255, 255);
	color: red;
	font-weight: bolder;
}
#userLankAdd {
  	width: 11%;
    margin-left: 68%;
    background: linear-gradient(Red -32%, Orange 79%);
    border-radius: 5px;
    color: white;
    font-weight: bold;
    border-color: burlywood;
    height: 42px;
    margin-top: 19px;
    font-size: 23px;
}
}
input#statusContinue {
    background-color: #80808042;
    width: 73px;
    height: 21px;
    border: 1px solid #8080807a;
    border-radius: 4px;
    text-align: center;
}
#statusEnd {
    width: 79px;
    height: 28px;
    padding: 0;
    border-radius: 6px;
}
</style>


</head>

<body class="sb-nav-fixed">
	<div id="layoutSidenav">
		<jsp:include page="../default/admin_top_menu.jsp"></jsp:include>
		<jsp:include page="../default/admin_side_menu.jsp"></jsp:include>
	
	<!--여기서 부터 수정가능!!-->
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">영화관리</h1>

				<div class="card mb-4"></div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 영화등록
					</div>
					<div style="display: inline;">
						<span style="font-size: 24px; font-weight: 800; margin-left: 2%;"><i class="fas fa-table me-1"></i>Movie List</span>
							<button id="userLankAdd" onclick='adminTerms()'>Register</button>
						
					
						
						
					</div>
					<div class="card-body" style="text-align: center;">
						<table id="datatablesSimple" style="text-align: center;">
							<thead>
								<tr>
									<th style="text-align: center;">No</th>
									<th style="text-align: center;">Poster</th>
									<th style="text-align: center;">Genre</th>
									<th style="text-align: center;">Movie Title</th>
									<th style="text-align: center;">Movie Age</th>
									<th style="text-align: center;">Open Date</th>
									<th style="text-align: center;">Status</th>
									<th style="text-align: center;">Delete/Update</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="movieList" items="${movieList }" varStatus="status">
								<tr>
									<td style="box-sizing: border-box; padding-top: 70px;">${movieListCount - status.index}</td>
									<td> <img style="width: 100px;" src="${movieList.movie_img }"></td>
									<td style="box-sizing: border-box; padding-top: 70px;">${movieList.movie_genre }</td>
									<td style="box-sizing: border-box; padding-top: 70px;">${movieList.movie_title}</td>
									<td style="box-sizing: border-box; padding-top: 60px;"><img src="${movieList.age_img}"></td>
									<td style="box-sizing: border-box; padding-top: 70px;">${movieList.movie_open_date}</td>
									<td style="box-sizing: border-box; padding-top: 60px;">
									<c:choose>
												<c:when test="${movieList.movie_status == 'true'}">
													<button id="statusEnd" class="w-btn w-btn-gra3 w-btn-gra-anim" type="button">상영중</button>																	
												</c:when>
												<c:otherwise>
													<input id="statusContinue" type="text" value="상영종료" readonly="readonly">													
												</c:otherwise>											
											</c:choose>
									</td>
 									<td style="box-sizing: border-box; padding-top: 70px;"><button id="deleteMovie"  onclick="deleteMovie'${movieList.movie_num}')"><i class="fas fa-trash-alt"></i></button> <button ><i class="fas fa-pencil-alt"></i></button></td>
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/admin/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/admin/datatables-simple-demo.js"></script>

</body>

</html>
