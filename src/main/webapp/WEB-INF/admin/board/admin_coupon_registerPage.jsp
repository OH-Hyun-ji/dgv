<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coupon Register</title>
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" />
 <link href="${pageContext.request.contextPath }/resources/css/admin/managerDetail.css" rel="stylesheet" />
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" ></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" ></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script> 			  
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
 <script type="text/javascript">
  		
  		function thumbNail(event) {
  			
			var reader = new FileReader();
			$("#thImg1-style").empty()
			reader.onload= function(event){
				document.getElementById("thImg1-style").src=event.target.result;
			}
			reader.readAsDataURL(event.target.files[0])
		}
  		
  		$(function(){
  			$("input[name=coupon_date]").datepicker();
  			$.datepicker.setDefaults({
  			    dateFormat: 'yy-mm-dd' //Input Display Format 변경
  			});
  			$("#couponRegister").click(function(){
  				const couponName = $("#couponName").val()
  				const couponDiscount =$("#couponDiscount").val()
  				const couponDate  = $("#couponDate").val()
  				const couponImgName = $("#couponImg").val()
  				const couponArr = couponImgName.split("\\")
  				const imgName = couponArr[couponArr.length-1]
  				const imgFile = $("#couponImg")[0].files[0]
  				
  				const couponVo ={
  					"coupon_name":couponName,
  					"coupon_discount":couponDiscount,
  					"coupon_date":couponDate,
  					"coupon_img":imgName				
  				}
  				
  				const form = new FormData();
  				form.append("imgFile",imgFile)
  				form.append("couponVo",new Blob([JSON.stringify(couponVo)],{type:"application/json"}));
  				
  				$.ajax({
  					method:"POST",
  					url:"/insertCoupon.mdo",
  					enctype:"multipart/form-data",
  					contentType:false,
  					processData:false,
  					data:form,
  					success:function(result){
  						if(result.msg=="SUCCESS"){
  							alert("쿠폰 등록 완료!!")
  							window.opener.location.reload()
  							window.close()
  						}
  					},
  					error:function(){
  						console.log("통신실패")
  					}
  				})//ajax close
  				
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
            padding-bottom: 2rem;
        }
    </style>   
</head>
<body style="color: aliceblue;">
    <div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<!-- 여기만 수정해서 사용하세요!! -->
				<h1 class="mt-4" style="background-color: rgba(0,0,0,0.4);">Coupon</h1>
				<div class="card mb-4">
					<div class="card-header" style="margin-bottom: 2rem;">
						<h3>
						Coupon Register
                        </h3>
					</div>
					<div class="card-body">
                            <div id="table-container">
                            	<input type="hidden" id="regId" name="reg_id" value="${adminID}">                            
								<table class="type02">		
									<tr>
										<th scope="row" style="font-size:18px;">Coupon Name</th>
										<td><input type="text" id="couponName" name="coupon_name" style="border-radius: 7px;line-height: 25px;width: 250px;"/></td>
									</tr>	
									<tr>
										<th scope="row" style="font-size:18px;">Coupon DisCount</th>
										<td>
											<input type="text" id="couponDiscount" name="coupon_discount" style="border-radius: 7px;line-height: 25px;width: 250px;"/>
										</td>
									</tr>	
									<tr>
										<th scope="row" style="font-size:18px;">Coupon Date(사용기한)</th>
										<td>
											<input type="text" id="couponDate" name="coupon_date" style="border-radius: 7px;line-height: 25px;width: 250px;"/>
										</td>
									</tr>								
									<tr>
										<th scope="row" style="font-size:18px;">Coupon Image</th>
										<td>
											<input type="file" multiple="multiple" id="couponImg"  onchange="thumbNail(event)"  name="coupon_img" style="cursor:pointer; border-radius: 7px;line-height: 25px;"/>
										</td>								
									</tr>	
									
								</table>
                            </div>
                            <div class="thImg-container" style="justify-content: center;">
								<div class="thImg-wrap">
									<img id="thImg1-style" >
								</div>
							</div>
                            <div class="bottomBar">
								 <input type="button" value="Register" multiple="multiple"id="couponRegister" style="margin-left: 10px;cursor: pointer;"/>
                            </div>
					</div>
				</div>
				
			</div>
		</main>
	</div>
</html>