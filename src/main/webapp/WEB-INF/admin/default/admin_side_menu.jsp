<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion" style="padding-top: 91px;">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <a class="nav-link" href="movie.mdo">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                AdminMain
                            </a>

                            <!-- 회원 -->
                            <a class="nav-link collapsed" href="/userList.mdo" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                    회원관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/userList.mdo">회원목록</a>
                                    <a class="nav-link" href="/userRank.mdo">등급관리</a>
                                    <a class="nav-link" href="/userTermList.mdo">약관관리</a>
                                </nav>
                            </div>
                            <!-- 회원 -->

                            <!-- 영화관리 -->
                            <a class="nav-link collapsed" href="/movieList.mdo" data-bs-toggle="collapse" data-bs-target="#collapseLayouts1" aria-expanded="false" aria-controls="collapseLayouts">
                             <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                    영화관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts1" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link" href="/movieList.mdo">영화등록</a>
                                    <a class="nav-link" href="/adminSeat.mdo">좌석관리</a>
                                    <a class="nav-link" href="/adminTheater.mdo">극장관리</a>
                                    <a class="nav-link" href="/adminManageMent.mdo">장르/연령관리</a>
                                    <a class="nav-link" href="/adminManager.mdo">감독/배우관리</a>
                                </nav>
                            </div>
                            
                            <!-- 게시글 관리 -->
                            <a class="nav-link collapsed" href="/adminNotice.mdo" data-bs-toggle="collapse" data-bs-target="#collapsePages1" aria-expanded="false" aria-controls="collapsePages1">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                          게시글 관리
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                           </a>
                               <div class="collapse" id="collapsePages1" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion1">
                                    <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages1">
                                       <a class="nav-link" href="/adminNotice.mdo">공지사항</a>
                                       <a class="nav-link" href="/adminEnquriy.mdo">고객문의(답변대기)</a>
                                       <a class="nav-link" href="/adminAnswerOk.mdo">고객문의(답변완료)</a>
                                   </nav>
                               </div>

                             <!-- 매출 관리 -->
                            <a class="nav-link collapsed" href="/adminChart.mdo" data-bs-toggle="collapse" data-bs-target="#collapsePages2" aria-expanded="false" aria-controls="collapsePages1">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                          매출 관리
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                           </a>
                               <div class="collapse" id="collapsePages2" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion1">
                                    <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages1">
                                       <a class="nav-link" href="/adminChart.mdo">매출통계관리</a>
                                       <a class="nav-link" href="/adminpaymentDetails.mdo">결제 내역 관리</a>
                                       <a class="nav-link" href="/adminBest.mdo">베스트 영화</a>
                                   </nav>
                               </div>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        dgv
                    </div>
                </nav>
            </div>