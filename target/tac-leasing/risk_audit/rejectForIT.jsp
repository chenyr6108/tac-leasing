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
	var LEASE_CODE = $("#LEASE_CODE").val() ;
	if(LEASE_CODE == null || LEASE_CODE == ''){
		alert("合同号不能为空") ;
		return false ;
	}	
	return flag ;
}
</script>
</head>
<body>
	<form id="form2" name="form2" action="../servlet/defaultDispatcher"	method="post">
	<input type="hidden" name="__action" id="__action" value="riskAudit.rejectForIT">
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<th class="ui-state-default ui-th-ltr zc_grid_head">
		<strong>请输入合同号：</strong><font color="red">${returnStr }</font>
		</th>
		<tr>  
			<td style="text-align: center;"><input type="text" name="LEASE_CODE" id="LEASE_CODE" value="${LEASE_CODE }" style="width: 250;height: 30;"/></td>
		</tr>
		<tr> 
			<td style="text-align: center;">是否保留合同号&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="is_lease" id="is_lease" value="1" checked="checked" >&nbsp;&nbsp;是 &nbsp;&nbsp;<input type="radio" name="is_lease" id="is_lease" value="0">&nbsp;&nbsp;否&nbsp;&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align: center;">
				<input type="submit" value="确&nbsp;定" class="ui-state-default ui-corner-all" onclick="return decompostSub();">
			</td>
		</tr>
	</table>
</form>
</body>
</html>