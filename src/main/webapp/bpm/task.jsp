<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" href="../resources/jquery/themes/redmond/jquery-ui-1.8.1.custom.css" rel="stylesheet" />
<script type="text/javascript" src="../resources/jquery/jquery-1.4.2.min.js"></script>
<script src="../bpm/js/bpmUI.js" type="text/javascript"></script>
<script type="text/javascript" src="../resources/jquery/jquery-ui-1.8.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#getTask").click(function() {
		$.bpmUI("taskDiv",$("#pid").val(),$("#uid").val());
	});
	
});
</script>
</head>
<body>
	processid<input id="pid" type="text" value="">
	userid<input id="uid" type="text" value="">
	<input id="getTask" type="button" value="getTask">
	<br>
	<div id="taskDiv"></div>
</body>
</html>