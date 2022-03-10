<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Video </title>
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
	text-align: center;
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
    color: wheat;
    font-weight: bolder;
    font-size: 20px;
}
video {
    width: 800px;
    height: 484px;
    padding-left: 47px;
}
img {
    width: 200px;
    height: 285px;
}
</style>
</head>
<body>
	<div class="artVideo_container">
			<div class="artVideo_wrap">
				<h1 style="font-size: 17px; color: white; margin-left: 2%;">
					<span class="artVideo_icon">HD</span> ${movieVo.movie_title}
				</h1>
				<video  width="560" height="315" autoplay muted loop>
					<source src="${video}" style="box-sizing: border-box; margin-left: 8%; width: 86%; height: 120%;">
				</video>

					<div class="video_info">
						<h3>영상설명</h3>
						<textarea readonly="readonly" id="artVideo_text">${movieVo.movie_title} 예고편</textarea>
					</div>
			</div>
		<div class="artVideo_subContents">
			<div class="artVideo_list">
				<a> <img
					src="${movieVo.movie_img }">
				</a>
			</div>
			<div class="box-contents">
				<a> <strong>${movieVo.movie_title}</strong>
				</a> <span class="box-text"> <i>${movieVo.movie_open_date}</i> <strong>개봉</strong>
				</span>
			</div>
		</div>
	</div>

</body>
</html>