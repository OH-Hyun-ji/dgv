<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/png" sizes="192x192"  href="${pageContext.request.contextPath }/resources/images/banana_real.png">
<meta charset="UTF-8">
<title>내가 본 영화</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/layout.css">
  <link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/myPage.css">
  <link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/movieTheater.css"/>
  <link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/userModule.css"/>
  <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css" />
  <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user_myPage_userMovie.css" />
  <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
  <style type="text/css">
  	div#menu {
	    float: none;
	    margin: 0;
	    padding: 3px;
	}
	ul#pageInfo {
	    display: flex;
	    justify-content: center;
	    margin-top: 1rem;
	    margin-left: 6rem;
	}
	li.pageInfo_btn {
	    margin-right: 1rem;
	    font-size: 18px;
	}
	.nav {
	    padding: 6px 0;
	}
  </style>
</head>

<body class="block">
<jsp:include page="../default/user_header.jsp"></jsp:include>
  <!--본격 콘텐츠-->
  <div id="contaniner" style="height: 1200px" class="">
    <!-- Contents Area -->
    <div id="contents" class="">
      <!-- Contents Start -->
      <div id="dev2014">
        <div class="cols-content" style="width: auto;">
          <div class="col-aside">
            <div class="box-round-dgray">
              <div class="box-round-inner">
                <div class="inner-contents-profile">
                  <div class="box-image">
                    <div class="thumb-image">
                      <img src="${userImg}" style="border: 2px solid #cecece; border-radius: 41px;box-sizing: border-box;"onerror="this.src='${pageContext.request.contextPath }/resources/images/default_profile.gif';">
                      <span class="profile-mask"></span>
                    </div>
                  </div>
                  <div class="box-contents">
                  <div class="user-name-style">
                    <strong>${userID } 님</strong>
          		  </div>
                    <em></em>
                  </div>
                </div>
              </div>
            </div>
           <jsp:include page="../default/user_myPage_side.jsp"></jsp:include>
          </div>

          <div class="col-detail">
            <div class="movielog-detail-wrap">
              <!-- Title & Button Combo -->
              <form id="form1" method="get" novalidate="novalidate">
                <div class="tit-mycgv">
                  <h3>내가 본 영화</h3>
                  <p><em id="count-em-style">${myMovieListCount}건</em></p>
                </div>
              </form>
              <!-- 내가 본 영화 리스트 -->
              <div class="sect-movielog-lst">
           		  <c:forEach var="myMovieList" items="${myMovieList}">
	                <ul id="watched_list_container">
	                  <li class="movie_info_82012">
	                    <div class="article-movie-info">
	                      <div class="box-image">
	                        <a id="phototicket_popup_82012" title="포스터 크게 보기" href="#">
	                          <span class="thumb-image"> 
	                            <img src="${myMovieList.movie_img }" >
	                            <span class="ico-grade grade-12">${myMovieList.age_name }</span>
	                            <i></i>
	                          </span>
	                        </a>
	                      </div>
	                      <div class="box-contents">
	                        <div class="title">
	                          <a href="#">
	                            <strong id="strong_82012">${myMovieList.movie_title }</strong>
	                          </a>
	                          <p>${myMovieList.movie_title_en }</p>
	                        </div>
	                        <p class="date">${myMovieList.reserve_date }</p>
	                        <p class="theater">${myMovieList.region_name} ${myMovieList.theater_name } / ${myMovieList.total_people} 명</p>
	                      </div>
	                     
	                    </div>
	                  </li>
	                  
	                </ul>
                </c:forEach>
                	<div class="page-info-wrap">
								<div class="page-info-area">
									<ul id="pageInfo" class="pageInfo">
										<c:if test="${pageMake.prev}">
											<li class="pageInfo-btn previous"><a
												href="${pageMake.startPage-1}">Previous</a></li>
										</c:if>
										<c:forEach var="num" begin="${pageMake.startPage}"
											end="${pageMake.endPage}">
											<li class="pageInfo_btn ${pageMake.page.pageNum == num ? "active":""}"><a
												href="/myPage_userMovie.do?pageNum=${num }&amount=${pageMake.page.amount }">${num}</a></li>
										</c:forEach>
										<c:if test="${pageMake.next}">
											<li class="pageInfo_btn next"><a
												href="${pageMake.endPage + 1}">Next</a></li>
										</c:if>
									</ul>
								</div>
							</div>
              </div>

            </div>

          </div>
        </div>
      </div>
    </div>
  </div>
  <jsp:include page="../default/user_footer.jsp"></jsp:include>
</body>
</html>