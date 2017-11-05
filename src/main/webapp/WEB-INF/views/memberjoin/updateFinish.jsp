<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<spring:url value="resources/css/main.css" var="mainCss" />
	<link href="${mainCss }" rel="stylesheet" />
	<spring:url value="resources/css/updateFinish.css" var="updateFinishCss" />
	<link href="${updateFinishCss }" rel="stylesheet" />
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<title>Timebox - 가입완료</title>
</head>
<body>
	<div id="header">
		<div class="small_logo" align="left">
			<a href="${home }" target="_self"> <img alt="작은" width="120px" src="img/timebox.jpg"> </a>
		</div>
	</div>

	<div id="section">
			<div class="membershipFinish">
				<form action="myInformation" name="membershipFinishForm" method="GET">
					<div class="font1">
						회원정보 수정이 완료 되었습니다. 
					</div>
					<div class="login">
						<br>
						<input type="submit" id="gotologin" value="회원정보보러가기">
					</div>
				</form>
			</div>
	</div>
	
	<div id="footer"><img alt="작은" width="75px" src="img/timebox.jpg"></div>
</body>
</html>