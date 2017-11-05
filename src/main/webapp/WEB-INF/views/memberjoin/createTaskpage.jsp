<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<spring:url value="resources/css/main.css" var="mainCss" />
<link href="${mainCss }" rel="stylesheet" />
<spring:url value="resources/css/createTaskpage.css" var="createTaskpageCss" />
<link href="${createTaskpageCss }" rel="stylesheet" />
<spring:url value="resources/css/subjectSelection.css" var="subjectSelectionCss" />
<link href="${subjectSelectionCss }" rel="stylesheet" />

<spring:url value="/subjectSelection" var="subjectSelection" />

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>Timebox</title>
<script>
	function subject() {//이용약관
		winobject = window.open('subjectSelection', '',
				"toolbar=no,menubar=no,resizable=no, width=600,height=480")
	}
	
	var WordMin=6;//최소 문자 
	var WordLength=6;//최대문자
	AnsiArray=new Array();AnsiRoom=new Array();AscCharNum=new Array() 
	AnsiArray[0]=[48,57] //asc 숫자코드 범위 
	AnsiArray[1]=[65,90]//알파벳 대문자 범위 
	AnsiArray[2]=[97,122]//알파벳 소문자 범위 
	//위에서 다른 asc숫자코드만 넣어주면 다양한 조합이 되겠지요. 
	//예)AnsiArray[3]=[122,255]
	function AnsiChar(){ 
	var Start=0,End=1,cnt=0 
	        for(i=0;i<=AnsiArray.length-1;i++) { 
	              for(j=AnsiArray[i][Start];j<=AnsiArray[i][End];j++){ 
	                AnsiRoom[cnt] = j; 
	                cnt++ 
	                } 
	        } 
	}
	function MakeCharNum(){ 
	AscCharNum=AnsiRoom; 
	AscNum=parseInt(Math.random()*AscCharNum.length); 
	return AscNum; 
	}
	function rnd(){ 
	WordRangr=parseInt(Math.random()*WordLength); 
	        if (WordRangr=WordMin){return WordRangr;} 
	        else{return rnd();} 
	}

	function MakeWord(){ 
	var Word=""; 
	        Len=rnd(); 
	        for(i=0;i<=Len;i++){ 
	                Word+=String.fromCharCode(AnsiRoom[MakeCharNum()]); 
	        } 
	        return Word; 
	} 
	AnsiChar(); 
	MakeCharNum();
	//for (k=0;k<=15;k++){ 
	    //document.write(MakeWord()+"<br>") 
	//}
	
	function createFinish() {
		alert("신청이 완료되었습니다. 코드번호는 " + MakeWord() +" 입니다.");
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
		<div id="page-content">

			<div id="connect_form">
				<div class="connect">
					<div class="top">
						<span>과제실 & 자료실 생성</span>
					</div>

					<div class="triangle"></div>

					<form action="timeTable" name="timeTableForm">
						<div class="connect_1">
							<div class="radio">
								<input type="radio" name="connect" value="Homeworkbox">자료실 <input
									type="radio" name="connect" value="Taskbox">과제실
							</div>

							<div class="connect_find">
								<input type="text" id="t1" placeholder="대학" readonly> <input
									type="text" id="t1" placeholder="학과" readonly> <input
									type="text" id="t1_1" placeholder="교수명" readonly>
							</div>

							<div class="connect_select">
								<input type="text" id="t2" placeholder="선택 과목명"> <input
									type="button" value="과목 선택" onClick="subject()">
							</div>

							<div class="connect_time">
								<label id="lb1">시간 :</label> <input type="text" value="9:00-13:00" placeholder="시간" id="time"
									readonly> <br><br><label id="lb2">수강 학생 수 : </label> <input type="text"
									id="peo" placeholder="수험학생 수" > <br><br><label id="lb3">과목 설명 : </label><input type="text"
									id="sub" placeholder="과목 설명"> <br><br>

								<div class="connect_submit">
									<input type="submit" value="신청" onClick="createFinish()">
									<input type="button" value="취소">
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div id="footer"><img alt="작은" width="75px" src="img/timebox.jpg"></div>
</body>
</html>