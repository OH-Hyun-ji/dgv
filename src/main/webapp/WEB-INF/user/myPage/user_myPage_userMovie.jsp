<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 본 영화</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
  <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css" />
  <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user_myPage_userMovie.css" />

</head>

<body class="block">
<jsp:include page="../default/user_header.jsp"></jsp:include>
  <!--본격 콘텐츠-->
  <div id="contaniner" style="height: 1200px" class="">
    <!-- Contents Area -->
    <div id="contents" class="">
      <!-- Contents Start -->
      <input type="hidden" id="isIPIN" name="isIPIN" value="noxK/LjPTJnWBhukxlDDeXOQHKqEc9kPhFOzZEcTD7FNw/rihnlu/7MQFLJW4gHsCFWpuwyol2yszuCsnPkf0A==">
      <div id="dev2014">
        <div class="cols-content" style="width: auto;">
          <div class="col-aside">
            <h2>프로필 및 서브메뉴</h2>
            <div class="box-round-dgray">
              <div class="box-round-inner">
                <div class="inner-contents-profile">
                  <div class="box-image">
                    <div class="thumb-image">
                      <img src="http://img.cgv.co.kr/R2014/images/common/default_profile.gif" alt="윤호영님 프로필 사진" onerror="errorImage(this, {type:'profile'})">
                      <span class="profile-mask"></span>
                    </div>
                  </div>
                  <div class="box-contents">
                    <strong>윤호영님</strong>
                    <a id="go_edit_page" href="#" class="edit" target="_blank" title="새창열림">나의 정보 변경</a>
                    <em></em>
                  </div>
                </div>
              </div>
            </div>
            <div class="box-round-wgray">
              <div class="box-round-inner">
                <div class="inner-contents-log">
                  <a href="/user/movielog/default.aspx">
                    <em>1</em>
                    <strong>기대되는 영화</strong>
                  </a>
                </div>
              </div>
            </div>
            <div class="box-round-on">
              <div class="box-round-inner">
                <div class="inner-contents-log">
                  <a href="/user/movielog/default.aspx">
                    <em>30</em>
                    <strong>내가 본 영화</strong>
                  </a>
                </div>
              </div>
            </div>
            <div class="box-round-wgray">
              <div class="box-round-inner">
                  <div class="inner-contents-log">
                      <a href="/movies/point/my-list.aspx">
                          <em>0</em>
                          <strong>내가 쓴 평점</strong>
                      </a>
                  </div>
              </div>
            </div>
          </div>

          <div class="col-detail">
            <div class="movielog-detail-wrap">
              <!-- Title & Button Combo -->
              <form id="form1" method="get" novalidate="novalidate">
                <div class="tit-mycgv">
                  <h3>내가 본 영화</h3>
                  <p><em>30건</em></p>
                  <div class="set-combo">
                    <label for="year">내가 본 영화 년도별 정렬</label>
                    <select id="year" name="year">      
                      <option value="" selected="selected">전체</option>
                      <option value="2016">2016</option>
                      <option value="2017">2017</option>
                      <option value="2018">2018</option>
                      <option value="2019">2019</option>
                      <option value="2020">2020</option>
                      <option value="2021">2021</option>
                    </select>
                    <button type="submit" class="round gray">
                      <span>GO</span>
                    </button>
                  </div>
                </div>
              </form>
              <!-- 내가 본 영화 리스트 -->
              <div class="sect-movielog-lst">
                <ul id="watched_list_container">
                  <li class="movie_info_82012">
                    <div class="article-movie-info">
                      <div class="box-image">
                        <a id="phototicket_popup_82012" title="포스터 크게 보기" href="#">
                          <span class="thumb-image"> 
                            <img alt="엑시트 포스터" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000082/82012/82012_185.jpg" onerror="errorImage(this)">
                            <span class="ico-grade grade-12">12세 이상</span>
                            <i></i>
                          </span>
                        </a>
                      </div>
                      <div class="box-contents">
                        <div class="title">
                          <a href="#">
                            <strong id="strong_82012">엑시트</strong>
                          </a>
                          <p>EXIT</p>
                        </div>
                        <p class="date">2019.08.11 (일) 13:00 ~ 14:53</p>
                        <p class="theater">CGV수유 6관 6층 / 2명</p>
                        <ul class="writerinfo" id="wid_390047546">
                          <li class="writer-opinion">
                            <a class="link-gradewrite" id="wIdx_390047546" href="javascript:void(0);" data-movieidx="82012" data-movietitle="엑시트">이 영화를 평가해주세요</a>
                          </li>
                        </ul>
                      </div>
                      <button type="button" data="390047546" class="btn-del">
                      	<img src="https://img.cgv.co.kr/R2014/images/common/btn/btn_del.gif" alt="엑시트 삭제">
                      </button>
                    </div>
                  </li>
                  
                </ul>
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