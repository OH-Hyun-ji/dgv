<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

    <form id="form1" name="form1" enctype="multipart/form-data" method="post">
        <table border="2">
            <tr>
                <td>유형</td>
                <td></td>
            </tr>
            <tr>
                <td>제목</td>
                <td></td>
            </tr>
            <tr>
                <td>등록일</td>
                <td></td>
            </tr>
            <tr>
                <td> 문의 내용</td>
                <td> <textarea rows="20" cols="53" name="productImage" id="productImage"></textarea></td>
            </tr>
            <tr>
            </tr>
        </table>
        <hr>
        <form id="form2" name="form2" enctype="multipart/form-data" method="post">
            <table border="2">
                <td>등록일</td>
                <td></td>
                </tr>
                <tr>
                    <td>답변 내용</td>
                    <td> <textarea rows="20" cols="53" name="productImage" id="productImage"></textarea></td>
                </tr>
                <tr>
                </tr>
            </table>
            <button class="r-button" type="button"
                style="margin-left: 386px; margin-top: 17px; background-color: white; outline: 5px; font-size: 13px; ">수정하기
            </button>
        </form>
</body>

</html>