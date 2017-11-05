<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<spring:url value="resources/css/message.css" var="messageCss" />
<link href="${messageCss }" rel="stylesheet" />


<title>코드 부여</title>
</head>

<body>

<%
	String code = (String)request.getAttribute("code");
	request.getAttribute("success");
%>
<div class="code">
 <span class="1">축하합니다. 코드번호는 </span><div class="code_1"><label><u><%=code %></u></label></div>  <samp>입니다.</samp>
</div>

</body>
</html>