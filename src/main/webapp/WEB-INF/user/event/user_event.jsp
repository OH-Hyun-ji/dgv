<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user_event.css">
  <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css">
  <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"crossorigin="anonymous"></script>

</head>

<body class="block">
<jsp:include page="../default/user_header.jsp"></jsp:include>
  <!--본격 콘텐츠-->
  <div id="contaniner" style="height: 1100px" class="">
    <!-- Contents Area -->
		<div id="contents" class="">
      <!-- Contents Start -->
      <div class="tit-heading-wrap tit-evt">
        <h3>EVENT</h3>
      </div>
      <!--이벤트 컨텐츠 메뉴/////////////////////////////////////////////////////////////////////////////////////////////-->
      <div class="evt-nav-area">
        <ul class="evt-tab-menu">
          <li><a href="/culture-event/event/defaultNew.aspx?mCode=001" title="" class="on">SPECIAL</a></li>
          <li><a href="/culture-event/event/defaultNew.aspx?mCode=004" title="" class="">영화/예매</a></li>
          <li><a href="/culture-event/event/defaultNew.aspx?mCode=008" title="" class="">멤버십/CLUB</a></li>
        <li><a href="/culture-event/event/defaultNew.aspx?mCode=005" title="" class="">CGV 극장별</a></li>
        <li><a href="/culture-event/event/defaultNew.aspx?mCode=006" title="" class="">제휴/할인</a></li>
        </ul>
        <div class="submenu">
          <a href="/user/mycgv/event/result_list.aspx" class="round red on"><i>당첨자 발표</i></a>
          <a href="/culture-event/event/end-list.aspx" class="round red on"><i>종료된 이벤트</i></a>
        </div>
        <div class="evt-select-area"></div>
        <div class="cols-content">
          <div class="col-detail event">
            <ul class="sect-evt-item-list">
              <li>
                <a id="tile_0" href="#">
                  <div class="evt-thumb">
                    <img src="https://img.cgv.co.kr/WebApp/contents/eventV4/34022/16450753700990.jpg" alt="개봉작 사용설명서">
                  </div>
                  <div class="evt-desc">
                    <p class="txt1">개봉작 사용설명서</p>
                    <p class="txt2"></p>
                  </div>
                </a>
              </li>
              <li>
                <a id="tile_1" href="#">
                  <div class="evt-thumb">
                    <img src="https://img.cgv.co.kr/WebApp/contents/eventV4/34046/16451515365430.jpg" alt="[극장판 주술회전 0]CGV 필름마크">
                  </div>
                  <div class="evt-desc">
                    <p class="txt1">[극장판 주술회전 0]CGV 필름마크</p>
                    <p class="txt2">2022.02.18~2022.03.06</p>
                  </div>
                </a>
              </li>
              <li>
                <a id="tile_2" href="#">
                  <div class="evt-thumb">
                    <img src="https://img.cgv.co.kr/WebApp/contents/eventV4/33839/16425473374760.jpg"
                      alt="[CGV NFT 플레이 포스터] No.1 킹메이커">
                  </div>
                  <div class="evt-desc">
                    <p class="txt1">[CGV NFT 플레이 포스터] No.1 킹메이커</p>
                    <p class="txt2">2022.01.19~2022.02.27
                      <span> . </span>
                      <em>D-7</em>
                    </p>
                  </div>
                </a>
              </li>
              <li>
                <a id="tile_1" href="#">
                  <div class="evt-thumb">
                    <img src="https://img.cgv.co.kr/WebApp/contents/eventV4/34046/16451515365430.jpg" alt="[극장판 주술회전 0]CGV 필름마크">
                  </div>
                  <div class="evt-desc">
                    <p class="txt1">[극장판 주술회전 0]CGV 필름마크</p>
                    <p class="txt2">2022.02.18~2022.03.06</p>
                  </div>
                </a>
              </li>
              <li>
                <a id="tile_1" href="#">
                  <div class="evt-thumb">
                    <img src="https://img.cgv.co.kr/WebApp/contents/eventV4/34046/16451515365430.jpg" alt="[극장판 주술회전 0]CGV 필름마크">
                  </div>
                  <div class="evt-desc">
                    <p class="txt1">[극장판 주술회전 0]CGV 필름마크</p>
                    <p class="txt2">2022.02.18~2022.03.06</p>
                  </div>
                </a>
              </li>
              <li>
                <a id="tile_1" href="#">
                  <div class="evt-thumb">
                    <img src="https://img.cgv.co.kr/WebApp/contents/eventV4/34046/16451515365430.jpg" alt="[극장판 주술회전 0]CGV 필름마크">
                  </div>
                  <div class="evt-desc">
                    <p class="txt1">[극장판 주술회전 0]CGV 필름마크</p>
                    <p class="txt2">2022.02.18~2022.03.06</p>
                  </div>
                </a>
              </li>
              <li>
                <a id="tile_1" href="#">
                  <div class="evt-thumb">
                    <img src="https://img.cgv.co.kr/WebApp/contents/eventV4/34046/16451515365430.jpg" alt="[극장판 주술회전 0]CGV 필름마크">
                  </div>
                  <div class="evt-desc">
                    <p class="txt1">[극장판 주술회전 0]CGV 필름마크</p>
                    <p class="txt2">2022.02.18~2022.03.06</p>
                  </div>
                </a>
              </li>
              <li>
                <a id="tile_1" href="#">
                  <div class="evt-thumb">
                    <img src="https://img.cgv.co.kr/WebApp/contents/eventV4/34046/16451515365430.jpg" alt="[극장판 주술회전 0]CGV 필름마크">
                  </div>
                  <div class="evt-desc">
                    <p class="txt1">[극장판 주술회전 0]CGV 필름마크</p>
                    <p class="txt2">2022.02.18~2022.03.06</p>
                  </div>
                </a>
              </li>
              <li>
                <a id="tile_1" href="#">
                  <div class="evt-thumb">
                    <img src="https://img.cgv.co.kr/WebApp/contents/eventV4/34046/16451515365430.jpg" alt="[극장판 주술회전 0]CGV 필름마크">
                  </div>
                  <div class="evt-desc">
                    <p class="txt1">[극장판 주술회전 0]CGV 필름마크</p>
                    <p class="txt2">2022.02.18~2022.03.06</p>
                  </div>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
 <jsp:include page="../default/user_footer.jsp"></jsp:include>
</body>
</html>