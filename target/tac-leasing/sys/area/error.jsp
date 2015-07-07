<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
<!--
.mistake_ym {
	background-image: url(frame/images/mistake/cuowu_bg_03.png);
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
		<div class="midtake_zi">
		<li>
			${errList}
		</li>
		<% 
	      int status_code = -1;
	      String exception_info = null;
	      Exception theException = null;
	      status_code = ((Integer) request.getAttribute("javax.servlet.error.status_code"));
	      exception_info = (String) request.getAttribute("javax.servlet.error.message");
	      theException = (Exception) request.getAttribute("javax.servlet.error.exception_type");
	     
	      out.println("<br><b>StatusCode:</b> " +  status_code);
	      out.println("<br><b>Exception:</b>" + exception_info);
	
		%>  
		</div>
	</div>
</body>
</html>