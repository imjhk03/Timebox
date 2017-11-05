<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Timebox - 회원탈퇴</title>

<spring:url value="resources/css/main.css" var="mainCss" />
<link href="${mainCss }" rel="stylesheet"  />
<spring:url value="resources/css/memberDropOutFinish.css" var="memberDropOutFinishCss" />
<link href="${memberDropOutFinishCss }" rel="stylesheet" />

<spring:url value="/" var="home" />

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
						그 동안 TimeBox를 이용해 주셔서 감사합니다.
				</div>
				<div class="login">
						<br>
						<a href="${home }" target="_self"> <input type="button" id="end" value="확인"> </a>
					</div>
			</div>
		</div>
	</div>
	
	<div id="footer"><img alt="작은" width="75px" src="img/timebox.jpg"></div>

</body>
</html>