<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>무비 상세페이지</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/movieDetail.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/swiper-bundle.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Dongle:wght@700&display=swap" rel="stylesheet">
    
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/swiper.min.js"></script>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){

            $("#btnMovie").click(function(){
                $("#movie-list").show();
                $("#movie-list-reser").hide();

                $(".movie-all-view").attr("href", "#");
            });

            $("#btnReserMovie").click(function(){
                $("#movie-list").hide();
                $("#movie-list-reser").show();
                $(".movie-all-view").attr("href", "#");
            });

            var movieChartSwiper = new Swiper("#movie-list", {

                slidesPerView: 5,
                spaceBetween: 32,
                slidesPerGroup: 5,
                loopFillGroupWithBlank: true,
                navigation: {
                    nextEl: ".swiper-button-next",

                    prevEl: ".swiper-button-prev",
                },
                a11y: {
                    prevSlideMessage: '이전 슬라이드',
                    nextSlideMessage: '다음 슬라이드',
                    slideLabelMessage: '총 {{slidesLength}}장의 슬라이드 중 {{index}}번 슬라이드 입니다.',
                },
            });

            var movieChartSwiper2 = new Swiper("#movie-list-reser", {

                slidesPerView: 5,
                spaceBetween: 32,
                slidesPerGroup: 5,
                loopFillGroupWithBlank: true,
                navigation: {
                    nextEl: ".swiper-button-next",

                    prevEl: ".swiper-button-prev",
                },
                a11y: {
                    prevSlideMessage: '이전 슬라이드',
                    nextSlideMessage: '다음 슬라이드',
                    slideLabelMessopenPopupage: '총 {{slidesLength}}장의 슬라이드 중 {{index}}번 슬라이드 입니다.',
                },
            });

            $("#movie-list-reser").hide(); //swiper 랜더링 완료 후 숨기기해야함

            var eventSwiper = new Swiper(".event_list", {
                autoplay: {
                    delay: 2500,
                    disableOnInteraction: false,
                },
                slidesPerView: 3,
                spaceBetween: 24,
                slidesPerGroup: 3,
                loopFillGroupWithBlank: true,
                navigation: {
                    nextEl: ".swiper-button-next",
                    prevEl: ".swiper-button-prev",
                },
                a11y: {
                    prevSlideMessage: '이전 슬라이드',
                    nextSlideMessage: '다음 슬라이드',
                    slideLabelMessage: '총 {{slidesLength}}장의 슬라이드 중 {{index}}번 슬라이드 입니다.',
                },
            });

            if (eventSwiper.autoplay.running) {
                $('.btn_eventControl').addClass('active');
            }

            $('.btn_eventControl').on({
                click: function (e) {
                    if (eventSwiper.autoplay.running) {
                        $(this).removeClass('active');
                        eventSwiper.autoplay.stop();
                    } else {
                        $(this).addClass('active');
                        eventSwiper.autoplay.start();
                    }
                }
            });
        
            $('.movie-chart-btn-wrap a').on({
                click:function(e){
                    var target = e.target;
                    $(target).addClass('active').parent('h3').siblings().children('a').removeClass('active');
                }
            });

            $('.specialHall_list a').on({
                mouseenter:function(e){
                    var target = e.target;
                    var idx = $(target).closest('li').index();

                    var arrimgUrl = ["https://img.cgv.co.kr//Front/Main/2021/1209/16390080561620.png","https://img.cgv.co.kr//Front/Main/2021/1130/16382612659930.png","https://img.cgv.co.kr//Front/Main/2021/1130/16382612660240.png","https://img.cgv.co.kr//Front/Main/2021/1130/16382612660560.png"];

                    $(target).closest('li').addClass('active').siblings('li').removeClass('active');
                    //$('.specialHall_link').attr('href', '') // 링크 주소 넣을 곳
                    $('.specialHall_link img').attr('src', arrimgUrl[idx]);
                    $('.specialHall_link img').attr('alt', $(target).children('strong').text());
                }
            });

            var movieSelectionVideoObj = $('.video_wrap video')[0];

            $('.video_wrap video').on({
                ended:function(){
                    $('.btn_movieSelection_playStop').removeClass('active');
                }
            })
            // movieSelectionVideoObj.onended = function(){
                
            // }

            $('.btn_movieSelection_playStop').on({
                click:function(){
                    if(movieSelectionVideoObj.paused){
                        movieSelectionVideoObj.play();
                        $(this).addClass('active');
                    }else{
                        movieSelectionVideoObj.pause();
                        $(this).removeClass('active');
                    }
                }
            });

            $('.btn_movieSelection_soundOnOff').on({
                click:function(){
                    if(movieSelectionVideoObj.muted){
                        movieSelectionVideoObj.muted = false;
                        $(this).addClass('active');
                    }else{
                        movieSelectionVideoObj.muted = true;
                        $(this).removeClass('active');
                    }
                }
            });

            var noticeClientBannerSwiper = new Swiper(".noticeClient_banner_list", {
                autoplay: {
                    delay: 2500,
                    disableOnInteraction:false,
                },
                slidesPerView: 1,
                spaceBetween: 0,
                loopFillGroupWithBlank: true,
            });

            if(noticeClientBannerSwiper.autoplay.running){
                $('.btn_noticeClientBannerControl').addClass('active');
            }

            $('.btn_noticeClientBannerControl').on({
                click:function(e){
                    if(noticeClientBannerSwiper.autoplay.running){
                        $(this).removeClass('active');
                        noticeClientBannerSwiper.autoplay.stop();
                    }else{
                        $(this).addClass('active');
                        noticeClientBannerSwiper.autoplay.start();
                    }
                } 
            });

            $.fn.openPopup = function( id ){
                var popObj = $('#' + id);

                popObj.parent('.pop_wrap').addClass('active');
                popObj.fadeIn();

                popObj.parent('.pop_wrap').on({
                    click:function(e){
                        if(e.target === e.currentTarget){
                            $.fn.closePopup();
                        }
                    }
                });
                popObj.find('.btn_close').on({
                    click:function(e){
                        $.fn.closePopup();
                    }
                });
            };

            $.fn.closePopup = function(){
                $('.pop_wrap').removeClass('active');
                $('.popup').fadeOut();
            };

            
        });
    </script>

