<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>My Page</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=1024"/>
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/userArea.css">
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/layout.css">
    <link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/movieTheater.css"/>
    <link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/userModule.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css"> 
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>
      <body class="">
        <div id="cgvwrap">
        	<jsp:include page="../default/user_header.jsp"></jsp:include>
        
               <!-- Contaniner -->
            <div id="contaniner" class="">
                <!-- Contents Area -->
                <div id="contents" class="">
                    <!-- Contents Start -->
                    <div class="sect-common">
                        <input type="hidden" id="isTown" name="isTown" value="Y"/>
                        <input
                            type="hidden"
                            id="userTownMemberInfo"
                            name="userTownMemberInfo"
                            value=""/>
                        <div class="mycgv-info-wrap">
                            <div class="skipnaiv">
                                <a href="#menu" id="skipPersoninfo">개인화영역 건너띄기</a>
                            </div>
                            <div class="sect-person-info">
                                <h2 class="hidden">개인화 영역</h2>
                                <div class="box-image">
                                    <span class="thumb-image">
                                        <img
                                            src="../images/1.png"
                                            alt="ㅇㅇㅇ님 프로필 사진"
                                            onerror="errorImage(this, {'type':'profile'})"/>
                                        <span class="profile-mask"></span>
                                    </span>
                                </div>
                                <div class="box-contents newtype">
                                    <div class="person-info">
                                        <strong>ㅇㅇㅇ님</strong>
                                        <em>text@naver.com</em>
                                        <span>닉네임 :
                                            <i>닉네임을 설정해주세요.</i>
                                        </span>
                                        <button id="go_edit_page" type="button" title="새창열림">나의 정보 변경</button>
                                    </div>
                                    <div class="grade-info">

                                        <p
                                            style="margin-bottom:4px;color: #342929;font-family: 'NanumBarunGothicBold', '맑은 고딕', '돋움', Dotum, sans-serif;font-size: 20px;line-height: 20px;">

                                            현재 고객등급 조정 기간입니다.

                                        </p>

                                        <button type="button" id="view_usergrade" class="round black">
                                            <span>MY 지난등급이력 보기</span></button>


                                    </div>
                                </div>
                            </div>
                            <div class="cols-benefit-info">
                                <div class="col-my-coupon">
                                    <h3>MY COUPON</h3>
                                    <ul>
                                        <li>
                                            <strong>DGV 할인쿠폰</strong>
                                            <span>
                                                <em>0</em>
                                                개</span>
                                        </li>

                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="cols-content" id="menu">
                        <div class="col-aside">
                            <div class="skipnaiv">
                                <a href="#" id="skipMycgvMenu">MYDGV 서브메뉴 건너띄기</a>
                            </div>
                            <h2>MY DGV 서브메뉴</h2>
                            <div class="snb">
                                <ul>
                                    <li class="on">
                                        <a href="#" title="현재 선택">MY DGV HOME
                                            <i></i>
                                        </a>
                                    </li>
                                    <li >
                                        <a href="#">나의 예매내역
                                            <i></i>
                                        </a>
                                        <ul></ul>
                                    </li>
                                    <li >
                                        <a href="#">관람권/할인쿠폰 관리
                                            <i></i>
                                        </a>
                                        <ul>
                                            <li >
                                                <a href="#">DGV할인쿠폰</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li >
                                        <a href="#" title="현재선택">이벤트 참여내역
                                            <i></i>
                                        </a>
                                    </li>
                                    <li >
                                        <a href="#">회원정보<i></i>
                                        </a>
                                        <ul>
                                            <li >
                                                <a href="#">개인정보 변경</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li >
                                        <a href="#">프로필 관리<i></i>
                                        </a>
                                    </li>
                                    <li >
                                        <a href="#">나의 문의내역
                                            <i></i>
                                        </a>
                                        <ul>
                                            <li >
                                                <a href="#">1:1 문의</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="my-event">
                                        <a href="#">내가 본 영화</a>
                                    </li>
                                    <!-- <li class="my-event"><a href="/user/mydgv/event/?g=1">나의 참여 이벤트</a></li>
                                    -->
                                </ul>
                            </div>
                        </div>
                        <div class="col-detail" id="mycgv_contents">

                            <div class="sect-mycgv-reserve movielog col3">
                                <div class="box-polaroid"></div>
                            </div>
                            <div class="tit-mycgv">
                                <h3>MY 예매내역</h3>
                                <p>
                                    <em>0건</em>
                                    <a href="#">예매내역 더보기</a>
                                </p>
                            </div>

                            <form name="aspnetForm" method="post" action="./" id="aspnetForm">
                                <div>
                                    <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value=""/>
                                    <input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value=""/>
                                    <input
                                        type="hidden"
                                        name="__VIEWSTATE"
                                        id="__VIEWSTATE"
                                        value="/wEPDwUKMTc0NzIwMTk3M2RkGpTZbHfO8pvW/Ta9En5loRX6E2E="/>
                                </div>

                                <div>

                                    <input
                                        type="hidden"
                                        name="__VIEWSTATEGENERATOR"
                                        id="__VIEWSTATEGENERATOR"
                                        value="F268F2D4"/>
                                    <input
                                        type="hidden"
                                        name="__EVENTVALIDATION"
                                        id="__EVENTVALIDATION"
                                        value="/wEdAANOZtRado8flmBd6Juf8OumAAaiyC+ogOIlg3pscMtiP2lKUwCIH8TI/sjrTPJzW37qSeqQYBLB9CRMYU4y53rNrIwxzA=="/>
                                </div>

                                <!-- MY 예매내역 -->
                                <input type="hidden" id="hidCancelReserveNo" name="hidCancelReserveNo"/>
                                <div class="sect-base-booking">
                                    <div class="box-polaroid">
                                        <div class="box-inner">
                                            <div class="lst-item">
                                                고객님의 최근 예매내역이 존재하지 않습니다.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <!-- MY 참여이력 -->
                            <div class="sect-mycgv-part">
                                <div class="box-polaroid type1">
                                    <div class="box-inner">
                                        <div class="tit-mycgv">
                                            <h3>MY Q&amp;A</h3>
                                            <p>
                                                <em>0건</em>
                                                <a href="#">MY Q&amp;A 더보기</a>
                                            </p>
                                        </div>
                                        <div class="col-myqna">

                                            <ul>
                                                <li>고객님의 1:1 문의내역이 존재하지 않습니다.</li>
                                            </ul>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/ Contents End -->
            </div>
            <!-- /Contents Area -->
        </div>
        <!-- S 예매하기 및 TOP Fixed 버튼 -->
        <div class="fixedBtn_wrap">

            <a href="/ticket/" class="btn_fixedTicketing">예매하기</a>

            <a href="#none" class="btn_gotoTop"><img src="/images/gotoTop.png" alt="최상단으로 이동"/></a>
        </div>
</body>
</html>