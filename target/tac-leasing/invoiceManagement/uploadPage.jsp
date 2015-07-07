<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>开票上传</title>
<script type="text/javascript">
function sub(){
	var fmt=$("#uploadFile").val().split(".");
	var typeName=fmt[1];
	if("xls"!=typeName){
		alert("只能上传Excel(97-2003)文件！");
     	return false;
	}
	$("#form1").submit();
}	

$(function() {
	if($("#msg").val()!='') {
		alert($("#msg").val());
	}
});
</script>
</head>
<body>
	<form action="${ctx }/servlet/defaultDispatcher" method="post" id="form1" enctype="multipart/form-data">
		<input type="hidden" name="type" value="excel">
		<input type="hidden" id="msg" name="msg" value="${msg }">
		<input type="hidden" name="__action" id="__action" value="invoiceManagementCommand.uploadFile"/>
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height:30px;width:50%">
			<span class="ui-jqgrid-title" style="line-height:30px;font-size:15px;">&nbsp;&nbsp;开票上传</span>
		</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" style="height:10%;width:50%">
			<table class="panel_table" align="left" style="width:50%;border-left:0px;border-top:0px;">
				<tr>
					<td style="border:0px;">
						Excel文件:
						<input id="uploadFile" type="file" name="uploadFile" style="height:25px;cursor:pointer;">
						<input class="panel_button" type="button" onclick="sub();" value="上传">
					</td>
				</tr>
				<tr>
					<td style="border:0px;color:red;">
						*文件名中禁止使用.符号<br>
						*只能上传后缀名为xls格式的Excel(97-2003)文件
					</td>
				</tr>
			</table>
		</div>
	</form>
	<%-- <c:if test="${not empty resultList }">测试使用
		<table class="panel_table" align="left" style="width:50%;">
				<tr>
					<th>
						序号
					</th>
					<th>
						合同号
					</th>
					<th>
						期数
					</th>
					<th>
						发票号
					</th>
					<th>
						类型
					</th>
				</tr>
				<c:forEach items="${resultList }" var="item" varStatus="index">
					<tr>
						<td style="text-align: center;">
							${index.count }
						</td>
						<td style="text-align: center;">
							${item.leaseCode }
						</td>
						<td style="text-align: right;">
							${item.periodNum }
						</td>
						<td style="text-align: center;">
							${item.invoiceNum }
						</td>
						<td style="text-align: center;">
							<c:if test="${item.priceType eq 'CAPITAL'}">本金</c:if>
							<c:if test="${item.priceType eq 'DEPOSIT'}">保证金</c:if>
							<c:if test="${item.priceType eq 'INTEREST'}">利息</c:if>
						</td>
					</tr>
				</c:forEach>
		</table>
	</c:if> --%>
</body>