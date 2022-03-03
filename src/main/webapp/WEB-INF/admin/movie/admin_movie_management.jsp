<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Genre, MovieAge Management</title>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath }/resources/css/user/button.css" rel="stylesheet"  />
	<link href="${pageContext.request.contextPath }/resources/css/admin/styles.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>  
	
	 <script>
        function adminGenre(){
        var popupX =(window.screen.width/2)-(300/2);
        var popupY =(window.screen.height/2)-(500/2);
                            
       window.open('/adminGenre.mdo','','width=500,height=280,left='+popupX+',top='+popupY+'screenX='+popupX+'.screenY='+popupY);
  		}
        
        function adminAge(){
            var popupX =(window.screen.width/2)-(200/2);
            var popupY =(window.screen.height/2)-(300/2);
    
            window.open('/adminAge.mdo','','width=500,height=280,left='+popupX+',top='+popupY+'screenX='+popupX+'.screenY='+popupY);
            }
        
        function deleteAge(ageCode){
        	let result = confirm("정말 삭제하시겠습니까??");
			console.log(ageCode)
		if(result == true){
		
			$.ajax({
				method:"POST",
				url:"deleteAge.mdo",
				contentType:"application/json",
				dataType:"json",
				data:JSON.stringify({"movie_age_num":ageCode}),
				success:function(num){					
					if(num.msg=="SUCCESS"){
						alert("삭제완료")
						location.replace("/adminManageMent.mdo");
					}else{
						alert('삭제를 다시 진행해주세요')
					}
				},
				error:function(){
					
					console.log("통신실패")
					}
				
				});//ajax close 

			}	
        }
        
        function deleteGenre(genreCode){
			let result = confirm("정말 삭제하시겠습니까??");
				console.log(genreCode)
			if(result == true){				
				$.ajax({
					method:"POST",
					url:"deleteGenre.mdo",
					contentType:"application/json",
					dataType:"json",
					data:JSON.stringify({"movie_genre_code":genreCode}),
					success:function(num){	
						if(num.msg=="SUCCESS"){
							alert("삭제완료")
							location.replace("/adminManageMent.mdo");
						}else{
							alert('삭제를 다시 진행해주세요')
						}
					},
					error:function(){
						console.log("통신실패")
					}
				});//ajax close 
	
			}
		}	
        
        
     </script>	

<style>

#userLankAdd {
	width: 11%;
	margin-top: 17px;
	margin-left: 88%;
	height: 43px;
	background-color: #f1eeee;
	border-color: #f1eeee;
	box-shadow: 0px 0px 20px #000;
	border-radius: 2px;
	font-weight: bold;
}
</style>
<body class="sb-nav-fixed">
	<div id="layoutSidenav">
		<jsp:include page="../default/admin_top_menu.jsp"></jsp:include>
		<jsp:include page="../default/admin_side_menu.jsp"></jsp:include>
  			 <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">장르/연령관리</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                장르/연령 목록
                            </div>                           
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <h2 style="font-weight: bold;"> Genre List</h2>
                                        <button class="w-btn-outline w-btn-red-outline" style="margin-top: 1%; box-shadow: none; padding: 10px; width: 13%; left:500; top:400; margin-bottom: 10px; margin-bottom: 1%;" 
                                        type="button" onclick="adminGenre()">
                                            Register
                                        </button>
                                        <tr>
                                            <th>Genre Code</th>
                                            <th>Genre Name</th>
                                            <th>Writer</th>
                                            <th>Write Date</th>
                                            <th>삭제/수정</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="genreList" items="${genreList}"  varStatus="status">
                                        <tr>
                                            <td>${genreListCount-status.index}</td>
                                            <td>${genreList.movie_genre_name}</td>
                                            <td>${genreList.reg_id}</td>
                                            <td>${genreList.reg_date}</td>
                                            <td><button id="delBt"  onclick="deleteGenre('${genreList.movie_genre_code}')"><i class="fas fa-trash-alt"></i></button> <button ><i class="fas fa-pencil-alt"></i></button></td>
                                        </tr>
                                        </c:forEach>                            
                                    </tbody>
                                </table>
                            </div>

                            <div class="card-body-one">
                                <div
                                    class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
                                    <h2 style="font-weight: bold; margin-left: 1%;">MovieAge List</h2>
                                    <button class="w-btn-outline w-btn-red-outline" style="margin-left: 1%;margin-top: 1%; box-shadow: none; padding: 10px; width: 13%; margin-bottom: 10px;" 
                                     type="button" onclick="adminAge()">
                                        Register
                                    </button>
                                   
                                    <div class="dataTable-container" style="overflow-y: scroll; height: 500px;">
                                        <table id="datatablesSimple" class="dataTable-table">
                                            <thead>
                                               
                                                <tr>
                                                    <th data-sortable="" style="width: 14.3831%;">Age Num</th>                                                 
                                                    <th data-sortable="" style="width: 14.7551%;">Age Name</th>
                                                    <th data-sortable="" style="width: 12.67948%;">Age Img</th>
                                                    <th data-sortable="" style="width: 20.0273%;">삭제/수정</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="ageList" items="${ageList }" varStatus="status">
                                                <tr>
                                                    <td>${ageListCount - status.index}</td>
                                                    <td>${ageList.movie_age_name}</td>
                                                    <td>${ageList.movie_age_img}</td>
                                                    <td>${ageList.reg_id}</td>
                                                    <td>${ageList.reg_date}</td>
                                                   <td><button id="delBT" onclick="deleteAge('${ageList.movie_age_num}')"><i class="fas fa-trash-alt"></i></button> <button><i class="fas fa-pencil-alt"></i></button></td>
                                                </tr>
                                            </c:forEach>                                              
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="dataTable-bottom">
                                        <nav class="dataTable-pagination">
                                            <ul class="dataTable-pagination-list"></ul>
                                        </nav>
                                    </div>
                                </div>

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
