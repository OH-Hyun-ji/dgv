<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 	<link>
 	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>	
<script type="text/javascript">

	var userId = "${userEmail}"
	$(function(){
		console.log("아이디 : "+ userId)

	})
</script>
<!DOCTYPE html>
<div class="myPage-sect-common">
	<div class="mydgv-info-wrap">
		<div class="sect-person-info">
			<div class="myPage-title-box">
				<h2 class="myPage-top" style="cursor: default;">My Dgv</h2>
				<c:if test="${userImg == '0' }">
					<img
						src="${pageContext.request.contextPath }/resources/images/default_profile.gif" />
				</c:if>
				<c:if test="${userImg != '0'  }">
					<img src=" ${userImg}" />
				</c:if>
			</div>
			<div class="myPage-box-contents  newtype">
				<div class="person-info">
					<strong style="cursor: default;">${userID}님</strong> <em style="cursor: default;">${userEmail}</em>
					<div class="page-style">
						<button id="myPage-change-info" type="button"
							onclick="location.href='/myPage_checkData.do'" title="새창열림">나의 정보 변경</button>							
						<button id="myCouponList" onclick="location.href='myPage_coupon.do'">나의 쿠폰 목록</button>	
					</div>
				</div>
				<div class="myPage-benefit-info"  style="width: 188px; padding-top: 141px;">
					<div class="myPage-coupon">
						<div class="myPage-coupon-count">
							<strong style="cursor: default;">보유한 할인쿠폰</strong> 
								<span style="cursor: default;">
									<c:if test="${couponCount == '0'  }">
										<em style="cursor: default;">없음</em>
									</c:if>
									<c:if test="${couponCount != '0'  }">
										<em style="cursor: default;">${couponCount}</em>개
									</c:if>								
								</span>
						</div>
					</div>
				</div>
				<div class="myPage-grade-info">
					<div class="myPage-grade-title">
						<span style="cursor: default;">MY GRADE</span>
					</div>
					<div class="myPage-info-box"
						style="display: grid; text-align: center;">
						<div class="userRank-img">
							<c:if test="${rankImg  !='0'}">
								<img style="width: 66px;" src="${rankImg}" />
							</c:if>
							<c:if test="${rankImg == '0' }">
								<p>등급이 없습니다.</p>
							</c:if>
						</div>
						<div class="userRank-name" style="text-align: -webkit-center;">
							<p
								style="font-weight: bolder; background-color: #8869b1;; color: ghostwhite; width: 100px; border-radius: 8px; border: 4px solid #fefefeb0;cursor: default;">${rankName}</p>
						</div>
					</div>
					<button type="button" id="myPage-view_usergrade"
						class="myPage-round black">
						<span style="cursor: pointer;">나의 보유 포인트</span>
						<br>
						<c:if test="${point == '0' }">
							<div class="my-point">포인트 없음</div>
						</c:if>
						<c:if test="${point != '0' }">
							<div class="my-point">${point} P</div>
						</c:if>
					</button>

				</div>
			</div>
		</div>

	</div>
</div>