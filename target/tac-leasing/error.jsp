<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>文件上传出错页面</title>
<style type="text/css">
<!--
.mistake_ym {
	background-image: url(../frame/images/mistake/cuowu_bg_03.png);
	background-repeat: no-repeat;
	height: 304px;
	width: 594px;
	margin-top: 76px;
	margin-right: auto;
	margin-left: 176px;
	float: left;
}
.midtake_zi {
	height: 116px;
	width: 337px;
	margin-top: 146px;
	margin-left: 220px;
	color: #014c6f;
	font-size: 12px;
	line-height: 1.5em;
}
-->
</style>
</head>

<body bgcolor="#f9fdfd">
	<div class="mistake_ym">
		<div class="midtake_zi"><span class="red">系统提示信息！！！</span>
		<c:forEach items="${errList}" var="err">
		  <li><c:out value="${err}"/></li>
		</c:forEach>
		</div>
	</div>
</body>
</html>