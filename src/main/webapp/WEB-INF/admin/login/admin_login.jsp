<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/png" sizes="192x192"  href="${pageContext.request.contextPath }/resources/images/banana_real.png">
<title>Admin Login</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Admin-Login</title>
        <link href="${pageContext.request.contextPath }/resources/css/admin/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>
   		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script> 
   		<script type="text/javascript">
   			function loginCheck(){
   				toastr.options = {
   					  "closeButton": true,
   					  "debug": false,
   					  "newestOnTop": false,
   					  "progressBar": true,
   					  "positionClass": "toast-top-right",
   					  "preventDuplicates": true,
   					  "onclick": null,
   					  "showDuration": "300",
   					  "hideDuration": "1000",
   					  "timeOut": "5000",
   					  "extendedTimeOut": "1000",
   					  "showEasing": "swing",
   					  "hideEasing": "linear",
   					  "showMethod": "fadeIn",
   					  "hideMethod": "fadeOut"
   					}
   				
   				const adminId = $("#adminId").val();
   				const adminPw = $("#adminPassword").val();
   				
   				if(adminId ==""){
   					toastr.warning("아이디를 입력해주세요!!","경고!!");
   				}else if(adminPw ==""){
   					toastr.warning("비밀번호를 입력해주세요!!","경고!!");
   				}   				
   				else{  				
   					$.ajax({
   						method:"POST",
   						url:"/loginCheck.mdo",
   						contentType:"application/json",
   						dataType:"json",
   						data:JSON.stringify({"admin_id":adminId,"admin_passwd":adminPw}),
   						success:function(result){
   							console.log(result)
   							const res = JSON.parse(result);
   							if(res.msg =="SUCCESS"){
   								alert("로그인 성공!!");
   								location.href="/movie.mdo";
   							}else{
   								alert("로그인 실패!!");
   								location.href="/login.mdo";
   							}
   						},
   						error:function(){
   							console.log("통신실패")
   						}   					
   					})//ajax close   					 					
   				}
   			}
   		</script>
    </head>
    <body class="" style="background-color:rgba(59, 58, 58, 0.986);">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">.  
                        <div><img src="${pageContext.request.contextPath }/resources/images/dgvMainLogo.png" style="width: 19%;"></div>
                        <div class="row justify-content-center">
                            <div class="col-lg-5" style="margin-top: 2%" >
                                <div class="card shadow-lg border-0 rounded-lg mt-5" style="border-radius: 40px; opacity: 0.8; background-color:rgba(43, 41, 41, 0.863);">
                                    <div class="card-headers"><img src="${pageContext.request.contextPath }/resources/images/loginLogo-01.png" style="margin-left: 29%;"></div>
                                    <div class="card-body">
                                        <div name="adminLoginForm">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="adminId" name="admin_id" type="id" placeholder="Id" style="border-radius: 20px;padding-left: 13%; background-color: rgb(101, 102, 102); border: none;"/>
                                                <label for="inputId" ><span style="color: azure;">id</span></label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="adminPassword" name="admin_passwd"type="password" placeholder="Password" style="padding-left: 13%; border-radius: 20px; background-color: rgb(101, 102, 102); border: none;" />
                                                <label for="inputPassword"><span style="color: azure;">Password</span></label>
                                            </div>
                                        
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0" style="margin-left: 9%">
                                                <input class="btn btn-primary"  value="login" onclick="loginCheck()" style="padding: 0.375rem 7rem; border-radius: 20px; border-color: #929696; background-color: #464343be; color: rgb(194, 194, 197);" >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer text-center py-3">
                       
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted"><span style="color: yellow;">by DGV &copy; DGV COMPANY</span> </div>
                            <div>
                                <a href="#" style="color: yellow;">GoGo</a>
                                &middot;
                                <a href="#" style="color: yellow;">Team &amp; Cheer up</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath }/resources/js/admin/scripts.js"></script>
    </body>
</html>
