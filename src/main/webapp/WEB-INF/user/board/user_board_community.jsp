<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DGV Community Board</title>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/board.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(function(){
			$("#writePage").on('click',function(){
			                    
		       location.href='/sokdakRegister.do'
			})
		})
	</script>
</head>
<body>
	<div class="dgv_all_container">
		<jsp:include page="../default/user_header.jsp"></jsp:include>
		<div class="sokdak-header">
			<div class="sokdak-sokdak">
				<h1><span class="sokdak-header-title">커뮤니티</span></h1>
				<button class="sokdak-writer" id="writePage"><i class="fas fa-pencil-alt" style="margin-right: 6px;"></i><span class="buttonName">작성하기</span></button>
			</div>
			<div class="sokdak-search-wrap">
				<label class="sokdak-search-img">
					<i class="fas fa-search"></i>
				</label>
				<input class="sokdak-search" placeholder="궁금한 내용을 찾아보세요">
			</div>
		</div>
		<div class="sokdak-dgv-total">
		<c:forEach var="communityList" items="${communityList}" varStatus="status">
			<div class="sokdak-dgv">
				<div class="board-sok-container">
					<div class="sokdak-kind">
						<span class="sokdak-cogo">
							<p class="sokdak-any"> ♥ ${communityList.community_kind} </p>
						</span>
					</div>
					<div class="sokdak-info">
						<a class="sokdak-title" href="/communityDetail.do?community_code=${communityList.community_code}">
							<span class="sokdak-star-img">
								<img style="height: 30px; margin-bottom: 4px;"
								 		src="https://dgvworld.s3.ap-northeast-2.amazonaws.com/starpreview.png">
							</span>
								<span class="sokdak-name">${communityList.community_title}</span>
						</a> 
						<a class="sokdak-text">
						<span class="sokdak-view-info">${communityList.community_text}</span></a>
					</div>
					<div class="sokdak-profile-wrap">
						<button class="sokdak-profile-wrapping">
							<div class="sokdak-user-info">
								<p class="sokdak-user-id">${communityList.user_id}</p>
								<c:if test="${communityList.write_time != 'null'}">
									<p class="sokdak-time-view">${communityList.write_time}</p>
								</c:if>
								<c:if test="${communityList.write_time == 'null'}">
									<div class="sokdak-date">${communityList.write_date}</div>		
								</c:if>
								<div class="sokdak-user-img">
									<img
										style="width: 100%; height: 100%; -o-object-fit: cover; object-fit: cover;"
										src="https://dgvworld.s3.ap-northeast-2.amazonaws.com/default_1.jpg">
								</div>
							</div>
						</button>
					</div>
					<div class="sokdak-submenu-wrap">
						<div class="sokdak-submenu">
							<div class="sokdak-count">조회수 : ${communityList.community_count} </div>
							<div class="sokdak-answerCount">댓글 수 : ${communityList.community_answerCount}</div>
						</div>
						<div class="sokdak-date-wrap">
						
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		</div>
	</div>
	<jsp:include page="../default/user_footer.jsp"></jsp:include>
</body>
</html>