<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

	<spring:url value="resources/css/main.css" var="mainCss" />
	<link href="${mainCss }" rel="stylesheet" />
<spring:url value="resources/css/dropOut.css" var="dropOutCss" />
<link href="${dropOutCss }" rel="stylesheet" />

<spring:url value="/memberDropOutFinish" var="memberDropOutFinish" />

<title>Insert title here</title>

<script>
	function dropOut() {
		winobj = window.open('dropOut.jsp', "",
				"toolbar=no,menubar=no,width=300,height=400")
	}
</script>

</head>
<body>

<div id="header">
		<div class="small_logo" align="left">
			<a href="${home }" target="_self"> <img alt="작은" width="120px" src="img/timebox.jpg"> </a>
		</div>
	</div>
	
	<div class="email">
		<div class="emailcheck">
			<span>회원 탈퇴</span>
		</div>

		<div class="triangle"></div>

		<div class="emailcheck_search">
		<form action=delete name="delete" method="post">
			현재 비밀번호 입력: <br><br><input type="password" name="pw" id="pw" > 
			<input type="submit" id="memberdrop" name="memberdrop" value="회원탈퇴">
			</form>
		</div>
	</div>
	
	<div id="footer"><img alt="작은" width="75px" src="img/timebox.jpg"></div>
</body>
</html>