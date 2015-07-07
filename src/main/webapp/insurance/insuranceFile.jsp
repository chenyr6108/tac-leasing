<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>附件查询</title>
<style type="text/css">
	.tb_return{border: 1px solid #A6C9E2; width: 200px; height: 22px;}
	.tb_return_t{width: 100px; height: 22px;}
	#grid-data td{text-align: center;}
</style>	
<script type="text/javascript">
	function downLoadFile(filePath){
		$("#filePath").val(filePath);
		$("#form2").submit();
	}
</script> 
</head>
<body>
<form action="../servlet/defaultDispatcher" id="form1" method="post">
<input type="hidden" name="__action" value="insuranceCommand.getInsuranceFile"/>
<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
 		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;附件查询</span>
</div>
<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
        <div class="zc_grid_body jqgrowleft">
<div class="ui-state-default ui-jqgrid-hdiv ">
<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
	<tr >
		<td><page:pagingToolbarTop pagingInfo="${pagingInfo }"/></td>
	</tr>
</table>
<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
	<thead>
	<tr class="ui-jqgrid-labels">
		<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
			<strong>序号</strong>
		</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">
			<page:pagingSort pagingInfo="${pagingInfo }" orderBy="SEND_FLAG"><strong>状态</strong></page:pagingSort>
		</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">
			<page:pagingSort pagingInfo="${pagingInfo }" orderBy="EMAIL_TO"><strong>收件人 </strong></page:pagingSort>
		</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">
			<page:pagingSort pagingInfo="${pagingInfo }" orderBy="EMAIL_SUBJECT"><strong>主题</strong></page:pagingSort>
		</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">
			<page:pagingSort pagingInfo="${pagingInfo }" orderBy="EMAIL_ATTACH_PATH"><strong>投保单</strong></page:pagingSort>
		</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">
			<page:pagingSort pagingInfo="${pagingInfo }" orderBy="CREATE_TIME"><strong>创建时间</strong></page:pagingSort>
		</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">
			<page:pagingSort pagingInfo="${pagingInfo }" orderBy="SEND_TIME"><strong>发送时间</strong></page:pagingSort>
		</th>
	</tr>
	</thead>
	<tbody id="grid-data">
		<c:forEach items="${pagingInfo.resultList}" var="item" varStatus="index">
		<tr	class="ui-widget-content jqgrow ui-row-ltr">
			<td>${index.count }&nbsp;</td>
			<td><c:if test="${item.SEND_FLAG == 0 }">未发送</c:if><c:if test="${item.SEND_FLAG == 1 }">已发送</c:if><c:if test="${item.SEND_FLAG == -1 }">发送失败</c:if>&nbsp;</td>
			<td>${item.EMAIL_TO }&nbsp;</td>
			<td>${item.EMAIL_SUBJECT }&nbsp;</td>
			<td><a href="javascript:void(0);" onclick="downLoadFile('${item.EMAIL_ATTACH_PATH }')">${fn:split(item.EMAIL_ATTACH_PATH, '\\')[fn:length(fn:split(item.EMAIL_ATTACH_PATH, '\\')) - 1] }</a>&nbsp;</td>
			<td><fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd HH:mm"/>&nbsp;</td>
			<td><fmt:formatDate value="${item.SEND_TIME }" pattern="yyyy-MM-dd HH:mm"/>&nbsp;</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
<page:pagingToolbar pagingInfo="${pagingInfo }"/>
</div>
</div>
</div>
</form>
<form action="../servlet/defaultDispatcher" id="form2" method="post">
	<input type="hidden" name="__action" value="insuranceCommand.downLoadFile"/>
	<input type="hidden" id="filePath" name="filePath"/>
</form>
</body>
</html>