<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!DOCTYPE html>
<html>
<head>
	<spring:url value="resources/css/main.css" var="mainCss" />
	<link href="${mainCss }" rel="stylesheet" />
	<spring:url value="resources/css/membership.css" var="membershipCss" />
	<link href="${membershipCss }" rel="stylesheet" />
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<title>Timebox - 회원가입</title>
	<script>
		function openWindow() {
			winobject = window.open("", "", "resize=yes")
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
		<form action="join" name="registrationForm" method="POST">
			<div class="top">계정 만들기</div>
			<div class="middle">
				<div class="username">
					<input type="text" name="firstname" id="firstname" size="5" placeholder="성">
					<input type="text" name="lastname" id="lastname" size="18" placeholder="이름">
				</div>
				<br>
				<div class="birthday">
					<input type="text" name="birthday" id="birthday" value = "${logined.birthday }" size="30" placeholder="생년월일">
				</div>
				<br>
				<div class="email">
					<input type="text" name="email" id="email"  value = "${logined.email }"  size="30" placeholder="이메일">
				</div>
				<br>
				<div class="pwd">
					<input type="password" name="pw" id="pw" size="30" placeholder="비밀번호">
				</div>
				<br>
				<div class="pwdcheck">
					<input type="password" name="pwcheck" id="pwcheck" size="30" placeholder="비밀번호 재확인">
				</div>
				<br>
				<div class="tel">
					<input type="text" name="tel" id="tel" size="30" placeholder="전화번호">
				</div>
				<br>
				<div class="univer">
					<input type="text" name="univer" id="univer" size="6" onClick="openWindow()" placeholder="대학">
					<input type="text" name="major" id="major" size="6" onClick="openWindow()" placeholder="학과">
					<input type="text" name="hakbun" id="hakbun" size="6" onClick="openWindow()" placeholder="학번">
				</div>
				<br>
				<div class="sinbun">
					신분
					<input type="radio" name="sinbun">교수 
					<input type="radio" name="sinbun">학생
				</div>
			</div>
			<div class="bottom">
					<input type="checkbox">
					<a href="http://www.naver.com">TimeBox 이용약관</a>에 동의하십니까?
					<input type="submit" name="agree" id="agree" value="가입하기" size="6">
			</div>
		</form>
	</div>
	
	<div id="footer"><img alt="작은" width="75px" src="img/timebox.jpg"></div>
</body>
</html>