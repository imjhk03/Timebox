<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<spring:url value="resources/css/main.css" var="mainCss" />
<link href="${mainCss }" rel="stylesheet" />
<spring:url value="resources/css/userConfirm.css" var="userCofirmCss" />
<link href="${userCofirmCss }" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script>
	function userConfirm() {
		var CNumber = 1234;
		var CTest;
		CTest = document.getElementById('confirmNum').value;
		if (CTest != CNumber) {
			alert("인증번호가 일치하지 않습니다.");
		} else {
			alert("인증번호가 일치합니다.")
		}
	}
</script>

<title>Timebox - 본인인증</title>
</head>
<body>
	<div id="header">
		<div class="small_logo" align="left">
			<a href="${home }" target="_self"> <img alt="작은" width="120px" src="img/timebox.jpg"> </a>
		</div>
	</div>
	<div id="section">
		<div class="telBox">
			<form class="telNum" method="POST">
				<div class="middle1">
					<div class="a">
						가입시 입력한 휴대폰 번호를 입력해주세요.
						<br>
					</div>

					<div class="telbox_1">
						입력한 번호로 인증번호 전송됩니다. 
					<div class="tel">
						<select id="tel1" name="tel1">
							<option value="">010</option>
							<option value="">011</option>
							<option value="">016</option>
							<option value="">017</option>
							<option value="">019</option>
						</select> <input type="text" name="tel2" id="tel2" size="6"> <input
							type="text" name="tel3" id="tel3" size="6">
							<input type="button" value="전송"><br>
					</div>
					</div>
				</div>
			</form>
			
			<form class="confirmNum" method="POST">
				<div class="middle2">
					<div class="telbox_2">
						<div class="b">
							<br>전송된 인증번호를 입력해주세요.
						</div>
						<div class="c">
							<input type="text" id="confirmNum" name="confirmNum" size="9">
							<input type="submit" value="확인" onclick="userConfirm()"><br>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div id="footer">아래부분</div>
</body>
</html>