<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- css 파일을 jsp에 연결하기 -->
<spring:url value="resources/css/main.css" var="mainCss" />
<link href="${mainCss }" rel="stylesheet"  />
<spring:url value="resources/css/timeTable.css" var="timeTableCss" />
<link href="${timeTableCss }" rel="stylesheet" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<spring:url value="resources/js/timeTable.js" var="timeTableJs" />

<!-- 홈 화면 연결해줄 페이지 -->
<spring:url value="/login" var="login" />
<spring:url value="/timeChoice" var="timeChoice" />
<spring:url value="/boardLink" var="boardLink" />
<spring:url value="/myInformation" var="myInformation" />
<spring:url value="/createTaskpage" var="createTaskpage" />

<script src="${timeTableJs}"></script>

<script language="javascript">
	function timeChoice() {
		winobj = window.open('timeChoice', "",
				"toolbar=no,menubar=no,width=650,height=415")
	}
	
</script>

<title>Timebox</title>
</head>
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
					<li class="aMenu"><a href="${createTaskpage }">과제실&자료실 생성</a></li>
					<li class="aMenu"><a href="logout">로그아웃</a></li>
				</ul>
			</div>
			
		</div>
	</div>
	
	<div id="section">
		<div id="page-content">
			<div id="timeTable">
				<%
				String myList[] = (String[])request.getAttribute("mylist");
				
				System.out.print("마이리스트"+ myList);
			
		
				
					// / 	월	 화	 수	 목	 금
					// 1 	1.1	1.2	1.3	1.4	1.5
					// 2	2.1	2.2	2.3	2.4	2.5
					// 3	3.1 3.2 3.3 3.4 3.5
					// 4	4.1 4.2	4.3 4.4 4.5
					// 5	5.1 5.2 5.3 5.4 5.5
					// 6 	6.1 6.2 6.3 6.4 6.5
					// 7	7.1 7.2 7.3 7.4 7.5
					// 8	8.1 8.2 8.3 8.4 8.5
					// 9 	9.1 9.2 9.3 9.4 9.5
					String[][] array = { { "/", "월", "화", "수", "목", "금" },
							{ "1", "11", "12", "13", "14", "15" },
							{ "2", "21", "22", "23", "24", "25" },
							{ "3", "31", "32", "33", "34", "35" },
							{ "4", "41", "42", "43", "44", "45" },
							{ "5", "51", "52", "53", "54", "55" },
							{ "6", "61", "62", "63", "64", "65" },
							{ "7", "71", "72", "73", "74", "75" },
							{ "8", "81", "82", "83", "84", "85" },
							{ "9", "91", "92", "93", "94", "95" } };
				
					//flat ui color - 12
					String[] colorStr = { "#1abc9c", "#16a085", "#2ecc71", "#27ae60",
							"#3498db", "#2980b9", "#9b59b6", "#34495e", "#f1c40f",
							"#f39c12", "#e67e22", "#e74c3c" };
					//pastel - 12
					String[] colorStr1 = { "#ffb3ba", "#ffdfba", "#ffffba", "#baffc9",
							"#bae1ff", "#dbdcff", "#ffbc6e", "#f0b0b0", "#e5e297",
							"#93e1a0", "#9ad4ea", "#d2b2f4"};
					//#21, #20 - 10
					String[] colorStr2 = { "#faa1a1", "#ffefaa", "#b7ffac", "#89f6ff",
							"#ad9aff", "#cb6464", "#d2b06e", "#7fd472", "#56b9bc",
							"#645ac1"};
					//basic - 6
					String[] colorStr3 = { "red", "orange", "yellow", "green", "blue",
							"indigo", "purple" };
					//색상 중복 체크 배열(색상갯수만큼배열크기)
					int[] cStr = new int[12];
					
					String[] test = new String[myList.length];
			
					
					for(int i = 0; i < myList.length; i++)
					{
						test[i] = myList[i];	
					}	
					for (int i = 0; i < cStr.length; i++) {
						cStr[i] = 0;
					}
					
					
					//요일 시작시간 끝시간 과목이름

					int day;
					int startTime;
					int endTime;
					String className;
					int cindex;

					for (int i = 0; i < test.length; i++) {
						day = Integer.parseInt(test[i].toString().substring(0, 1)); //요일
						startTime = Integer.parseInt(test[i].toString().substring(1, 2));
						endTime = Integer.parseInt(test[i].toString().substring(2, 3));
						className = test[i].toString().substring(3);

						for (int y = startTime; y <= endTime; y++) {
							if (y == startTime) {
								array[y][day] = (endTime - startTime + 1) + className;
							} else {
								array[y][day] = "x"; //empty is x
							}
						}
					}

					out.print("<table cellspacing=10 cellpadding=10>"
							+ "<col width=50 bgcolor=#c5f6e3><col width=50><col width=50>"
							+ "<col width=50><col width=50><col width=50>"
							+ "<col width=50><col width=50><col width=50><col width=50>");
					out.print("<tr bgcolor=#c5f6e3><th>＼<th>월<th>화<th>수<th>목<th>금");

					for (int q = 1; q < 10; q++) {
						out.print("<tr>");
						for (int y = 0; y < 6; y++) {
							//배경색 중복 제거 (색상 갯수 - 1)
							//랜덤 숫자 구하기
							long c = Math.round((Math.random() * 11));
							cindex = (int) c;
							//중복 제거 체크
							while (cStr[cindex] != 0) {
								c = Math.round((Math.random() * 11));
								cindex = (int) c;
							}

							if (y == 0) {
								out.print("<th>" + array[q][y]);
							} else if (array[q][y].equals(q + "" + y)) {
								out.print("<td class=\"noclass\">");
							} else if (array[q][y] != "x"
									&& array[q][y] != (q + "" + y)) {

								String plusString = "<td class=\"subclass\" rowspan="
										+ array[q][y].substring(0, 1) + " bgcolor = "
										+ colorStr1[cindex] + ">";
								out.print(plusString);
								out.print(array[q][y].substring(1));

								cStr[cindex] = 1;
							}

						}
					}
					out.print("</table>");
				%>
			</div>
			<div id="timeTableSetting">
					<img alt="시간표수정" width="25px" src="img/setting.png">
				</div>
			</div>
	</div>
	
	<div id="footer"><img alt="작은" width="75px" src="img/timebox.jpg"></div>
</body>
</html>