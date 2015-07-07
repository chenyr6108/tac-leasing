<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/jquery.autocomplete.css" />
<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
<title>recoverDecomposePirce</title>
<script type="text/javascript">
function decompostSub() {
	var flag = true ;
	var RECP_CODE = $("#RECP_CODE").val() ;
	if(RECP_CODE == null || RECP_CODE == ''){
		alert("支付表号不能为空") ;
		return false ;
	}	
	return flag ;
}
</script>
</head>
<body>
	<form id="form2" name="form2" action="../servlet/defaultDispatcher"	method="post">
	<input type="hidden" name="__action" id="__action" value="decompose.recoverDecomposePirce">
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<th class="ui-state-default ui-th-ltr zc_grid_head">
		<strong>请输入支付表号：</strong><font color="red">${returnStr }</font>
		</th>
		<tr>  
		<td style="text-align: center;"><input type="text" name="RECP_CODE" id="RECP_CODE" value="" style="width: 250;height: 30;"/></td>
		</tr>
		<tr>
			<td style="text-align: center;">
				<input type="submit" value="确&nbsp;定" class="ui-state-default ui-corner-all" onclick="return decompostSub() ;">
			</td>
		</tr>
	</table>
</form>
</body>
</html>