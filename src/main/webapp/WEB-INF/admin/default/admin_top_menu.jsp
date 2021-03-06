<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="movie.mdo"><img src="${pageContext.request.contextPath }/resources/images/dgvMainLogo.png" style="padding-top: 30px;"></a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
            	
                <div class="input-group">
                	 <c:if test="${empty adminId}">
                        <span><a class="dropdown-item" style="background-color: #e7e5e5;border-radius: 5px;" href="/login.mdo">Login</a></span>
                     </c:if>
                     <c:if test="${!empty adminId}">
                        <span><a style="color:white"  href="/logout.mdo">${adminId}님 Logout</a></span>
                     </c:if>
                </div>
            </form>
            <!-- Navbar-->:
            
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>                  
                    </ul>
                </li>
            </ul>
        </nav>