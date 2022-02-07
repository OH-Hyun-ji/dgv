<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Admin-Login</title>
        <link href="${pageContext.request.contextPath }/resources/css/admin/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="" style="background-color:rgba(59, 58, 58, 0.986);">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">.
                        
                        <div><img src="${pageContext.request.contextPath }/resources/images/7.png" style="width: 19%;"></div>
                        <div class="row justify-content-center">
                            <div class="col-lg-5" style="margin-top: 2%" >
                                <div class="card shadow-lg border-0 rounded-lg mt-5" style="border-radius: 40px; opacity: 0.8; background-color:rgba(43, 41, 41, 0.863);">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4" style="color: rgb(133, 134, 134);">Login</h3></div>
                                    <div class="card-body">
                                        <form>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputId" type="id" placeholder="Id" style="border-radius: 20px; background-color: rgb(101, 102, 102); border: none;"/>
                                                <label for="inputId" style="background-color: rgb(101, 102, 102);border-radius: 20px;" ><span style="color: azure;">id</span></label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputPassword" type="password" placeholder="Password"style="border-radius: 20px; background-color: rgb(101, 102, 102); border: none;" />
                                                <label for="inputPassword"style="background-color: rgb(101, 102, 102); border-radius: 20px;"><span style="color: azure;">Password</span></label>
                                            </div>
                                        
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0" style="margin-left: 22%">
                                            
                                                <a class="btn btn-primary" href="movie.mdo" style="padding: 0.375rem 7rem; border-radius: 20px; border-color: #929696; ; background-color: #464343be; color: rgb(194, 194, 197);" >Login</a>
                                            </div>
                                        </form>
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
