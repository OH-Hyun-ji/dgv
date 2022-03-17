<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<div class="header">
	<div class="header_content">
		<div class="contents">
			<h1>
				<!-- 상단 로고와 사이드 로고 -->
				<a href="/dgvMain.do">
					<img src="${pageContext.request.contextPath }/resources/images/dgvMainLogo.png" style="width: 82%;">
				</a>
				<span id="sideLogo">CULTUREPLEX</span>
			</h1>
			<!-- 상단 우측 아이콘 메뉴 -->
			<ul class="memberInfo_wrap">
<!-- ///////////////////////////////////////////// -->
				<c:if test="${empty userID}">
					<li>
	                     <span>
	                     	<a href="/loginForm.do" title="로그인">
							  <i id="a" style="padding-left: 9px;" class="fas fa-lock"></i>
							  <span id="main1" class="modiImg1">로그인</span>
							</a>
	                     </span>
               		 </li>
	               </c:if>	               
	                <c:if test="${!empty userID}">
	                  	<li id="user-id-style" style="width: 107px;padding-right: 35px;">	
	                     <span><a style="width: 100%;font-weight: bold;box-sizing: border-box;padding-top: 7%;color: lightcoral;text-align: center;border-bottom: 1px solid;padding-bottom: 2px;font-size: 18px;" href="/logout.do">${userID}님<br> Logout</a></span>
		                </li>
	                </c:if>
<!-- ///////////////////////////////////////////// -->
				<li>
					<a href="/join.do"> 
						<i id="a" class="fas fa-portrait" style="padding-left: 5px;;height: 31px;margin-bottom: 2px;"></i> 
						<span id="main1">회원가입</span>
					</a>
				</li>
<!-- ///////////////////////////////////////////// -->				
				<li>
					<c:if test="${empty userID}">
						<a href="/loginForm.do"> 
							<i id="a" class="fas fa-user-alt" style="padding-left: 4%;"></i> 
							<span id="main1">MY DGV</span>
						</a>
					</c:if>
					<c:if test="${!empty userID}">
						<a href="/myPage.do"> 
							<i id="a" class="fas fa-user-alt" style="padding-left: 4%;"></i> 
							<span id="main1">MY DGV</span>
						</a>
					</c:if>
				</li>
<!-- ///////////////////////////////////////////// -->
				<li>
					<a href="/serviceCenter.do"> 
						<i id="a" class="fas fa-hand-holding-heart" style="padding-left: 5%;; height: 35px;width: 48%;margin-bottom: -1px;"></i> 
						<span id="main1">고객센터</span>
					</a>
				</li>
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
				<a href="#" tabindex="-1"> </a>
			</h1>
			<ul class="nav-item">
				<li>
					<h2>
						<a class="btn-fix" href="/movieChart.do">영화</a>
					</h2>
					<dl class="nav_overMenu">
						<dt>
							<h2>
								<a href="/movieChart.do" tabindex="-1">영화</a>
							</h2>
						</dt>
						<dd>
							<h2>
								<a href="/movieChart.do">영화목록</a>
							</h2>
						</dd>
						<dd>
							<h2>
								<a href="/artHouse.do">아트하우스</a>
							</h2>
						</dd>
					</dl>
				</li>
				<li>
					<h2>
						<a href="/theater.do">극장</a>
					</h2>
					<dl class="nav_overMenu" style="display: none;">
						<dt>
							<h2>
								<a href="/theater.do">극장</a>
							</h2>
						</dt>
						<dd>
							<h2>
								<a href="/theater.do">DGV 극장</a>
							</h2>
						</dd>
					</dl>
				</li>
				<li>
					<h2>
						<a href="/movieReserve.do">예매</a>
					</h2>
					<dl class="nav_overMenu" style="display: none;">
						<dt>
							<h2>
								<a href="/movieReserve.do">예매</a>
							</h2>
						</dt>
						<dd>
							<h2>
								<a href="/movieReserve.do">빠른예매</a>
							</h2>
						</dd>					
					</dl>
				</li>
				<li>
					<h2>
						<a href="/board.do">커뮤니티</a>
					</h2>
					<dl class="nav_overMenu" style="display: none;">
						<dt>
							<h2>
								<a href="/board.do">커뮤니티</a>
							</h2>
						</dt>
						<dd>
							<h2>
								<a href="/board.do">속닥속닥 DGV</a>
							</h2>
						</dd>
						<dd>
							<h2>
								<a href="/review.do">모두의 Review</a>
							</h2>
						</dd>
					</dl>
				</li>
				<li>
					<h2>
						<a href="/event.do">이벤트</a>
					</h2>
					<dl class="nav_overMenu" style="display: none;">
						<dt>
							<h2>
								<a href="/event.do">이벤트</a>
							</h2>
						</dt>
						<dd>
							<h2>
								<a href="#">DGV 극장별</a>
							</h2>
						</dd>
						<dd>
							<h2>
								<a href="/eventWinner.do">당첨자 발표</a>
							</h2>
						</dd>
						<dd>
							<h2>
								<a href="/eventEnd.do">종료된 이벤트</a>
							</h2>
						</dd>
					</dl>
				</li>
			</ul>
		</div>
	</div>
</div>
<!-- header close-->
