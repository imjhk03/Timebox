<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Timebox - 회원정보</title>

<spring:url value="resources/css/main.css" var="mainCss" />
<link href="${mainCss }" rel="stylesheet" />
<spring:url value="resources/css/myInformation.css" var="myInformationCss" />
<link href="${myInformationCss }" rel="stylesheet" />

<spring:url value="/dropOut" var="dropOut" />

</head>
<body>

<div id="header">
		<div class="small_logo" align="left">
			<a href="${home }" target="_self"> <img alt="작은" width="120px" src="img/timebox.jpg"> </a>
		</div>
	</div>

		<div id="section">
		<form action="update" name="registrationForm" method="POST" onsubmit="return formCheck()">
			<div class="top">내 정보</div>

			<div id="triangle"></div>

			<div class="middle_form">
				<div class="middle">
					<div class="username">
					<input type="text" name="firstname" id="firstname" size="5" value=${firstname } placeholder="성" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" name="lastname" id="lastname" value=${lastname } size="18" placeholder="이름" >
					</div>
					<br>
					<div class="birthday">
						<label class="datechoice">생년월일 :</label> 
						
						<select name="year" class="year" id="year" size="1">

							<%
								for (int i = 1965; i < 2016; i++) {
							%>
							<option value="<%=i%>">${year}</option>
							<%
								}
							%>
						</select><label class="datechoic_year"> 년</label> 
						
						<select name="month" id="month"	size="1">

							<%
								for (int i = 1; i < 13; i++) {
							%>
							<option value="<%=i%>">${month }</option>
							<%
								}
							%>
						</select> <label class="datechoice_month">월</label> 
                     
                     <select name="day" id="day" size="1">
							<%
								for (int i = 1; i < 13; i++) {
							%>
							<option value="<%=i%>">${day }</option>
							<%
								}
							%>
						</select> <label class="datechoice_day">일</label>
					</div>

					<br>
					<div class="email">
						<input type="text" name="email" id="email" value=${logined.email }>
					</div>
					<br>
					<div class="pwd">
						<input type="password" name="pw" id="pw">
					</div>
					<br>
					<div class="pwdcheck">
						<input type="password" name="pwcheck" id="pwcheck"
							placeholder="비밀번호 재확인" onblur="pwdCheck()">
					</div>
					<br>
					<div class="tel">
						<select id="tel1" name="tel1">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="019">019</option>
						</select> 
						-  
						<input type="text" name="tel2" id="tel2" size="6" value=${tel2 } > 
						-  
						<input type="text" name="tel3" id="tel3" size="6" value=${tel3 }>
					</div>
					<br>
					<div class="univer">
						<input type="text" name="univer" id="univer" size="6"
							onClick="openWindow()" placeholder="대학 검색" value=${logined.univer }> <input
							type="text" name="major" id="major" size="6"
							onClick="openWindow()" placeholder="학과 검색" value=${logined.major }> <input
							type="text" name="hakbun" id="hakbun" size="6" value=${logined.hakbun }
							placeholder="학번">
					</div>
					<br>
					<div class="sinbun">
						<label class="sinbun_1">신분 :</label>
						<div class="sinbunchoice">
							<div class="sinbunchoice_1">
								<input type="text" name="stat" id="stat" value=${logined.sinbun } readonly>
							</div>
						</div>
					</div>
				</div>
				
			<div class="bottom">
				<input type="submit" name="change" id="change" value="수정하기" size="6">
				<input type="button" name="drop" id="drop" value="회원탈퇴" size="6" onclick="location.href='${dropOut}'">
			</div>
		</form>
	</div>

	<div id="footer"><img alt="작은" width="75px" src="img/timebox.jpg"></div>
</body>
</html>