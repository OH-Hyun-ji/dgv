<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Admin Coupon List</title>
	<link href="${pageContext.request.contextPath }/resources/css/admin/styles.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath }/resources/css/user/button.css" rel="stylesheet"  />
	<link href="${pageContext.request.contextPath }/resources/css/user/managerDetail.css" rel="stylesheet"  />
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"	crossorigin="anonymous"></script>
	<script type="text/javascript">
		function adminCoupon(){
	 		window.open('/couponRegister.mdo','','width=700,height=600')	
		}
	</script>
	<style type="text/css">
		a#idDetail {
		    text-decoration: none;
		    color: black;
		}
		.dataTable-container {
		    text-align-last: center;
		}
		a.tdStyle-coupon {
		    text-decoration: none;
		    color: black;
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
					<h1 class="mt-4">쿠폰관리</h1>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 쿠폰목록
						</div>
						<div class="card-body">
							<table id="datatablesSimple" name="userTable">
								<thead>
									<div>
										<div class="eventListBtn-wrap">
											<button class="w-btn-outline w-btn-red-outline" style="margin-top: 1%; box-shadow: none; padding: 10px; width: 13%; left:500; top:400; margin-bottom: 10px; margin-bottom: 1%;" 
	                                        type="button" onclick="adminCoupon()">
	                                            Register
	                                        </button>
	                                    </div>
									</div>
									<tr>
										<th>No</th>
										<th>Coupon Code</th>
										<th>Coupon Img</th>
										<th>Coupon Name</th>
										<th>Coupon Discount</th>
										<th>Coupon Date</th>
										<th>Writer</th>
										<th>Write Date</th>
										<th>Delete</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="couponList" items="${couponList }" varStatus="status">
										<tr>
											<td style="padding-top: 18px;">${status.index+1 }</td>
											<td style="padding-top: 18px;">${couponList.coupon_code }</td>
											<td>
												<a href="couponDetail.mdo?coupon_num=${couponList.coupon_num}"><img style="width: 102px;height: 40px;" src="${couponList.coupon_img }"></a>
											</td>
											<td style="padding-top: 18px;"><a class="tdStyle-coupon" href="couponDetail.mdo?coupon_num=${couponList.coupon_num}">${couponList.coupon_name }</a></td>
											<td style="padding-top: 18px;">${couponList.fomatter_discount } 원</td>
											<td style="padding-top: 18px;">${couponList.coupon_date }</td>
											<td style="padding-top: 18px;">${couponList.reg_id }</td>
											<td style="padding-top: 18px;">${couponList.reg_date }</td>
											<td style="padding-top: 18px;">
												<button id="delBt" onclick="deleteAction()"><i class="fas fa-trash-alt"></i></button>
											</td>
										</tr>	
									</c:forEach>				
								</tbody>
							</table>
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
