<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title></title>
<!doctype html>
<link rel="stylesheet" type="text/css" href="css/emali.css">
</head>
<body>

	<div id="header">
		<div class="mainsmallmenu">
			<form name="form1" method="post">
				<a href="/b_201112068"> <img
					src="https://cf.dropboxstatic.com/static/images/icons/blue_dropbox_glyph-vflJ8-C5d.png"
					alt="Time Box" width=50 height=50>
				</a>
		</div>
		<div id="mainbigmenu" align="center">
			<a href="http://localhost:8090/b_201112068/login.jsp"> <img
				alt="큰" src="img/mainbig.png">
			</a>
		</div>
	</div>

	<div id="selection">
		<form action="EmailOk" method="post" id="submitEmailOkForm"
			name="email">
			<div id="emailform" align="center">
				<div id="emailok">휴대폰 본인 확인으로부터 이메이을 찾았습니다.</div>
				<div id="emailradio" align="center">
					<input type="radio" name="id" id="id" maxlength="100" value="">
					glgjihyo@nate.com
				</div>

				<div id="emaillogin">
					<table>
						<tr>
							<td><a href="http://www.naver.com" trget="_blank">비밀번호 찾기</a></td>
							<td><a href="http://www.naver.com" trget="_blank">로그인</a></td>
						</tr>
					</table>
				</div>
			</div>
		</form>
	</div>

	<div id="footer">timebox 정보</div>
</body>
</html>

