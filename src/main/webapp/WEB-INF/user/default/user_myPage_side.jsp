<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
	<script type="text/javascript">
			
	$(function(){
		
		
		$(".feat-btn").click(function(){
			$(this).removeClass('fix')
			$("#myQna").removeClass("on")
			$("#myInfo").removeClass("on")
			$("#myDiscount").removeClass("on")
			$("#myReserve").removeClass("on")
			$("div.col-aside ul .feat-show1").removeClass("show")
			$("div.col-aside ul .feat-show2").removeClass("show")
			$("div.col-aside ul .feat-show").toggleClass("show")	
		})
		$(".feat-btn1").click(function(){
			$(this).removeClass('fix')
			$("#myQna").removeClass("on")
			$("#myEventJoin").removeClass("on")
			$("#myDiscount").removeClass("on")
			$("#myReserve").removeClass("on")
			$("div.col-aside ul .feat-show").removeClass("show")
			$("div.col-aside ul .feat-show2").removeClass("show")
			$("div.col-aside ul .feat-show1").toggleClass("show")	
		})
		$(".feat-btn2").click(function(){
			$(this).removeClass('fix')
			$("#myInfo").removeClass("on")
			$("#myEventJoin").removeClass("on")
			$("#myDiscount").removeClass("on")
			$("#myReserve").removeClass("on")
			$("div.col-aside ul .feat-show").removeClass("show")
			$("div.col-aside ul .feat-show1").removeClass("show")
			$("div.col-aside ul .feat-show2").toggleClass("show")	
		})
		
		$("div.col-aside ul .feat-btn").click(function(){
			$(this).addClass("active").siblings().removeClass("active")				
		})
		$("div.col-aside ul .feat-btn1").click(function(){
			$(this).addClass("active").siblings().removeClass("active")				
		})
		$("div.col-aside ul .feat-btn2").click(function(){
			$(this).addClass("active").siblings().removeClass("active")				
		})
	})
	</script>
</head>
  <div class="cols-content" id="menu" style="float: none;">
                        <div class="col-aside" style="width: 166px;">
                           
                            <h2>MY DGV 서브메뉴</h2>
                            <div class="snb">
                                <ul class="mySide">
                                    <li id="myMain" class="on">
                                        <a href="/myPage.do" title="현재 선택">MY DGV HOME
                                        </a>
                                    </li>
                                    <li id="myReserve" >
                                        <a href="/myPage_reserve.do">나의 예매내역        
                                        </a>
                                    </li>
                                    <li id="myDiscount" >
                                        <a class="feat-btn" href="javascript:;">관람권/할인쿠폰 관리</a>
                                        <ul class="feat-show" >
                                            <li >
                                                <a  href="/myPage_coupon.do">- DGV할인쿠폰</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li id="myEventJoin" >
                                        <a href="/myPage_event.do" >이벤트 참여내역
                                        </a>
                                    </li>
                                    <li id="myInfo">
                                        <a class="feat-btn1" href="javascript:;">회원정보<i></i>
                                        </a>
                                        <ul class="feat-show1"  >
                                            <li >
                                                <a id="changeInfo" href="/myPage_checkData.do">- 개인정보 변경</a>
                                            </li>
                                            <li >
	                                        	<a id="profileInfo" href="/myProfile.do">- 프로필 관리<i></i></a>
                                   			</li>
                                            <li >
	                                        	<a id="pointLog" href="/pointLog.do">- 포인트 내역<i></i></a>
                                   			</li>
                                        </ul>
                                    </li>
                                   
                                    <li id="myQna">
                                        <a class="feat-btn2"href="javascript:;">나의 문의내역
                                        </a>
                                        <ul class="feat-show2">
                                            <li >
                                                <a href="/myQna.do" style="padding-left: 26%;">- 1:1 문의</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="my-event">
                                        <a href="myPage_userMovie.do">내가 본 영화</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                      
                    </div>