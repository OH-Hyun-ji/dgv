<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>회원정보 수정 비밀번호입력</title>
	<meta name="viewport" content="width=1024">
	<title id="ctl00_ctl00_headerTitle"></title>

	<meta name="Description" content="DGV 회원 가입 시, 입력하신 회원님의 정보를 최신정보로 수정하실 수 있습니다." />
	<meta http-equiv="X-UA-Compatible" content="IE=edge ,chrome=1" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=yes">
	<meta name="format-detection" content="telephone=no" />
	<meta http-equiv="Cache-Control" content="no-cache" />
	<meta http-equiv="Pragma" content="no-cache" />

	<script src="/cjmweb/js/jquery-1.11.3.min.js"></script>
	<script src="/cjmweb/js/common.js"></script>
	<script src="/cjmweb/js/form.validate.js"></script>

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/mypage/informationupdate.css">

</head>

<body>
	<!--skip navigation-->
	<div class="skipNavi">
		<a href="#contentsWrap">본문으로 바로가기</a>
	</div>
	<!--//skip navigation-->

	<div id="bodyWrap" class="wide">

		<!--header-->
		<div id="part_headerWrap" style="background-color: khaki;">
			<div class="part_header_wrap">
				<h1 class="cj_logo" style="text-align: start;"><span class="logo" style="text-align: start;">DGV</span>
					<font _mstmutation="1"> Lifestyle Membership</font>
				</h1>
				<div id="coop_header_wrap">
					<p class="part_logo" style="text-align: right;">
						<font _mstmutation="1">영화 그 이상의 감동을 전하는 세계 최고의 문화 플랫폼</font><img src="${pageContext.request.contextPath }/resources/images/dgvMainLogo.png" alt="CGV"
							style="text-align: right;">
					</p>
				</div>
				<!-- 160216 수정 - 제휴 브랜드별 헤더 문구 및 로고 추가 -->


				<!-- //160216 수정 - 제휴 브랜드별 헤더 문구 및 로고 추가 -->
			</div>
		</div>

		<form method="post" id="getCoopForm" name="getCoopForm">
			<input type="hidden" name="get_coopco_cd" id="get_coopco_cd" value="7010">
			<input type="hidden" name="get_brnd_cd" id="get_brnd_cd" value="1000">
			<input type="hidden" name="get_mcht_no" id="get_mcht_no" value="1000">
		</form>

		<form id="headerFrm" method="get">
			<input type="hidden" name="h_search_keyword" id="h_search_keyword">
		</form>
		<!--//header-->

		<!--contents-->
		<div id="contentsWrap">
			<form id="form1" method="post" action="">
				<input type="hidden" name="coopco_cd" id="coopco_cd" value="7010">
				<input type="hidden" name="brnd_cd" id="brnd_cd" value="1000">
				<input type="hidden" name="mcht_no" id="mcht_no" value="1000">
				<input type="hidden" name="coop_return_url" id="coop_return_url" value="">
				<input type="hidden" name="__chkpwd" id="__chkpwd" value="">
				<input type="hidden" name="pwd" id="security_pwd" value="">
				<input type="hidden" name="access_token" id="access_token" value="" />
				<input type="hidden" name="noAgr" id="noAgr"
					value="AGRTYPCD_10,AGRTYPCD_11,AGRTYPCD_30,AGRTYPCD_40,AGRTYPCD_47,AGRTYPCD_31,AGRTYPCD_20,AGRTYPCD_21,AGRTYPCD_51,AGRTYPCD_Y14LT" />
			</form>
			<input type="hidden" name="tmpField">
			<div id="contents">
				<div class="cont_header">
					<h1 class="h1_tit">회원정보 수정</h1>
					<p class="h_desc">회원님의 소중한 정보를 안전하게 관리하세요.</p>
				</div>
				<div class="cont_area">
					<div class="mypage_sec modify">
						<div class="regi_complete">
							<span class="bg bg face_type2"><img src="${pageContext.request.contextPath }/resources/images/dgvMainLogo.png"></span>
							<p class="h2_tit">회원정보를 수정하시려면 비밀번호를 입력하셔야 합니다.</p>
							<p class="h_desc">회원님의 개인정보 보호를 위한 본인 확인 절차이오니, DGV 회원 로그인 시 사용하시는 비밀번호를 입력해주세요.</p>
							<div class="pwd_box">
								<span class="input_txt w330">
									<input type="password" id="pwd" class="text" placeholder="비밀번호를 입력해주세요."
										title="비밀번호" maxlength="20">
								</span>
							</div>
							<div class="btn_center">
							<!-- 취소부분 누르면 user_mypage_informationupdateClick으로... -->
								<button type="button" class="btn"><a href="#"
										target="_blank" title="새창" class="round inred on">취소</button></a>
										
							<!-- 확인부분 누르면 user_mypage_informationupdatechange으로... -->
								<button type="button" class="btn btn_em"><a href="#"
										target="_blank" title="새창" class="round inred on">확인</button></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--//contents-->

	<!--footer-->
	<div id="footer">
		<!-- 로그인여부 여부 체크 -->

		<div class="footer_wrap">

			<div class="site_info">
				<span class="ceo_info">대표이사 DGV</span>
				<address>서울특별시 종로구 돈화문로 26 KG아이티뱅크(묘동, 단성사4층)</address>
				<span class="customer_info">DGV 고객센터 ????-????</span>
				<span class="license_num">사업자 등록번호 ???-??-????</span>
			</div>
			<div class="site_info pd0">
				<span class="ceo_info">호스팅사업자 DGV</span>
				<span class="license_num">통신판매업신고번호 2022-서울종로-????</span>
			</div>
			<p class="copyright">
				<span class="img"><img src="${pageContext.request.contextPath }/resources/images/dgvMainLogo.png" alt="DGV"></span>
				Copyright (c)2022 DGV . All Rights Reserved
			</p>

			<div class="fixedTop" data-control="goTop"><a href="#headerWrap" title="페이지 처음으로 이동"><span
						class="haze">TOP</span></a></div>

		</div>
		<!--// 20191021 CJ ONE APP 사업자 정보 노출 전체 영역 -->
		<!-- 레이어 팝업(confirm) 내용 -->
		<div id="div_confirm" style="display: none;">
			<div class="ui_modal"
				style="position: fixed; background-color: rgb(255, 255, 255); outline: none; background-clip: padding-box; top: 50%; left: 50%; margin-left: -200px; margin-top: -160px; width: 400px; z-index: 9101;"
				tabindex="0">

				<div id="layerWrap" class="custom">
					<h1 id="h_confirm_title">알림</h1>

					<div class="inner" tabindex="0">
						<p id="p_confirm_text"></p>
					</div>


					<div class="btn_center">
						<a href="javascript:closeLayerConfirm();" id="a_confirm_y" class="btn"><span
								id="span_confirm_y">확인</span></a>
						<button id="a_confirm_n" type="button" onclick="closeLayerConfirm();" class="btn cancel"><span
								id="span_confirm_n">취소</span></button>
					</div>

					<button id="btn_confirm_close" type="button" onclick="closeLayerConfirm();"
						class="close">닫기</button>
				</div>

			</div>
			<div class="ui_modal_overlay"
				style="position: fixed; top: 0px; left: 0px; right: 0px; bottom: 0px; z-index: 9100;"></div>
		</div>
		<!-- //레이어 팝업(confirm) 내용 -->
		<!-- 레이어 팝업(alert) 내용 -->
		<div id="div_alert" style="display: none;">
			<div class="ui_modal"
				style="position: fixed; background-color: rgb(255, 255, 255); outline: none; background-clip: padding-box; top: 50%; left: 50%; margin-left: -200px; margin-top: -160px; width: 400px; z-index: 9101;"
				tabindex="0">

				<div id="layerWrap" class="custom">

					<div class="inner" tabindex="0">
						<p id="p_alert_text"></p>
					</div>
				</div>

			</div>
			<div class="ui_modal_overlay"
				style="position: fixed; top: 0px; left: 0px; right: 0px; bottom: 0px; z-index: 9100;"></div>
		</div>
		<!-- //레이어 팝업(alert) 내용 -->
	</div>
	<!--//footer-->

	</div>
	<!--script 영역-->
	<script src="/cjmweb/js/modules/cjoneCore.js"></script>
	<script src="/cjmweb/js/modules/commonUi.js"></script>
	<script src="/cjmweb/js/frontUi.js"></script>
	<script src="/cjmweb/js/modules/jquery.bxslider.js"></script>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script>
		$(document).ready(function () {


			enterKey("pwd", "goCheck()");
		});

		// 취소
		function goCancel() {
			$("#form1").attr("action", "/cjmweb/main.do");
			$("#form1").submit();

		}

		// 비밀번호 확인 
		function goCheck() {
			if ($("#pwd").val() == "") {
				alert('비밀번호를 입력해 주세요.');
				$("#pwd").focus();
			} else {
				//var params = encodeURI($('#form1').serialize());
				$('#security_pwd').val(BASE64.encode($('#pwd').val()));
				var params = $('#form1').serialize();
				$.ajax({
					url: "/cjmweb/member/passwd-check.do",
					data: params,
					dataType: "json",
					type: "post",
					async: false,
					success: function (data) {
						var str_msg = "" + data.reqBox.str_msg;
						if (data.reqBox.result_code == "2") {
							// 비밀번호 틀릴경우
							if (str_msg != "undefined" && str_msg != null && str_msg != '') {
								str_msg = str_msg.replace(/\\n/g, '\n');
								alert(str_msg);
							}
							$('#pwd').val('');
							//location.replace("/cjmweb"+ data.reqBox.action_url );
						} else if (data.reqBox.result_code == "3") {
							// 페이지 변경
							if (str_msg != "undefined" && str_msg != null && str_msg != '') {
								str_msg = str_msg.replace(/\\n/g, '\n');
								alert(dstr_msg);
							}
							$("#form1").attr("action", "/cjmweb" + data.reqBox.action_url);
							$("#form1").submit();
						} else if (data.reqBox.result_code == "1") {
							// 비밀번호 확인완료 및 수정페이지 이동
							$("#__chkpwd").val(data.reqBox.__chkpwd);
							$("#form1").attr("action", "/cjmweb" + data.reqBox.action_url);
							$("#form1").submit();
						}
					},
					error: function (xhr) {
						//에러
					}
				});
			}
		}
	</script>
	<!--//script 영역-->
</body>
</html>