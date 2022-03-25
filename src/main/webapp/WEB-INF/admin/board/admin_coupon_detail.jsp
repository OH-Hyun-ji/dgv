<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/png" sizes="192x192"  href="${pageContext.request.contextPath }/resources/images/banana_real.png">
	<title>Admin Update</title>
	<link href="${pageContext.request.contextPath }/resources/css/admin/styles.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath }/resources/css/user/button.css" rel="stylesheet"  />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"	crossorigin="anonymous"></script>
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
  			
  			$("#couponUpdateBtn").click(function(){
  				const couponNum =$("#couponNum").val()
  				const couponName = $("#couponName").val()
  				const couponDiscount =$("#couponDiscount").val()
  				const couponDate  = $("#couponDate").val()
  				const couponImgName = $("#couponImg").val()
  				const couponArr = couponImgName.split("\\")
  				const imgName = couponArr[couponArr.length-1]
  				const imgFile = $("#couponImg")[0].files[0]
  				
  				const couponVo ={
  					"coupon_num":couponNum,
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
  					url:"/CouponUpdate.mdo",
  					enctype:"multipart/form-data",
  					contentType:false,
  					processData:false,
  					data:form,
  					success:function(result){
  						if(result.msg=="SUCCESS"){
  							alert("쿠폰 수정 완료!!")
  							location.reload()  							
  						}
  					},
  					error:function(e){
  						console.log(e)
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
		
		th {
		    width: 179px;
		}
		tbody {
		    height: 339px;
		}
    </style>
</head>
<body class="sb-nav-fixed">
	<div id="layoutSidenav">
		<jsp:include page="../default/admin_top_menu.jsp"></jsp:include>
		<jsp:include page="../default/admin_side_menu.jsp"></jsp:include>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 style=" padding-top: 1rem;padding-bottom: 2px;border-bottom: 1px solid;">쿠폰 상세보기</h1>
					<div class="card mb-4" style="background-color: #f7f7f7;">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 쿠폰
						</div>
						<div class="card-body" style="height: 500px;">
							<div class="update-style-area">
							 	 <div id="table-container">
	                            	<input type="hidden" id="couponNum" name="coupon_num" value="${couponVo.coupon_num}">                            
									<table class="type02" style="margin-left: 6rem;">		
										<tr>
											<th scope="row" style="font-size:18px;">Coupon Name</th>
											<td><input type="text" id="couponName" class="sameInput" name="coupon_name" value="${couponVo.coupon_name}" /></td>
										</tr>	
										<tr>
											<th scope="row" style="font-size:18px;">coupon_code</th>
											<td><input type="text" id="couponCode" class="sameInput" readonly="readonly" name="coupon_code" value="${couponVo.coupon_code}" /></td>
										</tr>	
										<tr>
											<th scope="row" style="font-size:18px;">Coupon DisCount</th>
											<td>
												<input type="text" id="couponDiscount"class="sameInput" name="coupon_discount" value="${couponVo.coupon_discount}"/>
											</td>
										</tr>	
										<tr>
											<th scope="row" style="font-size:18px;">Coupon Date<br>(사용기한)</th>
											<td>
												<input type="text" id="couponDate"class="sameInput" name="coupon_date" value="${couponVo.coupon_date}"/>
											</td>
										</tr>																																						
									</table>
	                            </div>
			                            <div class="eventImg-wrapper1" style="margin-left: 7rem;">
			                            	<div class="event-label-wrapping1">
				                            	<label class="event-label1" style="font-weight:bolder;">Coupon Image</label>
				                            	<input type="file" multiple="multiple" id="couponImg"  onchange="thumbNail(event)"  name="coupon_img" style=" border-radius: 7px;line-height: 25px;"/>
				                           	</div>
				                           	<div class="thImg-wrap">
													<img id="thImg1-style" src="${couponVo.coupon_img }" >
											</div>
			                            </div>			                          
			                        </div>
                            <div class="bottomBar">
                                <input type="button" value="수정하기" multiple="multiple"id="couponUpdateBtn" style="margin-left: 10px;"/>
                            </div>
						</div>
					</div>
				</div>
			</main>
			<jsp:include page="../default/admin_footer.jsp" />
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resources/js/admin/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resources/js/admin/datatables-simple-demo.js"></script>
</body>
</html>
