<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<spring:url value="resources/css/faddFile.css" var="faddFileCss" />
<link href="${faddFileCss }" rel="stylesheet" />

</head>
<script language="javascript">
</script>
<body>
	<div class="a">
		<div class="b">
			<div class="fileinputs">
				<form method="post" name="form1" enctype="multipart/form-data"
					action="insertFfile">
					<input type="file" name="ffile1" class="custom-file-input"> <input type="submit"
						name="submit">
				</form>
			</div>
		</div>
	</div>
</body>
</html>