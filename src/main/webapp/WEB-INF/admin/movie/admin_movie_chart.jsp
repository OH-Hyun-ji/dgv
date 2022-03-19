<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <h1 class="mt-4">매출 통계</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-area me-1"></i>
                                일일 총 매출
                            </div>
                            <div class="card-body"><canvas id="myAreaChart" width="100%" height="30"></canvas></div>
                            <div class="card-footer small text-muted"></div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        장르별 선호도
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="50"></canvas></div>
                                    <div class="card-footer small text-muted"></div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-pie me-1"></i>
                                        영화 선호 순위
                                    </div>
                                    <div class="card-body"><canvas id="myPieChart" width="100%" height="50"></canvas></div>
                                    <div class="card-footer small text-muted"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <c:forEach var="dataList" items="${dataList}" varStatus="status">
   					<input type="hidden" value="${dataList }" id="today${status.index+1}">
   				</c:forEach>
   				
   				<c:forEach var="totalMovieList" items="${totalMovieList }" varStatus="status">
   					<c:if test="${empty totalMovieList.movie_genre_name}">
   						<input type="hidden" value="${0}" id="genre${status.index+1 }">
   					</c:if>
   					<c:if test="${!empty totalMovieList.movie_genre_name }">
	   					<input type="hidden" value="${totalMovieList.movie_genre_name }" id="genre${status.index+1 }">
	   					<input type="hidden" value="${totalMovieList.genre_count }" id="genreCount${status.index+1 }">
   					</c:if>
   				</c:forEach>
			
             	<jsp:include page="../default/admin_footer.jsp" />
            </div>
        </div> 
     <jsp:include page="../default/admin_footer.jsp"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/chart-area-demo.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/chart-bar-demo.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/chart-pie-demo.js"></script>

</body>

</html>