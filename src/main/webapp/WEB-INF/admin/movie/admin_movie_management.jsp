<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Genre, MovieAge Management</title>
	<link
		href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath }/resources/css/user/button.css" rel="stylesheet"  />
	<link
		href="${pageContext.request.contextPath }/resources/css/admin/styles.css" rel="stylesheet" />
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>

<style>
#delBT {
	border: none;
	background-color: rgb(255, 255, 255);
	color: red;
	font-weight: bolder;
}
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

                        <div class="card mb-4"></div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                장르/연령 목록
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <h2 style="font-weight: bold;"> Genre List</h2>
                                        <button class="w-btn-outline w-btn-red-outline" style="margin-top: 1%; box-shadow: none; padding: 10px; width: 13%; margin-bottom: 10px;" margin-bottom: 1%; type="button">
                                            Register
                                        </button>
                                        <tr>
                                            <th></th>
                                            <th>ID</th>
                                            <th>이름</th>
                                            <th>핸드폰번호</th>
                                            <th>회원등급</th>
                                            <th>마지막로그인</th>
                                            <th>상태</th>
                                            <th>수정/삭제</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Tiger Nixon</td>
                                            <td>System Architect</td>
                                            <td>Edinburgh</td>
                                            <td>61</td>
                                            <td>2011/04/25</td>
                                            <td>$320,800</td>
                                            <td>
                                                <select>
                                                    <option>탈퇴</option>
                                                    <option>활성</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Garrett Winters</td>
                                            <td>Accountant</td>
                                            <td>Tokyo</td>
                                            <td>63</td>
                                            <td>2011/07/25</td>
                                            <td>$170,750</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="card-body-one">
                                <div
                                    class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns"style=" margin-top: 10%;">
                                    <h2 style="font-weight: bold; margin-left: 1%;">MovieAge List</h2>
                                    <button class="w-btn-outline w-btn-red-outline" style="margin-left: 1%;margin-top: 1%; box-shadow: none; padding: 10px; width: 13%; margin-bottom: 10px;" type="button">
                                        Register
                                    </button>
                                    <div class="dataTable-top">
                                        <div class="dataTable-dropdown">
                                            <label>
                                                <select class="dataTable-selector">
                                                    <option value="5">5</option>
                                                    <option value="10" selected="">10</option>
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
                                                    <th data-sortable="" style="width: 14.3831%;">
                                                        <a href="#" class="dataTable-sorter">번호</a>
                                                    </th>
                                                    <th data-sortable="" style="width: 15.4371%;">
                                                        <a href="#" class="dataTable-sorter">ID</a>
                                                    </th>
                                                    <th data-sortable="" style="width: 10.3534%;">
                                                        <a href="#" class="dataTable-sorter">이름</a>
                                                    </th>
                                                    <th data-sortable="" style="width: 13.0192%;">
                                                        <a href="#" class="dataTable-sorter">핸드폰번호</a>
                                                    </th>
                                                    <th data-sortable="" style="width: 11.3453%;">
                                                        <a href="#" class="dataTable-sorter">회원등급</a>
                                                    </th>
                                                    <th data-sortable="" style="width: 14.7551%;">
                                                        <a href="#" class="dataTable-sorter">마지막로그인</a>
                                                    </th>
                                                    <th data-sortable="" style="width: 8.67948%;">
                                                        <a href="#" class="dataTable-sorter">상태</a>
                                                    </th>
                                                    <th data-sortable="" style="width: 12.0273%;">
                                                        <a href="#" class="dataTable-sorter">수정/삭제</a>
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>Tiger Nixon</td>
                                                    <td>System Architect</td>
                                                    <td>Edinburgh</td>
                                                    <td>61</td>
                                                    <td>2011/04/25</td>
                                                    <td>$320,800</td>
                                                    <td>
                                                        <select>
                                                            <option>탈퇴</option>
                                                            <option>활성</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Garrett Winters</td>
                                                    <td>Accountant</td>
                                                    <td>Tokyo</td>
                                                    <td>63</td>
                                                    <td>2011/07/25</td>
                                                    <td>$170,750</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="dataTable-bottom">
                                        <div class="dataTable-info">Showing 1 to 2 of 2 entries</div>
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
