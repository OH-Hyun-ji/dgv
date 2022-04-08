<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>

<script type="text/javascript">
	Kakao.init("8e2df3e9bebf8b3982f4d23137e42962");
	Kakao.Auth.setAccessToken($("#tokenVal").val());
    function sendLinkCustom(templateId) {
    	 Kakao.Link.createCustomButton({
             container: '#btn-link-template',
             templateId: templateId,
             templateArgs: {
                 'title': '제목 영역입니다.',
                 'description': '설명 영역입니다.'
             }
         });
    }


function defaultSend() {
	document.getElementById("tokenNum").innerText = "tokenNum";
    Kakao.API.request({
        url: '/v2/api/talk/memo/default/send',
        data: {
            template_object: {
                object_type: 'feed',
                content: {
                    title: '카카오톡 링크 4.0',
                    description: '디폴트 템플릿 FEED',
                    image_url: 'http://test-tam.pe.kr/img/3.result.gif',
                    link: {
                        mobileWebUrl: 'http://naver.com',                                                        
                            web_url: 'http://naver.com',
                    },
                },
                social: {
                    like_count: 100,
                    comment_count: 200,
                },
                buttons: [{
                        title: '쇼핑하러가기',
                        link: {
                            mobileWebUrl: 'http://naver.com',                                                        
                            web_url: 'http://naver.com',
                        },
                    },

                ]
            },
        },
        success: function(response) {
            document.getElementById("tokenNum").innerText = JSON.stringify(response);
        },
        fail: function(error) {
            document.getElementById("tokenNum").innerText = error;
        },
    });
}
</script>
<body>
<input type="button" onClick="defaultSend();" value="Custom"/>
<input type="button" onClick="sendLinkDefault();" value="Default"/>
 <p id="btn-link-template"><button onclick="sendLinkCustom(74724);" class="btn btn-primary">템플릿 메세지 보내기</button></p>
<div id="tokenNum">tokenNum</div>
<input type="type" id="tokenVal" value="${token}"> 
</body>

</html>