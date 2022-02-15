<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>

    </head>
    <body style="height: 1196px;">
        <div class="page-header">
            <h1 style="margin-left: 4%;">Movie Register<small>  영화등록</small></h1>
          </div>
        <div class="movie-all-container dgvBackground-img" style="color: coral; font-size: 15px;">
            <div class="movie-dgv-wrap">
                <div class="movie-info-container">
                    <div class="movie-info-wrap">
                        <form class="form-inline">
                            <div class="dgvTopWrapping">
                            <div class="dgv-wrapper" style="display: flex; margin-left: 3%;margin-top: 4%;">
                                <div class="form-group dgvContainer" style="display: inline-grid; width:88px; margin-right:3%;">
                                <label for="dgvMovieTitle" style="margin-top: 7px; margin-bottom: 5px;" >Title </label>
                                <label for="dgvMovieTitle-en" style="margin-top: 7px; margin-bottom: 5px;">Title (EN) </label>
                                <label for="dgvMovieRunTime" style="margin-top: 7px; margin-bottom: 5px;">Runtime </label>
                                <label for="Movie Open Date" style="margin-top: 7px; margin-bottom: 5px;">Open Date </label>
                                </div>                       
                            <br><br>
                            <div class="form-group dgvContainer" style="display: grid;">
                                <input type="text" id="dgvMovieTitle" class="form-control" style="margin-bottom: 7%;" placeholder="Movie Title">
                                <input type="text" id="dgvMovieTitle-en" class="form-control" style="margin-bottom: 7%;" placeholder="Movie Title English">
                                <input type="text" id="dgvMovieRunTime" class="form-control" style="margin-bottom: 7%;" placeholder="ex) 180분->180">
                                <input type="text" id="Movie Open Date" class="form-control" style="margin-bottom: 7%;" placeholder="ex) 2023-01-01">               
                            </div>
                        </div>
                            <br><br>
                            <div class="form-group" style="display: inline-grid; margin-left:3%;margin-right:1%; text-align:end;margin-top: 54px;">
                                <label for="dgvGenre">genre</label>
                                <label for="dgvAge">Age</label>
                                <label for="dgvMovieStartTime">Start Time</label>
                            </div>

                            <div class="form-group " style="display: inline-grid; margin-top: 4%;">
                                <select id="dgvGenre" class="form-control">
                                    <option>호러</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                </select>
                                  <select id="dgvAge" class="form-control">
                                      <option>11세</option>
                                      <option>2</option>
                                      <option>3</option>
                                      <option>4</option>
                                      <option>5</option>
                                  </select>
                                  <select id="dgvMovieStartTime" class="form-control">
                                    <option>11:00</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                </select>
                              </div>
                            </div>
                                <br>
                                <div class="dgvCitySite">
                                    <h3 style="color:antiquewhite;font-weight: bolder;font-size: 28px;border-bottom: 1px solid rgba(255,255,255,0.4);width: 44%;margin-bottom: 2%;margin-top: 0;">Theater Site</h3>
                                <div class="form-group ">
                                    <label for="dgvMovieCity">City</label>
                                    <select id="dgvMovieCity" class="form-control">
                                        <option>서울</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                    </select>
                                </div>
                                <div class="form-group" style="width:16%;">
                                    <label for="dgvMovieRegion" style="margin-left: 9%;">Region</label>
                                    <select id="dgvMovieRegion" class="form-control" style="width: 60%;">
                                        <option>강남</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                    </select>
                                </div>
                                <div class="form-group dgvTheater-width" "style="width:17%;">
                                    <label for="dgvMovieTheater" style="margin-left: 9%;">Theater</label>
                                    <select id="dgvMovieTheater" class="form-control">
                                        <option>A관</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                    </select>
                                </div>
                            </div>
                                <br>

                               
                                <div class="form-group" style="margin-left:4%;width: 35%;" >
                                   <h3 style="color: antiquewhite;font-weight: bolder;font-size: 28px;border-bottom: 1px solid rgba(255,255,255,0.4);width: 121%;margin-bottom: 5%;margin-top: 1%;">Start Date</h3>
                            <div style="display: flex; ">
                                    <div class="dgvMoviePlayDate" style="width: 38%;">
                                     <label for="dgvMovieYear">Year</label>
                                    <select id="dgvMovieYear" class="form-control">
                                        <option>2022</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                    </select>
                                </div>
                                <div class="form-group "  style="width:36%;">
                                        <label for="dgvMovieMonth">Month</label>
                                       <select id="dgvMovieMonth" class="form-control">
                                           <option>2</option>
                                           <option>2</option>
                                           <option>3</option>
                                           <option>4</option>
                                           <option>5</option>
                                       </select>
                                </div>
                                <div class="form-group" style="width:36%;">
                                    <label for="dgvMovieDay">Day</label>
                                   <select id="dgvMovieDay" class="form-control">
                                       <option>2</option>
                                       <option>2</option>
                                       <option>3</option>
                                       <option>4</option>
                                       <option>5</option>
                                   </select>
                                </div>
                            </div>
                            </div>
                                <br><br>
                                <div class="dgvMovieText-wrap" style="margin-left:4%;">
                                    <h3 style="color: antiquewhite;font-weight: bolder;font-size: 28px;border-bottom: 1px solid rgba(255,255,255,0.4);width: 44%;margin-bottom: 2%;margin-top: 0;">Movie Info</h3>
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
                                <input type="file" style="height: 32px;" value="파일찾기"> 
                            </div>
                                </div>
                            </div>
                                <button type="submit" class="btn btn-default dgvRegBtn">Register</button>
                          </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>