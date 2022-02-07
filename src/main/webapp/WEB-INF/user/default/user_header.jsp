<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="header">
	<div class="header_content">
		<div class="contents">
			<h1>
				<!-- 상단 로고와 사이드 로고 -->
				<a><img
					src="${pageContext.request.contextPath }/resources/images/7.png"></a>
				<span id="sideLogo">CULTUREPLEX</span>
			</h1>
			<!-- 상단 우측 아이콘 메뉴 -->
			<ul class="memberInfo_wrap">
				<li><a href="#" title="로그인"> <i id="a" class="fas fa-lock"></i>
						<span id="main1" class="modiImg1">로그인</span>
				</a></li>
				<li><a href="#"> <i id="a" class="fas fa-portrait"></i> <span
						id="main1">회원가입</span>
				</a></li>
				<li><a href="#"> <i id="a" class="fas fa-user-alt"></i> <span
						id="main1">MY DGV</span>
				</a></li>
				<li><a href="#"> <i id="a"
						class="fas fa-hand-holding-heart"></i> <span id="main1">고객센터</span>
				</a></li>
			</ul>
		</div>
	</div>
	<!-- 자바 스크립트 -->
	<script type="text/javascript">
            $(document).ready(function () {
                $('.nav-item > li > h2 > a').on({
                    mouseenter: function (e) {
                        var target = e.target;
                        $(target).parents('.nav-item').find('.nav_overMenu').slideDown(function () {

                        });
                    },
                    click: function (e) {
                        var target = e.target;
                        if (!$('.nav').hasClass('active')) {
                            $(this).trigger('mouseenter');
                        } else {
                            $('.nav').trigger('mouseleave');
                        }
                    }
                });
                $('.nav').on({
                    mouseleave: function (e) {
                        $(this).find('.nav_overMenu').slideUp(200, function () {
                            $('.nav').removeClass('active');
                        });
                    }
                });
                $(this).on({
                    scroll: function (e) {
                        /* S GNB fixed */
                        var headerOffsetT = $('.header').offset().top;
                        var headerOuterH = $('.header').outerHeight(true);
                        var fixedHeaderPosY = headerOffsetT + headerOuterH;
                        var scrollT = $(this).scrollTop();
                        var scrollL = $(this).scrollLeft();

                        if (scrollT >= fixedHeaderPosY) {
                            $('.nav').addClass('fixed');
                            $('.fixedBtn_wrap').addClass('topBtn');
                        } else {
                            $('.nav').removeClass('fixed');
                            $('.fixedBtn_wrap').removeClass('topBtn');
                        }
                        /* S > GNB fixed 좌우 스크롤
                        Description
                        - GNB가 fixed 되었을때 좌우 스크롤 되게 처리
                        */
                        if ($('.nav').hasClass('fixed')) {
                            $('.nav').css({ 'left': -1 * scrollL })
                        } else {
                            $('.nav').css({ 'left': 0 })
                        }
                        /* E > GNB fixed 좌우 스크롤 */
                        /* S GNB fixed */
                    }
             });            
            });
        </script>
	<!-- 상단 메뉴 바(메뉴 목록 수정필요) -->
	<div class="nav">
		<div class="contents" style="left: 0px;">
			<h1>
				<a href="#" tabindex="-1"> <img
					src="${pageContext.request.contextPath }/resources/images/logoWhite.png">
				</a>
			</h1>
			<ul class="nav-item">
				<li>
					<h2>
						<a class="btn-fix" href="#">영화</a>
					</h2>
					<dl class="nav_overMenu">
						<dt>
							<h2>
								<a href="#" tabindex="-1">영화</a>
							</h2>
						</dt>
						<dd>
							<h2>
								<a href="#">무비차트</a>
							</h2>
						</dd>
						<dd>
							<h2>
								<a href="#">아트하우스</a>
							</h2>
						</dd>
					</dl>
				</li>

				<li>
					<h2>
						<a href="#">극장</a>
					</h2>
					<dl class="nav_overMenu" style="display: none;">
						<dt>
							<h2>
								<a href="#">영화</a>
							</h2>
						</dt>
						<dd>
							<h2>
								<a href="#">무비차트</a>
							</h2>
						</dd>
						<dd>
							<h2>
								<a href="#">아트하우스</a>
							</h2>
						</dd>
					</dl>
				</li>
				<li>
					<h2>
						<a href="#">예매</a>
					</h2>
					<dl class="nav_overMenu" style="display: none;">
						<dt>
							<h2>
								<a href="#">영화</a>
							</h2>
						</dt>
						<dd>
							<h2>
								<a href="#">무비차트</a>
							</h2>
						</dd>
						<dd>
							<h2>
								<a href="#">아트하우스</a>
							</h2>
						</dd>
					</dl>
				</li>
				<li>
					<h2>
						<a href="#">스토어</a>
					</h2>
					<dl class="nav_overMenu" style="display: none;">
						<dt>
							<h2>
								<a href="#">영화</a>
							</h2>
						</dt>
						<dd>
							<h2>
								<a href="#">무비차트</a>
							</h2>
						</dd>
						<dd>
							<h2>
								<a href="#">아트하우스</a>
							</h2>
						</dd>
					</dl>
				</li>
				<li>
					<h2>
						<a href="#">이벤트</a>
					</h2>
					<dl class="nav_overMenu" style="display: none;">
						<dt>
							<h2>
								<a href="#">영화</a>
							</h2>
						</dt>
						<dd>
							<h2>
								<a href="#">무비차트</a>
							</h2>
						</dd>
						<dd>
							<h2>
								<a href="#">아트하우스</a>
							</h2>
						</dd>
					</dl>
				</li>
			</ul>
		</div>
	</div>
</div>
<!-- header close-->
