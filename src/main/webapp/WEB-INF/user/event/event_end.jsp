<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event End</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user_event.css">
  <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css">
 <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/board.css">
  <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
  <script src="js/scripts.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
  <script src="js/datatables-simple-demo.js"></script>
</head>
<style>

.finishbox {
    float: left;
    width: 298px;
    margin: 0 0 20px 20px;
    border: 1px solid #d1d0ce;
    border-top: 2px solid #333;
    padding: 15px 20px;
    position: relative;
    }
    </style>
<body>
<jsp:include page="../default/user_header.jsp"></jsp:include>
  <!--본격 콘텐츠-->
	<div id="contaniner" style="height: 1100px" class="">
		<!-- Contents Area -->
		<div class="event-board-wrap"> 
		<jsp:include page="../default/user_event_header.jsp"></jsp:include>
		<div class="cols-content" style="width: 100%;margin-top: -29px;margin-left: 0%;">
			<div class="col-detail event" style=" width: 98%; padding-left: 2%;">
		
		<div class ="finishbox" style="position: relative;">
		<strong class = "conti">
		<a href="http://blog.naver.com/storyphoto/viewer.jsp?src=https%3A%2F%2Fblogfiles.pstatic.net%2F20110929_258%2Fkhel3d2oat_1317222188760qaSKl_JPEG%2F165311_37352951_900.jpg">배트맨 </a>
		</strong>
		<dl class="eventList">
		<dt><a href="https://dgvworld.s3.ap-northeast-2.amazonaws.com/%ED%95%9C%ED%9A%A8%EC%A3%BC.jpg" style= "font-size: 14px;">이벤트기간 : 2022-03-01~2022-03-20</a></dt>
		<dt><a href="#" style= "font-size: 14px;">당첨자발표일 : 2022-04-01</a></dt>
		<dt style= "font-size: 14px;">당첨자확인 : -</dt>
		</dl>
	<dl>
	</dl>
		</div>
		
			<div class ="finishbox" >
		<strong class = "conti">
		<a href="#">주술회전 무료보기</a>
		</strong>
		<dl class="eventList">
		<dt><a href="#" style= "font-size: 14px;">이벤트기간 : 2022-03-01~2022-03-20</a></dt>
		<dt><a href="#" style= "font-size: 14px;">당첨자발표일 : 2022-04-01</a></dt>
		<dt style= "font-size: 14px;">당첨자확인 : -</dt>
		</dl>
	<dl>
	</dl>
		</div>
		
			<div class ="finishbox">
		<strong class = "conti">
		<a href="#">주술회전 무료보기</a>
		</strong>
		<dl class="eventList">
		<dt><a href="#" style= "font-size: 14px;">이벤트기간 : 2022-03-01~2022-03-20</a></dt>
		<dt><a href="#" style= "font-size: 14px;">당첨자발표일 : 2022-04-01</a></dt>
		<dt style= "font-size: 14px;">당첨자확인 : -</dt>
		</dl>
	<dl>
	</dl>
		</div>
		
			<div class ="finishbox" >
		<strong class = "conti">
		<a href="#">주술회전 무료보기</a>
		</strong>
		<dl class="eventList">
		<dt><a href="" style= "font-size: 14px;">이벤트기간 : 2022-03-01~2022-03-20</a></dt>
		<dt><a href="#" style= "font-size: 14px;">당첨자발표일 : 2022-04-01</a></dt>
		<dt style= "font-size: 14px;">당첨자확인 : -</dt>
		</dl>
	<dl>
	</dl>
		</div>
		
		<div class ="finishbox" >
		<strong class = "conti">
		<a href="#">주술회전 무료보기</a>
		</strong>
		<dl class="eventList">
		<dt><a href="#" style= "font-size: 14px;">이벤트기간 : 2022-03-01~2022-03-20</a></dt>
		<dt><a href="#" style= "font-size: 14px;">당첨자발표일 : 2022-04-01</a></dt>
		<dt style= "font-size: 14px;">당첨자확인 : -</dt>
		</dl>
	<dl>
	</dl>
		</div>
		
		
			</div>
		</div>
	</div>
	</div>
	<jsp:include page="../default/user_footer.jsp"></jsp:include>
</body>
</html>