<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<spring:url value="resources/css/main.css" var="mainCss" />
<link href="${mainCss }" rel="stylesheet" />
<spring:url value="resources/css/membership.css" var="membershipCss" />
<link href="${membershipCss }" rel="stylesheet" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/" var="home" />
<spring:url value="/idCheck" var="idCheck" />
<spring:url value="/timeChoice" var="timeChoice" />

<title>Timebox - 회원가입</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script> 

<script language='javascript' type='text/javascript'>
	
	function openWindow() {
		winobject = window.open("", "", "resize=yes")
	}
	
	function use(){//이용약관
		
	}

</script>

<script>
<!--
$(document).ready(function() {
	$('[type=password]').focus(function() {
		$(this).css({'font-family' : ''});​
	});
});
-->
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

			<div id="triangle"></div>

			<div class="middle_form">
				<div class="middle">
					<div class="username">
						<input type="text" name="firstname" id="firstname" size="5" placeholder="성" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" name="lastname" id="lastname" size="18" placeholder="이름" >
					</div>
					<br>
					<div class="birthday">
						<label class="datechoice">생년월일 :</label> 
						
						<select name="year" class="year" id="year" size="1">
							<option value="선택">선택</option>
							<%
								for (int i = 1965; i < 2016; i++) {
							%>
							<option value="<%=i%>"><%=i%></option>
							<%
								}
							%>
						</select><label class="datechoic_year"> 년</label> 
						
						<select name="month" id="month"	size="1">
							<option value="선택">선택</option>
							<%
								for (int i = 1; i < 13; i++) {
							%>
							
							<option value="<%=i%>"><%=i%></option>
							<%
								}
							%>
						</select> <label class="datechoice_month">월</label> 
                     
                     <select name="day" id="day" size="1">
                     		<option value="선택">선택</option>
							<%
								for (int i = 1; i < 32; i++) {
							%>
							<option value="<%=i%>"><%=i%></option>
							<%
								}
							%>
						</select> <label class="datechoice_day">일</label>
					</div>

					<br>
					<div class="email">
						<input type="text" name="email" id="email" placeholder="이메일 (ID)" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$">
						<input type="button" id="idcheck" value="중복체크" onClick="window.open('emailCheck?email='+registrationForm.email.value,'','scrollbars=no,width=500,height=40');">
					</div>
					<br>
					<div class="pwd">
						<input type="password" name="pw" id="pw" placeholder="비밀번호">
					</div>
					<br>
					<div class="pwdcheck">
						<input type="password" name="pwcheck" id="pwcheck" placeholder="비밀번호 재확인">
					</div>
					<br>
					<div class="tel">
						<select id="tel1" name="tel1">
							<option value="선택">선택</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="019">019</option>
						</select> 
						-  
						<input type="text" name="tel2" id="tel2" size="6"> 
						-  
						<input type="text" name="tel3" id="tel3" size="6">
					</div>
					<br>
					<div class="univer">
						<select id="univer" name="univer">
							<c:forEach items="${hakList}" var="hak">
								<option value="${hak.uni_name }">${hak.uni_name }</option>
							</c:forEach>
						</select> 
						
						<select id="major" name="major">
							<c:forEach items="${majorList}" var="major">
								<option value="${major.major_name }">${major.major_name }</option>
							</c:forEach>
						</select> 
						
						<input type="text" name="hakbun" id="hakbun" size="6" placeholder="학번">
					</div>
					
					<br>
					<div class="sinbun">
						<label class="sinbun_1">신분 :</label>
						<div class="sinbunchoice">
							<div class="sinbunchoice_1">
								<input type="radio" name="sinbun" value="교수"> 교수 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="sinbun" value="학생"> 학생
							</div>
						</div>
					</div>
				</div>
				<div class="bottom">
					<input type="checkbox"> 
					<label onClick="use()" id="use">TimeBox이용약관</label>에 동의하십니까? 
					<input type="submit"  id="agree" value="가입하기" size="6">
				</div>
		</form>
	</div>

	<div id="footer"><img alt="작은" width="75px" src="img/timebox.jpg"></div>
</body>
</html>