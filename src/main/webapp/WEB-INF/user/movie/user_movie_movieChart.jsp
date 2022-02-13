<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/movieChart.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css">    
    <link href="https://fonts.googleapis.com/css2?family=Dongle:wght@700&display=swap" rel="stylesheet">
 	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
  
</head>
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
                <!--
                <div class="sect-sorting">
                    <div class="nowshow">
                        <input type="checkbox" id="chk_nowshow">
                        <label for="chk_nowshow">현재 상영작만 보기</label>
                    </div>
                    <label for="order_type" class="hidden">정렬</label>
                    <select id="order_type" name="order-type">
                        <option title="현재 선택됨" selected="" value="1">예매율순</option>
                        <option value="2">평점순</option>
                        <option value="3">관람객순</option>
                    </select>
                    <button type="button" class="round gray">
                        <span>GO</span>
                    </button>
                </div>
                -->
                <div class="sect-movie-chart">
                    <h4 class="hidden">무비차트 - 예매율순</h4>
                    <ol>
                        <li>
                            <div class="box-image">
                                <strong class="rank">No.1</strong>
                                <a href="#">
                                    <span class="thumb-image">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85561/85561_320.jpg" alt="해적-도깨비 깃발 포스터" onerror="errorImage(this)">
                                        <span class="ico-grade grade-12">12세 이상</span>
                                    </span>
                                </a>
                            </div>
                            <div class="box-contents">
                                <a href="/movies/detail-view/?midx=85561">
                                    <strong class="title">해적-도깨비 깃발</strong>
                                </a>
                                <div class="score">
                                    <strong class="percent">예매율
                                        <span>21.4%</span>
                                    </strong>
                                </div>
                                <span class="txt-info">
                                    <strong>2022.01.26
                                        <span>개봉</span>
                                    </strong>
                                </span>
                                <span class="like">
                                    <a class="link-reservation" href="#">예매</a>
                                </span>
                            </div>
                        </li>
                        <li>
                            <div class="box-image">
                                <strong class="rank">No.2</strong>
                                <a href="#">
                                    <span class="thumb-image">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000084/84945/84945_320.jpg" alt="듄 포스터" onerror="errorImage(this)">
                                        <span class="ico-grade grade-12">12세 이상</span>
                                    </span>
                                </a>
                            </div>
                            <div class="box-contents">
                                <a href="/movies/detail-view/?midx=85561">
                                    <strong class="title">듄</strong>
                                </a>
                                <div class="score">
                                    <strong class="percent">예매율
                                        <span>16.1%</span>
                                    </strong>
                                </div>
                                <span class="txt-info">
                                    <strong>2022.02.09
                                        <span>재개봉</span>
                                    </strong>
                                </span>
                                <span class="like">
                                    <a class="link-reservation" href="#">예매</a>
                                </span>
                            </div>
                        </li>
                        <li>
                            <div class="box-image">
                                <strong class="rank">No.3</strong>
                                <a href="#">
                                    <span class="thumb-image">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85291/85291_320.jpg" alt="킹메이커 포스터" onerror="errorImage(this)">
                                        <span class="ico-grade grade-12">12세 이상</span>
                                    </span>
                                </a>
                            </div>
                            <div class="box-contents">
                                <a href="/movies/detail-view/?midx=85561">
                                    <strong class="title">킹메이커</strong>
                                </a>
                                <div class="score">
                                    <strong class="percent">예매율
                                        <span>11.8%</span>
                                    </strong>
                                </div>
                                <span class="txt-info">
                                    <strong>2022.01.26
                                        <span>개봉</span>
                                    </strong>
                                </span>
                                <span class="like">
                                    <a class="link-reservation" href="#">예매</a>
                                </span>
                            </div>
                        </li>
                        <li>
                            <div class="box-image">
                                <strong class="rank">No.4</strong>
                                <a href="#">
                                    <span class="thumb-image">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85641/85641_320.jpg" alt="해리 포터와 불사조 기사단 포스터" onerror="errorImage(this)">
                                        <span class="ico-grade grade-12">12세 이상</span>
                                    </span>
                                </a>
                            </div>
                            <div class="box-contents">
                                <a href="/movies/detail-view/?midx=85561">
                                    <strong class="title">해리 포터와 불사조 기사단</strong>
                                </a>
                                <div class="score">
                                    <strong class="percent">예매율
                                        <span>10.2%</span>
                                    </strong>
                                </div>
                                <span class="txt-info">
                                    <strong>2022.02.09
                                        <span>개봉</span>
                                    </strong>
                                </span>
                                <span class="like">
                                    <a class="link-reservation" href="#">예매</a>
                                </span>
                            </div>
                        </li>
                    </ol>
                    <ol>
                        <li>
                            <div class="box-image">
                                <strong class="rank">No.5</strong>
                                <a href="#">
                                    <span class="thumb-image">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85642/85642_320.jpg" alt="덩케르크 포스터" onerror="errorImage(this)">
                                        <span class="ico-grade grade-12">12세 이상</span>
                                    </span>
                                </a>
                            </div>
                            <div class="box-contents">
                                <a href="/movies/detail-view/?midx=85561">
                                    <strong class="title">덩케르크</strong>
                                </a>
                                <div class="score">
                                    <strong class="percent">예매율
                                        <span>8.5%</span>
                                    </strong>
                                </div>
                                <span class="txt-info">
                                    <strong>2022.02.09
                                        <span>개봉</span>
                                    </strong>
                                </span>
                                <span class="like">
                                    <a class="link-reservation" href="#">예매</a>
                                </span>
                            </div>
                        </li>
                        <li>
                            <div class="box-image">
                                <strong class="rank">No.6</strong>
                                <a href="#">
                                    <span class="thumb-image">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85603/85603_320.jpg" alt="극장판 주술회전 0 포스터" onerror="errorImage(this)">
                                        <span class="ico-grade grade-12">12세 이상</span>
                                    </span>
                                </a>
                            </div>
                            <div class="box-contents">
                                <a href="/movies/detail-view/?midx=85561">
                                    <strong class="title">극장판 주술회전 0</strong>
                                </a>
                                <div class="score">
                                    <strong class="percent">예매율
                                        <span>7.7%</span>
                                    </strong>
                                </div>
                                <span class="txt-info">
                                    <strong>2022.02.17
                                        <span>개봉</span>
                                    </strong>
                                </span>
                                <span class="like">
                                    <a class="link-reservation" href="#">예매</a>
                                </span>
                            </div>
                        </li>
                        <li>
                            <div class="box-image">
                                <strong class="rank">No.7</strong>
                                <a href="#">
                                    <span class="thumb-image">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000084/84949/84949_320.jpg" alt="스파이더맨-노 웨이 홈 포스터" onerror="errorImage(this)">
                                        <span class="ico-grade grade-12">12세 이상</span>
                                    </span>
                                </a>
                            </div>
                            <div class="box-contents">
                                <a href="/movies/detail-view/?midx=85561">
                                    <strong class="title">스파이더맨-노 웨이 홈</strong>
                                </a>
                                <div class="score">
                                    <strong class="percent">예매율
                                        <span>5.0%</span>
                                    </strong>
                                </div>
                                <span class="txt-info">
                                    <strong>2021.12.15
                                        <span>개봉</span>
                                    </strong>
                                </span>
                                <span class="like">
                                    <a class="link-reservation" href="#">예매</a>
                                </span>
                            </div>
                        </li>
                        <li>
                            <div class="box-image">
                                <strong class="rank">No.8</strong>
                                <a href="#">
                                    <span class="thumb-image">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000084/84780/84780_320.jpg" alt="씽2게더 포스터" onerror="errorImage(this)">
                                        <span class="ico-grade grade-12">12세 이상</span>
                                    </span>
                                </a>
                            </div>
                            <div class="box-contents">
                                <a href="/movies/detail-view/?midx=85561">
                                    <strong class="title">씽2게더</strong>
                                </a>
                                <div class="score">
                                    <strong class="percent">예매율
                                        <span>3.6%</span>
                                    </strong>
                                </div>
                                <span class="txt-info">
                                    <strong>2022.01.05
                                        <span>개봉</span>
                                    </strong>
                                </span>
                                <span class="like">
                                    <a class="link-reservation" href="#">예매</a>
                                </span>
                            </div>
                        </li>
                    </ol>
                    <ol>
                        <li>
                            <div class="box-image">
                                <strong class="rank">No.9</strong>
                                <a href="#">
                                    <span class="thumb-image">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85628/85628_320.jpg" alt="극장판 안녕 자두야: 제주도의 비밀 포스터" onerror="errorImage(this)">
                                        <span class="ico-grade grade-12">12세 이상</span>
                                    </span>
                                </a>
                            </div>
                            <div class="box-contents">
                                <a href="/movies/detail-view/?midx=85561">
                                    <strong class="title">극장판 안녕 자두야: 제주도의 비밀 포스터</strong>
                                </a>
                                <div class="score">
                                    <strong class="percent">예매율
                                        <span>2.0%</span>
                                    </strong>
                                </div>
                                <span class="txt-info">
                                    <strong>2022.01.27
                                        <span>개봉</span>
                                    </strong>
                                </span>
                                <span class="like">
                                    <a class="link-reservation" href="#">예매</a>
                                </span>
                            </div>
                        </li>
                        <li>
                            <div class="box-image">
                                <strong class="rank">No.10</strong>
                                <a href="#">
                                    <span class="thumb-image">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85645/85645_320.jpg" alt="비틀즈 겟 백-루프탑 콘서트 포스터" onerror="errorImage(this)">
                                        <span class="ico-grade grade-12">12세 이상</span>
                                    </span>
                                </a>
                            </div>
                            <div class="box-contents">
                                <a href="/movies/detail-view/?midx=85561">
                                    <strong class="title">비틀즈 겟 백-루프탑 콘서트</strong>
                                </a>
                                <div class="score">
                                    <strong class="percent">예매율
                                        <span>1.9%</span>
                                    </strong>
                                </div>
                                <span class="txt-info">
                                    <strong>2022.02.11
                                        <span>개봉</span>
                                    </strong>
                                </span>
                                <span class="like">
                                    <a class="link-reservation" href="#">예매</a>
                                </span>
                            </div>
                        </li>
                        <li>
                            <div class="box-image">
                                <strong class="rank">No.11</strong>
                                <a href="#">
                                    <span class="thumb-image">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000082/82987/82987_320.jpg" alt="타오르는 여인의 초상 포스터" onerror="errorImage(this)">
                                        <span class="ico-grade grade-12">12세 이상</span>
                                    </span>
                                </a>
                            </div>
                            <div class="box-contents">
                                <a href="/movies/detail-view/?midx=85561">
                                    <strong class="title">타오르는 여인의 초상</strong>
                                </a>
                                <div class="score">
                                    <strong class="percent">예매율
                                        <span>1.7%</span>
                                    </strong>
                                </div>
                                <span class="txt-info">
                                    <strong>2022.02.03
                                        <span>재개봉</span>
                                    </strong>
                                </span>
                                <span class="like">
                                    <a class="link-reservation" href="#">예매</a>
                                </span>
                            </div>
                        </li>
                        <li>
                            <div class="box-image">
                                <strong class="rank">No.12</strong>
                                <a href="#">
                                    <span class="thumb-image">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000083/83739/83739_320.jpg" alt="나일 강의 죽음 포스터" onerror="errorImage(this)">
                                        <span class="ico-grade grade-12">12세 이상</span>
                                    </span>
                                </a>
                            </div>
                            <div class="box-contents">
                                <a href="/movies/detail-view/?midx=85561">
                                    <strong class="title">나일 강의 죽음</strong>
                                </a>
                                <div class="score">
                                    <strong class="percent">예매율
                                        <span>1.6%</span>
                                    </strong>
                                </div>
                                <span class="txt-info">
                                    <strong>2022.02.09
                                        <span>개봉</span>
                                    </strong>
                                </span>
                                <span class="like">
                                    <a class="link-reservation" href="#">예매</a>
                                </span>
                            </div>
                        </li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
   <jsp:include page="../default/user_footer.jsp"></jsp:include>
</body>
</html>