<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Admin User Rank Choice</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		$(function(){
				
			$("#rankChoice").click(function(){
				const userRank =$("#RankList").val()
				const userNum = $("#user_num").val()
				console.log(userNum)
				$.ajax({
					method:"POST",
					url:"/userRankUpdate.mdo",
					contentType:"application/json",
					dataType:"json",
					data:JSON.stringify({"rank_code":userRank,"user_num":userNum}),
					success:function(){
						alert("등급이 적용되었습니다.")
						window.opener.location.reload();
						window.close()						
					},
					error:function(){
						console.log("통신실패")
					}
				})//close ajax
				
			})
		});
	</script>
	
    <style>
        .mt-4{
            text-align: center;
        }
        body{
        	background-image:url("./../../../resources/images/adminBackground01.png");
            background-size: contain;
            
        }
        h3{
        	font-size: 25px;
		    color: #fffefe;
		    font-weight: bold;
		    padding-left: 10%;
		    background-color: rgba(0,0,0,0.4);
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
        select#RankList {
		    width: 216px;
		    height: 30px;
		}
    </style>
	</head>
	<body>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
	
					<!-- 여기만 수정해서 사용하세요!! -->
					<h1 class="mt-4" style="background-color: rgba(0,0,0,0.4);">Genre</h1>

				<div class="card mb-4">
					<div class="card-header">
						<h3>
						사용자 등급설정
                        </h3>
					</div>
					<div class="card-body">
                            <div id="table-container">
								<table class="type02">
									<tr>
										<th scope="row" style=" color: antiquewhite; font-size:18px;">Rank</th>
										<td>
										<input type="hidden" value="${userNum}" id="user_num" >
											<select id="RankList" name="user_rank">
												<option class="rankList"></option>
												<c:forEach var="rankList" items="${rankList}">
													<option value="${rankList.rank_code }">${rankList.rank_name }</option>
												</c:forEach>
											</select>
										</td>
									</tr>

								</table>
                            </div>
                            <div class="bottomBar">
                                <input type="button" value="Choice" id="rankChoice" style="margin-left: 10px;"/>
                            </div>
						
					</div>
				</div>
				<!-- 여기만 수정해서 사용하세요!! -->
			</div>
		</main>
	</div>
</html>
