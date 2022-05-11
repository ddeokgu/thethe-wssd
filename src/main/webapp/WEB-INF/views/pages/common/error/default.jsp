<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!doctype html> 
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>${errorStatusCode} ERROR</title>
<script>
function fncGoAfterErrorPage(){
    history.back(-2);
}
const errorMessage = '<c:out value="${errorMessage}" />';
if (errorMessage) {
	alert(errorMessage);
	history.back();
}
</script>
<c:if test="${empty errorMessage}">
<style>
	a {text-decoration: none;color: inherit;}
	body {font-family: 'Noto Sans kr', Sans-serif;background-color: #edece4;}
	.error_wrap {position: absolute;left: 50%;top: 50%;width: 700px;min-height: 250px;padding: 60px;-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;-webkit-transform: translate(-50%,-50%);-moz-transform: translate(-50%,-50%);-ms-transform: translate(-50%,-50%);-o-transform: translate(-50%,-50%);transform: translate(-50%,-50%);color: #333;}
	.error_wrap .error_txt1 p {text-align: center;font-size: 20px;}
	.error_wrap .error_txt1 p .big {display: inline-block;font-size: 120px;font-weight: 800;line-height: 100px;margin-left: 30px;}
	.error_wrap .error_txt1 p.txt2 {font-size: 40px;font-weight: 600;padding-top: 20px;}
	.error_wrap .error_txt2 {width: 350px;margin: auto;font-size: 14px;color: #747474;}
	.error_wrap .btn_box {text-align: center;padding-top: 30px }
	.error_wrap .btn_box a {display: inline-block;margin: 0 3px;}
	.btn {padding: 0 20px;line-height: 36px;min-width: 40px;height: 36px;text-align: center;-webkit-transition: all .2s;-moz-transition: all .2s;-ms-transition: all .2s;-o-transition: all .2s;transition:all .2s;font-size: 14px;background-color: #FFF;border: 1px solid #333;color: #333;}
	.btn_black {background-color: #333;border: 1px solid #333;color: #FFF }
	.btn:hover {text-decoration: underline;}
</style>
</head>
<body>

	<div class="error_wrap">
		<div class="error_txt1">
			<p class="txt1"><span class="big">${errorStatusCode}</span>ERROR</p>
			<p class="txt2">${errorMessage}</p>
		</div>
		<div class="error_txt2">
			<p>The link you followed probably broken, or the page has been removed.</p>
		</div>
		<div class="btn_box">
			<a href="/" class="btn btn_black">HOME</a>
			<a href="#" onclick="fncGoAfterErrorPage(); return false;" class="btn">PREVIOUS PAGE</a>
		</div>
	</div>
</body>
</html>
</c:if>
