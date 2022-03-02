<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Admin Movie Register </title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/movieRegister.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" ></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" ></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
				
		<script type="text/javascript">
		
		var test;
		$(function(){
			$( "input[name='movie_open_date']" ).datepicker();
			const groupList = ${groupList1};
			const actorList =${actorList1};
			const cityList = ${cityList};
			const regionList =${regionList};
			
			$("#addTheater").click(function(){
				console.log("상영관시작!!")
				const tr =$("<tr>")
				const tdT = $("<td>").text("도시 :")
				const tdA = $("<td>").text("지역 :")
				const td =$("<td>")
				const td1 = $("<td>")
				const td2 = $("<td>")
				const input =$("<input>")
						.attr("type","button")
						.attr("class","delRow")
						.attr("value","삭제")
				const select=$("<select>")
						.attr("class","dgvCity")
						.attr("name","movieCityGroup")
						.attr("class","form-control1")
				const select1=$("<select>")
						.attr("name","movieCity")
						
			
				for(let i=0;i<cityList.length;i++){
					console.log("city_code : "+cityList[i].city_code);
					const option= $("<option>")
									.attr("class","test")
									.attr("value",cityList[i].city_code)
									.text(cityList[i].city_name)					
				select.append(option)	
					const index=$("#theaterTable").index($(".dgvCity"));	
				
					console.log("#####" + index)
				
				}
				
				td.append(select)
				tr.append(tdT)
				tr.append(td)
				td1.append(select1)
				tr.append(tdA)
				tr.append(td1)
				td2.append(input)
				tr.append(td2)
				$("#theaterTable").append(tr)
			
					let ind = $(this).index(this)
					console.log("index :" +ind)	
				
				$(document).on('change', 'select[name=movieCityGroup]',function(){
					var movieCityGroup =$(this).val()
					const selectNum = $("select[name=movieCityGroup] option:selected").val();
					const number={"city_code": selectNum}
					
					
					console.log("셀렉트값???? :"+selectNum)
					var aa	=$("#theaterTable").children('tr')
					//	console.log("tr의 인덱스 번호 ㅠ: "+aa.eq(0).children());
						console.log(aa.length);
						
						console.log("aa 1번째"+aa.eq(0).children().index());
						console.log("aa 1번째"+$(this).parent().index());
						console.log(aa.eq(1));
						console.log(aa.eq(0).children());
						console.log(aa.eq(1).children());
					
						console.log(aa.eq(3).children());
						console.log(aa.index(this));
						$($("#theaterTable").children()).each(function(i){
							
							console.log("제발!!! "+ $(i))
							console.log("child length : "+ $(i).children().length)
							console.log("test : "+ $(i).children[1].children[0].children[0].value)
						//	console.log($("select[name=movieCityGroup]").childNodes[i].value)
						//	console.log("child : "+aa.eq(i).children()[i]);
							
						})
						
						
				})
				
				
			/*	
			
				$(document).on('click','select[name=movieCityGroup] option ',function(){
					_($("#theaterTable").children()).forEach(function(n){
						console.log("??? : "+$(n).children().eq(1).children().first().val())
						console.log("!!! :"+selectNum)
					})
				*/
				
	/*			
					$.ajax({
						method:"POST",
						url:"lookingCode.mdo",
						contentType:"application/json",
						dataType:"json",
						data:JSON.stringify(number),
						success:function(regionList){
							console.log("ajax :" +regionList)
							const cleanArea = $("#regionSelect")
							cleanArea.empty();
							_(regionList).forEach(function(n){
								const option1=$("<option>")
												.attr("class","regionL")
												.attr("value",n.region_code)
												.attr("id" , "regionSelect")
												.text(n.region_name)
								select1.append(option1)
					})

				},
				error:function(){
					console.log("통신실패")
				}
				
			})//ajax close   
			
			*/
			test=this	
				
				
			
				
			})
			$("#addTr").click(function(){		
				console.log("??????")
					const tr = $("<tr>")
					const tdT = $("<td>").text("참여자 그룹 :")
					const tdA =$("<td>").text("참여자 :");
					const td=$("<td>")
					const td1=$("<td>")
					const td2=$("<td>")
					const input =$("<input>")
							.attr("type","button")
							.attr("class","delRow")
							.attr("value","삭제")
 					const select=$("<select>")
 							.attr("class","dgvGroup")
							.attr("name","movieJoinGroup")
							.attr("class","form-control")
					const select1=$("<select>")
									.attr("name","movieJoin")			
													
				for(let i=0;i<groupList.length; i++){
					console.log(${groupList1[i].movie_group_name}+"휴...")
 					const option = $("<option>")
 									.attr("value",groupList[i].movie_group_code)
 									.text(groupList[i].movie_group_name);

 					select.append(option)
				}
				for(let i =0;i<actorList.length;i++){
					console.log("이번엔 참여자들뽑기")
					const optionA = $("<option>")
									.attr("value",actorList[i].movie_actor_code)
									.text(actorList[i].movie_actor_name);
					select1.append(optionA)
				}
				td.append(select)
				tr.append(tdT)
				tr.append(td)
				td1.append(select1)
				tr.append(tdA)
				tr.append(td1)
				td2.append(input)
				tr.append(td2)
				$("#parTable").append(tr)
				console.log("ddd");
				console.log("ddd");	
				const arr = new Array();
				let ind = $(this).index(this)
				console.log("index :" +ind)
				
			})

			
 			$(document).on('click', '.delRow', function(event) {
				
 				$(this).closest("tr").remove()
 			});
						
			
			$(document).on('change', 'select[name=movieJoinGroup]', function(e){
				var movieJoinGroup = $(this).val()
				const arr = new Array();
				console.log($("#dgvGroup").val())
				//	console.log($("#dgvGroup").eq(2).val());
				let index = $(this).index(this);
				console.log("??? "+ index)
			})
			
			/* $(".delRow").on("click", function(){
				console.log($(this).html())
			}) */
			
			//제이쿼리니까 앞에 감싸고 시작
			$.datepicker.setDefaults({
			    dateFormat: 'yy-mm-dd' //Input Display Format 변경
			});
		
			
			$("#registerBtn").click(function(){
				alert("영화등록버튼 click click!!!!")
				const movieTitle = $("#dgvMovieTitle").val()
				const movieTitleEn = $("#dgvMovieTitle-en").val()
				const movieRunTime = $("#dgvMovieRunTime").val()
				const movieOpenDate =$("#movieopendate").val()
				const movieGenre=$("#dgvGenre").val()
				const movieAge = $("#dgvAge").val()
				const movieStartT = $("#dgvMovieStartTime").val()
				const movieStartM = $("#dgvMovieStartMM").val()
				const movieStartTime =movieStartT+":"+movieStartM
				const movieInfo =$("#dgvMovieText").val()
				const movieImgName = $("#movieImgName").val();
				console.log(movieImgName)
				console.log(movieStartTime)
				const movieName = movieImgName.split("\\")
				const imgName = movieName[movieName.length-1]
				const imgFile = $("#movieImgName")[0].files[0];
				//console.log("session adminId : " + ${session.adminID})
				const regId = "";
				
				_(movieName).forEach(function(n){
					console.log("ImgName :"+n)
				})
				
				
				
				//참여자 테이블 정보
				const partitionLength = $("#parTable").children().length
				//lodash javascript (= java stream)
				const trList = $("#parTable").children();
				_($("#parTable").children()).forEach(function(n){
					const groupCode = $(n).children().eq(1).children().first().val();
					console.log("groupCode : " + groupCode);
					
					const participantCode = $(n).children().eq(3).children().first().val();
					console.log("participantCode : " + participantCode);
				});
				
				const parList = _.map(trList, function(tr) {
					const groupCode = $(tr).children().eq(1).children().first().val();
					const participantCode = $(tr).children().eq(3).children().first().val();
					return {
						"groupCode" : groupCode,
						"participantCode" : participantCode
					}
				});
				
				const formData = new FormData();
				const movieVo = {
						"movie_title":movieTitle,
						"movie_title_en":movieTitleEn,
						"movie_running_time" :movieRunTime,
						"movie_open_date":movieOpenDate,
						"movie_genre_code" :movieGenre,
						"movie_age_code" :movieAge,
						"movie_time":movieStartTime,
						"movie_text":movieInfo,
						"movie_img":imgName,
						"movie_real_img":imgName,
						"reg_id": regId
				}
				test = parList;
				formData.append("imgFile",imgFile);
				formData.append("parList", new Blob([JSON.stringify(parList)], {type:"application/json"}));
				formData.append("movieVo", new Blob([JSON.stringify(movieVo)], {type:"application/json"}));
 				$.ajax({
					method:"POST",
					url:"/insertMovie.mdo",
					enctype:"multipart/form-data",
					contentType:false,
					processData:false,
					data:formData,
					success:function(result){
						if(result.msg="SUCCESS"){
							alert("등록 성공!!")
							window.opener.location.reload();
	    					window.close();
						}
					},
					error:function(e){
						
						console.log("통신실패"+e)
					}
					
					
 				})//close ajax
			
			})
		})
		</script>
		
		<style type="text/css">
		input#addTr {
		    width: 92px;
		    height: 34px;
		    background-color: #ffffff54;
		    margin-top: 1%;
		    border-radius: 6px;
		    color: WHITE;
		    font-weight: bolder;
		    font-size: 19px;
		}
		input#addTheater{
			width: 92px;
		    height: 34px;
		    background-color: #ffffff54;
		    margin-top: 1%;
		    border-radius: 6px;
		    color: WHITE;
		    font-weight: bolder;
		    font-size: 19px;
		    margin-right: 7%;
}

		    
		}
		</style>
    </head>
    <body style="height: 1196px;">
        <div class="page-header">
            <h1 style="margin-left: 4%;">Movie Register<small>  영화등록</small></h1>
          </div>
        <div class="movie-all-container dgvBackground-img" style="color: coral; font-size: 15px;">
            <div class="movie-dgv-wrap">
                <div class="movie-info-container">
                    <div class="movie-info-wrap">
                      
                            <div class="dgvTopWrapping">
                            <div class="dgv-wrapper" style="display: flex; margin-left: 3%;margin-top: 4%;">
                                <div class="form-group dgvContainer" style="display: inline-grid; width:88px; margin-right:3%;">
                                <label for="dgvMovieTitle" style="margin-top: 7px; margin-bottom: 5px;" >Title </label>
                                <label for="dgvMovieTitle-en" style="margin-top: 7px; margin-bottom: 5px;">Title (EN) </label>
                                <label for="dgvMovieRunTime" style="margin-top: 7px; margin-bottom: 5px;">Runtime </label>
                                <label for="movieopendate" style="margin-top: 7px; margin-bottom: 5px;">Open Date </label>
                                </div>                       
                            <br><br>
                            <div class="form-group dgvContainer" style="display: grid;">
                                <input type="text" id="dgvMovieTitle" name="movie_title" class="form-control" style="margin-bottom: 7%;" placeholder="Movie Title">
                                <input type="text" id="dgvMovieTitle-en" name="movie_title_en" class="form-control" style="margin-bottom: 7%;" placeholder="Movie Title English">
                                <input type="text" id="dgvMovieRunTime" name="movie_running_time" class="form-control" style="margin-bottom: 7%;" placeholder="ex) 180분->180">
                                <input type="text" id="movieopendate" name="movie_open_date"  autocomplete="off" class="form-control" style="width: 237px; margin-bottom: 7%;">               
                            	
                            </div>
                        </div>
                            <br><br>
                            <div class="form-group" style="display: inline-grid; margin-left:3%;margin-right:1%; text-align:end;margin-top: 54px;">
                                <label for="dgvGenre">genre</label>
                                <label for="dgvAge">Age</label>
                                <label for="dgvMovieStartTime">Start Time</label>
                            </div>

                            <div class="form-group" style="display: inline-grid; margin-top: 4%;">
                               	  <select id="dgvGenre" name="movie_genre_code" class="form-control" >
                               	  	<option>장르</option>	
                               	  	<c:forEach var="genreList" items="${genreList }">
                               	  		<option value="${genreList.movie_genre_code }">${genreList.movie_genre_name }</option>
                               	  	</c:forEach>
                               	  </select>
                                  <select id="dgvAge" name="movie_age_code" class="form-control">
                                  <option>연령</option>
                                  <c:forEach var="ageList" items="${ageList}">
                                      <option value="${ageList.movie_age_num}">${ageList.movie_age_name}</option>
                                  </c:forEach> 
                                  </select>
                                  <div class="dgvTime-wrap" style="display: flex;">
                                  <select id="dgvMovieStartTime" class="form-control">
                                    <option>시</option>
                                    <c:forEach var="i" begin="1" end="24">
                                    <c:choose>
                                    	<c:when test="${i<10 }">
                                    		<option value="0${i}">0${i}시</option>                                    	
                                    	</c:when>
                                    	<c:otherwise>
                                    		<option value="${i}">${i}시</option> 
                                    	</c:otherwise>
                                    </c:choose>
                                    </c:forEach>
                                </select>
                                 <select id="dgvMovieStartMM" class="form-control">
                                    <option>분</option>
                                    <c:forEach var="i" begin="1" end="59">
                                     <c:choose>
                                    	<c:when test="${i<10 }">
                                    		<option value="0${i}">0${i}분</option>                                    	
                                    	</c:when>
                                    	<c:otherwise>
                                    		<option value="${i}">${i}분</option> 
                                    	</c:otherwise>
                                    </c:choose>                
                                    </c:forEach>
                                </select>
                                </div>
                              </div>
                            </div>
					<br> <br>
					<div style="display: flex;">
					<div
						style="height: 300px; width: 500px; border: 1px solid #fff; border-bottom: 0; margin-left: 4%;">
						<div
							style="float: right; color: antiquewhite; display: flex; margin-right: 8%;">
							<span style="font-weight: bold; font-size: 27px; width: 266px;">
								Officials Info</span> <input type="button" id="addTr" value="추가">
						</div>
						<div style="overflow-y: scroll; width: 100%; height: 85%; border: 1px solid #fff; margin-top: 46px;">
							<table id="parTable" ></table>
						</div>
					</div>
					<div
						style="height: 300px; width: 500px; border: 1px solid #fff; border-bottom: 0; margin-left: 4%;">
						<div style=" display: flex;justify-content: end;argin-bottom: 1%;">
							<span style="font-weight: bold; color: antiquewhite; font-size: 27px; width: 266px;">Theater</span>
							<input type="button" id="addTheater" value="추가">
						</div>
						<div
							style="overflow-y: scroll; width: 100%; height: 87%; border: 1px solid #fff;">
							<table id="theaterTable"></table>
						</div>
					</div>
					</div>
					<div style="display: flex;">
					<div class="dgvMovieText-wrap" style="margin-left: 4%;">
						<h3
							style="color: antiquewhite; font-weight: bolder; font-size: 28px; margin-top: 6%; border-bottom: 1px solid rgba(255, 255, 255, 0.4); width: 44%; margin-bottom: 2%;">Movie
							Info</h3>
						<label for="dgvMovieText"style="font-size:20px">Plot</label>
						<textarea id="dgvMovieText" name="movie_text" class="form-control"
							style="width: 499px; height: 120px;" rows="4" cols="250"
							placeholder=" 최대 3000자 "></textarea>
					</div>
					<br><br>
					<div style="margin-left: 4%;margin-top: 2%;">
						<span
							style="color: antiquewhite; font-weight: bolder; font-size: 28px; border-bottom: 1px solid rgba(255, 255, 255, 0.4); width: 43%; margin-bottom: 2%; margin-top: 0;">Poster
							Upload</span>
						<div style="display: flex;">
							<div class="dgvMovieImg"
								style="border: 1px solid; width: 177px; height: 215px;margin-top: 3%;">
								<span><i class="far fa-image"
									style="width: 20%; height: 18%; box-sizing: border-box; padding-top: 16px;"></i></span>
							</div>
							<div style="display: flex; margin-top: 2%;">
								<input id="movieImgName" type="file"
									style="height: 32px; margin-left: 3%;margin-top: 10%;" value="파일찾기">
							</div>
						</div>
					</div>
					</div>
					<button type="text" class="btn btn-default dgvRegBtn" id="registerBtn">Register</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>