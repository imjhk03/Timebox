<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<spring:url value="resources/css/dDaySet.css" var="dDaySetCss" />
<link href="${dDaySetCss }" rel="stylesheet" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>D-day 설정</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<script>
	function a(){
		opener.location.reload();
		window.close();
	}
</script>
</head>
<body>
	<form method="post" action="insertDay">
		<div class="d_day_1">
		<div class="triangle_1"></div>
			<h3>D - day 설정</h3></div>
			<div class="d_day_set">

				<select name="startyear" id="year" size="1">
							<option value="2015">2015</option>
							<option value="2016">2016</option></select>
							<label class="datechoic_startyear">년</label>
							<select name="startmonth" id="month" size="1">
					<%
								for(int i =1; i <13; i++) {
							%>
							<option value="<%=i%>"><%=i%></option>
							<%
								}
							%>
						</select>
						<label class="datechoice_startmonth">월</label>
					
						<select name="startday" id="day" size="1">
							<%
								for(int i =1; i <32; i++) {
							%>
							<option value="<%=i%>"><%=i%></option>
							<%
								}
							%>
						</select> <label class="datechoice_startday">일</label> &nbsp;&nbsp;
				
			</div>
		

		<div class="d_day_2">
		<div class="triangle_2"></div>
			<h3>D - day 해제</h3></div>
			<div class="d_day_del">
				<select name="endyear" id="year" size="1">
							<option value="2015">2015</option>
							<option value="2016">2016</option></select>
							<label class="datechoic_endyear">년</label>
							<select name="endmonth" id="month" size="1">
							<%
								for(int i =1; i <13; i++) {
							%>
							<option value="<%=i%>"><%=i%></option>
							<%
								}
							%>
						</select>
						<label class="datechoice_endmonth">월</label>
						<select name="endday" id="day" size="1">
						<%
								for(int i =1; i <32; i++) {
							%>
							<option value="<%=i%>"><%=i%></option>
							<%
								}
							%>
						</select> <label class="datechoice_endday">일</label><br><br>
						
						
			</div> 
			
			
			<div class="ddayset">
				<div class="a">
					과제 설명 : <input type="text" name="comm">
			</div>
			
			<div class="ddayset_1">
				<input type="submit" value="설정">
				<input type="button" value="취소" onClick="window.close()">
			
			</div>

	</form>
</body>
</html>