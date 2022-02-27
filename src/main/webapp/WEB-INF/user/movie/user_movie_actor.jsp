<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
              <strong>로버트 패틴슨</strong>
              기본정보
            </h3>
            <div class="box-image">
              <a href="http://image.cine21.com/resize/cine21/still/2018/1217/14_44_09__5c1737a9d793c[X120,150].jpg" target="_blank">
                <span class="thumb-image">
                  <img src="http://image.cine21.com/resize/cine21/still/2018/1217/14_44_09__5c1737a9d793c[X120,150].jpg" alt="로버트 패틴슨" onerror="errorImage(this, {'type':'peoplelarge'})">
                </span>
              </a>
            </div>
            <div class="box-contents">
              <div class="title">
                <strong>로버트 패틴슨</strong>
                <p>Robert Pattinson</p>
              </div>
              <div class="spec">
                <dl>
                  <dt>출생</dt><dd>1986.05.13</dd>
                  <dt>국적</dt><dd>영국</dd>
                  <dt>직업</dt><dd>배우</dd>
                </dl>
              </div>
            </div>
          </div>
        </div>
        <!-- .sect-base-people -->
        <div class="sect-story-people">
          <strong>바이오그래피</strong>
          <p>국내에서는 [해리포터와 불의잔]에서 캐드릭 디고리 역을 맡아 가장 눈에 띄는 연기를 보였던 ‘로버트 패틴슨’은 1986년 생 영국 출신 배우이다.<br>
            못하는 스포츠가 없을 정도로 만능 스포츠맨인 그는 풋볼, 스키, 스노우보드 등 각종 스포츠 경기에 참가하여 취미 활동이라고는 생각할 수 없을 정도로 완벽한 실력을 선보여 주변인을 깜짝 놀라게 했다.<br>
            [트와일라잇]의 절대매력 뱀파이어 ‘에드워드’ 역으로 전세계 소녀 팬들의 사랑을 한 몸에 받은 그는19살때 [해리포터와 불의 잔]의 출연으로 영화 관계자들의 관심을 끌었다. 또한 음악적으로도 남다른 재능을 갖고 있어, 
            기타와 키보드 연주를 통해 음악에 대한 열정을 드러냈으며 영화 [트와일라잇]의 O.S.T.에도 참여하여 큰 이슈가 되기도 하였다. [트와일라잇] 단 한편으로 전세계 하이틴 스타로 군림한 그는 최근에는 연극 무대에 참여하는 등 
            다양한 방면으로 자신의 경력을 쌓고 있는 욕심 많은 연기자이다.
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
                <li>
                  <div class="box-image">
                    <a href="#">
                      <span class="thumb-image">
                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85632/85632_185.jpg" alt="더 배트맨 포스터">
                        <span class="ico-grade grade-15">15세 이상</span>
                      </span>
                    </a>
                  </div>
                  <div class="box-contents">
                    <a href="">
                      <strong>
                        더 배트맨
                        <span>2021    </span>
                      </strong>
                    </a>
                  </div>
                </li>
                <li>
                  <div class="box-image">
                    <a href="#">
                      <span class="thumb-image">
                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85632/85632_185.jpg" alt="더 배트맨 포스터">
                        <span class="ico-grade grade-15">15세 이상</span>
                      </span>
                    </a>
                  </div>
                  <div class="box-contents">
                    <a href="">
                      <strong>
                        더 배트맨
                        <span>2021    </span>
                      </strong>
                    </a>
                  </div>
                </li>
                <li>
                  <div class="box-image">
                    <a href="#">
                      <span class="thumb-image">
                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85632/85632_185.jpg" alt="더 배트맨 포스터">
                        <span class="ico-grade grade-15">15세 이상</span>
                      </span>
                    </a>
                  </div>
                  <div class="box-contents">
                    <a href="">
                      <strong>
                        더 배트맨
                        <span>2021    </span>
                      </strong>
                    </a>
                  </div>
                </li>
                <li>
                  <div class="box-image">
                    <a href="#">
                      <span class="thumb-image">
                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85632/85632_185.jpg" alt="더 배트맨 포스터">
                        <span class="ico-grade grade-15">15세 이상</span>
                      </span>
                    </a>
                  </div>
                  <div class="box-contents">
                    <a href="">
                      <strong>
                        더 배트맨
                        <span>2021    </span>
                      </strong>
                    </a>
                  </div>
                </li>
                <li>
                  <div class="box-image">
                    <a href="#">
                      <span class="thumb-image">
                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85632/85632_185.jpg" alt="더 배트맨 포스터">
                        <span class="ico-grade grade-15">15세 이상</span>
                      </span>
                    </a>
                  </div>
                  <div class="box-contents">
                    <a href="">
                      <strong>
                        더 배트맨
                        <span>2021    </span>
                      </strong>
                    </a>
                  </div>
                </li>
                <li>
                  <div class="box-image">
                    <a href="#">
                      <span class="thumb-image">
                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85632/85632_185.jpg" alt="더 배트맨 포스터">
                        <span class="ico-grade grade-15">15세 이상</span>
                      </span>
                    </a>
                  </div>
                  <div class="box-contents">
                    <a href="">
                      <strong>
                        더 배트맨
                        <span>2021    </span>
                      </strong>
                    </a>
                  </div>
                </li>
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