<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DGV Community Detail</title>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/board.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/community.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>
<body>
	<div class="dgv_all_container">
		<jsp:include page="../default/user_header.jsp"></jsp:include>
		<div class="detail-container">
			<div class="detail-show-wrap">
				<div class="detail-show">
					<div class="detail-title-wrapping">
						<div class="detail-title-wrap">
							<div class="detail-title-header">
								<span class="detail-header">
									<div class="detail-header-option">
										<span class="detail-option-val"">${communityVo.community_kind }</span>														
									</div>		
								</span>
								<div class="detail-title-name">
									<span>${communityVo.community_title }</span>
								</div>
								<c:if test="${communityVo.write_time != 'null'}">
									<div class="detail-time-wrap">${communityVo.write_time }</div>
								</c:if>
								<c:if test="${communityVo.write_time == 'null'}">
									<div class="detail-time-wrap">${communityVo.write_date }</div>
								</c:if>																		
							</div>
								<div class="user-img-wrap">
									<div class="user-img-wrapper">
										<div class="user-img-wrapping">
											<div class="user-img-profile">
												<img class="user-beautiful" src="${communityVo.commuity_img }">
												<span class="user-rank">
													<img class="user-rank-img">
												</span>
											</div>
											<span class="user-id-umm">${communityVo.user_id }</span>
											<span class="user-rank-name">userRankName</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div	class="community-real-wrap">
							<div class="community-mini-btn bookmark"></div>
							<div class="community-talk-wrap">
								<div class="community-talk-wrapper">
									<div class="community-talk">
										<p>${communityVo.community_text}</p>
									</div>
								</div>
								<div class="community-footer">
									<div class="community-vote">
										<div class="community-vote-wrapper">
											<span class="community-vote-btn">
												<i class="fas fa-thumbs-up" style="color: orange;"></i>
											</span>
											<span class="detail-recommend">추천 0</span>
										</div>
										<div class="community-vote-wrapper">
											<span class="community-vote-btn">
												<i class="fas fa-thumbs-down" style="color: orange;"></i>
											</span>
											<span  class="detail-no-recommend"> 비추천 </span>
										</div>
									</div>
									<div class="community-subMenu">
										<span class="community-count">조회수 ${communityVo.community_count }</span>
										<span class="community-any-text">댓글수 ${communityVo.community_answerCount }</span>								
									</div>								
								</div>
							</div>	
							<div class="community-body-conatainer">
								<div class="community-template">
									<button class="community-ctrl">
										<span class="any-text">댓글없음</span>
									</button>
								</div>
							</div>				
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>