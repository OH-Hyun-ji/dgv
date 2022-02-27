<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 그 이상적인 감동을</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/login.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/swiper-bundle.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Dongle:wght@700&display=swap" rel="stylesheet">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/swiper.min.js"></script>
    <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
</head>
<body class="block">
<jsp:include page="../default/user_header.jsp"></jsp:include>
    <!-- Contaniner -->
    <div id="contaniner" class="">
        <!-- 벽돌 배경이미지 사용 시 class="bg-bricks" 적용 / 배경이미지가 없을 경우 class 삭제  -->
        <!-- Contents Area -->
        <div id="contents" class="">
            <!-- Contents Start -->
            <!-- 실컨텐츠 시작 -->
            <div class="wrap-join-2016">
                <div class="join-hd">
                    <h3><img src="http://img.cgv.co.kr/R2014/images/common/img_join_hd.jpg" alt="CGV에 오신걸 환영합니다." />
                    </h3>
                    <p>CJ ONE 회원이 되시면 하나의 통합된 회원 ID와 비밀번호로<br />CGV와 CJ ONE의 다양한 서비스를 이용하실 수 있습니다.</p>
                    <a href="https://www.cjone.com/cjmweb/join.do?coopco_cd=7010&brnd_cd=1000" target="_blank"
                        title="새창" class="link-join"><span>CGV + CJONE 통합회원 가입</span></a>
                </div>

                <div class="join-benefit">
                    <h4>CJ ONE 상세 혜택</h4>
                    <ul class="benefit-list">
                        <li>
                            <h5>기본 적립율</h5>
                            <ul class="bl-dep1">
                                <li>유료 영화관람 금액의 3 ~ 7% 적립</li>
                                <li>매점 결제 금액의 0.5% 적립
                                    <ul class="bl-dep2">
                                        <li>적립 방법 : 영수증 하단의 적립번호와<br />인증번호를 CGV 홈페이지/모바일에서 입력</li>
                                        <li>이벤트 기간중에만 적립 가능<br />(일부매장 제외)</li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <h5>제휴할인 시 / 적립 가능매장</h5>
                            <ul class="bl-dep1">
                                <li>제휴할인 + 결제금액의 0 ~ 7% 적립</li>
                            </ul>
                        </li>
                        <li>
                            <h5>기타 적립안내 / 포인트 사용단위</h5>
                            <ul class="bl-dep1">
                                <li>단체할인 시, 무비머니, 관람권,<br />상품권 등으로 구매/결제 시 적립 제외</li>
                                <li>최대 1일 6회(현장 또는 온라인) 또는 1일<br />24매(온라인) 예매제한</li>
                                <li>사용 단위
                                    <ul class="bl-dep2">
                                        <li>매표, 매점 : 500P</li>
                                        <li>온라인 예매 : 10P</li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <p class="bl-desc">※ CJ ONE 통합회원으로 가입되더라도 정보 제공 및 약관 동의가 되지 않은 CJ ONE 제휴 브랜드에는 개인정보가 제공되지 않습니다.</p>
                </div>


            </div>
            <!-- 실컨텐츠 끝 -->



            <!--/ Contents End -->
        </div>
        <!-- /Contents Area -->
    </div>
    <!-- E Contaniner -->
    <!--close .container-->
    <div class="fixedBtn_wrap">
        <a href="/ticket/" class="btn_fixedTicketing">예매하기</a>
        <a href="#none" class="btn_gotoTop"><img src="https://img.cgv.co.kr/R2014/images/common/btn/gotoTop.png"
                alt="최상단으로 이동" /></a>
    </div>
    <!--footer!!!!!!!!!!-->
    <jsp:include page="../default/user_footer.jsp"></jsp:include>
</body>

</html>