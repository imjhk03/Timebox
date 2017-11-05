<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  -->
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- css 파일을 jsp에 연결하기 -->
<spring:url value="resources/css/main.css" var="mainCss" />
<link href="${mainCss }" rel="stylesheet" />
<spring:url value="resources/css/login.css" var="loginCss" />
<link href="${loginCss }" rel="stylesheet" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<spring:url value="resources/js/login.js" var="loginJs" />
<script src="${loginJs}"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 홈 화면 연결해줄 페이지 -->
<spring:url value="/" var="home" />
<spring:url value="/membership" var="membership" />
<spring:url value="/pwdReset" var="pwdReset" />

<title>Timebox - 로그인</title>

</head>
<body>
	<div id="header">
		<div class="small_logo" align="left">
			<a href="${home }" target="_self"> <img alt="작은" width="120px" src="img/timebox.jpg"> </a>
		</div>
	</div>

	<div id="section">
		<div id="page-content">
			<div id="pageContentHeader">
				<a href="${home }" target="_self">
					<img class="center" alt="큰" width="250px" src="http://i.imgur.com/gBgLHQP.png">
				</a>
			</div>
			
			<div id="login-form">
				<div class="loginbox">
					<div class="top">
						<span>로 그 인</span>
					</div>

				<div class="triangle"></div>
			
				<form action="login" method="post" id="submitLoginForm" name="login">
				<div class="loginform">
					<div class="left">
						<input type="text" name="email" id="email" maxlength="100" placeholder="이메일"><br>
						<input type="password" name="pw" id="pw" maxlength="100" placeholder="비밀번호">
					</div>
					<div class="right">
						<input type="submit" name="submit" value="로그인" id="loginbutton" onclick='background: green'>
					</div>
						<div class="bottom">
							<a href="${membership }" target="_top">회원가입</a> &thinsp;
							<a href="${pwdReset }" target="_self">비밀번호 찾기</a>
						</div>
					</div>
				</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

