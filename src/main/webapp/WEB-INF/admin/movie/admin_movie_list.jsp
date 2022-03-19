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
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	
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
button#statusEnd {
    background: black;
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
									<td><a href="${movieList.movie_img }"><img style="width: 100px;" src="${movieList.movie_img }"></a></td>
									<td style="box-sizing: border-box; padding-top: 70px;">${movieList.movie_genre }</td>
									<td style="box-sizing: border-box; padding-top: 70px;">${movieList.movie_title}</td>
									<td style="box-sizing: border-box; padding-top: 60px;"><img src="${movieList.age_img}"></td>
									<td style="box-sizing: border-box; padding-top: 70px;">${movieList.movie_open_date}</td>
									<td style="box-sizing: border-box; padding-top: 60px;">									
												<c:if test="${movieList.movie_status == 'true'}">
													<button id="statusContinue" onclick="continueChange(${movieList.movie_num })" class="w-btn w-btn-gra3 w-btn-gra-anim" type="button" value="${movieList.movie_num }" style="width: 112px;">상영중</button>																	
												</c:if >
												<c:if test="${movieList.movie_status == 'false'}">
													<button id="statusEnd" onclick="endChange(${movieList.movie_num })" class="w-btn w-btn-gra3 w-btn-gra-anim" value="${movieList.movie_num }" >상영종료</button>												
												</c:if>
												<c:if test="${movieList.movie_status == 'yet'}">
													<button id="statusYet" onclick="yetChange(${movieList.movie_num })"  class="w-btn w-btn-gra3 w-btn-gra-anim" value="${movieList.movie_num }" type="button" style="background: linear-gradient( 45deg, #2feb4a, #5bf06b, #76ff02, #06a916, #086b09 );color: white">상영예정</button>	
												</c:if>										
									</td>
 									<td style="box-sizing: border-box; padding-top: 70px;"><button id="deleteMovie"  onclick="deleteMovie('${movieList.movie_num}')" value="${movieList.movie_num }" ><i class="fas fa-trash-alt"></i></button> <button ><i class="fas fa-pencil-alt"></i></button></td>
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
	<script type="text/javascript">
			 function deleteMovie(e){
				 const ms = confirm("정말로 삭제하시겠습니까?")
				 if(ms){

					$.ajax({
						method:"POST",
						url:"deleteMovie.mdo",
						contentType:"application/json",
						dataType:"json",
						data:JSON.stringify({"movie_num":e}),
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
			 
		   	 function adminTerms(){
			          var popupX =(window.screen.width/2)-(300/2);
			          var popupY =(window.screen.height/2)-(300/2);                            
			          window.open('/movieRegister.mdo','','width=1200,height=700');
		     }
		   	 
			  function continueChange(e) {
					console.log("ddd : "+ e)						
	       		    
	       		    
	       		    const movieStatus ={
						"movie_status":"false",
						"movie_num":e
					}
	       		    
	       		    console.log("this : " + status)
	       		    $.ajax({
	       			   method:"POST",
	       			   url:"/statusChange.mdo",
	       			   contentType:"application/json",
	       			   dataType:"json",
	       			   data:JSON.stringify(movieStatus),
	       			   success:function(result){
	       				   if(result.msg=="SUCCESS"){
	       					 location.reload()
	       	
	       				   }
	       			   },
	       			   error:function(n){
	       				   console.log("통신 실패 "+n)
	       			   }
	       		   })//close ajax
				}
			  
        		function endChange(e){
        			  const movieStatus ={
      						"movie_status":"yet",
      						"movie_num":e
      					}
      	       		    
      	       		    console.log("this : " + status)
      	       		    $.ajax({
      	       			   method:"POST",
      	       			   url:"/statusChange.mdo",
      	       			   contentType:"application/json",
      	       			   dataType:"json",
      	       			   data:JSON.stringify(movieStatus),
      	       			   success:function(result){
      	       				   if(result.msg=="SUCCESS"){
      	       					 location.reload()
      	       	
      	       				   }
      	       			   },
      	       			   error:function(n){
      	       				   console.log("통신 실패 "+n)
      	       			   }
      	       		   })//close ajax
        		}
        		function yetChange(e){
        			  const movieStatus ={
        						"movie_status":"true",
        						"movie_num":e
        					}
        	       		    
        	       		    console.log("this : " + status)
        	       		    $.ajax({
        	       			   method:"POST",
        	       			   url:"/statusChange.mdo",
        	       			   contentType:"application/json",
        	       			   dataType:"json",
        	       			   data:JSON.stringify(movieStatus),
        	       			   success:function(result){
        	       				   if(result.msg=="SUCCESS"){
        	       					 location.reload()
        	       	
        	       				   }
        	       			   },
        	       			   error:function(n){
        	       				   console.log("통신 실패 "+n)
        	       			   }
        	       		   })//close ajax
        		}	           	                  	 
      
    </script>
</body>
</html>