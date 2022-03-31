<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/png" sizes="192x192"  href="${pageContext.request.contextPath }/resources/images/banana_real.png">
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
	 <!-- iamport.payment.js -->
 	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>
	<link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' />
	<script src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js' ></script>
</head>

<body>
<jsp:include page="../default/user_header.jsp" />
<div class="total-container">
        <div class="total-wrap">
            <div class="top-navi-menu">
                <span class="navi-bar-button">
                  
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
                            <div class="selected-price-title">
                          		<div class="price-style">
                            		<span class="selected-date">가격</span>
                            	</div>
                            	<div class="price-icon">
                             		<i class="fas fa-hand-point-right"></i>
                             	</div>
                            </div>
                            <div class="selected-price-total"></div>                     		
                        </div>
                   		<div class="coupon-point-wrapping">
		                     <div class="discount-reserve-wrap">
				                  <div class="coupon-select">
			                  		<label>쿠폰 목록</label>
				                  	<select id="discountCoupon" name="discountCoupon" >
				                  		<option value="0">선택안함</option>
				                  		<c:forEach var="couponList" items="${couponList}">
				                  			<c:if test="${empty couponList.coupon_name }">
				                  				<option>쿠폰 없음</option>
				                  			</c:if>
				                  			<c:if test="${!empty couponList.coupon_name }">
				                  					<option value="${couponList.coupon_discount}" >${couponList.coupon_name }</option>
				                  			</c:if>
				                  		</c:forEach>
				                  	</select>
				                  </div>
				                  <div class="point-select">
				                  	<label class="remain-point">잔여포인트 : </label> 
				                  	<input id="myRemainPoint" value="${userPoint}" readonly="readonly">
				                  </div>
				                  	<c:choose>
					                  	<c:when test="${empty userPoint ||userPoint <10000 }">
					                  		<input id="userPointText" value="10,000p 부터 사용가능" readonly="readonly">
					                  	</c:when>	
					                  	<c:otherwise>
					                  		<div class="point-wrapping">
						                  		<input id="userPointUse" name="use_point" placeholder="1p단위부터 사용가능" value="0">
						                  		<div id="userMsg"></div>
					                  		</div>
					                  		<div style="display: flex;width: 195px;">
						                  		<button id="pointBtn">포인트사용</button>
					                  		</div>		                  		
					                  	</c:otherwise>
				                  </c:choose>
		                		 </div>
		                		 <div class="use-coupon-view">
		                		 	<div id="use-coupon-name"></div>
		                		 </div>
		                		 </div>
 
                    </div>
                </div>            
            </div>
            <div class="seat_introduce">
            	<div>
            		<img alt="" src="https://dgvworld.s3.ap-northeast-2.amazonaws.com/seat_introduce.png">
            	</div>
            	<div class="couponTotalPrice-wrap">
            		<label class="totalCoupon-label">전체 금액 :</label>
            		<input type="text" readonly="readonly" id="allTotalPrice">
            	</div>
            	<div class="paymentKind-wrap">
            		<select id="paymentKind" >
            			<option value="">결제수단</option>
            			<option value="samsung">삼성페이</option>
            			<option value="card">신용카드</option>
            			<option value="trans">실시간계좌이체</option>
            			<option value="phone">휴대폰소액결제</option>
            		</select>
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
                        <a href="./../"><img style="border: 1px solid white; border-radius: 11px"; src="https://dgvworld.s3.ap-northeast-2.amazonaws.com/choiceBtn.png"></a>       		   
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
	                        <div class="result-totalPrice-wrap">
	                        	<span class="result-total-span">최종 결제 금액 :</span>
	                        	<input type="text" readonly="readonly" id="result-total-money">
	                        </div>
	                        <div class="movie-seat-style">
	                        	<span class="movie-seat-name">좌석 :</span>
	                        	<input type="text" readonly="readonly" id="userChoiceSeat">
	                        </div>
                        </div>
                        <div class="next-choice-style">
                        	<a href="#" ><img id="next-choice" src="https://dgvworld.s3.ap-northeast-2.amazonaws.com/choiceNext.png"></a>
                        </div>
                    </div>
            	</div>
            </div>

        </div>
		<form action="/ReservationInfo.do" method="post">
			<input type="hidden" name="movie_num", id="movieNum" value="${movieList.movie_num }">		
			<input type="hidden" name="movie_title", id="movieTitle" value="${movieList.movie_title }">		
			<input type="hidden" name="region_code" id="regionCode" value="${theaterList.region_code }">
			<input type="hidden" name="movie_time_start" id="movieStartTime" value=" ${time}">
			<input type="hidden" name="theater_code" id="theaterCode" value="${theaterList.theater_code }">
			<input type="hidden" name="seat_reservation" id="reserveSeat" >
			<input type="hidden" name="reserve_basic" id="reserveBasic" value="0">
			<input type="hidden" name="reserve_student" id="reserveStudent" value="0">
			<input type="hidden" name="reserve_old" id="reserveOld" value="0"> 
			<input type="hidden" name="reserve_price" id="reservePrice">
			<input type="hidden" id="myFixedRemainPoint" value="${userPoint}">
			<input type="hidden" id="couponTotalPriceFixed" >
			<input type="hidden" id="couponPriceAfterFixed" >
			<input type="hidden" id="couponCancelBefore" >
			<input type="hidden" id="fixedPrice" >
			<input type="hidden" name="reserve_myPoint" id="myRemainPoint" value="">
			<input type="hidden" name="reserve_movie_date" id="movieDate" value="${date}">
			<input type="hidden" name="user_id" id="userId" value="${userVo.user_id }"> 
			<input type="hidden" name="user_name" id="userName" value="${userVo.user_name }"> 
			<input type="hidden" name="user_email" id="userEmail" value="${userVo.user_email }"> 
			<input type="hidden" name="user_phone" id="userPhone" value="${userVo.user_phone }"> 
		</form>
    </div>
      <jsp:include page="../default/user_footer.jsp"></jsp:include>

