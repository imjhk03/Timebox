<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- css 파일을 jsp에 연결하기 -->
<spring:url value="resources/css/popup.css" var="popupCss" />
<link href="${popupCss }" rel="stylesheet" />
<spring:url value="resources/css/boardLink.css" var="boardLinkCss" />
<link href="${boardLinkCss }" rel="stylesheet" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 홈 화면 연결해줄 페이지 -->
<spring:url value="/boardConnect" var="boardConnect" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script>
$(document).ready(function() {
	//$('.test').hide();
});
</script>

<script>
function boardConnect() {
	
	location.href = "boardConnect";
	
}

function boardInsert() {
	winobj = window.open('boardInsert', "winobj", "toolbar=no,menubar=no,width=350,height=100");
	
}

function taskList() {

	var a = "connect";
	location.href="taskConn?="+ a;
	
}

function fileList() {
	var a = "conn";
	location.href="fileConn?="+ a;
}

</script>

</head>
<body>
		<div class="boardBox">
			<div class="middle">
					<c:if test="${data !=null }">
					
						<input type="button" name="project" value="과제실" onClick="taskList()" >
						<input type="button" name="data" value="자료실" onClick="fileList()" >
					
					</c:if> 
					
					<c:if test="${data == null }">
						<input type="button" name="project" value="과제실" onClick="window.close()" disabled="disabled">
						<input type="button" name="data" value="자료실" onClick="window.close()" disabled="disabled">
					</c:if>
			</div>
			

			<div class="boardConnect" align="center">
				<button type= "button" class="test" onclick="boardInsert()">코드부여</button>
				<button type="button" name="boardConnect" onClick="boardConnect()">과제실/자료실 연결하기</button>
			</div>
		</div>
</body>
</html>

