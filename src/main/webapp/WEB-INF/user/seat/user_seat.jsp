<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좌석배치</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/button.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/seat.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css">
	<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@100&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@700&display=swap" rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>
	<link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' />
	<script src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js' ></script>
	<style type="text/css">
	
	
	</style>
</head>

<body>
<jsp:include page="../default/user_header.jsp" />
<div class="total-container">
        <div class="total-wrap">
            <div class="top-navi-menu">
                <span class="navi-bar-button">
                    <button class="w-btn-neon2" type="button">
                        상영시간표
                    </button>
                    <button class="w-btn-neon2" type="button" style="margin-left: 20px;">
                        예매 다시하기
                    </button>
                </span>
            </div>
            <div class="select-people-title">인원/좌석</div>
            <div class="select-people-number-box">
                <div class="select-people-wrapper">
                    <div class="select-people-number-wrap">
                        <div class="select-people">
                            <div class="select-people-age">일반</div>
                            <div class="select-people-number">
                                <ul class="select-people-ul select-people-ul-adult">
                                	<c:forEach var="i" begin="0" end="6" step="1">
                                    	<li class="select-people-basic" value="${i}">${i}</li>                                	
                                	</c:forEach>
                                </ul>
                            </div>                        
                        </div>
                        <div class="select-people">
                            <div class="select-people-age">청소년</div>
                            <div class="select-people-number">
                                <ul class="select-people-ul select-people-ul-student">
                                    <c:forEach var="i" begin="0" end="6" step="1">
                                    	<li class="select-people-student" value="${i}">${i}</li>                                	
                                	</c:forEach>
                                </ul>
                            </div>

                        </div>
                        <div class="select-people">
                            <div class="select-people-age">경로</div>
                            <div class="select-people-number">
                                <ul class="select-people-ul select-people-ul-old">
                                    <c:forEach var="i" begin="0" end="6" step="1">
                                    	<li class="select-people-old" value="${i}">${i}</li>                                	
                                	</c:forEach>
                                </ul>
                            </div>

                        </div>
                    </div>
                    <div class="selected-number-wrap">
                        <div class="selected-number-title">선택된 좌석수</div>
                        <input type="hidden" id="totalCheckCount" >
                        <div class="selected-number">
                        	<input id="selected-count" type="text" readonly="readonly" value="0">
                        </div>
                    </div>
                    <div class="select-people-info">
                        <div class="select-people-movie-title">${movieName}</div>
                        <div class="select-people-movie-detail">
                            <ul class="select-people-movie-info-list">
                                <li class="select-theater-local selected-theater-local-info"><span class="selected-date">위치 :</span>  ${mapName}</li>
                                <li class="select-theater-local selected-theater-local-info"><span class="selected-date">상영관 :</span>  ${theaterName}</li>
                                <li>
                                    <span class="selected-date"">남은좌석 </span> 
                                    <span class="remain-seats"> ${seatRemain}</span>
                                    /
                                    <span class="total-seats">${seatAll}</span> 
                                </li>
                            </ul>
                        </div>
                        <div class="select-movie-time-info">
                           <div class="select-movie-date"><span class="selected-date">상영날짜 :</span> ${date}</div>
                           <div class="select-movie-start-time"><span class="selected-date">상영시간 :</span> ${time}</div>
                        </div>
                        <div class="selected-seat-list">
                            <div class="selected-seats-number"><span class="selected-date">좌석번호 :</span></div>
                            <div class="selected-seats-view" >
                            	<input id="seatStatus" readonly="readonly" >
                            </div>
                        </div>
                        <div class="selected-price-info">
                            <div class="selected-price-title"><span class="selected-date">가격</span> <i class="fa-solid fa-greater-than"></i></div>
                            <div class="selected-price-total">0</div>
                        </div>
                    </div>
                </div>
             
            </div>
            <div class="seat-container">
                <div class="seat-wrapper">
                    <div class="screen-site-wrapper">
                        <div class="screen-site">SCREEN</div>
                    </div>
                    <div class="user-seat-view"></div>
                </div>
            </div>
            <div class="reservation-container">
            	<div class="reservation-wrapper">
                    <div class="choicPrev">
                        <a href="#"><img style="border: 1px solid white; border-radius: 11px" src="https://dgvworld.s3.ap-northeast-2.amazonaws.com/choiceBtn.png"></a>       		   
                    </div>
            		<div class="movie-info">
                        <span class="movie-poster">
                           <img id="movie-poster-img" src="${movieList.movie_img}">
                        </span>
                        <div class="movie-title-style">
                        	<div class="movie-title-wrap">
	                            <span class="movie-title">
	                                <a href="#">${movieList.movie_title}</a>
	                            </span>
	                            <span class="movie-title-en">
	                                <a href="#">${movieList.movie_title_en}</a>
	                            </span>
	                            <div class="movie-age-style">
	                            	<span><img src="${ageList.movie_age_img}"></span>
	                            	<span class="movie-genre-style">${genreList.movie_genre_name}</span>
	                            </div>
                            </div>
                        </div>
                        <div class="movie-theater-container">
	                        <div class="movie-thearter-wrapping">
		                        <div class="movie-theater-style">
		                            <span class="movie-map-name">${mapName}</span>
		                            <span class="movie-theater-name">${theaterList.theater_name } 상영관</span>
		                        </div>
		                        <div class="movie-date-style">
		                        	<span class="movie-date-name">상영날짜 : ${date}</span>
		                        	<span class="movie-time-name">상영시간 : ${time}</span>
		                        </div>
	                        </div>
	                        <div class="movie-seat-style">
	                        	<span class="movie-seat-name">좌석 :</span>
	                        	<input type="text" readonly="readonly" id="userChoiceSeat">
	                        </div>
                        </div>
                        <div class="next-choice-style">
                        	<a href="#"><img id="next-choice" src="https://dgvworld.s3.ap-northeast-2.amazonaws.com/choiceNext.png"></a>
                        </div>
                    </div>
            	</div>
            </div>

        </div>

    </div>
      <jsp:include page="../default/user_footer.jsp"></jsp:include>
