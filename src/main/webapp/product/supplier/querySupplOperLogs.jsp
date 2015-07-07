<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
function parseLogMsg(msg){
	var m = $.parseJSON(msg);
	var mm = '';
	var number = 60;
	var style = ' style="color:#2e6e9e;font-weight:bold;"';
	for(var i = 0; i < m.length; i++){
		if(m[i].name != '开户银行(其他帐户)'){
			//修改后数据第一行已存在字数
			var newRowNumber = (m[i].name.length + 4 + m[i].msgs[0].length + 4) % number;
			mm = mm + '【<span' + style + '>' + m[i].name + '</span>】由【<span' 
					+ style + '>' + addBrPerNumber(m[i].msgs[0], number, m[i].name.length + 4) + '</span>】改为【<span'
					+ style + '>' + addBrPerNumber(m[i].msgs[1], number, newRowNumber) + '</span>】<br/>';
		}else{
			var space = '<br/>&nbsp;&nbsp;&nbsp;';
			var before = m[i].msgs[0].replace(/；/g, '；' + space);
			before = before.substring(0, before.length - space.length);
			var after = m[i].msgs[1].replace(/；/g, '；' + space);
			after = after.substring(0, after.length - space.length);
			mm = mm + '【<span' + style + '>开户银行(其他帐户)</span>】由<br/>【<span'
					+ style + '>' + before + '</span>】<br/>改为<br/>【<span'
					+ style + '>' + after + '</span>】<br/>';
		}
	}
	mm = mm.substring(0, mm.length - 5);
	document.write(mm);
}

//number每行字数，beforeNumber首次分行时在该行已存在的字数
function addBrPerNumber(msg, number, beforeNumber){
	if(msg.length >= (number-beforeNumber)){
		msg = msg.substring(0,number-beforeNumber) + '<br/>' + addBrPerNumber(msg.substring(number-beforeNumber,msg.length), number, 0);
	}
	return msg;
}

<!--
var idCardMap;
IdCard.onReady(function() {
	idCardMap = {
		link_idcard: new IdCard('link_idcard'),
	};
});
//-->
</script>
<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
				id="main">
				<div class="zc_grid_body jqgrowleft">
					<div class="ui-state-default ui-jqgrid-hdiv ">
<form id="custLinkManForm" name="custLinkManForm" method="POST"
	action="#">
	
	<table border="0" align="center" class="ui-jqgrid-htable zc_grid_title">
		<thead>
			<tr class="ui-jqgrid-labels">
				<th colspan="4" align="left" class="ui-state-default ui-th-ltr zc_grid_head">
					供应商信息历史操作日志&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</th>
			</tr>
			<tr>
				<td width="6%" align="center" class="ui-state-default ui-th-ltr zc_grid_head">
					序号
				</td>
				<td width="14%" align="center" class="ui-state-default ui-th-ltr zc_grid_head">
					操作时间
				</td>
				<td width="8%" align="center" class="ui-state-default ui-th-ltr zc_grid_head">
					操作人
				</td >
				<td width="72%" align="center" class="ui-state-default ui-th-ltr zc_grid_head">
					操作记录
				</td>
			</tr>
		</thead>
		<tbody id="divCustLinkman">
			<c:forEach items="${logs}" var="item" varStatus="status">
				<tr id="${item.ID }" class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align:center;">${status.index+1 }&nbsp;</td>
					<td style="text-align:center;"><fmt:formatDate value='${item.OPERATION_TIME}' pattern='yyyy-MM-dd HH:mm:ss' />&nbsp;</td>
					<td style="text-align:center;">${item.NAME }&nbsp;</td>
					<td style="padding-left:6px;"><script>parseLogMsg('${item.OPERATION_MESSAGE }' );</script>&nbsp;</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
</form>
</div>
</div>
</div>
