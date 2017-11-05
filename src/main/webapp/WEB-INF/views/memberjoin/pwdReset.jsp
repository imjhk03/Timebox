<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!DOCTYPE html>
<html>
<head>
	<!-- css 파일을 jsp에 연결하기 -->
	<spring:url value="resources/css/main.css" var="mainCss" />
	<link href="${mainCss }" rel="stylesheet" />
	<spring:url value="resources/css/pwdReset.css" var="pwdResetCss" />
	<link href="${pwdResetCss }" rel="stylesheet" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<spring:url value="/" var="home" />

	<title>Timebox - 비밀번호 재설정</title>

<script type="text/javascript">
	function onFocus(el) {
		if (el.value == el.defaultValue) {
			el.value = '';
		}
	}
	</script>
</head>
<body>
	<div id="header">		
		<div class="small_logo" align="left">
			<a href="${home }" target="_self"> <img alt="작은" width="120px" src="img/timebox.jpg"> </a>
		</div>
	</div>
	<div id="section">
		<form action="MAILTO:someone@example.com" method="post"
			enctype="text/plain">
			
			<div class="pwdBox">
			
			<div class="top">비밀번호 재설정</div>

			<div class="triangle"></div>
			
			<!-- pattern="/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/" -->

			<div class="pwdBox_form">
				<div class="middle">
					&nbsp;비밀번호를 재설정하려면 이메일 주소를 입력해야 합니다. <br>가입된 이메일 주소를 입력해 주세요.<br>
					<input type="text" name="user_email" size="25" placeholder="example@naver.com" required onfocus="onFocus(this)">
					<input type="submit" value="전송">
				</div>
			</div>
			</div>
		</form>
	</div>
	<div id="footer"> <img alt="작은" width="75px" src="img/timebox.jpg"> </div>
</body>
</html>