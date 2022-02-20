<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/css/admin/styles.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<div id="layoutSidenav">
	    <jsp:include page="../default/admin_top_menu.jsp" />
		<jsp:include page="../default/admin_side_menu.jsp" />   
		  	<div id="layoutSidenav_content">
            <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">매출관리</h1>
                <ol class="breadcrumb mb-4">
                </ol>
                <div class="card mb-4">
                    <div class="card-header">
                        베스트영화
                    </div>
                </div>
                <div class="card mb-4">
                    <div class="card-body">
                        <i class="fas fa-table me-1"></i>
                        목록
                    </div>
                    <div class="card-body">
                        <table class="table">
                            <thead>
                                <tr>

                                    <th>순위</th>
                                    <th>영화제목</th>
                                    <th>예매횟수</th>
                                    <th>총판매금액</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>사고</td>
                                    <td>2022-02-09</td>
                                    <td>3,000,00000원</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>사고</td>
                                    <td>2022-02-09</td>
                                    <td>30</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>사고</td>
                                    <td>2022-02-09</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>사고</td>
                                    <td>2022-02-09</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>사고</td>
                                    <td>2022-02-09</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>사고</td>
                                    <td>2022-02-09</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>사고</td>
                                    <td>2022-02-09</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>사고</td>
                                    <td>2022-02-09</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>사고</td>
                                    <td>2022-02-09</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>사고</td>
                                    <td>2022-02-09</td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
    </main>
   <jsp:include page="../default/admin_footer.jsp"/>
        <div class="container-fluid px-4">
            <div class="d-flex align-items-center justify-content-between small">
                <div class="text-muted">by DGV © DGV COMPANY</div>
            </div>
        </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="js/datatables-simple-demo.js"></script>
</body>

</html>