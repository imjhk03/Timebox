<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@page import="java.io.File"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!DOCTYPE html>
<html>
<head>
<!-- css 파일을 jsp에 연결하기 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<spring:url value="resources/css/main.css" var="mainCss" />
<spring:url value="resources/css/taskBox.css" var="taskBoxCss" />
<spring:url value="resources/js/taskBox.js" var="taskBoxJs" />

<link href="${mainCss }" rel="stylesheet" />
<link href="${taskBoxCss }" rel="stylesheet" />
<script src="${taskBoxJs}"></script>

<!-- 홈 화면 연결해줄 페이지 -->
<spring:url value="/" var="home" />
<spring:url value="/setDday" var="setDday" />
<spring:url value="/addFile" var="addFile" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Timebox - 과제실</title>
</head>
<script>
	function addFile() {
		winobj = window.open('addFile', "winobj", "toolbar=no,menubar=no,width=350,height=60")
	}

	function down(){
	window.opener.location = "down";
	window.close(); 
	}
</script>
<%
	String accountName = "김주희";

	String fileName = "과제실";
%>
<body>

	<div id="header">
		<div id="page-header">
			<div id="pageHeaderLogo">
				<a href="${home }" target="_self"> <img alt="작은" width="120px" src="img/timebox.jpg"> </a>
			</div>
			
			<div id="pageHeaderAccount">
				<span class="aName">${logined.name }님&nbsp;<img src="http://i.imgur.com/LpXhgZN.png" height="17" /></span>
				<ul id="accountMenu">
					<li class="aMenu"><a href="myInformation">내 정보</a></li>
					<li class="aMenu"><a href="logout">로그아웃</a></li>
				</ul>
			</div>
		</div>
	</div>
			
	<div id="section">
		<div id="page-content">
			<div id="pageContentHeader">
				<div id="fileRoute">
					<%=fileName %>
				</div>
				
					<div id="menubar">
					<ul id="contentMenu">
					<!-- 
						<li id="Dday" class="cMenu"><img src="http://i.imgur.com/ykuV1hP.png" title="d-day" /></li>
						<li id="upload" class="cMenu"><img src="http://i.imgur.com/N99OqwL.png" title="업로드" /></li>
						<li id="download" class="cMenu"><img src="http://i.imgur.com/JfGuTPp.png" title="다운로드" /></li>
						<li id="newFolder" class="cMenu"><img src="http://i.imgur.com/dZGCklJ.png" title="새 폴더" /></li>
						<li id="nameChange" class="cMenu"><img src="http://i.imgur.com/8toJCzo.png" title="이름 변경" /></li>
						<li id="delete" class="cMenu"><img src="http://i.imgur.com/qx4CsjZ.png" title="삭제" /></li>
					 -->
					 	<li id="Dday" class="cMenu"><img src="http://i.imgur.com/ykuV1hP.png" title="d-day" /></li>
						<li id="upload" class="cMenu"><img src="http://i.imgur.com/N99OqwL.png" title="업로드" /></li>
						<li id="download" class="cMenu"><img src="http://i.imgur.com/JfGuTPp.png" title="다운로드" /></li>
						<li id="delete" class="cMenu"><img src="http://i.imgur.com/qx4CsjZ.png" title="삭제" /></li>
					</ul>
				</div>

			</div>
			<c:if test="${dday != null }">
				<c:forEach var="day" items="${dday}"> 
				
				<span>공지사항 : ${day.comm } 과제 마감일은 ${day.endday }입니다.</span><br><br>
				
				</c:forEach>
				
				</c:if>
		
	
			<div id="fileBrowse">
				<div id="browseHeader">
				
				<table id="mytable" class=table1>
					<tr>
						<th id="thchkbox" align="center"><input type="checkbox" id='allCheck' /></th>
						<th id="thname" align="center">파일이름</th>
						<th id="thupload">업로드된날짜</th>
					</tr>
				</table>
				
				</div>
				<form id="downf" name="form2" method="post" action="down">
				<div id="fileContent">
				
					<c:forEach var="file" items="${fileList}"> 
					<ol id="fileList">

						<li class="browse-file">
							<div class="flist-checkbox"><input type="checkbox" class="flist-chkbox" name="filename" value="${file.g_name}"><span id="ddaytext"></span></div>
							<div class="flist-name"><img src="http://i.imgur.com/D2UCk1m.png" />${file.g_name}</div>
							<div class="flist-date">${file.g_date }</div>
						
						</li>
						
					</ol>
					</c:forEach>
						
				</div>
				</form>
			</div>
		</div>
	</div>	
	
	<div id="footer"><img alt="작은" width="75px" src="img/timebox.jpg"></div>
</body>
</html>