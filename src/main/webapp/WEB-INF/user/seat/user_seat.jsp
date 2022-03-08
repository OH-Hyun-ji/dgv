<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                                    <li class="select-people-basic">0</li>
                                    <li class="select-people-basic">1</li>
                                    <li class="select-people-basic">2</li>
                                    <li class="select-people-basic">3</li>
                                    <li class="select-people-basic">4</li>
                                    <li class="select-people-basic">5</li>
                                    <li class="select-people-basic">6</li>
                                </ul>
                            </div>

                        </div>
                        <div class="select-people">
                            <div class="select-people-age">청소년</div>
                            <div class="select-people-number">
                                <ul class="select-people-ul select-people-ul-student">
                                    <li class="select-people-student">0</li>
                                    <li class="select-people-student">1</li>
                                    <li class="select-people-student">2</li>
                                    <li class="select-people-student">3</li>
                                    <li class="select-people-student">4</li>
                                    <li class="select-people-student">5</li>
                                    <li class="select-people-student">6</li>
                                </ul>
                            </div>

                        </div>
                        <div class="select-people">
                            <div class="select-people-age">경로</div>
                            <div class="select-people-number">
                                <ul class="select-people-ul select-people-ul-old">
                                    <li class="select-people-old">0</li>
                                    <li class="select-people-old">1</li>
                                    <li class="select-people-old">2</li>
                                    <li class="select-people-old">3</li>
                                    <li class="select-people-old">4</li>
                                    <li class="select-people-old">5</li>
                                    <li class="select-people-old">6</li>
                                </ul>
                            </div>

                        </div>
                    </div>
                    <div class="selected-number-wrap">
                        <div class="selected-number-title">선택된 좌석수</div>
                        <div class="selected-number">0</div>
                    </div>
                    <div class="select-people-info">
                        <div class="select-people-movie-title">${movieName}</div>
                        <div class="select-people-movie-detail">
                            <ul class="select-people-movie-info-list">
                                <li class="select-theater-local selected-theater-local-info">${mapName}</li>
                                <li class="select-theater-local selected-theater-local-info">${theaterName}</li>
                                <li>
                                    <span>남은좌석</span> 
                                    <span class="remain-seats">${seatRemain}</span>
                                    /
                                    <span class="total-seats">${seatAll}</span> 
                                </li>
                            </ul>
                        </div>
                        <div class="select-movie-time-info">
                           <div class="select-movie-date">${date}</div>
                           <div class="select-movie-start-time">${time}</div>
                        </div>
                        <div class="selected-seat-list">
                            <div class="selected-seats-number">좌석번호 :</div>
                            <div class="selected-seats-view" >
                            	<input id="seatStatus" readonly="readonly" >
                            </div>
                        </div>
                        <div class="selected-price-info">
                            <div class="selected-price-title">가격 <i class="fa-solid fa-greater-than"></i></div>
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
                        <img src="/images/preview.png">
            		   
                    </div>
            		<div class="movie-info">
                        <span class="movie-poster">
                           
                        </span>
                        <div><button disabled="disabled"> </button>
                            <span class="movie-title">
                                <a href="#">영화제목</a>
                            </span>
                        </div>
                        <div>
                            <span class="movie-age">
                                <a href="#">관람나이</a>
                            </span>
                        </div>
                    </div>
            	</div>
            </div>

        </div>

    </div>
      <jsp:include page="../default/user_footer.jsp"></jsp:include>
<script type="text/javascript">
      $(function(){
    	const row = ${row}
    	const col = ${col}
    	const alphabetNumber = parseInt(col)+64
    	var seatStatus = ${seatStatus}
    	
    	_
    
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
    	 
    	const seatArr = new Array();
    	$(".seat-status").on('click',function(){
    		alert($(this).val())
    		
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
    		}
    		
    		console.log("배열 : "+seatArr)
    		$("#seatStatus").val(seatArr)
    	})
    	
    	
    	
    
    	
      })
      
      
      
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

	            if(totalNum > 37){
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

	            if(totalNum > 37){
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

	            if(totalNum > 37){
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
	        

	        if(totalNum > 16){
	            li.classList.remove('select-people-ul-action');
	            toastr.error(
	                '<div>인원수 선택을 초과하였습니다. *최대6명~!</div>',
	                '<div>인원수 확인해주세요.</div>',
	                {timeOut: 4000}
	            );
	        }
	    

	    });
	}
	classAction(selectPeopleBasicList);
	classAction(selectPeopleStudentList);
	classAction(selectPeopleOldList);
	
	</script>
    </body> 
    </html>