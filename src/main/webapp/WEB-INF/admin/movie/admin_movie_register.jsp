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
         <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
		
		
		<script type="text/javascript">

		$(function(){
			$( "input[name='movie_open_date']" ).datepicker();
			const groupList = ${groupList1};
			const actorList =${actorList1};
			$("#addTr").click(function(){		
				console.log("??????")
	//		const actorList = ${actorList[i].movie_actor_name};
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
 							.attr("id","dgvGroup")
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
									.attr("value",actorList[i].movie_actor_name)
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
 					$("table").append(tr)
				console.log("ddd");
				console.log("ddd");	
			
				
			})

			
 			$(document).on('click', '.delRow', function(event) {
				
 				$(this).closest("tr").remove()
 			});
						
			$(document).on('change', 'select[name=movieJoinGroup]', function(event){
				var movieJoinGroup = $(this).val()
			})
			
			/* $(".delRow").on("click", function(){
				console.log($(this).html())
			}) */
			
			$("#registerBtn").click(function(){
				alert("???")
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
                        <form action="#" class="form-inline">
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
                                <input type="text" id="dgvMovieTitle" class="form-control" style="margin-bottom: 7%;" placeholder="Movie Title">
                                <input type="text" id="dgvMovieTitle-en" class="form-control" style="margin-bottom: 7%;" placeholder="Movie Title English">
                                <input type="text" id="dgvMovieRunTime" class="form-control" style="margin-bottom: 7%;" placeholder="ex) 180분->180">
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
                               	  <select id="dgvGenre" class="form-control" >
                               	  	<option>장르</option>	
                               	  	<c:forEach var="genreList" items="${genreList }">
                               	  		<option value="${genreList.movie_genre_name }">${genreList.movie_genre_name }</option>
                               	  	</c:forEach>
                               	  </select>
                                  <select id="dgvAge" class="form-control">
                                  <option>연령</option>
                                  <c:forEach var="ageList" items="${ageList}">
                                      <option value="${ageList.movie_age_name}">${ageList.movie_age_name}</option>
                                  </c:forEach> 
                                  </select>
                                  <div class="dgvTime-wrap">
                                  <select id="dgvMovieStartTime" class="form-control">
                                    <option>시</option>
                                    <c:forEach var="i" begin="1" end="24">
                                    <option value="${i}">${i}시</option>
                                    </c:forEach>
                                </select>
                                 <select id="dgvMovieStartMM" class="form-control">
                                    <option>분</option>
                                    <c:forEach var="i" begin="1" end="59">
                                    <option value="${i}">${i}분</option>
                                    </c:forEach>
                                </select>
                                </div>
                              </div>
                            </div>
                                <br><br>   
                                <div style="height: 300px; width:500px; border:1px solid #fff;border-bottom: 0;margin-left: 4%;">
                                <div style="float: right; color:antiquewhite; display: flex;margin-right: 8%;">
                                	<span style="font-weight: bold; font-size: 27px;width: 266px;"> Officials Info</span>
                                	<input type="button" id="addTr" value="추가">
                                </div>
                                <div style="overflow-y: scroll; width:100%; height: 100%; border: 1px solid #fff; margin-top:46px;">
                                <table width="100%" height="100%">
                                	
                                </table>
                                </div>
                                </div>
                                <div class="dgvMovieText-wrap" style="margin-top: 4%;margin-left:4%;">
                                    <h3 style="color: antiquewhite;font-weight: bolder;font-size: 28px; margin-top: 6%;border-bottom: 1px solid rgba(255,255,255,0.4);width: 44%;margin-bottom: 2%;">Movie Info</h3>
                                <label for="dgvMovieText">Plot</label>
                                <textarea id="dgvMovieText" class="form-control" rows="4" cols="50" placeholder=" 최대 3000자 "></textarea>
                            </div>
                            <br><br>
                            <span><h3 style="margin-left:4%;color: antiquewhite;font-weight: bolder;font-size: 28px;border-bottom: 1px solid rgba(255,255,255,0.4);width: 43%;margin-bottom: 2%;margin-top: 0;">Poster Upload</h3></span>
                            <div style="margin-left:4%;">
                                <div>
	                                <div class="dgvMovieImg" style="border: 1px solid; width: 177px;height: 215px;">
	                                    <span><i class="far fa-image" style="width: 20%; height: 18%; box-sizing: border-box; padding-top: 16px; "></i></span>
	                                </div>
	                                <div style="display: flex; margin-top: 2%;">
	                                <input placeholder="파일경로" style="height: 32px; ">
	                                <input type="file" style="height: 32px; margin-left: 3%;" value="파일찾기"> 
                                		<button type="text" class="btn btn-default dgvRegBtn" id="registerBtn">Register</button>
	                            	</div>
                                </div>
                            </div>
                    </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>