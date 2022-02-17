<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="${pageContext.request.contextPath}/resources/css/admin/styles.css" rel="stylesheet">
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
                        <div class="card-body"style="background-color: #a1a1a1; height: 100%;font-size: 30px; font-weight: bold;padding-top: 1%;padding-bottom: 1%;">                      
                            매출통계관리
                        </div>
                    </div>
                    <div class="container1">
                        <form method="post" id="form1">
                            <div class="row" style="flex-wrap: nowrap; margin-top:1%">
                                <div class="col-lg-6" style="float:left">
                                    <div class="card mb-4">
                                        <div class="card-header" style="background:#FF6384;">
                                            <svg class="svg-inline--fa fa-chart-bar fa-w-16 me-1" aria-hidden="true"
                                                focusable="false" data-prefix="fas" data-icon="chart-bar" role="img"
                                                xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"
                                                data-fa-i2svg="">
                                                <path fill="currentColor"
                                                    d="M332.8 320h38.4c6.4 0 12.8-6.4 12.8-12.8V172.8c0-6.4-6.4-12.8-12.8-12.8h-38.4c-6.4 0-12.8 6.4-12.8 12.8v134.4c0 6.4 6.4 12.8 12.8 12.8zm96 0h38.4c6.4 0 12.8-6.4 12.8-12.8V76.8c0-6.4-6.4-12.8-12.8-12.8h-38.4c-6.4 0-12.8 6.4-12.8 12.8v230.4c0 6.4 6.4 12.8 12.8 12.8zm-288 0h38.4c6.4 0 12.8-6.4 12.8-12.8v-70.4c0-6.4-6.4-12.8-12.8-12.8h-38.4c-6.4 0-12.8 6.4-12.8 12.8v70.4c0 6.4 6.4 12.8 12.8 12.8zm96 0h38.4c6.4 0 12.8-6.4 12.8-12.8V108.8c0-6.4-6.4-12.8-12.8-12.8h-38.4c-6.4 0-12.8 6.4-12.8 12.8v198.4c0 6.4 6.4 12.8 12.8 12.8zM496 384H64V80c0-8.84-7.16-16-16-16H16C7.16 64 0 71.16 0 80v336c0 17.67 14.33 32 32 32h464c8.84 0 16-7.16 16-16v-32c0-8.84-7.16-16-16-16z">
                                                </path>
                                            </svg>
                                            <!-- <i class="fas fa-chart-bar me-1"></i> Font Awesome fontawesome.com -->
                                            일별 매출 관리
                                        </div>
                                        <div class="card-body" style="height: 353px;">
                                            <div style="text-align: center;">
                                                <div class="chartjs-size-monitor">
                                                    <div class="chartjs-size-monitor-expand">
                                                        <div class=""></div>
                                                    </div>
                                                    <div class="chartjs-size-monitor-shrink">
                                                        <div class=""></div>
                                                    </div>
                                                </div><canvas id="myBarChart1" width="543" height="181"
                                                    style="display: block; width: 543px; height: 181px;"
                                                    class="chartjs-render-monitor"></canvas>

                                            </div>
                                            <div align="center">

                                            </div>
                                        </div>
                                    </div>
                                </div>


                                &nbsp;&nbsp;&nbsp;
                                <form method="post" id="form2">
                                    <div class="col-lg-6">
                                        <div class="card mb-4" style="width: 98%;height: 99%;">
                                            <div class="card-header" style="background:#660099; color:white">
                                                <svg class="svg-inline--fa fa-chart-bar fa-w-16 me-1" aria-hidden="true"
                                                    focusable="false" data-prefix="fas" data-icon="chart-bar" role="img"
                                                    xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"
                                                    data-fa-i2svg="">
                                                    <path fill="currentColor"
                                                        d="M332.8 320h38.4c6.4 0 12.8-6.4 12.8-12.8V172.8c0-6.4-6.4-12.8-12.8-12.8h-38.4c-6.4 0-12.8 6.4-12.8 12.8v134.4c0 6.4 6.4 12.8 12.8 12.8zm96 0h38.4c6.4 0 12.8-6.4 12.8-12.8V76.8c0-6.4-6.4-12.8-12.8-12.8h-38.4c-6.4 0-12.8 6.4-12.8 12.8v230.4c0 6.4 6.4 12.8 12.8 12.8zm-288 0h38.4c6.4 0 12.8-6.4 12.8-12.8v-70.4c0-6.4-6.4-12.8-12.8-12.8h-38.4c-6.4 0-12.8 6.4-12.8 12.8v70.4c0 6.4 6.4 12.8 12.8 12.8zm96 0h38.4c6.4 0 12.8-6.4 12.8-12.8V108.8c0-6.4-6.4-12.8-12.8-12.8h-38.4c-6.4 0-12.8 6.4-12.8 12.8v198.4c0 6.4 6.4 12.8 12.8 12.8zM496 384H64V80c0-8.84-7.16-16-16-16H16C7.16 64 0 71.16 0 80v336c0 17.67 14.33 32 32 32h464c8.84 0 16-7.16 16-16v-32c0-8.84-7.16-16-16-16z">
                                                    </path>
                                                </svg>
                                                <!-- <i class="fas fa-chart-bar me-1"></i> Font Awesome fontawesome.com -->
                                                월별 매출 관리
                                            </div>
                                            <div class="card-body" style="height: 352px;">
                                                <div style="text-align: center;">
                                                    <div class="chartjs-size-monitor">
                                                        <div class="chartjs-size-monitor-expand">
                                                            <div class=""></div>
                                                        </div>
                                                        <div class="chartjs-size-monitor-shrink">
                                                            <div class=""></div>
                                                        </div>
                                                    </div><canvas id="myBarChart2" width="543" height="181"
                                                        style="display: block; width: 543px; height: 181px;"
                                                        class="chartjs-render-monitor"></canvas>
                                                </div>
                                                <div align="center">

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </form>
                    </div>
                    <div class="con1" style="display: flex; margin-top: 7%;">
                        <div class="col-lg-6">
                            <div class="card mb-4" style="width: 98%; height: 148%; ">
                                <div class="card-header">
                                    <svg class="svg-inline--fa fa-chart-pie fa-w-17 me-1" aria-hidden="true"
                                        focusable="false" data-prefix="fas" data-icon="chart-pie" role="img"
                                        xmlns="http://www.w3.org/2000/svg" viewBox="0 0 544 512" data-fa-i2svg="">
                                        <path fill="currentColor"
                                            d="M527.79 288H290.5l158.03 158.03c6.04 6.04 15.98 6.53 22.19.68 38.7-36.46 65.32-85.61 73.13-140.86 1.34-9.46-6.51-17.85-16.06-17.85zm-15.83-64.8C503.72 103.74 408.26 8.28 288.8.04 279.68-.59 272 7.1 272 16.24V240h223.77c9.14 0 16.82-7.68 16.19-16.8zM224 288V50.71c0-9.55-8.39-17.4-17.84-16.06C86.99 51.49-4.1 155.6.14 280.37 4.5 408.51 114.83 513.59 243.03 511.98c50.4-.63 96.97-16.87 135.26-44.03 7.9-5.6 8.42-17.23 1.57-24.08L224 288z">
                                        </path>
                                    </svg><!-- <i class="fas fa-chart-pie me-1"></i> Font Awesome fontawesome.com -->
                                    일별 매출 차트
                                </div>
                                <div class="card-body">
                                    <div class="chartjs-size-monitor">
                                        <div class="chartjs-size-monitor-expand">
                                            <div class=""></div>
                                        </div>
                                        <div class="chartjs-size-monitor-shrink">
                                            <div class=""></div>
                                        </div>
                                    </div><canvas id="myPieChart" width="543" height="135"
                                        style="display: block; width: 543px; height: 135px;"
                                        class="chartjs-render-monitor"></canvas>
                                </div>
                               
                            </div>
                        </div>
                        <div class="col-lg-7">
                            <div class="card mb-5"style="width: 83%; height: 148%; margin-left: 3%;">
                                <div class="card-header">
                                    <svg class="svg-inline--fa fa-chart-pie fa-w-17 me-1" aria-hidden="true"
                                        focusable="false" data-prefix="fas" data-icon="chart-pie" role="img"
                                        xmlns="http://www.w3.org/2000/svg" viewBox="0 0 544 512" data-fa-i2svg="">
                                        <path fill="currentColor"
                                            d="M527.79 288H290.5l158.03 158.03c6.04 6.04 15.98 6.53 22.19.68 38.7-36.46 65.32-85.61 73.13-140.86 1.34-9.46-6.51-17.85-16.06-17.85zm-15.83-64.8C503.72 103.74 408.26 8.28 288.8.04 279.68-.59 272 7.1 272 16.24V240h223.77c9.14 0 16.82-7.68 16.19-16.8zM224 288V50.71c0-9.55-8.39-17.4-17.84-16.06C86.99 51.49-4.1 155.6.14 280.37 4.5 408.51 114.83 513.59 243.03 511.98c50.4-.63 96.97-16.87 135.26-44.03 7.9-5.6 8.42-17.23 1.57-24.08L224 288z">
                                        </path>
                                    </svg><!-- <i class="fas fa-chart-pie me-1"></i> Font Awesome fontawesome.com -->
                                    월별 매출 차트
                                </div>
                                <div class="card-body">
                                    <div class="chartjs-size-monitor">
                                        <div class="chartjs-size-monitor-expand">
                                            <div class=""></div>
                                        </div>
                                        <div class="chartjs-size-monitor-shrink">
                                            <div class=""></div>
                                        </div>
                                    </div>
                                    <canvas id="OneChart" width="543" height="135"
                                        style="display: block; width: 543px; height: 135px;"
                                        class="chartjs-render-monitor"></canvas>

                                  
                                </div>
                            </div>
                        </div>
                    </div>
                    &nbsp;&nbsp;&nbsp;
                    <div class="col-lg-7">
                        
                    </div>
                </div>
            </main>
        </div>
    </div>

     <jsp:include page="../default/admin_footer.jsp"/>
        <div class="container-fluid px-4">
            <div class="d-flex align-items-center justify-content-between small">
                <div class="text-muted">by DGV © DGV COMPANY</div>      
            </div>
        </div>
    </footer>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="assets/demo/chart-area-demo.js"></script>
    <script src="assets/demo/chart-bar-demo.js"></script>
    <script src="assets/demo/chart-pie-demo.js"></script>
    <div class="col-lg-6">


        <!-- Code injected by live-server -->
        

    </div>
</body>

</html>