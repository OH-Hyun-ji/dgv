<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/png" sizes="192x192"  href="${pageContext.request.contextPath }/resources/images/banana_real.png">
<title>DGV Community Detail</title>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/board.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/community.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(function(){
			$("#commentRegister").click(function(){
				const writeComment = $("#writeComment").val()
				const commentText =$("#commentText").val()
				const communityCode = $("#communityCode").val()
				
				const commentVo ={
					"community_code":communityCode,
					"comment_title":writeComment,
					"comment_text":commentText
					
				}
				$("#commentAllList").empty();
				$.ajax({
					method:"POST",
					url:"/commentInsert.do",
					contentType:"application/json",
					dataType:"json",
					data:JSON.stringify(commentVo),
					success:function(result){
						if(result.msg ="SUCCESS"){
							alert("등록이 완료되었습니다. ")
							location.reload();
							
						}else{
							alert("등록 실패 다시 등록해주세요 ")
						}
// 						var commentList = JSON.parse(result)
						
// 						_(commentList).forEach(function(n){
// 							const div =$("<div>")
// 									.attr("class","comment-wrapping")
// 							const div1 =$("<div>")
// 									.attr("class","comment-list-wrap")
// 							const div2 =$("<div>")
// 									.attr("class","comment-title")
// 							const input =$("<input>")
// 									.attr("type","text")
// 									.attr("id","commentTitle")
// 							const div3 =$("<div>")
// 									.attr("class","comment-textarea")
// 							const textarea =$("<textarea>")
// 									.attr("class","comment-textarea-styleOn")
// 									.attr("readonly","readonly")	
// 									.attr("rows","10")
// 									.attr("cols","20")
// 							const div4 =$("<div>")
// 									.attr("class","user-img-wrap")
// 									.attr("class","img-wrap-style")
// 							const div5 =$("<div>")
// 									.attr("class","user-img-wrapper")
// 							const div6 =$("<div>")
// 									.attr("class","user-img-wrapping")
// 							const div7 =$("<div>")
// 									.attr("class","user-img-profile")
// 									.css("flex-direction","unset")
// 							const img =$("<img>")
// 									.attr("id","user-beautiful")
// 									.attr("class","beauty-style")
// 									.attr("src",n.user_img)
// 							const span =$("<span>")
// 									.attr("class","user-id-umm")
// 									.attr("class","user-umm")
// 									.text(n.user_id)
// 							const span1 =$("<span>")
// 									.attr("class","user-rank-name")
// 									.attr("class","rank-style")
// 									.css("color","#ff9f4c")
// 									.css("font-weight","700")
// 									.text(n.user_rank)
									
// 									div3.append(textarea)
// 									div2.append(input)
// 									div1.append(div3)
// 									div1.append(div2)
// 									div7.append(img)
// 									div6.append(div7)
// 									div6.append(span)
// 									div6.append(span1)
// 									div5.append(div6)
// 									div4.append(div5)
// 									div.append(div4)
// 									div.append(div1)
									
// 									$("#commentAllList").append(div)
									
//						})
							
						
					},
					error:function(){
						console.log("통신실패")
					}
					
				})//close ajax
			})
		})
</script>
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
										<input type="hidden" id="communityCode" name="comment_num" value="${communityVo.community_code }">
										<span class="detail-option-val">${communityVo.community_kind }</span>														
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
												<c:if test="${communityVo.user_img == '0' }">
													<img
														class="user-beautiful"
														src="https://dgvworld.s3.ap-northeast-2.amazonaws.com/default_1.jpg">
												</c:if>
												<c:if test="${communityVo.user_img != '0' }">
													<img
														class="user-beautiful"
														src="${communityVo.user_img}">
												</c:if>
											
											</div>
											<span class="user-id-umm">${communityVo.user_id }</span>									
												<span class="user-rank-name" style="color: #ff9f4c; font-weight: 700;">${communityVo.rank_name}</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div	class="community-real-wrap">
							<div class="community-mini-btn bookmark"></div>
							<div class="community-talk-wrap">
								<div class=user-saved-img>
									<img id="myImgView" src="${communityVo.commuity_img} " >
								</div>
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
											<span class="community-any-text">의견수 ${communityVo.community_answerCount }</span>								
										</div>								
									</div>
							</div>	
							<div class="community-all-wrapping">
								<div class="community-body-conatainer">
									<div class="community-template">
										<button class="community-ctrl">
											<span class="any-text">Comment</span>
										</button>
									</div>
								</div>
								<div class="community-insert-comment">
									<div class="comment-box-wrap">
										<div class="community-write-comment">
											<input type="text" id="writeComment" name="comment_title" placeholder="제목입력">
										</div>
										<div class="comment-textarea">
										<div>
											<textarea class="comment-textarea-style" id="commentText" name="comment_text" rows="10" cols="20"></textarea>
											</div>
											<div class="comment-resBtn-style">
												<button class="comment-register" id="commentRegister">등록하기</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="comment-allList-container" id="commentAllList">
								<c:forEach var="commentList" items="${commentList}">
									<div class="comment-wrapping" id="commentWrap">
										<div class="comment-list-wrap">
											<div class="comment-title">
												<input type="text" id="commemtTitle" value="${commentList.comment_title}" >
											</div>
											<div class="comment-textarea">
												<textarea class="comment-textarea-styleOn" readonly="readonly" rows="10" cols="20">${commentList.comment_text }</textarea>
											</div>
										</div>
										<div class="user-img-wrap img-wrap-style">
											<div class="user-img-wrapper">
												<div class="user-img-wrapping">
													<div class="user-img-profile" style="flex-direction: unset;">		
														<img class="user-beautiful beauty-style" src="${commentList.user_img }">
													</div>
													<span class="user-id-umm user-umm">${commentList.user_id}</span>									
													<span class="user-rank-name rank-style" style="color: #ff9f4c; font-weight: 700;">${commentList.user_rank}</span>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>				
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>