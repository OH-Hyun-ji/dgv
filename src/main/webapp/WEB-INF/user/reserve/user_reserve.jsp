<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user_reserve.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css">
    <link href="https://fonts.googleapis.com/css2?family=Dongle:wght@700&display=swap" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
        crossorigin="anonymous"></script>

</head>
<body class="block" >
<jsp:include page="../default/user_header.jsp"></jsp:include>
    <!--본격 콘텐츠-->
    <a name="t"></a>
    <div id="wrap" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
        <div id="container">
            <!-- 빠른예매 -->
            <div id="ticket" class="ticket ko">
                <!-- 타이틀 -->
                <div class="navi">
                    <span class="right">
                        <a class="button button-english" href="#" onmousedown="javascript:logClick('옵션/ENGLISH');" onclick="switchLanguage(); return false;">
                            <span>ENGLISH</span>
                        </a>
                        <a class="button button-guide" href="#" onmousedown="javascript:logClick('옵션/예매가이드');" onclick="ticketPopupShow('popup_guide'); return false;">
                            <span>예매가이드 - 레이어로 서비스 되기 때문에 가상커서를 해지(Ctrl+Shift+F12)한 후 사용합니다.</span>
                        </a>
                        <a class="button button-discount" href="#" onmousedown="javascript:logClick('옵션/제휴할인혜택');" onclick="ticketNewWindow('http://www.cgv.co.kr/discount/discountlist.aspx');return false;" title="새창열기">
                            <span>제휴할인혜택</span>
                        </a>
                        <a class="button button-schedule" href="#" onmousedown="javascript:logClick('옵션/상영시간표');" onclick="openSchedulePopup();return false;" title="새창열기">
                            <span>상영시간표</span>
                        </a>
                        <a class="button button-reservation-restart" href="#" onmousedown="javascript:logClick('옵션/예매다시하기');" onclick="ticketRestart(); return false;">
                            <span>예매 다시하기</span>
                        </a>
                    </span>
                </div>
                <!-- //타이틀 -->
			    <!-- 메인컨텐츠 -->
                <div class="steps">
                    <!-- step1 -->
                    <div class="step step1" style="height: 595px; display: block;">
                        <!-- MOVIE 섹션 -->
                        <div class="section section-movie">
                            <!-- col-head -->
                            <div class="col-head" id="skip_movie_list">
                                <h3 class="sreader">영화</h3>
                                <a href="#" class="skip_to_something" onclick="skipToSomething('skip_theater_list');return false;">영화선택 건너뛰기</a>
                            </div>
                            <!-- col-body -->
                            <div class="col-body" style="height: 560px;">
                                <!-- 영화선택 -->
                                <div class="movie-select">
                                    <div class="tabmenu">
                                        <span class="side on"></span>
                                        <a href="#" class="button menu1 selected">전체</a>
                                        <span class="side on"></span>
                                        <a href="#" class="button menu2">
                                            아트하우스
                                            <span class="arrow"></span>
                                        </a>
                                        <div class="tabmenu-selectbox MOVIECOLLAGE" style="display:none;">
                                            <ul>
                                                <li>
                                                    <a href="#" onclick="return false;">전체</a>
                                                </li>
                                                <li>
                                                    <a href="#" onclick="return false;">최신작</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <span class="side"></span>
                                        <!-- 특별관 안한다고 하셔서 일단 보류함-->
                                    </div>
                                    <div class="sortmenu">
                                        <a href="#" onclick="sortMovieByRank();return false;" id="movieSortRankBtn" class="button btn-rank selected">예매율순</a>
                                        <a href="#" onclick="sortMovieByName();return false;" id="movieSortNameBtn" class="button btn-abc">가나다순
                                        </a>
                                    </div>
                                    <div class="movie-list nano has-scrollbar has-scrollbar-y" id="movie_list">
                                        <ul class="content scroll-y" onscroll="movieSectionScrollEvent();" tabindex="-1" style="right: -17px;padding: 0px;">
                                            <li class="rating-15" data-index="0" movie_cd_group="20028797" movie_idx="85603">
                                                <a href="#" onclick="return false;" title="극장판주술회전0" alt="극장판주술회전0">
                                                    <span class="icon">&nbsp;</span>
                                                    <span class="text">극장판주술회전0</span>
                                                    <span class="sreader"></span>
                                                </a>
                                            </li>
                                            <li class="rating-12" data-index="1" movie_cd_group="20028855" movie_idx="85624">
                                                <a href="#" onclick="return false;" title="언차티드" alt="언차티드">
                                                    <span class="icon">&nbsp;</span>
                                                    <span class="text">언차티드</span>
                                                    <span class="sreader"></span>
                                                </a>
                                            </li>
                                            <li class="rating-12" data-index="2" movie_cd_group="20027588" movie_idx="84945">
                                                <a href="#" onclick="return false;" title="듄" alt="듄">
                                                    <span class="icon">&nbsp;</span>
                                                    <span class="text">듄</span>
                                                    <span class="sreader"></span>
                                                </a>
                                            </li>
                                        </ul>
                                        <div class="pane pane-y" style="display: block; opacity: 1; visibility: visible;">
                                            <div class="slider slider-y" style="height: 50px; top: 0px;"></div>
                                        </div>
                                        <div class="pane pane-x" style="display: none; opacity: 1; visibility: visible;">
                                            <div class="slider slider-x" style="width: 50px;"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- THEATER 섹션 -->
                        <div class="section section-theater">
                            <!-- col-head -->
                            <div class="col-head" id="skip_theater_list">
                                <h3 class="sreader">극장</h3>
                                <a href="#" class="skip_to_something" onclick="skipToSomething('skip_date_list');return false;">극장선택 건너뛰기</a>
                            </div>
                            <!-- col-body -->
                            <div class="col-body" style="height: 560px;">
                                <!-- 자주가는 DGV -->
                                <!-- 극장선택 -->
                                <div class="theater-select" style="height: 429px;">
                                    <div class="tabmenu">
                                        <span class="side on"></span>
                                        <a href="#" onclick="return false;" class="button menu1 selected">전체</a>
                                        <span class="side on"></span>
                                        <a href="#" onclick="return false;" class="button menu2">아트하우스</a>
                                        <span class="side"></span>
                                    </div>
                                    <div class="theater-list" style="height: 388px;">
                                        <div class="theater-area-list" id="theater_area_list">
                                            <ul style="padding-left: 0px;">
                                                <li class="selected">
                                                    <a href="#" onclick="theaterAreaClickListener(event);return false;">
                                                        <span class="name">서울</span>
                                                        <span class="count">(31)</span>
                                                    </a>
                                                    <div class="area_theater_list nano has-scrollbar has-scrollbar-y">
                                                        <ul class="content scroll-y" tabindex="-1" style="right: -17px; margin-left: 0px;">
                                                            <li class="" data-index="0" areaindex="0" theater_cd="0056" rating_cd="undefined"
                                                                style="display: list-item;">
                                                                <a href="#" onclick="theaterListClickListener(event);return false;">
                                                                    강남
                                                                    <span class="sreader"></span>
                                                                </a>
                                                            </li>
                                                            <li class="" data-index="2" areaindex="0" theater_cd="0001" rating_cd="undefined"
                                                                style="display: list-item;">
                                                                <a href="#" onclick="theaterListClickListener(event);return false;" title="강변역 테크노마트">
                                                                    강변
                                                                    <span class="sreader"></span>
                                                                </a>
                                                            </li>
                                                            <li class="" data-index="4" areaindex="0" theater_cd="0229" rating_cd="undefined"
                                                                style="display: list-item;">
                                                                <a href="#" onclick="theaterListClickListener(event);return false;">
                                                                    건대입구
                                                                    <span class="sreader"></span>
                                                                </a>
                                                            </li>
                                                            <li class="" data-index="21" areaindex="0" theater_cd="0010" rating_cd="undefined"
                                                                style="display: list-item;">
                                                                <a href="#" onclick="theaterListClickListener(event);return false;">
                                                                    구로<span class="sreader"></span>
                                                                </a>
                                                            </li>
                                                            <li class="" data-index="50" areaindex="0" theater_cd="0063" rating_cd="undefined"
                                                                style="display: list-item;">
                                                                <a href="#" onclick="theaterListClickListener(event);return false;">
                                                                    대학로
                                                                    <span class="sreader"></span>
                                                                </a>
                                                            </li>
                                                            <li class="" data-index="51" areaindex="0" theater_cd="0252" rating_cd="undefined"
                                                                style="display: list-item;">
                                                                <a href="#" onclick="theaterListClickListener(event);return false;">
                                                                    동대문
                                                                    <span class="sreader"></span>
                                                                </a>
                                                            </li>
                                                            <li class="" data-index="58" areaindex="0" theater_cd="0230" rating_cd="undefined"
                                                                style="display: list-item;">
                                                                <a href="#" onclick="theaterListClickListener(event);return false;">
                                                                    등촌
                                                                    <span class="sreader"></span>
                                                                </a>
                                                            </li>
                                                            <li class="" data-index="60" areaindex="0" theater_cd="0009" rating_cd="undefined"
                                                                style="display: list-item;">
                                                                <a href="#" onclick="theaterListClickListener(event);return false;" title="눈스퀘어 8층">
                                                                    명동
                                                                    <span class="sreader"></span>
                                                                </a>
                                                            </li>
                                                            <li class="" data-index="61" areaindex="0" theater_cd="0105" rating_cd="undefined"
                                                                style="display: list-item;">
                                                                <a href="#" onclick="theaterListClickListener(event);return false;" title="명동역 7,8번 출구">
                                                                    명동역 씨네라이브러리
                                                                    <span class="sreader"></span>
                                                                </a>
                                                            </li>
                                                            <li class="" data-index="62" areaindex="0" theater_cd="0011" rating_cd="undefined"
                                                                style="display: list-item;">
                                                                <a href="#" onclick="theaterListClickListener(event);return false;">
                                                                    목동
                                                                    <span class="sreader"></span>
                                                                </a>
                                                            </li>
                                                            <li class="" data-index="65" areaindex="0" theater_cd="0057" rating_cd="undefined"
                                                                style="display: list-item;">
                                                                <a href="#" onclick="theaterListClickListener(event);return false;">
                                                                    미아
                                                                    <span class="sreader"></span>
                                                                </a>
                                                            </li>
                                                            <li class="" data-index="76" areaindex="0" theater_cd="0030" rating_cd="undefined"
                                                                style="display: list-item;">
                                                                <a href="#" onclick="theaterListClickListener(event);return false;">
                                                                    불광
                                                                    <span class="sreader"></span>
                                                                </a>
                                                            </li>
                                                            <li class="" data-index="78" areaindex="0" theater_cd="0046" rating_cd="undefined"
                                                                style="display: list-item;">
                                                                <a href="#" onclick="theaterListClickListener(event);return false;">
                                                                    상봉
                                                                    <span class="sreader"></span>
                                                                </a>
                                                            </li>
                                                            <li class="" data-index="86" areaindex="0" theater_cd="0300" rating_cd="undefined"
                                                                style="display: list-item;">
                                                                <a href="#" onclick="theaterListClickListener(event);return false;">
                                                                    성신여대입구
                                                                    <span class="sreader"></span>
                                                                </a>
                                                            </li>
                                                            <li class="" data-index="91" areaindex="0" theater_cd="0088" rating_cd="undefined"
                                                                style="display: list-item;">
                                                                <a href="#" onclick="theaterListClickListener(event);return false;">
                                                                    송파
                                                                    <span class="sreader"></span>
                                                                </a>
                                                            </li>
                                                            <li class="" data-index="93" areaindex="0" theater_cd="0276" rating_cd="undefined"
                                                                style="display: list-item;">
                                                                <a href="#" onclick="theaterListClickListener(event);return false;">
                                                                    수유
                                                                    <span class="sreader"></span>
                                                                </a>
                                                            </li>
                                                            <li class="" data-index="98" areaindex="0" theater_cd="0150" rating_cd="undefined"
                                                                style="display: list-item;">
                                                                <a href="#" onclick="theaterListClickListener(event);return false;">
                                                                    신촌아트레온
                                                                    <span class="sreader"></span>
                                                                </a>
                                                            </li>
                                                            <li class="" data-index="100" areaindex="0" theater_cd="P001" rating_cd="undefined"
                                                                style="display: list-item;">
                                                                <a href="#" onclick="theaterListClickListener(event);return false;">
                                                                    씨네드쉐프 압구정
                                                                    <span class="sreader"></span>
                                                                </a>
                                                            </li>
                                                            <li class="" data-index="101" areaindex="0" theater_cd="P013" rating_cd="undefined"
                                                                style="display: list-item;">
                                                                <a href="#" onclick="theaterListClickListener(event);return false;">
                                                                    씨네드쉐프 용산아이파크몰
                                                                    <span class="sreader"></span>
                                                                </a>
                                                            </li>
                                                            <li class="" data-index="106" areaindex="0" theater_cd="0040" rating_cd="undefined"
                                                                style="display: list-item;">
                                                                <a href="#" onclick="theaterListClickListener(event);return false;">압구정<span
                                                                        class="sreader"></span></a>
                                                            </li>
                                                            <li class="" data-index="111" areaindex="0" theater_cd="0112" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">여의도<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="113" areaindex="0" theater_cd="0292" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">연남<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="114" areaindex="0" theater_cd="0059" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">영등포<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="118" areaindex="0" theater_cd="0074" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">왕십리<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="119" areaindex="0" theater_cd="0013" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">용산아이파크몰<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="148" areaindex="0" theater_cd="0131" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;" title="홈플러스 중계점 8층">중계<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="157" areaindex="0" theater_cd="0199" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">천호<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="158" areaindex="0" theater_cd="0107" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">청담씨네시티<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="177" areaindex="0" theater_cd="0223" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">피카디리1958<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="178" areaindex="0" theater_cd="0164" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;" title="건영백화점 B1층">하계<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="182" areaindex="0" theater_cd="0191" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">홍대<span
                                                                        class="sreader"></span></a></li>
                                                        </ul>
                                                        
                                                    </div>
                                                </li>
                                                <li class=""><a href="#" onclick="theaterAreaClickListener(event);return false;"><span
                                                            class="name">경기</span><span class="count">(54)</span></a>
                                                    <div class="area_theater_list nano has-scrollbar">
                                                        <ul class="content scroll-y" tabindex="-1" style="right: -17px;">
                                                            <li class="" data-index="5" areaindex="1" theater_cd="0260" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">경기광주<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="9" areaindex="1" theater_cd="0255" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">고양행신<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="10" areaindex="1" theater_cd="0257" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">광교<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="11" areaindex="1" theater_cd="0266" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">광교상현<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="22" areaindex="1" theater_cd="0232" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">구리<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="25" areaindex="1" theater_cd="0344" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">기흥<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="27" areaindex="1" theater_cd="0278" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">김포<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="28" areaindex="1" theater_cd="0188" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">김포운양<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="29" areaindex="1" theater_cd="0298" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">김포한강<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="53" areaindex="1" theater_cd="0124" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">동백<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="54" areaindex="1" theater_cd="0041" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;" title="인계동 씨네파크 7층">동수원<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="55" areaindex="1" theater_cd="0106" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;" title="메타폴리스 A블럭">동탄<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="56" areaindex="1" theater_cd="0265" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">동탄역<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="57" areaindex="1" theater_cd="0233" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">동탄호수공원<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="66" areaindex="1" theater_cd="0226" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">배곧<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="67" areaindex="1" theater_cd="0155" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;" title="범계역 뉴코아아울렛">범계<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="70" areaindex="1" theater_cd="0015" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;" title="현대백화점 5층">부천<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="71" areaindex="1" theater_cd="0194" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;"
                                                                    title="부천역 3번출구에 있습니다.">부천역<span class="sreader"></span></a></li>
                                                            <li class="" data-index="72" areaindex="1" theater_cd="0287" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">부천옥길<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="74" areaindex="1" theater_cd="0049" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">북수원<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="77" areaindex="1" theater_cd="0242" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">산본<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="84" areaindex="1" theater_cd="0196" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">서현<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="85" areaindex="1" theater_cd="0304" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">성남모란<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="89" areaindex="1" theater_cd="0143" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">소풍<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="92" areaindex="1" theater_cd="0012" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">수원<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="96" areaindex="1" theater_cd="0274" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">스타필드시티위례<span
                                                                        class="sreader"></span></a>
                                                            </li>
                                                            <li class="" data-index="97" areaindex="1" theater_cd="0073" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">시흥<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="104" areaindex="1" theater_cd="0211" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">안산<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="105" areaindex="1" theater_cd="0279" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">안성<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="107" areaindex="1" theater_cd="0003" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">야탑<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="109" areaindex="1" theater_cd="0262" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">양주옥정<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="112" areaindex="1" theater_cd="0338" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">역곡<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="115" areaindex="1" theater_cd="0004" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">오리<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="116" areaindex="1" theater_cd="0305" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">오산<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="117" areaindex="1" theater_cd="0307" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">오산중앙<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="120" areaindex="1" theater_cd="0271" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">용인<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="127" areaindex="1" theater_cd="0113" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;" title="신세계 백화점 10층">의정부<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="128" areaindex="1" theater_cd="0187" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;" title="센트럴타워 15층">의정부태흥<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="129" areaindex="1" theater_cd="0205" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">이천<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="137" areaindex="1" theater_cd="0054" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">일산<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="142" areaindex="1" theater_cd="0320" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">정왕<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="147" areaindex="1" theater_cd="0055" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">죽전<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="168" areaindex="1" theater_cd="0148" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">파주문산<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="169" areaindex="1" theater_cd="0310" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">파주야당<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="170" areaindex="1" theater_cd="0181" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">판교<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="171" areaindex="1" theater_cd="0195" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">평촌<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="172" areaindex="1" theater_cd="0052" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">평택<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="173" areaindex="1" theater_cd="0334" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">평택고덕<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="174" areaindex="1" theater_cd="0214" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">평택소사<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="175" areaindex="1" theater_cd="0309" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">포천<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="179" areaindex="1" theater_cd="0326" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">하남미사<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="185" areaindex="1" theater_cd="0301" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">화성봉담<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="186" areaindex="1" theater_cd="0145" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">화정<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="187" areaindex="1" theater_cd="0342" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">Drive In
                                                                    곤지암<span class="sreader"></span></a></li>
                                                        </ul>
                                                        <div class="pane pane-y" style="display: none; opacity: 1; visibility: visible;">
                                                            <div class="slider slider-y" style="height: 50px;"></div>
                                                        </div>
                                                        <div class="pane pane-x" style="display: none; opacity: 1; visibility: visible;">
                                                            <div class="slider slider-x" style="width: 50px;"></div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class=""><a href="#" onclick="theaterAreaClickListener(event);return false;"><span
                                                            class="name">인천</span><span class="count">(11)</span></a>
                                                    <div class="area_theater_list nano has-scrollbar">
                                                        <ul class="content scroll-y" tabindex="-1" style="right: -17px;">
                                                            <li class="" data-index="7" areaindex="2" theater_cd="0043" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">계양<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="73" areaindex="2" theater_cd="0021" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;" title="청천동 아이즈빌 아울렛">부평<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="90" areaindex="2" theater_cd="0325" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">송도타임스페이스<span
                                                                        class="sreader"></span></a>
                                                            </li>
                                                            <li class="" data-index="132" areaindex="2" theater_cd="0002" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;" title="구월동 홈플러스">인천<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="133" areaindex="2" theater_cd="0254" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">인천논현<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="134" areaindex="2" theater_cd="0340" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">인천도화<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="135" areaindex="2" theater_cd="0258" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">인천연수<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="136" areaindex="2" theater_cd="0269" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">인천학익<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="146" areaindex="2" theater_cd="0308" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">주안역<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="159" areaindex="2" theater_cd="0235" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">청라<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="188" areaindex="2" theater_cd="0339" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">Drive In
                                                                    스퀘어원<span class="sreader"></span></a></li>
                                                        </ul>
                                                        <div class="pane pane-y" style="display: none; opacity: 1; visibility: visible;">
                                                            <div class="slider slider-y" style="height: 50px;"></div>
                                                        </div>
                                                        <div class="pane pane-x" style="display: none; opacity: 1; visibility: visible;">
                                                            <div class="slider slider-x" style="width: 50px;"></div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li><a href="#" onclick="theaterAreaClickListener(event);return false;"><span
                                                            class="name">강원</span><span class="count">(4)</span></a>
                                                    <div class="area_theater_list nano has-scrollbar">
                                                        <ul class="content scroll-y" tabindex="-1" style="right: -17px;">
                                                            <li class="" data-index="1" areaindex="3" theater_cd="0139" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">강릉<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="125" areaindex="3" theater_cd="0144" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">원주<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="131" areaindex="3" theater_cd="0281" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">인제<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="165" areaindex="3" theater_cd="0070" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">춘천<span
                                                                        class="sreader"></span></a></li>
                                                        </ul>
                                                        <div class="pane pane-y" style="display: none; opacity: 1; visibility: visible;">
                                                            <div class="slider slider-y" style="height: 50px;"></div>
                                                        </div>
                                                        <div class="pane pane-x" style="display: none; opacity: 1; visibility: visible;">
                                                            <div class="slider slider-x" style="width: 50px;"></div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class=""><a href="#" onclick="theaterAreaClickListener(event);return false;"><span
                                                            class="name">대전/충청</span><span class="count">(23)</span></a>
                                                    <div class="area_theater_list nano has-scrollbar">
                                                        <ul class="content scroll-y" tabindex="-1" style="right: -17px;">
                                                            <li class="" data-index="34" areaindex="4" theater_cd="0261" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">논산<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="35" areaindex="4" theater_cd="0207" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">당진<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="45" areaindex="4" theater_cd="0007" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">대전<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="46" areaindex="4" theater_cd="0286" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">대전가수원<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="47" areaindex="4" theater_cd="0154" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">대전가오<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="48" areaindex="4" theater_cd="0202" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">대전탄방<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="49" areaindex="4" theater_cd="0127" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">대전터미널<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="68" areaindex="4" theater_cd="0275" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">보령<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="82" areaindex="4" theater_cd="0091" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">서산<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="87" areaindex="4" theater_cd="0219" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">세종<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="126" areaindex="4" theater_cd="0206" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">유성노은<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="153" areaindex="4" theater_cd="0044" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;" title="천안역 1번 출구">천안<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="154" areaindex="4" theater_cd="0332" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">천안시청<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="155" areaindex="4" theater_cd="0293" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">천안터미널<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="156" areaindex="4" theater_cd="0110" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;"
                                                                    title="불당동 펜타포트(천안아산역)">천안펜타포트<span class="sreader"></span></a></li>
                                                            <li class="" data-index="160" areaindex="4" theater_cd="0297" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">청주성안길<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="161" areaindex="4" theater_cd="0282" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">청주율량<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="162" areaindex="4" theater_cd="0142" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">청주지웰시티<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="163" areaindex="4" theater_cd="0319" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">청주터미널<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="164" areaindex="4" theater_cd="0228" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">청주(서문)<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="166" areaindex="4" theater_cd="0284" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">충북혁신<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="167" areaindex="4" theater_cd="0328" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">충주교현<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="183" areaindex="4" theater_cd="0217" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">홍성<span
                                                                        class="sreader"></span></a></li>
                                                        </ul>
                                                        <div class="pane pane-y" style="display: none; opacity: 1; visibility: visible;">
                                                            <div class="slider slider-y" style="height: 50px;"></div>
                                                        </div>
                                                        <div class="pane pane-x" style="display: none; opacity: 1; visibility: visible;">
                                                            <div class="slider slider-x" style="width: 50px;"></div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li><a href="#" onclick="theaterAreaClickListener(event);return false;"><span
                                                            class="name">대구</span><span class="count">(8)</span></a>
                                                    <div class="area_theater_list nano has-scrollbar">
                                                        <ul class="content scroll-y" tabindex="-1" style="right: -17px;">
                                                            <li class="" data-index="36" areaindex="5" theater_cd="0157" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">대구수성<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="37" areaindex="5" theater_cd="0108" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">대구스타디움<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="38" areaindex="5" theater_cd="0185" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;"
                                                                    title="중앙로역 2번 출구">대구아카데미<span class="sreader"></span></a></li>
                                                            <li class="" data-index="39" areaindex="5" theater_cd="0343" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">대구연경<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="40" areaindex="5" theater_cd="0216" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">대구월성<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="41" areaindex="5" theater_cd="0071" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">대구칠곡<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="42" areaindex="5" theater_cd="0147" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;" title="동성로광장 진입로">대구한일<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="43" areaindex="5" theater_cd="0109" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;"
                                                                    title="현대백화점 지하 2층">대구현대<span class="sreader"></span></a></li>
                                                        </ul>
                                                        <div class="pane pane-y" style="display: none; opacity: 1; visibility: visible;">
                                                            <div class="slider slider-y" style="height: 50px;"></div>
                                                        </div>
                                                        <div class="pane pane-x" style="display: none; opacity: 1; visibility: visible;">
                                                            <div class="slider slider-x" style="width: 50px;"></div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li><a href="#" onclick="theaterAreaClickListener(event);return false;"><span
                                                            class="name">부산/울산</span><span class="count">(17)</span></a>
                                                    <div class="area_theater_list nano has-scrollbar">
                                                        <ul class="content scroll-y" tabindex="-1" style="right: -17px;">
                                                            <li class="" data-index="44" areaindex="6" theater_cd="0061" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">대연<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="52" areaindex="6" theater_cd="0042" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">동래<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="69" areaindex="6" theater_cd="0337" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">부산명지<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="79" areaindex="6" theater_cd="0005" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">서면<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="80" areaindex="6" theater_cd="0285" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">서면삼정타워<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="81" areaindex="6" theater_cd="0303" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">서면상상마당<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="88" areaindex="6" theater_cd="0089" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">센텀시티<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="99" areaindex="6" theater_cd="P004" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">씨네드쉐프
                                                                    센텀시티<span class="sreader"></span></a></li>
                                                            <li class="" data-index="102" areaindex="6" theater_cd="0160" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">아시아드<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="121" areaindex="6" theater_cd="0335" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">울산동구<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="122" areaindex="6" theater_cd="0128" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;" title="삼산동">울산삼산<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="123" areaindex="6" theater_cd="0264" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">울산신천<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="124" areaindex="6" theater_cd="0246" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">울산진장<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="141" areaindex="6" theater_cd="0306" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">정관<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="180" areaindex="6" theater_cd="0245" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">하단아트몰링<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="181" areaindex="6" theater_cd="0318" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">해운대<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="184" areaindex="6" theater_cd="0159" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">화명<span
                                                                        class="sreader"></span></a></li>
                                                        </ul>
                                                        <div class="pane pane-y" style="display: none; opacity: 1; visibility: visible;">
                                                            <div class="slider slider-y" style="height: 50px;"></div>
                                                        </div>
                                                        <div class="pane pane-x" style="display: none; opacity: 1; visibility: visible;">
                                                            <div class="slider slider-x" style="width: 50px;"></div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li><a href="#" onclick="theaterAreaClickListener(event);return false;"><span
                                                            class="name">경상</span><span class="count">(17)</span></a>
                                                    <div class="area_theater_list nano has-scrollbar">
                                                        <ul class="content scroll-y" tabindex="-1" style="right: -17px;">
                                                            <li class="" data-index="3" areaindex="7" theater_cd="0263" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">거제<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="6" areaindex="7" theater_cd="0330" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">경산<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="8" areaindex="7" theater_cd="0323" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">고성<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="23" areaindex="7" theater_cd="0053" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">구미<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="26" areaindex="7" theater_cd="0240" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">김천율곡<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="30" areaindex="7" theater_cd="0028" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">김해<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="31" areaindex="7" theater_cd="0311" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">김해율하<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="32" areaindex="7" theater_cd="0239" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">김해장유<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="59" areaindex="7" theater_cd="0033" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">마산<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="75" areaindex="7" theater_cd="0097" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;" title="포항시 북구 덕산동">북포항<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="103" areaindex="7" theater_cd="0272" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">안동<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="108" areaindex="7" theater_cd="0234" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">양산삼호<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="149" areaindex="7" theater_cd="0324" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">진주혁신<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="150" areaindex="7" theater_cd="0023" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">창원<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="151" areaindex="7" theater_cd="0079" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">창원더시티<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="152" areaindex="7" theater_cd="0283" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">창원상남<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="176" areaindex="7" theater_cd="0045" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;" title="포항시 남구 상도동">포항<span
                                                                        class="sreader"></span></a></li>
                                                        </ul>
                                                        <div class="pane pane-y" style="display: none; opacity: 1; visibility: visible;">
                                                            <div class="slider slider-y" style="height: 50px;"></div>
                                                        </div>
                                                        <div class="pane pane-x" style="display: none; opacity: 1; visibility: visible;">
                                                            <div class="slider slider-x" style="width: 50px;"></div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li><a href="#" onclick="theaterAreaClickListener(event);return false;"><span
                                                            class="name">광주/전라/제주</span><span class="count">(24)</span></a>
                                                    <div class="area_theater_list nano has-scrollbar">
                                                        <ul class="content scroll-y" tabindex="-1" style="right: -17px;">
                                                            <li class="" data-index="12" areaindex="8" theater_cd="0220" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">광양<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="13" areaindex="8" theater_cd="0221" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">광양
                                                                    엘에프스퀘어<span class="sreader"></span></a></li>
                                                            <li class="" data-index="14" areaindex="8" theater_cd="0295" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">광주금남로<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="15" areaindex="8" theater_cd="0193" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">광주상무<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="16" areaindex="8" theater_cd="0210" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">광주용봉<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="17" areaindex="8" theater_cd="0218" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">광주첨단<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="18" areaindex="8" theater_cd="0244" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">광주충장로<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="19" areaindex="8" theater_cd="0090" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">광주터미널<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="20" areaindex="8" theater_cd="0215" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">광주하남<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="24" areaindex="8" theater_cd="0277" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">군산<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="33" areaindex="8" theater_cd="0237" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">나주<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="63" areaindex="8" theater_cd="0289" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">목포<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="64" areaindex="8" theater_cd="0280" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">목포평화광장<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="83" areaindex="8" theater_cd="0225" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">서전주<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="94" areaindex="8" theater_cd="0114" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">순천<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="95" areaindex="8" theater_cd="0268" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">순천신대<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="110" areaindex="8" theater_cd="0315" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">여수웅천<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="130" areaindex="8" theater_cd="0020" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">익산<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="138" areaindex="8" theater_cd="0213" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">전주고사<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="139" areaindex="8" theater_cd="0336" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">전주에코시티<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="140" areaindex="8" theater_cd="0179" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">전주효자<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="143" areaindex="8" theater_cd="0186" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">정읍<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="144" areaindex="8" theater_cd="0302" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">제주<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="145" areaindex="8" theater_cd="0259" rating_cd="undefined"
                                                                style="display: list-item;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">제주노형<span
                                                                        class="sreader"></span></a></li>
                                                        </ul>
                                                        <div class="pane pane-y" style="display: none; opacity: 1; visibility: visible;">
                                                            <div class="slider slider-y" style="height: 50px;"></div>
                                                        </div>
                                                        <div class="pane pane-x" style="display: none; opacity: 1; visibility: visible;">
                                                            <div class="slider slider-x" style="width: 50px;"></div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <a href="#" onclick="theaterAreaClickListener(event);return false;">
                                                        <span class="name">&nbsp;</span>
                                                        <span class="count">&nbsp;</span>
                                                    </a>
                                                    <div class="area_theater_list nano has-scrollbar">
                                                        <ul class="content scroll-y" tabindex="-1" style="right: -17px;">
                                                            <li class="" data-index="48" areaindex="9" theater_cd="0303" rating_cd="32"
                                                                style="display: none;">
                                                                <a href="#" onclick="theaterListClickListener(event);return false;">
                                                                    서면상상마당
                                                                    <span class="sreader"></span>
                                                                </a>
                                                            </li>
                                                            <li class="" data-index="86" areaindex="9" theater_cd="0292" rating_cd="32"
                                                                style="display: none;">
                                                                <a href="#" onclick="theaterListClickListener(event);return false;">
                                                                    연남
                                                                    <span class="sreader"></span>
                                                                </a>
                                                            </li>
                                                        </ul>
                                                        <div class="pane pane-y" style="display: none; opacity: 1; visibility: visible;">
                                                            <div class="slider slider-y" style="height: 50px;">
                                                            </div>
                                                        </div>
                                                        <div class="pane pane-x" style="display: none; opacity: 1; visibility: visible;">
                                                            <div class="slider slider-x" style="width: 50px;">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <a href="#" onclick="theaterAreaClickListener(event);return false;">
                                                        <span class="name">&nbsp;</span>
                                                        <span class="count">&nbsp;</span>
                                                    </a>
                                                    <div class="area_theater_list nano has-scrollbar">
                                                        <ul class="content scroll-y" tabindex="-1" style="right: -17px;">
                                                            <li class="" data-index="0" areaindex="10" theater_cd="0056" rating_cd="23"
                                                                style="display: none;">
                                                                <a href="#" onclick="theaterListClickListener(event);return false;">강남<span
                                                                        class="sreader"></span></a>
                                                            </li>
                                                            <li class="" data-index="1" areaindex="10" theater_cd="0139" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">강릉<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="6" areaindex="10" theater_cd="0043" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">계양<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="10" areaindex="10" theater_cd="0193" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">광주상무<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="15" areaindex="10" theater_cd="0090" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">광주터미널<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="16" areaindex="10" theater_cd="0010" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">구로<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="18" areaindex="10" theater_cd="0028" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">김해<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="21" areaindex="10" theater_cd="0216" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">대구월성<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="26" areaindex="10" theater_cd="0007" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">대전<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="27" areaindex="10" theater_cd="0202" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">대전탄방<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="29" areaindex="10" theater_cd="0042" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">동래<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="32" areaindex="10" theater_cd="0106" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;" title="메타폴리스 A블럭">동탄<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="34" areaindex="10" theater_cd="0265" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">동탄역<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="35" areaindex="10" theater_cd="0230" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">등촌<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="37" areaindex="10" theater_cd="0011" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">목동<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="39" areaindex="10" theater_cd="0015" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;" title="현대백화점 5층">부천<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="41" areaindex="10" theater_cd="0194" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;"
                                                                    title="부천역 3번출구에 있습니다.">부천역<span class="sreader"></span></a></li>
                                                            <li class="" data-index="43" areaindex="10" theater_cd="0046" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">상봉<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="47" areaindex="10" theater_cd="0005" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">서면<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="49" areaindex="10" theater_cd="0219" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">세종<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="54" areaindex="10" theater_cd="0089" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">센텀시티<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="58" areaindex="10" theater_cd="0088" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">송파<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="61" areaindex="10" theater_cd="0012" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">수원<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="65" areaindex="10" theater_cd="0150" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">신촌아트레온<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="73" areaindex="10" theater_cd="0160" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">아시아드<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="75" areaindex="10" theater_cd="0211" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">안산<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="83" areaindex="10" theater_cd="0112" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">여의도<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="91" areaindex="10" theater_cd="0059" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">영등포<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="94" areaindex="10" theater_cd="0004" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">오리<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="106" areaindex="10" theater_cd="0013" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">용산아이파크몰<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="111" areaindex="10" theater_cd="0128" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;" title="삼산동">울산삼산<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="112" areaindex="10" theater_cd="0246" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">울산진장<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="113" areaindex="10" theater_cd="0144" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">원주<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="115" areaindex="10" theater_cd="0113" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;" title="신세계 백화점 10층">의정부<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="120" areaindex="10" theater_cd="0002" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;" title="구월동 홈플러스">인천<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="125" areaindex="10" theater_cd="0213" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">전주고사<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="127" areaindex="10" theater_cd="0179" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">전주효자<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="131" areaindex="10" theater_cd="0055" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">죽전<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="135" areaindex="10" theater_cd="0079" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">창원더시티<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="140" areaindex="10" theater_cd="0110" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;"
                                                                    title="불당동 펜타포트(천안아산역)">천안펜타포트<span class="sreader"></span></a></li>
                                                            <li class="" data-index="143" areaindex="10" theater_cd="0199" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">천호<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="153" areaindex="10" theater_cd="0070" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">춘천<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="157" areaindex="10" theater_cd="0181" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">판교<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="158" areaindex="10" theater_cd="0195" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">평촌<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="160" areaindex="10" theater_cd="0052" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;">평택<span
                                                                        class="sreader"></span></a></li>
                                                            <li class="" data-index="161" areaindex="10" theater_cd="0045" rating_cd="23"
                                                                style="display: none;"><a href="#"
                                                                    onclick="theaterListClickListener(event);return false;" title="포항시 남구 상도동">포항<span
                                                                        class="sreader"></span></a></li>
                                                        </ul>
                                                        <div class="pane pane-y" style="display: none; opacity: 1; visibility: visible;">
                                                            <div class="slider slider-y" style="height: 50px;"></div>
                                                        </div>
                                                        <div class="pane pane-x" style="display: none; opacity: 1; visibility: visible;">
                                                            <div class="slider slider-x" style="width: 50px;"></div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="theater-cgv-list nano has-scrollbar" id="theater_cgv_list">
                                            <ul class="content scroll-y" tabindex="-1" style="right: -17px;">
                                            </ul>
                                            <div class="pane pane-y" style="display: none; opacity: 1; visibility: visible;">
                                                <div class="slider slider-y" style="height: 50px;">
                                                    <div class="slider slider-y" style="height: 50px;">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="pane pane-x" style="display: none; opacity: 1; visibility: visible;">
                                                <div class="slider slider-x" style="width: 50px;"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </div>
                                </div>
                        <!-- DATE 섹션 -->
                        <div class="section section-date">
                            <div class="col-head" id="skip_date_list">
                                <h3 class="sreader">날짜</h3>
                                <a href="#" onclick="return false;" class="skip_to_something">날짜 건너뛰기</a>
                                
                            </div>
                            
                            <div class="col-body" style="height: 560px;">
                                <!-- 날짜선택 -->
                                <div class="day-part">
                                    <div class="reserve-date">
                                        
                                    </div>
                                    
                                </div>
                                <script>
                                    const date = new Date();
                                    // console.log(date.getFullYear());
                                    const lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);
                                    const reserveDate = document.querySelector(".reserve-date");
                            
                                  
                                        const weekOfDay = ["일", "월", "화", "수", "목", "금", "토"]
                                        const year = date.getFullYear();
                                        const month = date.getMonth();
                                        for (i = date.getDate(); i <= lastDay.getDate(); i++) {
                            
                                            const button = document.createElement("button");
                                            const spanWeekOfDay = document.createElement("span");
                                            const spanDay = document.createElement("span");
                            
                                            //class넣기
                                            button.classList = "movie-date-wrapper"
                                            spanWeekOfDay.classList = "movie-week-of-day";
                                            spanDay.classList = "movie-day";
                            
                                            //weekOfDay[new Date(2020-03-날짜)]
                                            const dayOfWeek = weekOfDay[new Date(year + "-" + month + "-" + i).getDay()];
                            
                                            //요일 넣기
                                            if (dayOfWeek === "토") {
                                                spanWeekOfDay.classList.add("saturday");
                                                spanDay.classList.add("saturday");
                                            } else if (dayOfWeek === "일") {
                                                spanWeekOfDay.classList.add("sunday");
                                                spanDay.classList.add("sunday");
                                            }
                                            spanWeekOfDay.innerHTML = dayOfWeek;
                                            button.append(spanWeekOfDay);
                                            //날짜 넣기
                                            spanDay.innerHTML = i;
                                            button.append(spanDay);
                                            //button.append(i);
                                            reserveDate.append(button);
                            
                                            dayClickEvent(button);
                                        }
                            
                                    
                            
                            
                                    function dayClickEvent(button) {
                                        button.addEventListener("click", function() {
                                            const movieDateWrapperActive = document.querySelectorAll(".movie-date-wrapper-active");
                                            movieDateWrapperActive.forEach((list) => {
                                                list.classList.remove("movie-date-wrapper-active");
                                            })
                                            button.classList.add("movie-date-wrapper-active");
                                        })
                                    }
                                </script>
                            </div>
                        </div>
                        <!-- TIME 섹션 -->
                        <div class="section section-time">
                            <div class="col-head" id="skip_time_list">
                                <h3 class="sreader">시간</h3>
                                <a href="#" class="skip_to_something" onclick="skipToSomething('tnb_step_btn_right');return false;">시간선택 건너뛰기</a>                                
                            </div>
                            <div class="col-body" style="height: 560px;">
                                <!-- 시간선택 -->
                                <div class="placeholder hidden">영화, 극장, 날짜를 선택해주세요.</div>
                                <div class="time-list nano has-scrollbar">
                                    <div class="content scroll-y" tabindex="-1" style="right: -17px;">
                                        <div class="theater" screen_cd="001" movie_cd="20024619" style="border: none;"><span class="title"><span
                                                    class="name">2D</span><span class="floor">1관 5층</span><span class="seatcount">(총130석)</span></span>
                                            <ul>
                                                <li data-index="0" data-remain_seat="130" play_start_tm="1400" screen_cd="001" movie_cd="20024619"
                                                    play_num="2"><a class="button" href="#" onclick="screenTimeClickListener(event);return false;"
                                                        title=""><span class="time"><span>14:00</span></span><span class="count">60석</span>
                                                        <div class="sreader">종료시간 16:17</div><span class="sreader mod"></span>
                                                    </a></li>
                                                <li data-index="1" data-remain_seat="130" play_start_tm="1910" screen_cd="001" movie_cd="20024619"
                                                    play_num="4"><a class="button" href="#" onclick="screenTimeClickListener(event);return false;"
                                                        title=""><span class="time"><span>19:10</span></span><span class="count">60석</span>
                                                        <div class="sreader">종료시간 21:27</div><span class="sreader mod"></span>
                                                    </a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <!-- step2는 seat섹션이라 일단 보류함-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../default/user_footer.jsp"></jsp:include>
</body>
</html>