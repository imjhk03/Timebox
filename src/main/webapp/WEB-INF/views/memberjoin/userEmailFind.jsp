<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- css 파일을 jsp에 연결하기 -->
<spring:url value="resources/css/main.css" var="mainCss" />
<link href="${mainCss }" rel="stylesheet" />
<spring:url value="resources/css/userEmailFind.css" var="userEmailFind" />
<link href="${userEmailFind }" rel="stylesheet" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Timebox - 이메일 확인</title>

<!-- 홈 화면 연결해줄 페이지 -->
<spring:url value="/login" var="login" />
<spring:url value="/pwdReset" var="pwdReset" />

</head>
<body>
	<div id="header">
		<div class="small_logo" align="left">
			<a href="${home }" target="_self"> <img alt="작은" width="120px" src="img/timebox.jpg"> </a>
		</div>
	</div>

	<div id="section">
	<div class="emailBox">
		<form id="userEmail" name="userEmail">
			<div class="top">휴대폰 본인 확인으로부터 이메일을 찾았습니다.</div>
			
			<div class="triangle"></div>
			
			<div class="middle">
			<div class="middle_1">
				<input type="radio" name="id" id="id" maxlength="50" >glgjihyo@nate.com
				</div>
			</div>
			
			<div class="bottom">
				<a href="${pwdReset }" target="_self">비밀번호 찾기</a>
				&thinsp;
				<a href="${login }" target="_self">로그인</a>
			</div>
		</form>
		</div>
	</div>

	<div id="footer">Timebox 정보</div>
</body>
</html>