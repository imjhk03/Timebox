<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������ & �ڷ�� ��û �Ϸ�</title>

<spring:url value="resources/css/createFinish.css" var="createFinishCss" />
<link href="${createFinishCss }" rel="stylesheet" />

<script language="createFinish_ok">
	function timechoice_1() {
		winobj = window.open('timeChoice_1', "",
				"toolbar=no,menubar=no,width=650,height=415")
	}
</script>

</head>
<body>

	<div id="header">
		<div class="small_logo" align="left">
			<a href="${home }" target="_self"> <img alt="����" width="120px" src="img/timebox.jpg"> </a>
		</div>
	</div>
	
	
	<div id="header">
			<div class="big_logo" align="center">
			<a href="${home }" target="_self"> <img alt="ū" width="250px" src="http://i.imgur.com/gBgLHQP.png">
			</a>
		</div>
	</div>

	<div id="section">
		<div class="membershipFinish">
			<form action="login" name="membershipFinishForm" method="GET">
				<div class="font1">
					������ & �ڷ�� ������ �Ϸ�Ǿ����ϴ�. <input type="button" value="Ȯ��" onClick="createFinish_ok()">
				</div>
			</form>
		</div>
	</div>

	<div id="footer"><img alt="����" width="75px" src="img/timebox.jpg"></div>
</body>
</html>