</head>
<body class="block">
<jsp:include page="../default/user_header.jsp"></jsp:include>
    <!--본격 콘텐츠-->
    <div id="contaniner" style="height: 2366px" class="">
        <div id="contents" class="">
            <!-- 실컨텐츠 시작 -->
            <div class="wrap-movie-detail" id="select_main">
                <div class="tit-heading-wrap">
                    <h3 style="margin-top: 1%;">영화상세</h3>
                </div>
                <div class="sect-base-movie">
                    <h3>
                        <strong>극장판 주술회전 0</strong>
                        "기본정보"
                    </h3>
                    <div class="box-image">
                        <a href="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85603/85603_1000.jpg" title="포스터 크게 보기 새창" target="_blank">
                            <span class="thumb-image"> 
                                <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85603/85603_320.jpg" alt="극장판 주술회전 0 포스터 새창" onerror="errorImage(this)">
                                <span class="ico-posterdetail">포스터 크게 보기</span>
                                <span class="ico-grade grade-15"> 15세 이상</span>
                            </span>
                        </a>
                    </div>
                    <div class="box-contents">
                        <div class="title">
                            <strong>극장판 주술회전 0</strong>
                            <em class="round brown">
                                <span>예매중</span>
                            </em>
                            <p>Jujutsu Kaisen: Zero</p>
                        </div>
                        <div class="score">
                            <strong class="percent">
                                예매율&nbsp;
                                <span>20.1%</span>
                            </strong>
                        </div>
                        <div class="spec">
                            <dl>
                                <dt>감독 :&nbsp;</dt>
                                <dd>
                                    <a>박성후</a>
                                </dd>
                                <dd> </dd>
                                <dt>&nbsp;/ 배우 :&nbsp;</dt>
                                <dd class="on">
                                    <a>오가타 메구미</a>                                    
                                    ,&nbsp;
                                    <a>하나자와 카나</a>                                                       
                                    ,&nbsp;
                                    <a>코마츠 미카코</a>                                                      
                                    ,&nbsp;
                                    <a>우치야마 코우키</a>                                                       
                                    ,&nbsp;
                                    <a>세키 토모카즈</a>                                                       
                                    ,&nbsp;
                                    <a>나카무라 유이치</a>                                                        
                                    ,&nbsp;
                                    <a>사쿠라이 타카히로</a>
                                </dd>
                                <dt>장르 :&nbsp;애니메이션</dt>
                                <dd></dd>
                                <dt>&nbsp;/ 기본 :&nbsp;</dt>
                                <dd class="on">15세 이상,&nbsp;105분,&nbsp;일본</dd>
                                <dt>개봉 :&nbsp;</dt>
                                <dd class="on">2022.02.17</dd>
                            </dl>
                        </div>
                        <span class="like">
                            <a class="link-reservation" href="#">예매</a>
                        </span>
                    </div>
                </div>
                <div class="cols-content" id="menu">
                    <div class="col-detail">
                        <ul class="tab-menu">
                            <li class="on">
                                <a title="현재 선택됨" href="#" >주요정보 </a>
                            </li>
                            <li>
                                <a href="#">트레일러</a>
                            </li>
                            <li>
                                <a href="#">스틸컷</a>
                            </li>
                            <li>
                                <a href="#">평점/리뷰</a>
                            </li>
                            <li class="last">
                                <a href="#">상영시간표</a>
                            </li>
                        </ul>
                        <div class="sect-story-movie">
                            어릴 적 소꿉친구인 오리모토 리카를 교통사고로 눈앞에서 잃은 옷코츠 유타.<br>
                            <br>
                            <strong>“약속해, 리카와 유타는 어른이 되면 결혼하기로”</strong><br>
                            옷코츠는 원령으로 변한 리카의 저주에 괴로워한 나머지, 자신도 죽기를 바라지만 최강의 주술사인 고죠 사토루에 의해 주술고전에 들어가게 된다. 그리고 동급생인 젠인마키, 이누마키 토게, 판다를 만나면서 굳은 결심을 한다.<br>
                            <br>
                            <strong>“살아도 된다는 자신감이 필요해”<br>
                            “나는 주술고전에서 리카의 저주를 풀겠습니다”</strong><br>
                            한편, 옷코츠와 친구들 앞에 과거에 일반인을 대량으로 학살해서 고전에서 추방된 최악의 주저사인 게토 스구루가 나타난다.<br>
                            <br>
                            <strong>“12월 24일, 우리는 백귀야행을 결행한다”</strong><br>
                            주술사만의 낙원을 만들려는 게토는 비술사를 섬멸하겠다면서, 신주쿠와 교토에 천의 저주를 내리는데…과연 옷코츠는 게토를 막을 수 있을까? 그리고리카의 저주를 풀 수 있을까?
                        </div>
                        <!-- 연령별예매분포 -->
                        <div id="ctl00_PlaceHolderContent_Section_Chart" class="sect-graph sect-graph-emotion">
                            <ul class="graph">
                                <li>
                                    <strong>연령별 예매 분포</strong>
                                    <div id="jqplot_age" class="chart jqplot-target" style="position: relative;"><canvas width="401" height="192" class="jqplot-base-canvas" style="position: absolute; left: 0px; top: 0px;"></canvas><div class="jqplot-title" style="height: 0px; width: 0px;">
                                        <canvas width="401" height="192" class="jqplot-base-canvas" style="position: absolute; left: 0px; top: 0px;"></canvas>
                                        <div class="jqplot-title" style="height: 0px; width: 0px;"></div>
                                        <div class="jqplot-axis jqplot-xaxis" style="position: absolute; width: 401px; height: 15px; left: 0px; bottom: 0px;">
                                            <div class="jqplot-xaxis-tick" style="position: absolute; font-size: 12px; left: 36.1px;">10대</div>
                                            <div class="jqplot-xaxis-tick" style="position: absolute; font-size: 12px; left: 112.3px;">20대</div>
                                            <div class="jqplot-xaxis-tick" style="position: absolute; font-size: 12px; left: 188.5px;">30대</div>
                                            <div class="jqplot-xaxis-tick" style="position: absolute; font-size: 12px; left: 264.7px;">40대</div>
                                            <div class="jqplot-xaxis-tick" style="position: absolute; font-size: 12px; left: 340.9px;">50대</div>
                                        </div>
                                        <div class="jqplot-axis jqplot-yaxis" style="position: absolute; height: 192px; width: 0px; left: 0px; top: 0px;"></div>
                                        <canvas width="401" height="192" class="jqplot-grid-canvas" style="position: absolute; left: 0px; top: 0px;"></canvas>
                                        <canvas width="381" height="157" class="jqplot-series-shadowCanvas" style="position: absolute; left: 10px; display: block; top: 10px;"></canvas>
                                        <canvas width="381" height="157" class="jqplot-series-canvas" style="position: absolute; left: 10px; display: block; top: 10px;"></canvas>
                                        <div class="jqplot-point-label jqplot-series-0 jqplot-point-4" style="position: absolute; left: 349.9px; top: 130.683px; display: block;">7</div>
                                        <div class="jqplot-point-label jqplot-series-0 jqplot-point-3" style="position: absolute; left: 271.2px; top: 122.833px; display: block;">10</div>
                                        <div class="jqplot-point-label jqplot-series-0 jqplot-point-2" style="position: absolute; left: 190.5px; top: 111.058px; display: block;">14.5</div>
                                        <div class="jqplot-point-label jqplot-series-0 jqplot-point-1" style="position: absolute; left: 114.3px; top: 25.4933px; display: block;">47.2</div>
                                        <div class="jqplot-point-label jqplot-series-0 jqplot-point-0" style="position: absolute; left: 38.1px; top: 93.265px; display: block;">21.3</div>
                                        <canvas width="381" height="157" class="jqplot-barRenderer-highlight-canvas" style="position: absolute; left: 10px; top: 10px;"></canvas>
                                        <canvas width="381" height="157" class="jqplot-event-canvas" style="position: absolute; left: 10px; top: 10px;"></canvas>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div id="ctl00_PlaceHolderContent_Section_Trailer" class="sect-trailer">
                            <div class="heading">
                                <h4>트레일러</h4>
                                <span id="ctl00_PlaceHolderContent_TrailerTotalCount" class="count">3건</span>
                                <a class="link-more" href="####">더보기</a>
                            </div>
                            <ul>
                                <!-- 사진 동영상 조회 -->
                                <li>
                                    <div class="box-image">
                                        <a href="#" title="새창" class="movie_player_popup" data-gallery-idx="200013">
                                            <span class="thumb-image">
                                                <img src="https://img.cgv.co.kr/Movie/Thumbnail/Trailer/85603/85603200013_1024.jpg" alt="[극장판 주술회전 0]2차 예고편" onerror="errorImage(this, {'type':'landscape'})">
                                                <span class="ico-play">영상보기</span>
                                            </span>
                                        </a>
                                    </div>
                                    <div class="box-contents">
                                        <a href="#" title="새창" class="movie_player_popup" data-gallery-idx="200013">
                                            <strong class="title">
                                                <span class="ico-trailer hd">HD</span>
                                                2차 예고편
                                            </strong>
                                        </a>
                                        <span class="txt-info">2022.02.03</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="box-image">
                                        <a href="#" title="새창" class="movie_player_popup" data-gallery-idx="200013">
                                            <span class="thumb-image">
                                                <img src="https://img.cgv.co.kr/Movie/Thumbnail/Trailer/85603/85603199812_1024.jpg" alt="[극장판 주술회전 0]런칭 예고편" onerror="errorImage(this, {'type':'landscape'})">
                                                <span class="ico-play">영상보기</span>
                                            </span>
                                        </a>
                                    </div>
                                    <div class="box-contents">
                                        <a href="#" title="새창" class="movie_player_popup" data-gallery-idx="200013">
                                            <strong class="title">
                                                <span class="ico-trailer hd">HD</span>
                                                런칭 예고편
                                            </strong>
                                        </a>
                                        <span class="txt-info">2022.01.24</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="box-image">
                                        <a href="#" title="새창" class="movie_player_popup" data-gallery-idx="200013">
                                            <span class="thumb-image">
                                                <img src="https://img.cgv.co.kr/Movie/Thumbnail/Trailer/85603/85603199777_1024.jpg" alt="[극장판 주술회전 0]1차 예고편" onerror="errorImage(this, {'type':'landscape'})">
                                                <span class="ico-play">영상보기</span>
                                            </span>
                                        </a>
                                    </div>
                                    <div class="box-contents">
                                        <a href="#" title="새창" class="movie_player_popup" data-gallery-idx="200013">
                                            <strong class="title">
                                                <span class="ico-trailer hd">HD</span>
                                                1차 예고편
                                            </strong>
                                        </a>
                                        <span class="txt-info">2022.01.21</span>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div id="ctl00_PlaceHolderContent_Section_Still_Cut" class="sect-stillcut">
                            <div class="heading">
                                <h4>스틸컷</h4>
                                <span id="val" class="count">
                                    <!-- <strong id="stillcut_current">1</strong> -->
                                </span>
                                <span>
                                    건
                                </span>
                                <a class="link-more" href="##">더보기</a>
                            </div>
                            <div>
                                <div id="slider-wrap"  style="overflow: hidden;" class="swiper-container">
                                    <div class="swiper-wrapper" style=" margin-left: 37px;">
                                        <div class="swiper-slide">
                                            <img data-src="https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000085/85603/85603200094_727.jpg" alt="극장판 주술회전 0" onerror="errorImage(this)" src="https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000085/85603/85603200094_727.jpg" style="margin-top: 23px;">
                                        </div>
                                        <div class="swiper-slide">
                                            <img data-src="https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000085/85603/85603200093_727.jpg" alt="극장판 주술회전 0" onerror="errorImage(this)" src="https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000085/85603/85603200093_727.jpg" style="margin-top: 23px;">
                                        </div>
                                        <div class="swiper-slide">
                                            <img data-src="https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000085/85603/85603200092_727.jpg" alt="극장판 주술회전 0" onerror="errorImage(this)" src="https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000085/85603/85603200092_727.jpg" style="margin-top: 23px;">
                                        </div>
                                        <div class="swiper-slide">
                                            <img data-src="https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000085/85603/85603200091_727.jpg" alt="극장판 주술회전 0" onerror="errorImage(this)" src="https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000085/85603/85603200091_727.jpg" style="margin-top: 23px;">
                                        </div>
                                        <div class="swiper-slide">
                                            <img data-src="https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000085/85603/85603200090_727.jpg" alt="극장판 주술회전 0" onerror="errorImage(this)" src="https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000085/85603/85603200090_727.jpg" style="margin-top: 23px;">
                                        </div>

                                        <!-- div class="swiper-slide" 갯수를 세는 js -->
                                        <script>
                                            var num = $('.swiper-slide').length
                                            const val = document.getElementById("val")
                                            val.innerHTML = num;    
                                        </script>
                                     
                                    </div>                
                                </div>
                                <div class="swiper-button-prev" style="
                                padding-top: 90%;" ></div>
                                <div class="swiper-button-next"  style="
                                padding-top: 90%;"></div>                             
                            </div>                          
                            <script>
                                var swiper = new Swiper(".swiper-container", {
                                    //반복 기능 true 사용가능 false 사용불가
                                    loop : true,
                                    navigation: {
                                        nextEl: ".swiper-button-next",
                                        prevEl: ".swiper-button-prev",
                                  }
                                });
                            </script>
                        </div>
                    </div>
                </div>
     
            </div>
      
        </div>
        
    </div>
	<jsp:include page="../default/user_footer.jsp"></jsp:include>
</body>

</html>