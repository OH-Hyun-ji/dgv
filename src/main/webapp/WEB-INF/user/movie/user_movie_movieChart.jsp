<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/button.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/movieChart.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css">    
    <link href="https://fonts.googleapis.com/css2?family=Dongle:wght@700&display=swap" rel="stylesheet">
 	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
  
</head>
<script type="text/javascript">
	function reservePage(movieNum){
		var form = document.createElement('form');
		var objs;
		objs =document.createElement('input')
		objs.setAttribute('type','text')
		objs.setAttribute('name','movie_num')
		objs.setAttribute('value',movieNum)
		form.appendChild(objs)
		form.setAttribute('method','post')
		form.setAttribute('action','/movieReserve.do')
		document.body.appendChild(form)
		form.submit()	
	}
</script>
<body class="block">
<jsp:include page="../default/user_header.jsp"></jsp:include>
    <!--본격 콘텐츠-->
    <div id="contaniner" class="">
        <!-- Contents Area -->
		<div id="contents" class="">
            <div class="wrap-movie-chart">
                <div class="tit-heading-wrap">
                    <h3 style="margin-top: 1%;">영화목록</h3>
                    <div class="submenu">
                        <ul>
                            <li class="on">
                                <a href="movieChart.do" title="선택">무비차트</a>
                            </li>
                            <li>
                                <a href="#">상영예정작</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="sect-movie-chart">
                    <h4 class="hidden">무비목록 - 예매율순</h4>
                    <ol>
                    	<c:forEach var="movieList" items="${movieList}" varStatus="status">
                        <li>
                        <input type="hidden" id="movieNum" value="${movieList.movie_num }">
                            <div class="box-image">
                                <strong class="rank">No.${status.index+1}</strong>
                                <a href="/movieDetail.do?movie_num=${movieList.movie_num}">
                                    <span class="thumb-image">
                                        <img src="${movieList.movie_img}" >
                                        <span class="ico-grade grade-12">${movieList.age_name }</span>
                                    </span>
                                </a>
                            </div>
                            <div class="box-contents">
                                <a href="/movieDetail.do?movie_num="${movieList.movie_num}">
                                    <strong class="title">${movieList.movie_title}</strong>
                                </a>
                                <div class="score">
                                    <strong class="percent">예매율
                                        <span>21.4%</span>
                                    </strong>
                                </div>
                                <span class="txt-info">
                                    <strong>${movieList.movie_open_date}
                                        <span>개봉</span>
                                    </strong>
                                </span>
	                               <span class="like" style=" text-align-last: center;">
										<button class="w-btn w-btn-gra3 w-btn-gra-anim"style="padding: 9px 8px; box-shadow: none;" onclick="reservePage(${movieList.movie_num})">예매하기</button>
                                </span>
                            </div>
                            
                        </li>
                        
                        </c:forEach>                 
                    </ol>
                </div>
            </div>
        </div>
    </div>
   <jsp:include page="../default/user_footer.jsp"></jsp:include>
</body>
</html>