<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좌석배치</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/button.css">
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/seat.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css">
	<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@100&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@700&display=swap" rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="../default/user_header.jsp" />
<div class="total-container">
        <div class="total-wrap">
            <div class="top-navi-menu">
                <span class="navi-bar-button">
                    <button class="w-btn-neon2" type="button">
                        상영시간표
                    </button>
                    <button class="w-btn-neon2" type="button" style="margin-left: 20px;">
                        예매 다시하기
                    </button>
                </span>
            </div>
          <div class="select-people-title">인원/좌석</div>
            <div class="select-people-number-box">
                <div class="select-people-wrapper">
                    <div class="select-people-number-wrap">
                        <div class="select-people">
                            <div class="select-people-age">일반</div>
                            <div class="select-people-number">
                                <ul class="select-people-ul select-people-ul-adult">
                                    <li class="select-people-basic">0</li>
                                    <li class="select-people-basic">1</li>
                                    <li class="select-people-basic">2</li>
                                    <li class="select-people-basic">3</li>
                                    <li class="select-people-basic">4</li>
                                    <li class="select-people-basic">5</li>
                                    <li class="select-people-basic">6</li>
                                </ul>
                            </div>

                        </div>
                        <div class="select-people">
                            <div class="select-people-age">청소년</div>
                            <div class="select-people-number">
                                <ul class="select-people-ul select-people-ul-student">
                                    <li class="select-people-student">0</li>
                                    <li class="select-people-student">1</li>
                                    <li class="select-people-student">2</li>
                                    <li class="select-people-student">3</li>
                                    <li class="select-people-student">4</li>
                                    <li class="select-people-student">5</li>
                                    <li class="select-people-student">6</li>
                                </ul>
                            </div>

                        </div>
                        <div class="select-people">
                            <div class="select-people-age">경로</div>
                            <div class="select-people-number">
                                <ul class="select-people-ul select-people-ul-old">
                                    <li class="select-people-old">0</li>
                                    <li class="select-people-old">1</li>
                                    <li class="select-people-old">2</li>
                                    <li class="select-people-old">3</li>
                                    <li class="select-people-old">4</li>
                                    <li class="select-people-old">5</li>
                                    <li class="select-people-old">6</li>
                                </ul>
                            </div>

                        </div>
                    </div>
                        <div class="selected-number-title">선택된 좌석수</div>
                        <div class="selected-number">0</div>
                    </div>
                    <div class="select-people-info">
                        <div class="select-people-movie-title">영화제목</div>
                        <div class="select-people-movie-detail">
                            <ul class="select-people-movie-info-list">
                                <li class="select-theater-local selected-theater-local-info">DGV까치산</li>
                                <li class="select-theater-local selected-theater-local-info">1관 3층</li>
                                <li>
                                    <span>남은좌석</span> 
                                    <span class="remain-seats">150</span>
                                    /
                                    <span class="total-seats">150</span> 
                                </li>
                            </ul>
                        </div>
                        <div class="select-movie-time-info">
                           <div class="select-movie-date">영화상영날짜</div>
                           <div class="select-movie-start-time">영화상영시간</div>
                        </div>
                        <div class="selected-seat-list">
                            <div class="selected-seats-number">좌석번호 :</div>
                            <div class="selected-seats-view">선택한 좌석없음</div>
                        </div>
                        <div class="selected-price-info">
                            <div class="selected-price-title">가격 -></div>
                            <div class="selected-price-total">0</div>
                        </div>
                    </div>
                </div>
             
            </div>
            <div class="seat-container">
                <div class="seat-wrapper">
                    <div class="screen-site-wrapper">
                        <div class="screen-site">SCREEN</div>
                    </div>
                </div>
            </div>
            <div class="reservation-container">
            	<div class="reservation-wrapper">
            		<a href="#" title="영화선택"></a>
            		<div></div>
            	</div>
            </div>

        </div>

    </div>
    <jsp:include page="../default/user_footer.jsp" />
    </body>
    </html>