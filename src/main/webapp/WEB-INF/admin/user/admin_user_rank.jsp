<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin User List</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath }/resources/css/admin/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <style>
            #delBT{
                border:none;
                background-color: rgb(255, 255, 255);
                color: red;
                font-weight: bolder;
            }
            #userLankAdd{
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

    </head>

    <body class="sb-nav-fixed">
        <div id="layoutSidenav">
        	<jsp:include page="../default/admin_top_menu.jsp"></jsp:include>
			<jsp:include page="../default/admin_side_menu.jsp"></jsp:include>
	            <div id="layoutSidenav_content">
	                <main>
	                    <div class="container-fluid px-4">
	                        <h1 class="mt-4">등급관리</h1>
	                        
	                        <div class="card mb-4">
	                        
	                        </div>
	                        <div class="card mb-4">
	                            <div class="card-header" >
	                                <i class="fas fa-table me-1"></i>
	                               등급목록
	                            </div>
	                            <div>
	                                <button id="userLankAdd" onclick="window.open('/userRankRegister.mdo','window_name','width=430,height=300,scrollbars=yes');">회원등급추가</button>
	                            </div>
	                            <div class="card-body">
	                                <table id="datatablesSimple">
	                                    <thead>
	                                        <tr>
	                                            <th>번호</th>
	                                            <th>등급종류</th>
	                                            <th>등급적립률</th>
	                                            <th>등급 전월실적조건</th>
	                                            <th></th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                        <tr>
	                                            <td>Tiger Nixon</td>
	                                            <td>System Architect</td>
	                                            <td>Edinburgh</td>
	                                            <td>61</td>
	                                            <td><button id="delBT" ><i class="fas fa-times"></i></button></td>                                           
	                                        </tr>
	                                        <tr>
	                                            <td>Garrett Winters</td>
	                                            <td>Accountant</td>
	                                            <td>Tokyo</td>
	                                            <td>63</td>
	                                            <td><button id="delBT"><i class="fas fa-times"></i></button></td>    
	                                        </tr>
	                                        <tr>
	                                            <td>Ashton Cox</td>
	                                            <td>Junior Technical Author</td>
	                                            <td>San Francisco</td>
	                                            <td>66</td>
	                                            <td><button id="delBT"><i class="fas fa-times"></i></button></td>        
	                                        </tr>
	                                        <tr>
	                                            <td>Ashton Cox</td>
	                                            <td>Junior Technical Author</td>
	                                            <td>San Francisco</td>
	                                            <td>66</td>
	                                            <td></td>    
	                                        </tr>
	                                        <tr>
	                                            <td>Ashton Cox</td>
	                                            <td>Junior Technical Author</td>
	                                            <td>San Francisco</td>
	                                            <td>66</td>
	                                            <td></td>    
	                                        </tr>
	                                        <tr>
	                                            <td>Ashton Cox</td>
	                                            <td>Junior Technical Author</td>
	                                            <td>San Francisco</td>
	                                            <td>66</td>
	                                            <td></td>    
	                                        </tr>
	                                        <tr>
	                                            <td>Ashton Cox</td>
	                                            <td>Junior Technical Author</td>
	                                            <td>San Francisco</td>
	                                            <td>66</td>
	                                            <td></td>    
	                                        </tr>
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
        <script src="${pageContext.request.contextPath }/resources/js/admin/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath }/resources/js/admin/datatables-simple-demo.js"></script>
    
    </body>

</html>
