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
	function subject() {//�̿���
		winobject = window.open('subjectSelection', '',
				"toolbar=no,menubar=no,resizable=no, width=600,height=480")
	}
	
	var WordMin=6;//�ּ� ���� 
	var WordLength=6;//�ִ빮��
	AnsiArray=new Array();AnsiRoom=new Array();AscCharNum=new Array() 
	AnsiArray[0]=[48,57] //asc �����ڵ� ���� 
	AnsiArray[1]=[65,90]//���ĺ� �빮�� ���� 
	AnsiArray[2]=[97,122]//���ĺ� �ҹ��� ���� 
	//������ �ٸ� asc�����ڵ常 �־��ָ� �پ��� ������ �ǰ�����. 
	//��)AnsiArray[3]=[122,255]
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
		alert("��û�� �Ϸ�Ǿ����ϴ�. �ڵ��ȣ�� " + MakeWord() +" �Դϴ�.");
	}
</script>
</head>

<body>

	<div id="header">
		<div class="small_logo" align="left">
			<a href="${home }" target="_self"> <img alt="����" width="120px" src="img/timebox.jpg"> </a>
		</div>
	</div>

	<div id="section">
		<div id="page-content">

			<div id="connect_form">
				<div class="connect">
					<div class="top">
						<span>������ & �ڷ�� ����</span>
					</div>

					<div class="triangle"></div>

					<form action="timeTable" name="timeTableForm">
						<div class="connect_1">
							<div class="radio">
								<input type="radio" name="connect" value="Homeworkbox">�ڷ�� <input
									type="radio" name="connect" value="Taskbox">������
							</div>

							<div class="connect_find">
								<input type="text" id="t1" placeholder="����" readonly> <input
									type="text" id="t1" placeholder="�а�" readonly> <input
									type="text" id="t1_1" placeholder="������" readonly>
							</div>

							<div class="connect_select">
								<input type="text" id="t2" placeholder="���� �����"> <input
									type="button" value="���� ����" onClick="subject()">
							</div>

							<div class="connect_time">
								<label id="lb1">�ð� :</label> <input type="text" value="9:00-13:00" placeholder="�ð�" id="time"
									readonly> <br><br><label id="lb2">���� �л� �� : </label> <input type="text"
									id="peo" placeholder="�����л� ��" > <br><br><label id="lb3">���� ���� : </label><input type="text"
									id="sub" placeholder="���� ����"> <br><br>

								<div class="connect_submit">
									<input type="submit" value="��û" onClick="createFinish()">
									<input type="button" value="���">
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div id="footer"><img alt="����" width="75px" src="img/timebox.jpg"></div>
</body>
</html>