<script type="text/javascript">
	$(function(){

		$("#next-choice").click(function(){
			
			const selectedCount = $("#selected-count").val();
			console.log("selectedCount : "+selectedCount)
			const booking = $("#reserveSeat").val().split(",")
			console.log("booking : "+booking)
			console.log("길이 : "+booking.length)
			const basicP = $("#reserveBasic").val()
	        const studentP =  $("#reserveStudent").val()
			const reserveP = $("#reserveOld").val()
			const allPeopleTotalCount =  parseInt(basicP)+parseInt(studentP)+parseInt(reserveP)
			console.log("allPeopleTotalCount : "+ allPeopleTotalCount)
			
			
			if(allPeopleTotalCount == booking.length && selectedCount !=0 ){
			
				var movieTitle = $("#movieTitle").val()			
				var movieNum = $("#movieNum").val()			
				var regionCode = $("#regionCode").val()			
				var movieStartTime = $("#movieStartTime").val()			
				var theaterCode = $("#theaterCode").val()			
				var reserveSeat = $("#reserveSeat").val()			
				var reserveBasic =$("#reserveBasic").val()
				var reserveStudent =$("#reserveStudent").val()
				var reserveOld =$("#reserveOld").val()
				var userId = $("#userId").val()
				var userName = $("#userName").val()
				var userEamil = $("#userEmail").val()
				var userPhone = $("#userPhone").val()			
				var reservePrice = $("#reservePrice").val()
				var movieDate = $("#movieDate").val()
				var myPoint  =	$("#myRemainPoint").val()
				const formatReserve =parseInt(reservePrice)
				const couponDiscount =$("#discountCoupon option:selected").val()
				const usePoint = $("#userPointUse").val()
				const formatUsePoint = parseInt(usePoint)
				console.log("reservePrice  =>  "+formatReserve)
				console.log("myPoint  =>  "+myPoint)
				console.log(usePoint)
				
// 				alert("결제버튼 클릭")
				console.log("userId " +userId)
				
			
					//결제 아임포트 
					 var IMP = window.IMP; // 생략가능	 
					 IMP.init('imp31303840');
					 IMP.request_pay({
		            	pg: 'html5_inicis', //version 1.1.0부터 지원.
		            	pay_method: $("#paymentKind option:selected").val(),
		            	merchant_uid:'merchant_' + new Date().getTime(),
		            	name:movieTitle,
		            	amount: formatReserve,     // 결제금액
		            	buyer_email: userEamil,
		                buyer_name: userName,
		                buyer_tel: userPhone
		                
		        	}, function (rsp) {
		           	 	console.log(rsp);
			            if (rsp.success) {
			                var msg = '결제가 완료되었습니다.';
				                msg += '고유ID : ' + rsp.imp_uid;
				                msg += '상점 거래ID : ' + rsp.merchant_uid;
				                msg += '결제 금액 : ' + rsp.paid_amount;
				                msg += '카드 승인번호 : ' + rsp.apply_num;
				                msg += '결제수단 : ' + rsp.pay_method;
				                console.log('결제수단 : ' + rsp.pay_method)
				                const reserveVo={
				                	"movie_num" : movieNum,
				                	"region_code" : regionCode,
				                	"movie_time_start":movieStartTime,
				                	"theater_code":theaterCode,
				                	"user_id":userId,
				                	"seat_reservation" :reserveSeat,
				                	"reserve_basic":reserveBasic,
				                	"reserve_student":reserveStudent,
				                	"reserve_old" :reserveOld,
				                	"reserve_price":parseInt(reservePrice) ,
				                	"reserve_movie_date":movieDate,
				                	"reserve_imp_uid":rsp.imp_uid ,
				                	"reserve_apply_num": rsp.apply_num,
				                	"reserve_merchant_uid":rsp.merchant_uid,
				                	"reserve_method":rsp.pay_method,
				                	"reserve_movie_date":movieDate,
				                	"reserve_myPoint":parseInt(myPoint),
				                	"use_point":formatUsePoint,
				                	"coupon_discount":couponDiscount
				                }
					            	$.ajax({
					            		method:"POST",
					            		url:"/userReservation.do",
					            		contentType:"application/json",
					            		dataType:"json",
					            		data:JSON.stringify(reserveVo),
					            		success:function(result){
					            			if(result.msg=="SUCCESS"){
					            				location.href="userReserveResult.do?reserve_merchant_uid="+rsp.merchant_uid
					            			}
					            		},
					            		error:function(e){
					            			console.log("통신실패"+e)
					            		}
					            		
					            	}) //close ajax
			            	console.log(rsp)
			            } else {
			                var msg = '결제에 실패하였습니다.';
			                msg += '에러내용 : ' + rsp.error_msg;
			            }
			            alert(msg);
		        });
			}else{
				console.log("???왜안떠?")
				alert("인원에 맞게 좌석수를 선택해주세요")
			}
		}) // close click function
	})
