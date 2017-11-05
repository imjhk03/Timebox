<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<spring:url value="resources/css/newFolder.css" var="newFolderCss" />
<link href="${newFolderCss }" rel="stylesheet" />

<spring:url value="/fileBox" var="fileBox" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>폴더 생성</title>
</head>
<body>
<%@page import="java.io.File"%>

<form action="${fileBox }" method="get">
    <h2>
        새 폴더 생성
    </h2>
    <input name="createfolder" type="text">
    <input type="submit" value="폴더 생성">
</form>
<%
    String createfolder = request.getParameter("createfolder");
    String path = "C:/temp/data/" + createfolder; 
    File f = new File(path);
    if(!f.exists()){
        if(f.mkdirs()){%>
            <h2>created file <%=createfolder%></h2>
   <%}
    }
   %>
</body>
</html>