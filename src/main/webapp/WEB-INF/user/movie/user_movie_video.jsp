<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="UTF-8">
	<link rel="shortcut icon" type="image/png" sizes="192x192"  href="${pageContext.request.contextPath }/resources/images/banana_real.png">
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<title>독립영화 예고편 by artHouse</title>
<style>
.artVideo_icon {
	display: inline-block;
	height: 13px;
	margin-right: 5px;
	padding: 0 3px;
	border: 1px solid #c62424;
	font-size: 10px;
	font-family: Dotum, '돋움';
	text-align: center;
	font-weight: bold;
	line-height: 13px;
	border-color: #2a6fb6;
	color: #2a6fb6;
}

body {
	background-color: black;
}

.artVideo_container {
	display: flex;
	width: 100%;
}

.artVideo_wrap {
	box-sizing: border-box;
	width: 80%;
}

h1 {
	font-size: 17px;
	color: white;
	margin-left: 2%;
	box-sizing: border-box;
	padding-right: 100px;
}

.artVideo_list {
	box-sizing: border-box;
	padding-top: 70px;
}

.box-contents {
	color: white;
}

strong {
	display: block;
}
.video_info{
	margin-left: 9%;
}
h3{
    color: lightgray;
}
#artVideo_text{
	padding: 10px;
    width: 705px;
    height: 111px;
    border-color: lightslategray;
    background: none;
    margin-bottom: 5px;
}
</style>
</head>
<body>
	<div class="artVideo_container">
			<div class="artVideo_wrap">
				<h1 style="font-size: 17px; color: white; margin-left: 2%;">
					<span class="artVideo_icon">HD</span> [좋은 빛, 좋은 공기]닮은 역사 예고편
				</h1>
				<video width="560" height="315" id="myVideo"
					oncontextmenu="return false;"
					src="http://h.vod.cgv.co.kr:80/vodCGVa/84558/84558_190327_1200_128_960_540.mp4"
					title="YouTube video player" controls autoplay="autoplay"
					style="box-sizing: border-box; margin-left: 8%; width: 86%;height: 60%;"></video>		
					<div class="video_info">
						<h3>영상설명</h3>
						<textarea readonly="readonly" id="artVideo_text">독립의소재 솰라솰라</textarea>
					</div>
			</div>
		<div class="artVideo_subContents">
			<div class="artVideo_list">
				<a> <img
					src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000084/84558/84558_185.jpg">
				</a>
			</div>
			<div class="box-contents">
				<a> <strong>좋은 빛, 좋은 공기</strong>
				</a> <span class="box-text"> <i>2021.04.28</i> <strong>개봉</strong>
				</span>
			</div>
		</div>
	</div>

</body>
</html>