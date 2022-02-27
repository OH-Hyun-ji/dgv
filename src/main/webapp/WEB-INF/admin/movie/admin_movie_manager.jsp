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
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
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
                        <h1 class="mt-4">감독/배우관리</h1>

                        <div class="card mb-4"></div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                감독/배우목록
                            </div>
                            <script>
                                    function adminGroup(){
                                    var popupX =(window.screen.width/2)-(300/2);
                                    var popupY =(window.screen.height/2)-(500/2);
                            
                                    window.open('/adminGroup.mdo','','width=500,height=280,left='+popupX+',top='+popupY+'screenX='+popupX+'.screenY='+popupY);
                                    }
                                </script>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <h2 style="font-weight: bold;"> Movie Group List</h2>
                                        <button class="w-btn-outline w-btn-red-outline" style="margin-top: 1%; box-shadow: none; padding: 10px; width: 13%; left:500; top:400; margin-bottom: 10px; margin-bottom: 1%;" 
                                        type="button" onclick="adminGroup()">
                                            Register
                                        </button>
                                        <tr>
                                            <th>Group Code</th>
                                            <th>Group Name</th>
                                            <th>Writer</th>
                                            <th>Write Date</th>
                                            <th>수정/삭제</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="groupList" items="${groupList}" >
                                        <tr>
                                            <td>${groupList.movie_group_code}</td>
                                            <td>${groupList.movie_group_name}</td>
                                            <td>${groupList.reg_id}</td>
                                            <td>${groupList.reg_date}</td>
                                            <td><button id="delBT"><i class="fas fa-trash-alt"></i></button> <button><i class="fas fa-pencil-alt"></i></button></td>
                                        </tr>
                                        </c:forEach>                            
                                    </tbody>
                                </table>
                            </div>
                            	<!-- 등록 창 띄우기 -->
                            		<script>
                                    function adminActor(){
                                    var popupX =(window.screen.width/2)-(200/2);
                                    var popupY =(window.screen.height/2)-(300/2);
                            
                                    window.open('/adminActor.mdo','','width=500,height=500,left='+popupX+',top='+popupY+'screenX='+popupX+'.screenY='+popupY);
                                    }
                                </script>
                            <div class="card-body-one">
                                <div
                                    class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
                                    <h2 style="font-weight: bold; margin-left: 1%;">Movie Actor List</h2>
                                    <button class="w-btn-outline w-btn-red-outline" style="margin-left: 1%;margin-top: 1%; box-shadow: none; padding: 10px; width: 13%; margin-bottom: 10px;" 
                                     type="button" onclick="adminActor()">
                                        Register
                                    </button>
                                    <div class="dataTable-top">
                                        <div class="dataTable-dropdown">
                                            <label>
                                                <select class="dataPerPage">
                                                    <option value="5">5</option>
                                                    <option value="10">10</option>
                                                    <option value="15">15</option>
                                                    <option value="20">20</option>
                                                    <option value="25">25</option>
                                                </select>
                                                entries per page</label>
                                        </div>
                                        <div class="dataTable-search">
                                            <input class="dataTable-input" placeholder="Search..." type="text">
                                        </div>
                                    </div>
                                    <div class="dataTable-container">
                                        <table id="datatablesSimple" class="dataTable-table">
                                            <thead>
                                               
                                                <tr>
                                                    <th>Actor Code</th>                                                 
                                                    <th>Actor Name</th>
                                                    <th>Actor Birth</th>
                                                    <th>Actor Nation</th>
                                                    <th>Writer</th>
                                                    <th>Writer Date</th>
                                                    <th>수정/삭제</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="actorList" items="${actorList}">
                                                <tr>
                                                    <td>${actorList.movie_actor_code}</td>
                                                    <td>${actorList.movie_actor_name}</td>
                                                    <td>${actorList.movie_actor_birth}</td>
                                                    <td>${actorList.movie_actor_nation}</td>
                                                    <td>${actorList.reg_id}</td>
                                                    <td>${actorList.reg_date}</td>
                                                    <td><button id="delBt"  onclick="deleteAction('${actorList.movie_actor_code}')"><i class="fas fa-trash-alt"></i></button><button ><i class="fas fa-pencil-alt"></i></button></td>
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
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resources/js/admin/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resources/js/admin/datatables-simple-demo.js"></script>
</body>

</html>
