<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>现场调查管理</title>
		<script type="text/javascript">
			$(function (){
				$("#datebegin").datepicker($.datepicker.regional['zh-CN']);
				$("#dateend").datepicker($.datepicker.regional['zh-CN']);
			});
		</script>
	</head>
	<body>
		<div>
			起始日期：<input type="text" style="border: #03515d solid 1px;"  id="datebegin">
			结束日期：<input type="text" id="dateend" style="border: #03515d solid 1px;" >
		</div>
	</body>
</html>