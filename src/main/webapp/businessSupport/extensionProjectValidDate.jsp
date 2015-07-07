<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>延长案件有效期</title>
<script type="text/javascript">

	/* Add by ZhangYizhou on 2014-06-19 Begin */
	/* IT201406071 : 延长案件有效期画面完善 */
	$(function (){
		$("#valid_date").datepicker($.datepicker.regional['zh-CN']);
		$('#valid_day').hide();
		if($('#valid_date').val()!='') {
			$("#type0").attr("checked", true);
			$("#type1").attr("checked", false);
		}
		if($('#valid_day').val()!='') {
			$("#type0").attr("checked", false);
			$("#type1").attr("checked", true);
		}
		onChange();
		$('input[name="type"]').change(onChange);
	});

	function onChange(){
		if($('input[name="type"]:checked').val()==0) {
			$('#valid_day').hide('');
			$('#valid_day').val('');
			$('#valid_date').show();
		} else {
			$('#valid_date').hide();
			$('#valid_date').val('');
			$('#valid_day').show();
		}
	}
	/* Add by ZhangYizhou on 2014-06-19 End */
	
	function submitForm(e){
		var reg = /^\d+$/;
		if (!reg.exec($.trim($("#lease_code").val()))) {
			alert("好像合同号都是数字的吧！");
			$("#lease_code").select();
			$("#lease_code").focus();
			return false;
		}
		/* Modify by ZhangYizhou on 2014-06-19 Begin */
		/* IT201406071 : 延长案件有效期画面完善 */
		if ($.trim($("#valid_day").val())!='' && !reg.exec($.trim($("#valid_day").val()))) {
		/*
		if (!reg.exec($.trim($("#valid_day").val()))) {
		*/
		/* Modify by ZhangYizhou on 2014-06-19 End */
			alert("有效期是天数啦。（默认90天）");
			$("#valid_day").select();
			$("#valid_day").focus();
			return false;
		}
		$(e).attr('disabled',true);
		$("form").submit();
	}
</script>
<style type="text/css">
	.tital_th{background-color: #EAF4FD; color: #2E6E9E; border: solid 0.25px #A6C9E2;padding: 8px;}
	.dataTD1{background-color: #FFFFFF; color: #2E6E9E; border: solid 0.25px #A6C9E2;padding: 8px;}
	.dataTD2{background-color: #FFFFFF; color: #2E6E9E; border: solid 0.25px #A6C9E2;padding: 0px;}
	.textBox{border: solid 1px #9B6CA0; width: 250px; height: 25px; background-color: #FFFFFF}
</style>
</head>
<body>
<form action="${ctx }/servlet/defaultDispatcher" method="post">
	<input type="hidden" name="__action" value="businessSupport.updateExtensionProjectValidDate"/>
	<table cellspacing="0" cellpadding="0" border="0" align="center" style="border: solid 1px #A6C9E2;" width="50%">
		<tr>
			<th colspan="4" class="tital_th">
				根据合同号来延长案件的有效期，默认是90天。<font color="red">${result }</font>
			</th>
		</tr>
		<tr>
			<td class="dataTD1" align="right">合同号：</td>
			<td class="dataTD2"><input type="text" id="lease_code" name="lease_code" class="textBox" value="${lease_code }"/></td>
		</tr>
		<!-- Modify by ZhangYizhou on 2014-06-19 Begin -->
		<!-- IT201406071 : 延长案件有效期画面完善  -->
		<tr>
			<td class="dataTD1" align="right">
				<input id="type0" type="radio" name="type" checked="checked" readonly="readonly" value="0">新有效日期：
				<input id="type1" type="radio" name="type" value="1">新有效天数：
			</td>
			<td class="dataTD2">
				<input type="text" id="valid_date" name="valid_date" class="textBox" value="${valid_date }"/>
				<input type="text" id="valid_day" name="valid_day" class="textBox" value="${valid_day }"/>
			</td>
		</tr>
		<!--
		<tr>
			<td class="dataTD1" align="right">新有效期：</td>
			<td class="dataTD2"><input type="text" id="valid_day" name="valid_day" class="textBox" value="${valid_day }"/></td>
		</tr>
		-->
		<!-- Modify by ZhangYizhou on 2014-06-19 End -->
		<tr>
			<th colspan="4" class="tital_th">
				<input type="button" value="提交" id="but_sub" onclick="submitForm(this);" style="width: 80px; height: 30px; color: #2E6E9E; font-weight: bolder;"/>
			</th>
		</tr>
	</table>
</form>
</body>
</html>