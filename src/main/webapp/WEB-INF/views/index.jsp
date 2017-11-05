<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- css 파일을 jsp에 연결하기 -->
<spring:url value="resources/css/main.css" var="mainCss" />
<link href="${mainCss }" rel="stylesheet" />
<spring:url value="resources/css/index.css" var="indexCss" />
<link href="${indexCss }" rel="stylesheet" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 홈 화면 연결해줄 페이지 -->
<spring:url value="/" var="home" />
<spring:url value="/login" var="login" />
<spring:url value="/membership" var="membership" />
<spring:url value="/membershipFinish" var="membershipFinish" />
<spring:url value="/pwdReset" var="pwdReset" />
<spring:url value="/userConfirm" var="userConfirm" />
<spring:url value="/userEmailFind" var="userEmailFind" />

<title>Index</title>
</head>
<body>
${logined.name }님 환영합니다
	<div id="header">머리부분</div>
	<div id="section">
	중간부분
		<div class="menu">
			<a href="${home }" target="_self">홈</a>
			&thinsp;
			<a href="${login }" target="_self">로그인</a>
			&thinsp;
			<a href="${membership }" target="_self">회원가입</a><br>
			<a href="${membershipFinish }" target="_self">가입완료</a>
			&thinsp;
			<a href="${pwdReset }" target="_self">비밀번호 재설정</a>
			&thinsp;
			<a href="${userConfirm }" target="_self">회원인증</a>
			&thinsp;
			<a href="${userEmailFind }" target="_self">이메일 찾기</a><br>
		</div>
	</div>
	<div id="footer">아래부분</div>
</body>
</html>