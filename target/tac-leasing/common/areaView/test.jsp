<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="openDiv.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>测试区域</title>
</head>
<body>
	<form action="test2.jsp">
		 <!--<span id="ele1"><input type="text" name="area" id="area"/><input type="button" value="请选择区域"  onclick="openAreas()"/><input type="hidden" name="areaId" id="areaId"></input></span>  -->
		 <span id="ele1">请选择区域: <input type="text" name="area" id="area" onclick="openAreas()"/><input type="hidden" name="areaId" id="areaId"></input></span> 
		<input type="submit" value="submit">
	</form>
</body>
</html>