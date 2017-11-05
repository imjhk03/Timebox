<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<spring:url value="resources/css/idCheck.css" var="idCheckCss" />
<link href="${idCheckCss }" rel="stylesheet" />

</head>
<body>

<div class="aa">
	<c:choose>
		<c:when test="${id == 0}">
			<span> ${email }은 사용가능합니다. </span>
		</c:when>
		<c:otherwise>
			<span> ${email }은 증복입니다.</span>
		</c:otherwise>
	</c:choose>

	<input type="button" value="닫기" onclick="window.close()">
</div>	


</body>
</html>