<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
       
       <style>
            .card-header{
                     background-color: #a1a1a1; 
                     height: 100%;
                     font-size: 30px; 
                     padding-top: 1%;
                     padding-bottom: 1%;
     
                 }
        </style>
    </head>
    <body>
        
       <jsp:include page="../default/admin_top_menu.jsp" />
	<jsp:include page="../default/admin_side_menu.jsp" />
	
        <!-- Navbar-->
        <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="#!">Settings</a></li>
                    <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                    <li><hr class="dropdown-divider" /></li>
                    <li><a class="dropdown-item" href="#!">Logout</a></li>
                </ul>
            </li>
        </ul>
        </nav>
        <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion" style="padding-top: 91px;">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <a class="nav-link" href="index.html">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            AdminMain
                        </a>

                        <!-- 회원 -->
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                회원관리
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="#">회원목록</a>
                                <a class="nav-link" href="ㅍ">등급관리</a>
                                <a class="nav-link" href="#">약관관리</a>
                            </nav>
                        </div>
                        <!-- 회원 -->

                        <!-- 영화관리 -->
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts1" aria-expanded="false" aria-controls="collapseLayouts">
                         <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                영화관리
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseLayouts1" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                <a class="nav-link" href="#">영화등록</a>
                                <a class="nav-link" href="#">좌석관리</a>
                            </nav>
                        </div>
                        

                        <!-- 스토어관리 -->
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                             <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                       스토어 관리
                                 <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                 <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link" href="admin-store-list.html">상품등록</a>
                                    <a class="nav-link" href="#">구매관리</a>
                                </nav>
                            </div>
                        
                        <!-- 게시글 관리 -->
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages1" aria-expanded="false" aria-controls="collapsePages1">
                            <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                      게시글 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                       </a>
                       <div class="collapse" id="collapsePages1" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion1">
                        <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages1">
                           <a class="nav-link" href="gaesipan.html">공지사항</a>
                           <a class="nav-link" href="admin-customer-answer-wait.html">고객문의</a>
                          
                       </nav>
                   </div>

                         <!-- 매출 관리 -->
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages2" aria-expanded="false" aria-controls="collapsePages1">
                            <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                      매출 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                       </a>
                           <div class="collapse" id="collapsePages2" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion1">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages1">
                                   <a class="nav-link" href="admin-movie-chart.html">매출통계관리</a>
                                   <a class="nav-link" href="admin-movie-best.html">베스트 영화</a>
                               </nav>
                           </div>

                         
                    </div>
                </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        DGV
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">게시글 관리</h1>
                        <ol class="breadcrumb mb-4">
                            
                          
                        </ol>
                        <div class="card mb-4">
                            <div class="card-header"font-familt:BMJUA>
                               고객문의(답변완료)
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-body">
                                <i class="fas fa-table me-1"></i>
                                목록
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>DGV문의</th>
                                            <th>유형</th>
                                            <th>제목</th>
                                            <th>등록일</th>
                                            <th>답변학인</th>
                                            <th>수정</th>
                                            <th>삭제</th>
                                        </tr>
                                    </thead>
                                   
                                    <tbody>
                                        <tr>
                                            <td>Tiger Nixon</td>
                                            <td>System Architect</td>
                                            <td>Edinburgh</td>
                                            <td>61</td>
                                            <td>2011/04/25</td>
                                            <td>$320,800</td>
                                            <td>11</td>
                                            <td>11</td>
                                            
                                        </tr>
                                        <tr>
                                            <td>Garrett Winters</td>
                                            <td>Accountant</td>
                                            <td>Tokyo</td>
                                            <td>63</td>
                                            <td>2011/07/25</td>
                                            <td>$170,750</td>
                                        </tr>
                                        <tr>
                                            <td>Ashton Cox</td>
                                            <td>Junior Technical Author</td>
                                            <td>San Francisco</td>
                                            <td>66</td>
                                            <td>2009/01/12</td>
                                            <td>$86,000</td>
                                        </tr>
                                        <tr>
                                            <td>Cedric Kelly</td>
                                            <td>Senior Javascript Developer</td>
                                            <td>Edinburgh</td>
                                            <td>22</td>
                                            <td>2012/03/29</td>
                                            <td>$433,060</td>
                                        </tr>
                                        <tr>
                                            <td>Airi Satou</td>
                                            <td>Accountant</td>
                                            <td>Tokyo</td>
                                            <td>33</td>
                                            <td>2008/11/28</td>
                                            <td>$162,700</td>
                                        </tr>
                                        <tr>
                                            <td>Brielle Williamson</td>
                                            <td>Integration Specialist</td>
                                            <td>New York</td>
                                            <td>61</td>
                                            <td>2012/12/02</td>
                                            <td>$372,000</td>
                                        </tr>
                                        <tr>
                                            <td>Herrod Chandler</td>
                                            <td>Sales Assistant</td>
                                            <td>San Francisco</td>
                                            <td>59</td>
                                            <td>2012/08/06</td>
                                            <td>$137,500</td>
                                        </tr>
                                        <tr>
                                            <td>Rhona Davidson</td>
                                            <td>Integration Specialist</td>
                                            <td>Tokyo</td>
                                            <td>55</td>
                                            <td>2010/10/14</td>
                                            <td>$327,900</td>
                                        </tr>
                                     
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
               <jsp:include page="../default/admin_footer.jsp"/>
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">by DGV © DGV COMPANY</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>