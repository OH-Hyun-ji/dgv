<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>회원정보 수정</title>
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
						<font _mstmutation="1">영화 그 이상의 감동을 전하는 세계 최고의 문화 플랫폼</font><img src="${pageContext.request.contextPath }/resources/images/dgvMainLogo.png" alt="DGV"
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
						<div class="=cont_area">
                            <div class="mypage_sec">
                                <div class="member_info">
                                    <!-- 기본정보 -->
                                    <div class="table_header">
                                        <h3 class="h3_tit">기본정보</h3>
                                        <div class="info">
                                            <a id="auth_btn_area" href="javascript:callAuthLayer()" ;=""
                                                class="btn btn_sm"><span class="arr">보호된 정보 확인</span></a>
                                            <a href="#" class="btn btn_sm"><span class="arr">회원탈퇴</span></a>
                                        </div>
                                    </div>
                                    <div class="table_col">
                                        <table>
                                            <caption>회원기본정보 입력 표로 회원정보 이름, 아이디, 비밀번호, 비밀번호 확인, 생년월일, 휴대전화, 이메일을 나타냅니다.
                                            </caption>
                                            <colgroup>
                                                <col style="width:25%">
                                                <col>
                                            </colgroup>
                                            <tbody>
                                                <tr class="input">
                                                    <th scope="row">이름</th>
                                                    <td>
                                                        <div class="input_group">
                                                            <span id="hg_nm_area">ㅇㅇ**</span>
                                                            <a href="#" class="btn btn_sm"
                                                                id="lnChangeName"><span>이름변경</span></a>
                                                        </div>
                                                        <p class="msg_desc">개명으로 이름이 변경된 경우만 수정 가능합니다.</p>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <th scope="row">아이디</th>
                                                    <td><span id="mbr_id_area">tex****</span></td>
                                                </tr>
                                                <tr class="input">
                                                    <th scope="row">
                                                        <label for="pwd">비밀번호</label>
                                                        <div class="btn_wrap change_pw" data-handler="trPwdCheck">
                                                            <button type="button" class="btn btn_sm"
                                                                data-control="toggle"
                                                                data-handler-target="trPwdCheck"><span>변경</span></button>
                                                        </div>
                                                    </th>
                                                    <td>
                                                        <div class="input_group hide" data-handler="trPwdCheck">
                                                            <span class="input_txt w250"><input type="password"
                                                                    class="text" placeholder="비밀번호를 입력해주세요."
                                                                    maxlength="50" name="pwd" id="pwd"></span>
                                                            <span class="msg_desc" id="alert_pwd_strength"></span>
                                                            <p id="msg_pwd" class="msg_info em hide">비밀번호는 영문자, 숫자,특수문자
                                                                모두 최소 1가지 이상 조합한 8~12자리이어야 합니다.</p>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr class="input new_pw hide" id="trPwdCheck" data-handler="trPwdCheck">
                                                    <th scope="row">
                                                        <label for="pwd_check">비밀번호 확인</label>
                                                    </th>
                                                    <td>
                                                        <div class="input_group">
                                                            <span class="input_txt w250"><input type="password"
                                                                    class="text" placeholder="비밀번호를 재입력해주세요."
                                                                    maxlength="50" name="pwd_check"
                                                                    id="pwd_check"></span>
                                                            <p id="msg_pwd_check" class="msg_info em hide">비밀번호와 비밀번호
                                                                확인이 일치하지 않습니다.</p>
                                                        </div>
                                                    </td>
                                                </tr>

                                                <tr class="input">
                                                    <th scope="row">
                                                        <label for="birth_yy">생년월일</label>
                                                    </th>
                                                    <td>
                                                        <div class="birthday_select" id="birthday_select"
                                                            style="display:none">
                                                            <span class="select w120 hide" data-skin="form">
                                                                <select id="birth_yy" name="birth_yy"
                                                                    title="생년월일 중 년 선택">
                                                                    [<option value="">년</option>, <option value="2022">
                                                                        2022</option>, <option value="2021">2021
                                                                    </option>, <option value="2020">2020</option>,
                                                                    <option value="2019">2019</option>, <option
                                                                        value="2018">2018</option>, <option
                                                                        value="2017">2017</option>, <option
                                                                        value="2016">2016</option>, <option
                                                                        value="2015">2015</option>, <option
                                                                        value="2014">2014</option>, <option
                                                                        value="2013">2013</option>, <option
                                                                        value="2012">2012</option>, <option
                                                                        value="2011">2011</option>, <option
                                                                        value="2010">2010</option>, <option
                                                                        value="2009">2009</option>, <option
                                                                        value="2008">2008</option>, <option
                                                                        value="2007">2007</option>, <option
                                                                        value="2006">2006</option>, <option
                                                                        value="2005">2005</option>, <option
                                                                        value="2004">2004</option>, <option
                                                                        value="2003">2003</option>, <option
                                                                        value="2002">2002</option>, <option
                                                                        value="2001">2001</option>, <option
                                                                        value="2000">2000</option>, <option
                                                                        value="1999">1999</option>, <option
                                                                        value="1998">1998</option>, <option
                                                                        value="1997">1997</option>, <option value="1996"
                                                                        selected="">1996</option>, <option value="1995">
                                                                        1995</option>, <option value="1994">1994
                                                                    </option>, <option value="1993">1993</option>,
                                                                    <option value="1992">1992</option>, <option
                                                                        value="1991">1991</option>, <option
                                                                        value="1990">1990</option>, <option
                                                                        value="1989">1989</option>, <option
                                                                        value="1988">1988</option>, <option
                                                                        value="1987">1987</option>, <option
                                                                        value="1986">1986</option>, <option
                                                                        value="1985">1985</option>, <option
                                                                        value="1984">1984</option>, <option
                                                                        value="1983">1983</option>, <option
                                                                        value="1982">1982</option>, <option
                                                                        value="1981">1981</option>, <option
                                                                        value="1980">1980</option>, <option
                                                                        value="1979">1979</option>, <option
                                                                        value="1978">1978</option>, <option
                                                                        value="1977">1977</option>, <option
                                                                        value="1976">1976</option>, <option
                                                                        value="1975">1975</option>, <option
                                                                        value="1974">1974</option>, <option
                                                                        value="1973">1973</option>, <option
                                                                        value="1972">1972</option>, <option
                                                                        value="1971">1971</option>, <option
                                                                        value="1970">1970</option>, <option
                                                                        value="1969">1969</option>, <option
                                                                        value="1968">1968</option>, <option
                                                                        value="1967">1967</option>, <option
                                                                        value="1966">1966</option>, <option
                                                                        value="1965">1965</option>, <option
                                                                        value="1964">1964</option>, <option
                                                                        value="1963">1963</option>, <option
                                                                        value="1962">1962</option>, <option
                                                                        value="1961">1961</option>, <option
                                                                        value="1960">1960</option>, <option
                                                                        value="1959">1959</option>, <option
                                                                        value="1958">1958</option>, <option
                                                                        value="1957">1957</option>, <option
                                                                        value="1956">1956</option>, <option
                                                                        value="1955">1955</option>, <option
                                                                        value="1954">1954</option>, <option
                                                                        value="1953">1953</option>, <option
                                                                        value="1952">1952</option>, <option
                                                                        value="1951">1951</option>, <option
                                                                        value="1950">1950</option>, <option
                                                                        value="1949">1949</option>, <option
                                                                        value="1948">1948</option>, <option
                                                                        value="1947">1947</option>, <option
                                                                        value="1946">1946</option>, <option
                                                                        value="1945">1945</option>, <option
                                                                        value="1944">1944</option>, <option
                                                                        value="1943">1943</option>, <option
                                                                        value="1942">1942</option>, <option
                                                                        value="1941">1941</option>, <option
                                                                        value="1940">1940</option>, <option
                                                                        value="1939">1939</option>, <option
                                                                        value="1938">1938</option>, <option
                                                                        value="1937">1937</option>, <option
                                                                        value="1936">1936</option>, <option
                                                                        value="1935">1935</option>, <option
                                                                        value="1934">1934</option>, <option
                                                                        value="1933">1933</option>, <option
                                                                        value="1932">1932</option>, <option
                                                                        value="1931">1931</option>, <option
                                                                        value="1930">1930</option>, <option
                                                                        value="1929">1929</option>, <option
                                                                        value="1928">1928</option>, <option
                                                                        value="1927">1927</option>, <option
                                                                        value="1926">1926</option>, <option
                                                                        value="1925">1925</option>, <option
                                                                        value="1924">1924</option>, <option
                                                                        value="1923">1923</option>, <option
                                                                        value="1922">1922</option>, <option
                                                                        value="1921">1921</option>, <option
                                                                        value="1920">1920</option>, <option
                                                                        value="1919">1919</option>, <option
                                                                        value="1918">1918</option>, <option
                                                                        value="1917">1917</option>, <option
                                                                        value="1916">1916</option>, <option
                                                                        value="1915">1915</option>, <option
                                                                        value="1914">1914</option>, <option
                                                                        value="1913">1913</option>, <option
                                                                        value="1912">1912</option>, <option
                                                                        value="1911">1911</option>, <option
                                                                        value="1910">1910</option>, <option
                                                                        value="1909">1909</option>, <option
                                                                        value="1908">1908</option>, <option
                                                                        value="1907">1907</option>, <option
                                                                        value="1906">1906</option>, <option
                                                                        value="1905">1905</option>, <option
                                                                        value="1904">1904</option>, <option
                                                                        value="1903">1903</option>, <option
                                                                        value="1902">1902</option>, <option
                                                                        value="1901">1901</option>, <option
                                                                        value="1900">1900</option>]
                                                                </select>
                                                            </span>
                                                            <div class="select_wrap w120"
                                                                style="background-color:rgb(235,235,228)">
                                                                <div class="item_seleced"><a href="#1996"
                                                                        title="생년월일 중 년 선택 목록 열기"
                                                                        data-title="생년월일 중 년 선택">1996<span
                                                                            class="haze">선택됨</span></a></div>
                                                                <div class="item_list_wrap ">
                                                                    <div class="item_list ui_scrollarea">
                                                                        <ul class="ui_content">
                                                                            <li><a href="#"><span>년</span></a></li>
                                                                            <li><a href="#2022"><span>2022</span></a>
                                                                            </li>
                                                                            <li><a href="#2021"><span>2021</span></a>
                                                                            </li>
                                                                            <li><a href="#2020"><span>2020</span></a>
                                                                            </li>
                                                                            <li><a href="#2019"><span>2019</span></a>
                                                                            </li>
                                                                            <li><a href="#2018"><span>2018</span></a>
                                                                            </li>
                                                                            <li><a href="#2017"><span>2017</span></a>
                                                                            </li>
                                                                            <li><a href="#2016"><span>2016</span></a>
                                                                            </li>
                                                                            <li><a href="#2015"><span>2015</span></a>
                                                                            </li>
                                                                            <li><a href="#2014"><span>2014</span></a>
                                                                            </li>
                                                                            <li><a href="#2013"><span>2013</span></a>
                                                                            </li>
                                                                            <li><a href="#2012"><span>2012</span></a>
                                                                            </li>
                                                                            <li><a href="#2011"><span>2011</span></a>
                                                                            </li>
                                                                            <li><a href="#2010"><span>2010</span></a>
                                                                            </li>
                                                                            <li><a href="#2009"><span>2009</span></a>
                                                                            </li>
                                                                            <li><a href="#2008"><span>2008</span></a>
                                                                            </li>
                                                                            <li><a href="#2007"><span>2007</span></a>
                                                                            </li>
                                                                            <li><a href="#2006"><span>2006</span></a>
                                                                            </li>
                                                                            <li><a href="#2005"><span>2005</span></a>
                                                                            </li>
                                                                            <li><a href="#2004"><span>2004</span></a>
                                                                            </li>
                                                                            <li><a href="#2003"><span>2003</span></a>
                                                                            </li>
                                                                            <li><a href="#2002"><span>2002</span></a>
                                                                            </li>
                                                                            <li><a href="#2001"><span>2001</span></a>
                                                                            </li>
                                                                            <li><a href="#2000"><span>2000</span></a>
                                                                            </li>
                                                                            <li><a href="#1999"><span>1999</span></a>
                                                                            </li>
                                                                            <li><a href="#1998"><span>1998</span></a>
                                                                            </li>
                                                                            <li><a href="#1997"><span>1997</span></a>
                                                                            </li>
                                                                            <li><a href="#1996"
                                                                                    data-selected="true"><span>1996</span></a>
                                                                            </li>
                                                                            <li><a href="#1995"><span>1995</span></a>
                                                                            </li>
                                                                            <li><a href="#1994"><span>1994</span></a>
                                                                            </li>
                                                                            <li><a href="#1993"><span>1993</span></a>
                                                                            </li>
                                                                            <li><a href="#1992"><span>1992</span></a>
                                                                            </li>
                                                                            <li><a href="#1991"><span>1991</span></a>
                                                                            </li>
                                                                            <li><a href="#1990"><span>1990</span></a>
                                                                            </li>
                                                                            <li><a href="#1989"><span>1989</span></a>
                                                                            </li>
                                                                            <li><a href="#1988"><span>1988</span></a>
                                                                            </li>
                                                                            <li><a href="#1987"><span>1987</span></a>
                                                                            </li>
                                                                            <li><a href="#1986"><span>1986</span></a>
                                                                            </li>
                                                                            <li><a href="#1985"><span>1985</span></a>
                                                                            </li>
                                                                            <li><a href="#1984"><span>1984</span></a>
                                                                            </li>
                                                                            <li><a href="#1983"><span>1983</span></a>
                                                                            </li>
                                                                            <li><a href="#1982"><span>1982</span></a>
                                                                            </li>
                                                                            <li><a href="#1981"><span>1981</span></a>
                                                                            </li>
                                                                            <li><a href="#1980"><span>1980</span></a>
                                                                            </li>
                                                                            <li><a href="#1979"><span>1979</span></a>
                                                                            </li>
                                                                            <li><a href="#1978"><span>1978</span></a>
                                                                            </li>
                                                                            <li><a href="#1977"><span>1977</span></a>
                                                                            </li>
                                                                            <li><a href="#1976"><span>1976</span></a>
                                                                            </li>
                                                                            <li><a href="#1975"><span>1975</span></a>
                                                                            </li>
                                                                            <li><a href="#1974"><span>1974</span></a>
                                                                            </li>
                                                                            <li><a href="#1973"><span>1973</span></a>
                                                                            </li>
                                                                            <li><a href="#1972"><span>1972</span></a>
                                                                            </li>
                                                                            <li><a href="#1971"><span>1971</span></a>
                                                                            </li>
                                                                            <li><a href="#1970"><span>1970</span></a>
                                                                            </li>
                                                                            <li><a href="#1969"><span>1969</span></a>
                                                                            </li>
                                                                            <li><a href="#1968"><span>1968</span></a>
                                                                            </li>
                                                                            <li><a href="#1967"><span>1967</span></a>
                                                                            </li>
                                                                            <li><a href="#1966"><span>1966</span></a>
                                                                            </li>
                                                                            <li><a href="#1965"><span>1965</span></a>
                                                                            </li>
                                                                            <li><a href="#1964"><span>1964</span></a>
                                                                            </li>
                                                                            <li><a href="#1963"><span>1963</span></a>
                                                                            </li>
                                                                            <li><a href="#1962"><span>1962</span></a>
                                                                            </li>
                                                                            <li><a href="#1961"><span>1961</span></a>
                                                                            </li>
                                                                            <li><a href="#1960"><span>1960</span></a>
                                                                            </li>
                                                                            <li><a href="#1959"><span>1959</span></a>
                                                                            </li>
                                                                            <li><a href="#1958"><span>1958</span></a>
                                                                            </li>
                                                                            <li><a href="#1957"><span>1957</span></a>
                                                                            </li>
                                                                            <li><a href="#1956"><span>1956</span></a>
                                                                            </li>
                                                                            <li><a href="#1955"><span>1955</span></a>
                                                                            </li>
                                                                            <li><a href="#1954"><span>1954</span></a>
                                                                            </li>
                                                                            <li><a href="#1953"><span>1953</span></a>
                                                                            </li>
                                                                            <li><a href="#1952"><span>1952</span></a>
                                                                            </li>
                                                                            <li><a href="#1951"><span>1951</span></a>
                                                                            </li>
                                                                            <li><a href="#1950"><span>1950</span></a>
                                                                            </li>
                                                                            <li><a href="#1949"><span>1949</span></a>
                                                                            </li>
                                                                            <li><a href="#1948"><span>1948</span></a>
                                                                            </li>
                                                                            <li><a href="#1947"><span>1947</span></a>
                                                                            </li>
                                                                            <li><a href="#1946"><span>1946</span></a>
                                                                            </li>
                                                                            <li><a href="#1945"><span>1945</span></a>
                                                                            </li>
                                                                            <li><a href="#1944"><span>1944</span></a>
                                                                            </li>
                                                                            <li><a href="#1943"><span>1943</span></a>
                                                                            </li>
                                                                            <li><a href="#1942"><span>1942</span></a>
                                                                            </li>
                                                                            <li><a href="#1941"><span>1941</span></a>
                                                                            </li>
                                                                            <li><a href="#1940"><span>1940</span></a>
                                                                            </li>
                                                                            <li><a href="#1939"><span>1939</span></a>
                                                                            </li>
                                                                            <li><a href="#1938"><span>1938</span></a>
                                                                            </li>
                                                                            <li><a href="#1937"><span>1937</span></a>
                                                                            </li>
                                                                            <li><a href="#1936"><span>1936</span></a>
                                                                            </li>
                                                                            <li><a href="#1935"><span>1935</span></a>
                                                                            </li>
                                                                            <li><a href="#1934"><span>1934</span></a>
                                                                            </li>
                                                                            <li><a href="#1933"><span>1933</span></a>
                                                                            </li>
                                                                            <li><a href="#1932"><span>1932</span></a>
                                                                            </li>
                                                                            <li><a href="#1931"><span>1931</span></a>
                                                                            </li>
                                                                            <li><a href="#1930"><span>1930</span></a>
                                                                            </li>
                                                                            <li><a href="#1929"><span>1929</span></a>
                                                                            </li>
                                                                            <li><a href="#1928"><span>1928</span></a>
                                                                            </li>
                                                                            <li><a href="#1927"><span>1927</span></a>
                                                                            </li>
                                                                            <li><a href="#1926"><span>1926</span></a>
                                                                            </li>
                                                                            <li><a href="#1925"><span>1925</span></a>
                                                                            </li>
                                                                            <li><a href="#1924"><span>1924</span></a>
                                                                            </li>
                                                                            <li><a href="#1923"><span>1923</span></a>
                                                                            </li>
                                                                            <li><a href="#1922"><span>1922</span></a>
                                                                            </li>
                                                                            <li><a href="#1921"><span>1921</span></a>
                                                                            </li>
                                                                            <li><a href="#1920"><span>1920</span></a>
                                                                            </li>
                                                                            <li><a href="#1919"><span>1919</span></a>
                                                                            </li>
                                                                            <li><a href="#1918"><span>1918</span></a>
                                                                            </li>
                                                                            <li><a href="#1917"><span>1917</span></a>
                                                                            </li>
                                                                            <li><a href="#1916"><span>1916</span></a>
                                                                            </li>
                                                                            <li><a href="#1915"><span>1915</span></a>
                                                                            </li>
                                                                            <li><a href="#1914"><span>1914</span></a>
                                                                            </li>
                                                                            <li><a href="#1913"><span>1913</span></a>
                                                                            </li>
                                                                            <li><a href="#1912"><span>1912</span></a>
                                                                            </li>
                                                                            <li><a href="#1911"><span>1911</span></a>
                                                                            </li>
                                                                            <li><a href="#1910"><span>1910</span></a>
                                                                            </li>
                                                                            <li><a href="#1909"><span>1909</span></a>
                                                                            </li>
                                                                            <li><a href="#1908"><span>1908</span></a>
                                                                            </li>
                                                                            <li><a href="#1907"><span>1907</span></a>
                                                                            </li>
                                                                            <li><a href="#1906"><span>1906</span></a>
                                                                            </li>
                                                                            <li><a href="#1905"><span>1905</span></a>
                                                                            </li>
                                                                            <li><a href="#1904"><span>1904</span></a>
                                                                            </li>
                                                                            <li><a href="#1903"><span>1903</span></a>
                                                                            </li>
                                                                            <li><a href="#1902"><span>1902</span></a>
                                                                            </li>
                                                                            <li><a href="#1901"><span>1901</span></a>
                                                                            </li>
                                                                            <li><a href="#1900"><span>1900</span></a>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                    <div class="scroll ui_scrollbar"> <span
                                                                            class="bg_top"></span> <span
                                                                            class="bg bg_mid"
                                                                            style="display: none;"></span> <span
                                                                            class="bg_btm"></span> </div>
                                                                </div>
                                                            </div>
                                                            <span class="symbol">년</span>
                                                            <span class="select w70 hide" data-skin="form">
                                                                <select id="birth_mm" name="birth_mm"
                                                                    title="생년월일 중 월 선택" class="narrow">
                                                                    [<option value="">월</option>, <option value="01">01
                                                                    </option>, <option value="02">02</option>, <option
                                                                        value="03">03</option>, <option value="04">04
                                                                    </option>, <option value="05" selected="">05
                                                                    </option>, <option value="06">06</option>, <option
                                                                        value="07">07</option>, <option value="08">08
                                                                    </option>, <option value="09">09</option>, <option
                                                                        value="10">10</option>, <option value="11">11
                                                                    </option>, <option value="12">12</option>]
                                                                </select>
                                                            </span>
                                                            <div class="select_wrap w70"
                                                                style="background-color:rgb(235,235,228)">
                                                                <div class="item_seleced"><a href="#05"
                                                                        title="생년월일 중 월 선택 목록 열기"
                                                                        data-title="생년월일 중 월 선택">05<span
                                                                            class="haze">선택됨</span></a></div>
                                                                <div class="item_list_wrap ">
                                                                    <div class="item_list ui_scrollarea">
                                                                        <ul class="ui_content">
                                                                            <li><a href="#"><span>월</span></a></li>
                                                                            <li><a href="#01"><span>01</span></a></li>
                                                                            <li><a href="#02"><span>02</span></a></li>
                                                                            <li><a href="#03"><span>03</span></a></li>
                                                                            <li><a href="#04"><span>04</span></a></li>
                                                                            <li><a href="#05"
                                                                                    data-selected="true"><span>05</span></a>
                                                                            </li>
                                                                            <li><a href="#06"><span>06</span></a></li>
                                                                            <li><a href="#07"><span>07</span></a></li>
                                                                            <li><a href="#08"><span>08</span></a></li>
                                                                            <li><a href="#09"><span>09</span></a></li>
                                                                            <li><a href="#10"><span>10</span></a></li>
                                                                            <li><a href="#11"><span>11</span></a></li>
                                                                            <li><a href="#12"><span>12</span></a></li>
                                                                        </ul>
                                                                    </div>
                                                                    <div class="scroll ui_scrollbar"> <span
                                                                            class="bg_top"></span> <span
                                                                            class="bg bg_mid"
                                                                            style="display: none;"></span> <span
                                                                            class="bg_btm"></span> </div>
                                                                </div>
                                                            </div>
                                                            <span class="symbol">월</span>
                                                            <span class="select w70 hide" data-skin="form">
                                                                <select id="birth_dd" name="birth_dd"
                                                                    title="생년월일 중 일 선택" class="narrow">
                                                                    [<option value="">일</option>, <option value="01">01
                                                                    </option>, <option value="02">02</option>, <option
                                                                        value="03">03</option>, <option value="04">04
                                                                    </option>, <option value="05">05</option>, <option
                                                                        value="06">06</option>, <option value="07">07
                                                                    </option>, <option value="08">08</option>, <option
                                                                        value="09">09</option>, <option value="10">10
                                                                    </option>, <option value="11">11</option>, <option
                                                                        value="12">12</option>, <option value="13">13
                                                                    </option>, <option value="14">14</option>, <option
                                                                        value="15">15</option>, <option value="16">16
                                                                    </option>, <option value="17">17</option>, <option
                                                                        value="18">18</option>, <option value="19">19
                                                                    </option>, <option value="20">20</option>, <option
                                                                        value="21">21</option>, <option value="22">22
                                                                    </option>, <option value="23">23</option>, <option
                                                                        value="24">24</option>, <option value="25">25
                                                                    </option>, <option value="26">26</option>, <option
                                                                        value="27">27</option>, <option value="28">28
                                                                    </option>, <option value="29">29</option>, <option
                                                                        value="30" selected="">30</option>, <option
                                                                        value="31">31</option>]
                                                                </select>
                                                            </span>
                                                            <div class="select_wrap w70"
                                                                style="background-color:rgb(235,235,228)">
                                                                <div class="item_seleced"><a href="#30"
                                                                        title="생년월일 중 일 선택 목록 열기"
                                                                        data-title="생년월일 중 일 선택">30<span
                                                                            class="haze">선택됨</span></a></div>
                                                                <div class="item_list_wrap ">
                                                                    <div class="item_list ui_scrollarea">
                                                                        <ul class="ui_content">
                                                                            <li><a href="#"><span>일</span></a></li>
                                                                            <li><a href="#01"><span>01</span></a></li>
                                                                            <li><a href="#02"><span>02</span></a></li>
                                                                            <li><a href="#03"><span>03</span></a></li>
                                                                            <li><a href="#04"><span>04</span></a></li>
                                                                            <li><a href="#05"><span>05</span></a></li>
                                                                            <li><a href="#06"><span>06</span></a></li>
                                                                            <li><a href="#07"><span>07</span></a></li>
                                                                            <li><a href="#08"><span>08</span></a></li>
                                                                            <li><a href="#09"><span>09</span></a></li>
                                                                            <li><a href="#10"><span>10</span></a></li>
                                                                            <li><a href="#11"><span>11</span></a></li>
                                                                            <li><a href="#12"><span>12</span></a></li>
                                                                            <li><a href="#13"><span>13</span></a></li>
                                                                            <li><a href="#14"><span>14</span></a></li>
                                                                            <li><a href="#15"><span>15</span></a></li>
                                                                            <li><a href="#16"><span>16</span></a></li>
                                                                            <li><a href="#17"><span>17</span></a></li>
                                                                            <li><a href="#18"><span>18</span></a></li>
                                                                            <li><a href="#19"><span>19</span></a></li>
                                                                            <li><a href="#20"><span>20</span></a></li>
                                                                            <li><a href="#21"><span>21</span></a></li>
                                                                            <li><a href="#22"><span>22</span></a></li>
                                                                            <li><a href="#23"><span>23</span></a></li>
                                                                            <li><a href="#24"><span>24</span></a></li>
                                                                            <li><a href="#25"><span>25</span></a></li>
                                                                            <li><a href="#26"><span>26</span></a></li>
                                                                            <li><a href="#27"><span>27</span></a></li>
                                                                            <li><a href="#28"><span>28</span></a></li>
                                                                            <li><a href="#29"><span>29</span></a></li>
                                                                            <li><a href="#30"
                                                                                    data-selected="true"><span>30</span></a>
                                                                            </li>
                                                                            <li><a href="#31"><span>31</span></a></li>
                                                                        </ul>
                                                                    </div>
                                                                    <div class="scroll ui_scrollbar"> <span
                                                                            class="bg_top"></span> <span
                                                                            class="bg bg_mid"
                                                                            style="display: none;"></span> <span
                                                                            class="bg_btm"></span> </div>
                                                                </div>
                                                            </div>
                                                            <span class="symbol">일</span>
                                                            <a href="https://www.cjone.com/cjmweb/my-one/coupon.do?cpn_type_cd=15"
                                                                class="btn btn_sm"><span class="arr">생일쿠폰 확인</span></a>
                                                        </div>
                                                        <div class="birthday_select" id="birthday_default"
                                                            style="display:block">
                                                            ****<span class="symbol">년</span>
                                                            **<span class="symbol">월</span>
                                                            **<span class="symbol">일</span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr class="input">
                                                    <th scope="row">
                                                        <label for="mob_no_1">휴대전화</label>
                                                    </th>
                                                    <td>
                                                        <div class="phon_write">
                                                            <span class="select w100 hide" data-skin="form">
                                                                <select name="mob_no_1" id="mob_no_1"
                                                                    title="휴대전화 앞자리 선택" disabled="disabled">
                                                                    <option value="">선택하세요</option>

                                                                    <option value="010" selected="selected">010
                                                                    </option>

                                                                    <option value="011">011
                                                                    </option>

                                                                    <option value="016">016
                                                                    </option>

                                                                    <option value="017">017
                                                                    </option>

                                                                    <option value="018">018
                                                                    </option>

                                                                    <option value="019">019
                                                                    </option>

                                                                    <option value="070">070
                                                                    </option>

                                                                    <option value="0130">0130
                                                                    </option>

                                                                    <option value="0303">0303
                                                                    </option>

                                                                    <option value="0502">0502
                                                                    </option>

                                                                    <option value="0504">0504
                                                                    </option>

                                                                    <option value="0505">0505
                                                                    </option>

                                                                    <option value="0506">0506
                                                                    </option>

                                                                </select>
                                                            </span>
                                                            <div class="select_wrap w100"
                                                                style="background-color:rgb(235,235,228)">
                                                                <div class="item_seleced"><a href="#010"
                                                                        title="휴대전화 앞자리 선택 목록 열기"
                                                                        data-title="휴대전화 앞자리 선택">010
                                                                        <span class="haze">선택됨</span></a></div>
                                                                <div class="item_list_wrap ">
                                                                    <div class="item_list ui_scrollarea">
                                                                        <ul class="ui_content">
                                                                            <li><a href="#"><span>선택하세요</span></a></li>
                                                                            <li><a href="#010"
                                                                                    data-selected="true"><span>010
                                                                                    </span></a></li>
                                                                            <li><a href="#011"><span>011
                                                                                    </span></a></li>
                                                                            <li><a href="#016"><span>016
                                                                                    </span></a></li>
                                                                            <li><a href="#017"><span>017
                                                                                    </span></a></li>
                                                                            <li><a href="#018"><span>018
                                                                                    </span></a></li>
                                                                            <li><a href="#019"><span>019
                                                                                    </span></a></li>
                                                                            <li><a href="#070"><span>070
                                                                                    </span></a></li>
                                                                            <li><a href="#0130"><span>0130
                                                                                    </span></a></li>
                                                                            <li><a href="#0303"><span>0303
                                                                                    </span></a></li>
                                                                            <li><a href="#0502"><span>0502
                                                                                    </span></a></li>
                                                                            <li><a href="#0504"><span>0504
                                                                                    </span></a></li>
                                                                            <li><a href="#0505"><span>0505
                                                                                    </span></a></li>
                                                                            <li><a href="#0506"><span>0506
                                                                                    </span></a></li>
                                                                        </ul>
                                                                    </div>
                                                                    <div class="scroll ui_scrollbar"> <span
                                                                            class="bg_top"></span> <span
                                                                            class="bg bg_mid"
                                                                            style="display: none;"></span> <span
                                                                            class="bg_btm"></span> </div>
                                                                </div>
                                                            </div>
                                                            <span class="symbol">-</span>
                                                            <span class="input_txt w100">
                                                                <input type="text" class="text narrow"
                                                                    title="휴대전화 중간자리 입력" data-format="num"
                                                                    name="mob_no_2" id="mob_no_2" maxlength="4"
                                                                    value="****" disabled="disabled" autocomplete="off">
                                                            </span>
                                                            <span class="symbol">-</span>
                                                            <span class="input_txt w100">
                                                                <input type="text" class="text narrow"
                                                                    title="휴대전화 끝자리 입력" data-format="num"
                                                                    name="mob_no_3" id="mob_no_3" maxlength="4"
                                                                    value="1234" disabled="disabled" autocomplete="off">
                                                            </span>
                                                        </div>
                                                        <p class="msg_desc">주문 및 배송, 쿠폰, 이벤트 정보 등을 제공 받으실 수 있습니다.</p>
                                                    </td>
                                                </tr>
                                                <tr class="input">
                                                    <th scope="row">
                                                        <label for="email_addr1">이메일</label>
                                                    </th>
                                                    <td>
                                                        <div class="email_write" style="width:415px">
                                                            <span class="input_txt w110" data-skin="form">
                                                                <input type="text" class="text small" title="이메일 아이디 입력"
                                                                    placeholder="이메일 아이디" data-format="email"
                                                                    name="email_addr1" id="email_addr1" value="th****"
                                                                    disabled="disabled" autocomplete="off">
                                                            </span>
                                                            <span class="symbol">@</span>
                                                            <span class="input_txt w110">
                                                                <input type="text" class="text small" title="이메일 도메인 입력"
                                                                    placeholder="이메일 도메인" data-format="email"
                                                                    name="email_addr2" id="email_addr2"
                                                                    value="naver.com" disabled="disabled"
                                                                    autocomplete="off">
                                                            </span>
                                                            <span class="select w100 hide" data-skin="form">
                                                                <select title="이메일 도메인 선택" data-control="emailSelector"
                                                                    name="email_addr_opt" id="email_addr_opt"
                                                                    disabled="disabled">

                                                                    <option value="0">직접입력</option>

                                                                    <option value="naver.com" selected="selected">네이버
                                                                    </option>

                                                                    <option value="hanmail.net">한메일</option>

                                                                    <option value="nate.com">네이트</option>

                                                                    <option value="gmail.com">지메일</option>

                                                                </select>
                                                            </span>
                                                            <div class="select_wrap w100"
                                                                style="background-color:rgb(235,235,228)">
                                                                <div class="item_seleced"><a href="#nate.com"
                                                                        title="이메일 도메인 선택 목록 열기"
                                                                        data-title="이메일 도메인 선택">네이버<span
                                                                            class="haze">선택됨</span></a></div>
                                                                <div class="item_list_wrap ">
                                                                    <div class="item_list ui_scrollarea">
                                                                        <ul class="ui_content">
                                                                            <li><a href="#0"><span>직접입력</span></a></li>
                                                                            <li><a href="#naver.com"
                                                                                    data-selected="true"><span>네이버</span></a>
                                                                            </li>
                                                                            <li><a
                                                                                    href="#hanmail.net"><span>한메일</span></a>
                                                                            </li>
                                                                            <li><a href="#nate.com"><span>네이트</span></a>
                                                                            </li>
                                                                            <li><a
                                                                                    href="#gmail.com"><span>지메일</span></a>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                    <div class="scroll ui_scrollbar"> <span
                                                                            class="bg_top"></span> <span
                                                                            class="bg bg_mid"
                                                                            style="display: none;"></span> <span
                                                                            class="bg_btm"></span> </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <p class="msg_desc">이메일 주소 입력 시 사용 가능 특수 문자 : - . _</p>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                    <div class="table_header choice">
                                        <h3 class="h3_tit">약관동의</h3>
                                    </div>
                                    <div class="list_accordion faq_list agreement_sec">
                                        <ul data-control="accordion">

                                            <!-- DGV 약관동의 -->

                                            <li class="on">
                                                <p class="question_wrap">
                                                    <button type="button" data-handler-target="cj_gatherAgree" class="">
                                                        <span class="title">!!여기에 약관동의에 대한 내용 넣기</span>
                                                        <span class="btn" data-handler="toggleText">닫기</span>
                                                    </button>
                                                </p>
                                                <div class="answer_wrap">
                                                    <div class="item_box first">
                                                        <div class="cont">


                                        </ul>
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
                                <button id="a_confirm_n" type="button" onclick="closeLayerConfirm();"
                                    class="btn cancel"><span id="span_confirm_n">취소</span></button>
                            </div>

                            <button id="btn_confirm_close" type="button" onclick="closeLayerConfirm();"
                                class="close">닫기</button>
                        </div>

                    </div>
                    <div class="ui_modal_overlay"
                        style="position: fixed; top: 0px; left: 0px; right: 0px; bottom: 0px; z-index: 9100;">
                    </div>
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
                        style="position: fixed; top: 0px; left: 0px; right: 0px; bottom: 0px; z-index: 9100;">
                    </div>
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