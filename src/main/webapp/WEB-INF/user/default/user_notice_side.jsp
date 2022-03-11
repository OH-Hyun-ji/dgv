<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
  <div class="cols-content" id="menu" style="float: none;">
                        <div class="col-aside" style="width: 166px;">
                           
                            <h2>MY DGV 서브메뉴</h2>
                            <div class="snb">
                                <ul>
                                    <li class="on">
                                        <a href="/serviceCenter.do" title="현재 선택">고객센터 메인</a>
                                    </li>
                                    <li >
                                        <a href="/notice.do">공지사항</a>
                                    </li>
                                    <li >
                                        <a href="/oftenQna.do">자주찾는 질문</a>
                                    </li>
                                    <c:if test="${!empty userID }">
	                                    <li >
	                                        <a href="/myQna.do">나의 1:1 문의</a>                                       
	                                    </li>
                                    </c:if>
                                    <c:if test="${empty userID }">
	                                    <li >
	                                        <a href="/loginForm.do">나의 1:1 문의</a>                                       
	                                    </li>
                                    </c:if>
                                </ul>
                            </div>
                        </div>
                      
                    </div>