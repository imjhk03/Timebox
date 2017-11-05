<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<spring:url value="resources/css/timeChoice.css" var="timeChoiceCss" />
<link href="${timeChoiceCss }" rel="stylesheet" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script language='javascript' type='text/javascript'>
	function reLoad() {
		var check = this.form1.check.value;
		window.opener.location = "timeTableinsert?check=" + check;
		window.close();
	}
</script>
</head>


<body onload="init(this.form);">
	<div id="header"></div>


	<div class="timeChoice_1">
		<div class="timeChoice_search">
			<h3>�ð�ǥ �˻��ϱ�</h3>
		</div>

		<div class="triangle"></div>

		<div class="timeChoice_box">

			<form name="form" method="post" action="seltt">

				<select id="first" name="hak_no">
					<c:forEach var="list" items="${hakList}">
					
						<option value="${list.uni_no }">${list.uni_name}</option>

					</c:forEach>

				</select> <select id="second">
					<c:forEach var="list" items="${majorList}">

						<option value="${list.major_no }">${list.major_name}</option>

					</c:forEach>

				</select>
				 <select id="grade">
					<option id="0">�г� ����</option>
					<option id="1">1�г�</option>
					<option id="2">2�г�</option>
					<option id="3">3�г�</option>
				</select> 
				<input type="submit" name="search" value="�˻�"> <br> <br>
			</form>

			<form name="form1" method="post" action="timeTableinsert">
				<c:choose>
					<c:when test="${ttList == null}">

					</c:when>
					<c:otherwise>
						<div class="timetable_form">
							<div class="timetable_info">
								<table cellspacing=0>
									<tr>
										<td width=50 height=35 bgcolor=#19cc95>����</td>
										<td width=82 bgcolor=#19cc95>���� ����</td>
										<td width=65 bgcolor=#19cc95>������</td>
										<td width=65 bgcolor=#19cc95>����</td>
										<td width=65 bgcolor=#19cc95>���۽ð�</td>
										<td width=65 bgcolor=#19cc95>���ð�</td>


									</tr>
								</table>
							</div>

							<div class="timetable_search_1">
								<table cellspacing=0>

									<c:forEach var="list" items="${ttList}">
										<tr id="timetable_border">

											<td width=50 height=25><input type="radio" name="check" id="color" value="${list.tt_no}"></td>
											<td width=82>${list.subject}</td>
											<td width=65>${list.teach}</td>
											<td width=65>${list.subdate}</td>
											<td width=65>${list.stime}</td>
											<td width=65>${list.etime}</td>

										</tr>

									</c:forEach>

								</table>
							</div>
						</div>

						<div id="saveinfo">
							<input type="button" name="save" class="test" value="Ȯ��" onClick="reLoad()"> <input type="button"
								name="can" value="���" onClick="window.close()">
						</div>
					</c:otherwise>
				</c:choose>

			</form>
		</div>
	</div>
</body>
</html>