<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Often QNA</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=1024" />
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/layout.css">
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/myPage.css">
	<link href="${pageContext.request.contextPath }/resources/css/user/button.css" rel="stylesheet" />
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/movieTheater.css" />
	<link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/userModule.css" />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
<script type="text/javascript">
		$(function(){
			var teat
			$(".often-qna-wrap").children().on('click',function(){
				alert("????" + $(this).val())
				const choiceVal =  $(this).val()
				$(".clean-list").empty()
					$.ajax({
						method:"POST",
						url:"/faqList.do",
						contentType:"application/json",
						dataType:"json",
						data:JSON.stringify({"faq_kind_num":choiceVal}),
						success:function(result){						
							const faqList = JSON.parse(result)
							test =this
							console.log("길이 : "+faqList.length)
							_(faqList).forEach(function(n){
								const td = $("<td>")
								const td1 =$("<td>")
								const td2 =$("<td>")									
								const a =$("<a>")
										.attr("class","faq-title")
										.attr("id","faqAnswerview")
										.attr("href","/oftenAnswer.do?faq_num="+n.faq_num)
								const td3 =$("<td>")
								const tr =$("<tr>")
								console.log("faq_num : "+n.faq_num)
								td.text(n.faq_num)
								console.log("td :" + td.text() )
								td1.text(n.kind_name)
								a.text(n.faq_title)
								td2.append(a)
								td3.text(n.faq_count)
								tr.append(td)
								tr.append(td1)
								tr.append(td2)
								tr.append(td3)
														
								$(".clean-list").append(tr)
							})			
						}
					})//ajax close
			})
		
			
			
		})
		
       
	</script>
<style type="text/css">
.often-qna-wrap {
	box-sizing: border-box;
	padding-top: 12px;
}

button.w-btn-outline.w-btn-gray-outline.btn1 {
	box-shadow: none;
	line-height: 3px;
	border-bottom: none;
}

table.myPage-table {
	height: 120px;
}

td {
	box-sizing: border-box;
	padding-top: 6px;
	border-right: 1px solid #8080807a;
}

th {
	box-sizing: border-box;
	padding-top: 3px;
	border-right: 1px solid #8080807a;
}

.myPage-table-wrap>span {
	height: 49px;
	box-sizing: border-box;
	padding-top: 2%;
	font-size: 18px;
}

thead.myPage-table-wrapping>tr {
	line-height: 40px;
}
</style>
</head>
<body class="">
	<div id="dgvwrap">
		<jsp:include page="../default/user_header.jsp"></jsp:include>

		<!-- Contaniner -->
		<div id="contaniner" class="">
			<!-- Contents Area -->
			<div id="contents" class="">
				<!-- Contents Start -->
				<div class="myPage-cols-container">
					<jsp:include page="../default/user_notice_side.jsp"></jsp:include>
					<div class="myPage-content-wrap">
						<span class="service-center-text">FAQ</span>
						<div class="often-qna-wrap">
							<button class="w-btn-outline w-btn-gray-outline btn1" value="1"
								id="ticketing" name="faq_kind_num" type="button">예매/매표</button>
							<button class="w-btn-outline w-btn-gray-outline btn1" value="2"
								id="cinema" name="faq_kind_num" type="button">영화관이용</button>
							<button class="w-btn-outline w-btn-gray-outline btn1" value="3"
								id="userService" name="faq_kind_num" type="button">회원서비스</button>
							<button class="w-btn-outline w-btn-gray-outline btn1" value="4"
								id="lostFound" name="faq_kind_num" type="button">분실물</button>
							<button class="w-btn-outline w-btn-gray-outline btn1" value="5"
								id="homePage" name="faq_kind_num" type="button">DGV홈페이지</button>
						</div>
						<div class="myPage-table-wrap"
							style="margin-top: 0%; border-top: 4px solid rgba(0, 0, 0, 0.2);"">
							<span><i class="fas fa-table me-1"
								style="margin-right: 1%;"></i>자주찾는 질문 </span>
							<table class="myPage-table">
								<thead class="myPage-table-wrapping">
									<tr>
										<th>번호</th>
										<th>구분</th>
										<th>제목</th>
										<th>조회수</th>
									</tr>
								</thead>
								<tbody class="clean-list">
								
								</tbody>
							</table>

						</div>

						<br> <br> <br> <br> <br>
						<div class="bottom-text-wrap">
							<span class="bottom-text">DGV 고객센터 : 1234-1234(상담가능 시간,
								월~금 12:00~15:00) *이 외 시간은 자동 응답 안내 가능</span>
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>

	<jsp:include page="../default/user_bottom_reserve.jsp"></jsp:include>
	<jsp:include page="../default/user_footer.jsp"></jsp:include>
</body>
</html>