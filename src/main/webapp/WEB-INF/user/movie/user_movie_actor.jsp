<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  
  <title>배우</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script> 
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
    crossorigin="anonymous"></script>
  <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user_movie_actor.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css">

</head>
<body class="block">
<jsp:include page="../default/user_header.jsp"></jsp:include>
  <!--본격 콘텐츠-->
  <div id="contaniner" style="height: 1800px" class="">
    <!-- Contents Area -->
		<div id="contents" class="">
      <!-- 실컨텐츠 시작 -->
      <div class="tit-heading-wrap">
        <h3>인물</h3>
      </div>
      <div class="wrap-people" style="padding-top:20px;">
        <div class="sect-base-people">
          <div class="sect-base">
            <h3>
              <strong>${actorVo.movie_actor_name}</strong>
              기본정보
            </h3>
            <div class="box-image">
              <a href="${actorVo.movie_actor_img }" target="_blank">
                <span class="thumb-image">
                  <img src="${actorVo.movie_actor_img }" alt="${actorVo.movie_actor_name}" >
                </span>
              </a>
            </div>
            <div class="box-contents">
              <div class="title">
                <strong>${actorVo.movie_actor_name}</strong>
                <p>${actorVo.movie_actor_ename}</p>
              </div>
              <div class="spec">
                <dl>
                  <dt>출생</dt><dd>${actorVo.movie_actor_birth}</dd>
                  <dt>국적</dt><dd>${actorVo.movie_actor_nation}</dd>
                  <dt>직업</dt><dd>${actorVo.movie_group_name}</dd>
                </dl>
              </div>
            </div>
          </div>
        </div>
        <!-- .sect-base-people -->
        <div class="sect-story-people">
          <strong>바이오그래피</strong>
          <p>
          	${actorVo.movie_actor_info}
          </p>
        </div>
        <!-- .sect-story-people -->
        <div class="cols-content">
          <div class="col-detail">
            <!-- 선택한 li 에 class="on" 을넣는다 -->
            <ul class="tab-menu">
              <li class="on">
                <a href="#" onclick="return false;" title="선택">
                  필모그래피
                </a>
              </li>
              <li class="last">
                <a href="#">
                  포토갤러리
                </a>
              </li>
            </ul>
            <div class="sect-movielist-filmo">
              <ul>
              <c:forEach var="movieList" items="${movieList}">
                <li>
                  <div class="box-image">
                    <a href="#">
                      <span class="thumb-image">
                        <img src="${movieList.movie_img}" alt="${movieList.movie_title}">
                        <span class="ico-grade grade${movieList.age_name}">${movieList.age_name} 이상</span>
                      </span>
                    </a>
                  </div>
                  <div class="box-contents">
                    <a href="">
                      <strong>
                        ${movieList.movie_title}
                        <span>${movieList.movie_open_date}    </span>
                      </strong>
                    </a>
                  </div>
                </li>
                </c:forEach>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <jsp:include page="../default/user_footer.jsp"></jsp:include>
</body>

</html>