<script type="text/javascript">
/**상단 표기  원하는 인원클릭 변수 선언  */
	let totalNum = 0;
	let basicNum = 0;
	let studentNum = 0;
	let oldNum = 0;
	let totalMoney = 0;
	let basicMoney = 0;
	let studentMoney = 0;
	let oldMoney = 0;
	let selectedUlAction = '';
	
	/** class로 선언된 값 */
	const totalResultPrice = document.querySelector('.selected-price-total');
	const totalSelectedNum = document.querySelector('.selected-number');
	
	/** 각각의 li 목록들 가져오기*/
	const selectPeopleBasicList = document.querySelectorAll('.select-people-ul-adult li');
	const selectPeopleStudentList = document.querySelectorAll('.select-people-ul-student li');
	const selectPeopleOldList = document.querySelectorAll('.select-people-ul-old li');
	
	/** 전체 클릭가능한수 36을 초과시 0으로 돌리기위한 선언 */
	const selectPeopleBasic = document.querySelectorAll('.select-people-basic');
	const selectPeopleStudent = document.querySelectorAll('.select-people-student');
	const selectPeopleOld = document.querySelectorAll('.select-people-old');
	
	/**토스트 옵션 설정 */
	toastr.options = {
	    positionClass: 'toast-top-right',
	    progressBar: true,
	    timeOut: 1000,
	    preventDuplicates: true,
	    newestOnTop: true
	};

   
	/**클래스 초기화 , 클래스 추가 */
	function classAction(list){
	    console.log('TEST 1:')
	    console.log('TEST 1:'+selectPeopleBasicList)
	     console.log(list)
	    totalNum=0;
	    totalMoney=0;
	    console.log(list)
	    _(list).forEach(function(li) {
	        console.log('TEST 2:')
	        cleanList(list, li)
	    });

	}
	function cleanList(list, li){
	    console.log('TEST 3:');
	    li.addEventListener('click', function() {//먼저 클래스 지워주고 진행
	        console.log('TEST 4:');
	        _(list).forEach(function(li) {
	        li.classList.remove('select-people-ul-action');
	    });
	    li.classList.add('select-people-ul-action');
	    selectedUlAction = document.querySelectorAll('.select-people-ul-action');
	    selectPeopelUl(selectedUlAction);
	    });
	}

	function selectPeopelUl(selectedUlAction){
	    console.log('TEST 5:');
	    _(selectedUlAction).forEach( function(li){
	        if(li.parentNode.classList.contains('select-people-ul-adult')){
	            basicNum = Number(li.innerHTML);
	            basicMoney = 17000 * basicNum;
	            totalMoney = basicMoney + studentMoney + oldMoney;
	            totalNum = basicNum + studentNum + oldNum;
	            totalResultPrice.innerHTML = '17000 X '+basicNum+' = '+ basicMoney +'원'+'<br>';

	            if(totalNum > 18){
	                li.classList.remove('select-people-ul-action');
	                totalMoney -= basicMoney;
	                totalNum -= basicNum;
	                selectPeopleBasic[0].classList.add('select-people-ul-action');
	                totalResultPrice.innerHTML = totalMoney + ' 원';

	            }
	        }else if(li.parentNode.classList.contains('select-people-ul-student')){
	            studentNum = Number(li.innerHTML);
	            studentMoney = 11000 * studentNum;
	            totalMoney = basicMoney + studentMoney + oldMoney;
	            totalNum = basicNum + studentNum + oldNum;
	            totalResultPrice.innerHTML = '11000 X '+studentNum+' = '+studentMoney +'원'+'<br>';

	            if(totalNum > 18){
	                li.classList.remove('select-people-ul-action');
	                totalMoney -= studentMoney;
	                totalNum -= studentNum;
	                selectPeopleStudent[0].classList.add('select-people-ul-action');
	                totalResultPrice.innerHTML = totalMoney + ' 원';
	            }
	        }else if(li.parentNode.classList.contains('select-people-ul-old')){
	            oldNum = Number(li.innerHTML);
	            oldMoney = 11000 * oldNum;
	            totalMoney = basicMoney + studentMoney + oldMoney;
	            totalNum = basicNum + studentNum + oldNum;
	            totalResultPrice.innerHTML = '11000 X '+oldNum+' = '+oldMoney +'원'+'<br>';

	            if(totalNum > 18){
	                li.classList.remove('select-people-ul-action');
	                totalMoney -= oldMoney;
	                totalNum -= oldNum;
	                selectPeopleOld[0].classList.add('select-people-ul-action');
	                totalResultPrice.innerHTML = totalMoney + ' 원';
	            }
	        }
	        totalResultPrice.innerHTML = ' 일반 17000 X '+basicNum+' = '+ basicMoney +'원'+'<br>'+
	                                     ' 청소년 11000 X '+studentNum+' = '+studentMoney +'원'+'<br>'+
	                                     ' 경로 11000 X '+oldNum+' = '+oldMoney +'원'+'<br>'+'전체금액 :'+totalMoney + ' 원';
	        

	        if(totalNum > 18){
	            li.classList.remove('select-people-ul-action');
	            toastr.error(
	                '<div>인원수 선택을 초과하였습니다. *최대6명~!</div>',
	                '<div>인원수 확인해주세요.</div>',
	                {timeOut: 4000}
	            );
	            basicNum =0;
	            studentNum = 0;
	            oldNum =0;
	            basicMoney=0;
	            studentMoney=0;
	            oldMoney=0;
	            totalMoney=0;
	            totalResultPrice.innerHTML = ' 일반 17000 X <input type="text" value='+basicNum+'> = '+ basicMoney +'원'+'<br>'+
							                 ' 청소년 11000 X <input type="text" value='+studentNum+' >= '+studentMoney +'원'+'<br>'+
							                 ' 경로 11000 X <input type="text" value='+oldNum+'> = '+oldMoney +'원'+'<br>'+'전체금액 :'+totalMoney + ' 원';
	        }
	    	
	       

	    });
	}
	classAction(selectPeopleBasicList);
	classAction(selectPeopleStudentList);
	classAction(selectPeopleOldList);
	   $(function(){
	    	  console.log(basicNum)
	    	const row = ${row}
	    	const col = ${col}
	    	const alphabetNumber = parseInt(col)+64
	    	var seatStatus = ${seatStatus}
	    
	    	
	    //	const alphabet = String.fromCharCode(alphabetNumber)
	    	
	    	var str_html = "";
	    	for(let i =65; i<=(parseInt(row)+64);i++){
	    		str_html = str_html+'<br>'
	    		for(let j=1;j<=col;j++){
	    			var alphabet = String.fromCharCode(i)    			
	    			var seat_btn = '<button class="seat-status" value="()" disabled1="abled">{}</button>';
	    														///????? 참나..
	    
	    			seat_btn = seat_btn.replace('{}', alphabet+j)
	    			seat_btn = seat_btn.replace('()', alphabet+j)
	    			
	    			_(seatStatus).forEach(function(n){
	    				
						if(n===alphabet+j){
							console.log(n)				
	 						seat_btn =	seat_btn.replace("disabled1","disabled")	
	 						console.log("??? : "+$(".seat-status"+n))		
						}
							seat_btn =	seat_btn.replace("abled","abled")	
							
						
						
	    			})
	    			
	    				
	    			str_html = str_html+seat_btn;
	    		}
	    		str_html = str_html+'<br>'
	    	}
	    	$(".user-seat-view").html(str_html);
	    	
	    	var adultP =0;
	    	var studentP=0;
	    	var oldP=0;
	    	var totalP=0;
	    	$(".select-people-ul").children().on('click',function(){
	    	
	    //		console.log("1212121212 : "+ $(".select-people-ul").children().hasClass("select-people-ul-action").text)
	    		if($(this).hasClass("select-people-ul-action")&&$(this).hasClass("select-people-basic")){
	    			adultP = 0;
	    			console.log("qqqqqqqqqqq"+$(this).val())
	    			var adultCount = $(this).val()
	    			adultP +=adultCount
	    			console.log("성인 : "+ adultP)
	    			// 변환  끝
	    			//return adultP;
	    		}
	    		if($(this).hasClass("select-people-ul-action")&&$(this).hasClass("select-people-student")){
	    			studentP =0;
	    			var studentCount = $(this).val()
	    			studentP +=studentCount
	    			console.log("학생 : "+studentCount)

	    		}
	    		if($(this).hasClass("select-people-ul-action")&&$(this).hasClass("select-people-old")){
	    			oldP =0;
	    			var oldCount = $(this).val()
	    			oldP +=oldCount
	    			console.log("경로 : "+oldCount)

	    		}
	    		totalP = parseInt(parseInt(adultP)+parseInt(studentP)+parseInt(oldP))
	    		console.log("totalP : "+ totalP)
	    		
	    		$("#totalCheckCount").val(totalP)
	    	})	
	    	
	    	const seatArr = new Array();
	    	$(".seat-status").on('click',function(){
	    		alert($(this).val())
	    		console.log("totalCheckCount" + $("#totalCheckCount").val())
	    			
		    		
	    	
	    		if($(this).hasClass("choiceBtnStyle")){
	    			$(this).removeClass("choiceBtnStyle")  			 		
		    			for(let i=0;i<seatArr.length;i++){
		 		   			if(seatArr[i]==$(this).val()){
		 		   				seatArr.splice(i,1)
		 		   			}
		 		   		}
	    		}else{
	 		   		$(this).addClass("choiceBtnStyle")
		    			seatArr.push($(this).val())
		    		//	$("#selected-count").val(selectedCount++)
		    			if(seatArr.length >$("#totalCheckCount").val()){			
		    				$(this).removeClass("choiceBtnStyle") 
		    				for(let i=0;i<seatArr.length;i++){
			 		   			if(seatArr[i]==$(this).val()){
			 		   				seatArr.splice(i,1)
			 		   			}
			 		   		}
			    		
			    			alert("좌석선택수를 초과하였습니다. ")
			    			
			    		}
	    		}
	    		
	    		$("#selected-count").val(seatArr.length)    		
	    		console.log("선택 좌석수  : "+seatArr.length)
	    		console.log("배열 : "+seatArr)
	    		$("#seatStatus").val(seatArr)
	    		$("#userChoiceSeat").val(seatArr)
	    	
	    	})
	      })
	     

	</script>
    </body> 
    </html>