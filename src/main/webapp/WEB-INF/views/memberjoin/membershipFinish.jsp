<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<spring:url value="resources/css/main.css" var="mainCss" />
	<link href="${mainCss }" rel="stylesheet" />
	<spring:url value="resources/css/membershipFinish.css" var="membershipFinish" />
	<link href="${membershipFinish }" rel="stylesheet" />
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<spring:url value="/" var="home" />
	
	<title>Timebox - 가입완료</title>
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
			<div class="membershipFinish">
					<div class="font1">
						회원가입이 완료 되었습니다. 
					</div>
					<div class="login">
						<br>
						<a href="${home }" target="_self"> <input type="button" id="gotologin" value="로그인하기"> </a>
					</div>
			</div>
	</div>
	</div>
	<div id="footer"><img alt="작은" width="75px" src="img/timebox.jpg"></div>
</body>
</html>