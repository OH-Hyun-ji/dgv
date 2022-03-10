<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Admin Movie Director Register</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' />
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>
	<script src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(function(){
			
			$("#plus-button").on('click',function(){
				
				const tr = $("<tr>")
				const td = $("<td>")
				const td1 = $("<td>")
				const td2 = $("<td>")
				const td3 = $("<td>")
				const td4 =$("<td>")
				const input = $("<input>")
						.attr("type","button")
						.attr("class","delRow")
						.attr("value","삭제")
				const span =$("<span>")
						.attr("class","hour")
						.text("시")
				const span1 =$("<span>")
						.attr("class","minute")
						.text("분")
 				const select = $("<select>")
						.attr("class","time-hour")
				const select1 = $("<select>")
						.attr("class","time-minute")
				
				for(let i=1;i<24;i++){
					if(i<10){
						i="0"+i
					}
					const option=$("<option>")
							.attr("class","timeHH")
							.attr("value",i)
							.text(i)
					select.append(option)		
				}
				td.append(select)
				tr.append(td)
				tr.append(span)
				
				for(let j=0;j<60;j++){
					if(j<10){
						j="0"+j
					}
					const option1 = $("<option>")
							.attr("class","timeMM")
							.attr("value",j)
							.text(j)
						select1.append(option1)
				}
				td1.append(select1)
				tr.append(td1)
				tr.append(td2)
				tr.append(span1)
				td2.append(input)
				tr.append(td2)
				
				$("#TimeTable").append(tr)
				
			select.on('change',function(){
				const aa= $(this).val()
				console.log(aa)
			})
			select1.on('change',function(){
				const aa1 = $(this).val()
				console.log(aa1)
			})
	
				
		})
		
		$("#timeRegister").click(function(){
			const aa= $(".timeMM").val()
			const aa1= $(".timeHH").val()
			const regionName =${theaterList.region_code }
			const theaterName = ${theaterList.theater_code} 
			const timeList = $("#TimeTable").children();
			_($("#TimeTable").children()).forEach(function(n){
				const timeT = $(n).children().eq(0).children().first().val();	
				const timeM = $(n).children().eq(2).children().first().val();	
		
				
				console.log("TimeT : "+timeT+":"+timeM)
				console.log("TimeM : "+timeM)
			})
			
		
			console.log("현재 코드 :"+regionName)
			console.log("현재 코드1 :"+theaterName)
			var arr= ""
			
			const timeListInfo = _.map(timeList, function(n){
				const timeT = $(n).children().eq(0).children().first().val();	
				const timeM = $(n).children().eq(2).children().first().val();
				arr+=(timeT+":"+timeM+"/")
			
				return arr;
				
			})
			const timeListLast =timeListInfo[timeListInfo.length-1]
			console.log("bbb" +timeListLast)
			var dataArr=[];
			const timeVo = {
				"region_code":regionName,
				"theater_code":theaterName,
				"movie_time_start":timeListLast
				
			}
			
			console.log("배열 :" +timeListInfo)
		
			console.log("timeList length : "+ timeListLast.length)
			console.log("선택한 시간은"+ aa+"선택한 분은 "+aa1)
			
			$.ajax({
				method:"POST",
				url:"/timeInsert.mdo",
				contentType:"application/json",
				dataType:"json",
				data:JSON.stringify(timeVo),
				success:function(result){
					if(result.msg=="SUCCESS"){
						alert("등록 완료!!")
						window.opener.location.reload();
    					window.close();
					}else if(result.msg="EXIST"){
						alert("이미 등록된 데이터 입니다.")
					}
					else{
						alert("등록 실패!!")
					}
				},
				error:function(){
					console.log("통신실패")
				}
			})//close ajax 
		})
		
		$(document).on('click', '.delRow',function(){
			$(this).closest("tr").remove();
		})
			
		
		
			
			
			
		})  
	  
	</script>
	<style>
	      .mt-4{
	          text-align: center;
	          margin-bottom: 0;
	      }
	      body{
	      	background-image:url("./../../../resources/images/adminBackground01.png");
	          background-size: contain;
	          
	      }
	      h3{
	      	font-size: 25px;
		    color: lightgray;
		    font-weight: bold;
		    padding-left: 10%;
		    background-color: rgba(0,0,0,0.4);
		    margin: 0;
		    padding-bottom: 6px;
	}
	      .bottomBar{
	          margin-top: 5%;
	          display: flex;
	          justify-content: space-evenly
	      }
	      .bottomBar>input{
	          background-color: lightgray;
	          height: 45px;
	          width: 25%;
	          border-radius: 13px;
	      }
	      
	     #table-container {
	          padding-left: 15%;
	      }
	      table.type02 {
		      border: 1px solid white;
		      width: 360px;
		      height: 221px;
		 }
		 .time-title {
		 	  height: 38px;
		      display: flex;
		      justify-content: end;
		      border-bottom: 1px solid white;
		 }
		  .time-title > td >button{
		  	  width: 91px;
			  font-size: 15px;
			  background-color: orange;
			  font-weight: bolder;
			  border-radius: 10px;
			  color: white;
			  height: 36px;
  			
  		}
  		select.time-hour {
			    width: 100px;
			    height: 29px;
			    border-radius: 11px;
		}
		select.time-minute {
			    width: 100px;
			    height: 29px;
			    border-radius: 11px;
		}
	 </style>      
</head>
<body style="color: aliceblue;">
    <div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">

				<!-- 여기만 수정해서 사용하세요!! -->
				<h1 class="mt-4" style="background-color: rgba(0,0,0,0.4);">Movie Theater Time</h1>

				<div class="card mb-4">
					<div class="card-header">
						<h3>${theaterList.region_name } => ${theaterList.theater_name}  </h3>
                       
					</div>
					<div class="card-body">

						<div id="table-container">
							<input type="hidden" id="theaterCode" name="theater_code"
								value="">
							<div
								style="height: 229px;width: 363px;border: 1px solid #fff;border-bottom: 0;margin-left: -4%;">
								<div
									style="float: right; color: antiquewhite; display: flex; margin-right: 8%;">
									<span style="font-weight: bold; font-size: 27px; width: 266px;">Theater Time</span> 
									<button id="plus-button" style="margin: 0;padding: 0;"><i style="width: 33px; height: 38px;color: orangered;" class="fas fa-plus-square"></i></button>
								</div>
								<div
									style="overflow-y: scroll; width: 100%; height: 85%; border: 1px solid #fff; margin-top: 46px;">
									<table id="TimeTable"></table>
								</div>
							</div>
							<div class="bottomBar">
								<input type="button" value="Register" id="timeRegister" style="margin-left: 10px;"/>
							</div>

						</div>
					</div>
				</div>
		</main>
	</div>
</html>