////////////////////////////////////////////////////////////////////
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
	                                     ' 경로 11000 X '+oldNum+' = '+oldMoney +'원';
	            	        			console.log("전체금액 1  : "+totalMoney)
	                      	        	console.log("전체성인  : "+basicNum)
	                      	        	$("#reserveBasic").val(basicNum)
	                      	        	$("#reserveStudent").val()
										$("#reserveOld").val()
	                                    $("#reservePrice").val(totalMoney)
	                                    $("#fixReservePrice").val(totalMoney)
	                 $("#allTotalPrice").val(totalMoney.toLocaleString('ko-KR')+"원")
	                 $("#couponTotalPriceFixed").val(totalMoney.toLocaleString('ko-KR')+"원")
	                 $("#couponPriceAfterFixed").val(totalMoney.toLocaleString('ko-KR')+"원")
	                 $("#fixedPrice").val(totalMoney.toLocaleString('ko-KR')+"원")
	        //		$("#result-total-money").val(totalMoney.toLocaleString('ko-KR')+"원")
	        		
	                                     
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
	      	
		   var count =0
		   //쿠폰 적용(누를때마다 변경감지해야하므로 change)
		   $("#discountCoupon").change(function(){
			   //쿠폰 적용금액
			   const couponValue = $("#discountCoupon option:selected").val()
			   
			   //사용한 쿠폰을 취소하기위해 따로 저장한 값불러올때 사용
			   const couponCancelBefore =$("#couponCancelBefore").val()
			   
			   const couponTotalPriceFixed = $("#couponTotalPriceFixed").val()	
			   
			   const allTotalPrice = $("#allTotalPrice").val()
			   
			    const userPointUse = $("#userPointUse").val()
			   
			   //콤마제거
			   const removeCommaTotalP = parseInt(removeComma(allTotalPrice))
			   
			   const couponResultPrice =removeCommaTotalP-couponValue
			   
			   //인원지정과 전체 금액이없을경우 쿠폰 사용시 막기위해서
			   const basicP = $("#reserveBasic").val()
			   const studentP =$("#reserveStudent").val()
			   const reserveP = $("#reserveOld").val()
			   const allPeopleTotalCount =  parseInt(basicP)+parseInt(studentP)+parseInt(reserveP)
			   
			   
			   if(couponValue == 0){
				   const couponPriceAfterFixed = $("#couponPriceAfterFixed").val()
				   console.log(couponPriceAfterFixed)
				   console.log(userPointUse)
				    $("#allTotalPrice").val(couponPriceAfterFixed)
				   	if(userPointUse != 0){
						   const resultPrice = removeComma(allTotalPrice)
						   const couponCancel = resultPrice+parseInt(couponCancelBefore)
						   console.log(resultPrice)
						   console.log(parseInt(couponCancelBefore))
						   console.log(couponCancel)
						   $("#allTotalPrice").val(couponCancel.toLocaleString('ko-KR')+"원")
						   
					  }
				   $("#use-coupon-name").text("")
			   }else{
				   if(allPeopleTotalCount == 0){
					   alert("인원을 먼저 선택해주세요")
					   $('#discountCoupon').val(0)
				   }else{
					   $("#couponTotalPriceFixed").val(couponResultPrice.toLocaleString('ko-KR')+"원")
					   $("#allTotalPrice").val(couponResultPrice.toLocaleString('ko-KR')+"원")
					   $("#result-total-money").val(couponResultPrice.toLocaleString('ko-KR')+"원")
					   $("#reservePrice").val(couponResultPrice.toLocaleString('ko-KR')+"원")
				   	   $("#couponCancelBefore").val(couponValue)
				   	   $("#use-coupon-name").text("[ "+couponValue+"원 할인쿠폰 사용 ]")
				   }
			   }
			   
			   
		   })
		   
		   //포인트 적용
		   $("#pointBtn").on('click',function(){
			  	
			   //사용자가 적은 사용포인트의 길이
			   const usePointLength = getDigit($("#userPointUse").val())
			   
			   //사용자의 보유 포인트의 길이
			   const userHavePointLength = getDigit(${userPoint})
			   
			   //사용자의 보유 포인트 
			   const myRemainPoint = $("#myRemainPoint").val()
			   
			   //사용할 포인트 입력값 (0을 입력시 포인트를 되돌리기 위함,정규식 적용)
			   const userPointUse = $("#userPointUse").val()
			   
			   //0을 입력시 포인트를 되돌리기 위해서 사용
			   const myFixedRemainPoint = $("#myFixedRemainPoint").val()
				
			   //전체금액을 리셋할때 사용
			   const couponTotalPriceFixed = $("#couponTotalPriceFixed").val()
			   
			   //결제할 전체금액
			   const allTotalPrice = $("#allTotalPrice").val()
		   
			   //인원을 선택했을때 포인트와 쿠폰사용이 가능해야 하므로 선언 
			   const basicP = $("#reserveBasic").val()
			   const studentP =$("#reserveStudent").val()
			   const reserveP = $("#reserveOld").val()
			   const allPeopleTotalCount =  parseInt(basicP)+parseInt(studentP)+parseInt(reserveP)
			   
			   //정규식으로 숫자만 입력
			   var regExp = /^[0-9]+$/;
			   
			   //쿠폰도 0을 받았을때 전체리셋하기위해
			    const couponValue = $("#discountCoupon option:selected").val()
		       //변하지않는 전체 가격	
			    const fixedPrice = $("#fixedPrice").val()
			    
			   if(allPeopleTotalCount != 0){
				   if(userPointUse ==0){
					   $("#myRemainPoint").val(myFixedRemainPoint)
					   $("#allTotalPrice").val(couponTotalPriceFixed)
					   $("#result-total-money").val(couponTotalPriceFixed)
					   if(couponValue == 0){
						   alert("DFsdf")
						   $("#allTotalPrice").val(fixedPrice)
						   $("#result-total-money").val(fixedPrice)
					   }
				   }else if(userPointUse.substring(0,1) == "0" ){
					   $("#userMsg").text("[앞에 0 빼주세요]")
				   }else if(!regExp.test(userPointUse)){
					   $("#userMsg").text("[숫자만 입력가능합니다.]")
				   }else if(usePointLength <2 ){
					   $("#userMsg").text("[10p 이상부터 사용가능합니다.]")
				   }else if(userHavePointLength < usePointLength){
					   $("#userMsg").text("[잔여포인트 확인후 입력해주세요]")
				   }else{
					   if(count==0){
					   const myRemainPoint = $("#myRemainPoint").val()
					   const userPointUse  = $("#userPointUse").val()	
					   const resultPrice =removeComma(allTotalPrice)-userPointUse
					   const formatCouponTotalPrice = resultPrice.toLocaleString('ko-KR')+"원"
					 
					   $("#myRemainPoint").val(myRemainPoint-userPointUse)
					   $("#allTotalPrice").val(formatCouponTotalPrice)
					   $("#result-total-money").val(formatCouponTotalPrice)
					   $("#reservePrice").val(formatCouponTotalPrice)
		
					   }if(couponValue == 0){
						   const removeCommaFixedP = removeComma(fixedPrice)
						   const resultTotalP = removeCommaFixedP-userPointUse
						   $("#allTotalPrice").val(resultTotalP.toLocaleString('ko-KR')+"원")
					  	   $("#result-total-money").val(resultTotalP.toLocaleString('ko-KR')+"원")
					   }				  
					   count+=1;			   
				   }
			   }else{
				   alert("인원을 먼저 선택해주세요")
				   
			   }
			   //포인트 적용을 고정적으로 하기위해서 사용
			   $("#userPointUse").on('keyup',function(){
				   $("#myRemainPoint").val(myFixedRemainPoint)
				   count =0;
			   })
			 
		   })
		   //콤마제거 함수
		   function removeComma(str){
			  var n=parseInt(str.replace(/,/g,""));
			   return parseInt(n);
		   }
		   
		   
		   //자릿수 판별함수
	        function getDigit(num){
	        	num = num.toString()
	        	var i =0;
	        	while(num[i]){
	        		i++;
	        	};
	        	return i
	        	
	        }
	
	   
	    	console.log(basicNum)
	    	const row = ${row}
	    	const col = ${col}
	    	const alphabetNumber = parseInt(col)+64
	    	var seatStatus = ${seatStatus}
	    	var reserveStatus = ${reserveVo}
	    
	    	
	    //	const alphabet = String.fromCharCode(alphabetNumber)
	    	
	    	var str_html = "";
	    	for(let i =65; i<=(parseInt(row)+64);i++){
	    		str_html = str_html+'<br>'
	    		for(let j=1;j<=col;j++){
	    			var alphabet = String.fromCharCode(i)    			
	    			var seat_btn = '<button class="seat-status" id="??" value="()" disabled1="abled">{}</button>';
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
	    			
	    			_(reserveStatus).forEach(function(e){
	    				if(e === alphabet+j){
	    					console.log(e)
	    					seat_btn = seat_btn.replace("disabled1","disabled")    					
	    					seat_btn = seat_btn.replace("??","reservationSeat")    					
	    				}
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
	    		
	    		//결제 테이블 정보를 넣기위한 hidden처리 
	    		$("#reserveBasic").val(parseInt(adultP))
	    		$("#reserveStudent").val(parseInt(studentP))
	    		$("#reserveOld").val(parseInt(oldP))
	    		
	    		
	    		$("#totalCheckCount").val(totalP)
	    		
	    	})	
	    	
	    	const seatArr = new Array();
	    	$(".seat-status").on('click',function(){
	    		const basicP = $("#reserveBasic").val()
				const studentP =$("#reserveStudent").val()
				const reserveP = $("#reserveOld").val()
				const allPeopleTotalCount =  parseInt(basicP)+parseInt(studentP)+parseInt(reserveP)

	    		if($(this).hasClass("choiceBtnStyle")){
	    			$(this).removeClass("choiceBtnStyle")  			 		
		    			for(let i=0;i<seatArr.length;i++){
		 		   			if(seatArr[i]==$(this).val()){
		 		   				seatArr.splice(i,1)
		 		   			}
		 		   		}
	    		}else{
		    			if(allPeopleTotalCount ==0){
		    				alert("좌석수 항목을 클릭후 선택해주세요")
		    			}else{		    				
			 		   		$(this).addClass("choiceBtnStyle")
				    		seatArr.push($(this).val())
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
	    		}
	    		
	    		$("#selected-count").val(seatArr.length)    		
	    		console.log("선택 좌석수  : "+seatArr.length)
	    		console.log("배열 : "+seatArr)
	    	
	    		$("#seatStatus").val(seatArr)
	    		$("#userChoiceSeat").val(seatArr)
	    		$("#reserveSeat").val(seatArr)
	    	
	    	})
	      })
	     

	</script>
    </body> 
    </html>