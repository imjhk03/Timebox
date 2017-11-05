
function ddaycal(x1, x2, x3, x4, x5, x6) {
	today = new Date(x1, x2, x3);
	dday = new Date(x4, x5, x6);
	n = Math.floor((dday.getTime() - today.getTime()) / (24 * 60 * 60 * 1000)) + 1;
	return n;

}
function ddayequal(x1, x2, x3, x4, x5, x6) {
	if (x1 <= x4) {
		if (x2 <= x5) {
			if (x3 <= x6) {
				alert("설정되었습니다.시작값 :" + x1 + x2 + x3 + "설정값 :" + x4 + x5 + x6);

			} else if (x3 > x6) {
				alert("날짜를 다시 설정해주세요.시작값이 설정값보다 큽니다.");

			}
		} else if (x2 > x5) {
			alert("날짜를 다시 설정해주세요.시작값이 설정값보다 큽니다.");

		}
	} else if (x1 > x4)
		alert("날짜를 다시 설정해주세요.시작값이 설정값보다 큽니다.");

}

function sendDday() {
	var txt = "<font color='blue'>D-Day : </font>";
	var x1 = startyear.options[startyear.selectedIndex].value;
	var x2 = startmonth.options[startmonth.selectedIndex].value;
	var x3 = startday.options[startday.selectedIndex].value;
	var x4 = endyear.options[endyear.selectedIndex].value;
	var x5 = endmonth.options[endmonth.selectedIndex].value;
	var x6 = endday.options[endday.selectedIndex].value;

	ddayequal(x1, x2, x3, x4, x5, x6);
	if (0 <= ddaycal(x1, x2, x3, x4, x5, x6)) {
		txt += ddaycal(x1, x2, x3, x4, x5, x6);
		window.opener.document.getElementById("ddaytext").innerHTML = txt;
		window.close();
	}
}
