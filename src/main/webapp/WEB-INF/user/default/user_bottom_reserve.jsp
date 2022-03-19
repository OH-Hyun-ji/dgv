<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script type="text/javascript">
function scrollToTop() {

    $('html, body').animate({scrollTop: 0 }, 'slow');

}
</script>
<div class="fixedBtn_wrap">
		<a href="/movieReserve.do" class="btn_fixedTicketing">예매하기</a> <a onclick="scrollToTop()"
			class="btn_gotoTop"><img
			src="https://dgvworld.s3.ap-northeast-2.amazonaws.com/gotoTop.png"
			alt="최상단으로 이동" /></a>
</div>