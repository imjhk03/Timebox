<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- css 파일을 jsp에 연결하기 -->
<spring:url value="resources/css/boardConnect.css" var="boardConnectCss" />
<link href="${boardConnectCss }" rel="stylesheet" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>과제실/자료실 연결하기</title>
<script>

function load() {

	location.href = "boardLink1";

}

function a(){
	opener.document.getElementsByName("project").disabled = true; 
	opener.document.getElementsByName("data").disabled = true; 
	opener.location.reload();
	window.close();
}

var cn;
	function openWindow() {
		winobject = window.open('taskConnect.jsp', "", "toolbar=no,menubar=no,width=350,height=350")
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
	
	function CheckCode() {
		document.getElementById('codenumb').value = MakeWord();
	}
	//document.getElementById('codenum').value;
</script>
</head>
<body>

	<div id="connect">
		<div class="connect_1">
			<div class="connect_form">
				<h3>과제실/자료실 연결하기</h3>
			</div>
			
			<div class="triangle"></div>
			
			
			<form method="post" action="searchcode">
				<div class="codefind">
					<label>코드번호</label> <input type="text" name="searchcode"
						id="codenumb" size="6" value=""> <input type="submit"
						name="search" id="search" size="3" value="연결">
				</div>
			</form>
			<br>

			<c:if test="${bdto !=null }">
				<span>자료실 / 과제실이 존재합니다.</span>
		
				<br>
				
				<div id="findconnect">
					<form name="form1" action="boardLink1" method="post">
						<input type="hidden" name="code" value="${bdto.g_code }">
						<input type="submit" name="save" value="연결하기" onClick="load()">
					</form>
				</div>
			</c:if>
		</div>
	</div>

</body>
</html>