<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>签办单</title>
<%@ include file="/common/taglibsNew.jsp"%>
<style>
	.connectedSortable { list-style-type:none; margin:0 0 10px 0; padding:0; border:1px solid #4297D7; min-width:120px; min-height:320px;}
	.connectedSortable li, .connectedSortable li { margin:1px 0 1px 0; padding:6px;  cursor:move; }
	.demandHead { background-color:#2E6EAF;}
	.applyBtns input:hover{background:#FFFFFF;}
</style>
<script type="text/javascript" src="${ctx}/common/js/jquery.autocomplete.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/jquery.autocomplete.css" />
<script type="text/javascript">	
	
	$(function (){
        $.datepicker.setDefaults($.datepicker.regional['zh-CN']);
		$("#PREDICT_DATE").datepicker({minDate: 0});
		$("#datebegin").datepicker({
			onClose: function(selectedDate) {
		        $("#dateend").datepicker("option", "minDate", selectedDate);
			}
		});
		$("#dateend").datepicker({
			onClose: function( selectedDate ) {
		        $("#datebegin").datepicker("option", "maxDate", selectedDate);
			}
		});
		$("#isMy").change(function(){
			checkSelectOption();
		});
		checkSelectOption();
		$("#QSEARCH_VALUE").keydown(function(e){ 
	        if(e.which == 13){
		    	$("#form1").submit();
	        } 
	    }); 
	});
	
	function checkSelectOption(){
		if($("#isMy").val() == 2){
			$("#qSelectStatus").val("");
			$("#qSelectStatus").attr("disabled","disabled");
		} else {
			$("#qSelectStatus").removeAttr("disabled");
		}
	}
	
	//添加页面
	function addSignOrder(companyCode){
		location.href="../servlet/defaultDispatcher?__action=signOrderCommand.addSignOrder" + "&companyCode=" + companyCode;
	}

	function doQuery() {
		$("#form1").submit();
	}
	
	function exportSignOrder() {
		var chk_value =[];   
		$('input[name="check_id"]:checked').each(function(){   
		   chk_value.push($(this).attr('id').substr(9));   
		});
		if(chk_value.length==0){
		  	alert("你还没有选择签办单");
		  	return false;
		}
		$("#signOrderId").val(chk_value[0]);
		$("#__action").val("signOrderCommand.export");
		$("#form1").submit();
		$("#__action").val("signOrderCommand.getAllSignOrders");
	}

</script>
</head>
<body>
	<form action="${ctx}/servlet/defaultDispatcher" name="form1" id="form1"	method="post">
		<input type="hidden" name="__action" id="__action" value="signOrderCommand.getAllSignOrders"> 
		<input type="hidden" name="EMPLOYEEID" id="EMPLOYEEID" value="${EMPLOYEEID}">
		<input type="hidden" name="urlParam" id="urlParam" value="${urlParam}">

		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px;">
			<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;签办单</span>
		</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" style="min-width:1100px;">
			<div style="margin: 6 0 6 0px;">
				<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
					<tr>
						<td width="8">&nbsp;</td>
						<td width="60" class="ss_o"></td>
						<td width="60%" class="ss_t" valign="top">
							<table style="margin-left: 10px; min-width: 790px;">
								<tr>
									<td align="right">起始日期:</td>
									<td>
										<input type="text" name="QSTART_DATE" style="width: 80px; height: 18px;" readonly="readonly" id="datebegin" value="${QSTART_DATE }">
									</td>
									<td align="right">结束日期:</td>
									<td>
										<input type="text" name="QEND_DATE" id="dateend" style="width: 80px; height: 18px;" readonly="readonly" value="${QEND_DATE }">
									</td>
									<td align="right">签办单状态:</td>
									<td>
										<select name="current_state" style="height: 18px;" id="qSelectStatus">
											<option value="" <c:if test="${current_state eq ''}">selected='selected'</c:if>>查询全部</option>
											<c:forEach items="${states}" var="s" varStatus="index">
												<option value="${s.CODE }" <c:if test="${current_state eq s.CODE}">selected='selected'</c:if>>
													<c:if test="${s.CODE > 300 && s.CODE < 350 }">会签中--</c:if>${s.SHORTNAME }
												</option>
											</c:forEach>
											<option value="-100" <c:if test="${current_state eq '-100'}">selected='selected'</c:if>>未完成</option>
											<option value="-101" <c:if test="${current_state eq '-101'}">selected='selected'</c:if>>已完成</option>
										</select>
									</td>
									<td align="right">公司:</td>
									<td>
										<select name="companyCode">
											<option <c:if test="${companyCode eq '' }">selected="selected"</c:if> value="">查询全部</option>
											<option <c:if test="${companyCode eq '1' }">selected="selected"</c:if> value="1">裕融</option>
											<option <c:if test="${companyCode eq '2' }">selected="selected"</c:if> value="2">裕国</option>
										</select>
									</td>
								</tr>
								<tr>
									<td align="right">查询内容:</td>
									<td colspan="6">
										<input type="text" id="QSEARCH_VALUE" name="QSEARCH_VALUE" value="${QSEARCH_VALUE }" style="width: 100%; height: 18px; font-size: 12px;" />
									</td>
									<td align="right">当前处理人:</td>
									<td>
										<select name="isMy" style="height: 18px;" id="isMy">
											<c:if test="${signOrder_selectAll == true}">
												<option value="0" <c:if test="${isMy eq '0' || empty isMy}">selected='selected'</c:if>>查询全部</option>
											</c:if>
											<c:if test="${signOrder_selectAll == false}">
												<option value="2" <c:if test="${isMy eq '2' || empty isMy}">selected='selected'</c:if>>查询全部</option>
											</c:if>
											<option value="1" <c:if test="${isMy eq '1' }">selected='selected'</c:if>>自己</option>	
										</select>
									</td>
									<td align="right">申请人:</td>
									<td>
										<select name="isApply" style="height: 18px;" id="isApply">
											<option value="0" <c:if test="${isApply eq '0' || empty isApply}">selected='selected'</c:if>>查询全部</option>
											<option value="1" <c:if test="${isApply eq '1' }">selected='selected'</c:if>>自己</option>	
										</select>
									</td>
								</tr>
							</table>
						</td>
						<td width="55" class="ss_th" valign="top">&nbsp;</td>
						<td width="20%"><a href="#" name="search" id="search" onclick="doQuery();" class="blue_button">搜 索</a></td>
					</tr>
				</table>
			</div>
			<div class="ui-state-default ui-jqgrid-hdiv" style="background: #FFFFFF;"><br/>
				<div class="applyBtns" style="margin-left:10px;">
					<input type="hidden" id="signOrderId" name="signOrderId" />
					<input type="button" name="addbutton" onclick="addSignOrder('1');" style="padding: 1px 10px;" class="ui-state-default ui-corner-all" value="新增签办单" />
					<input type="button" name="exportbutton" onclick="exportSignOrder()" style="padding: 1px 10px;" class="ui-state-default ui-corner-all" value="导出签办单" />
				</div>
				<page:pagingToolbarTop pagingInfo="${dw }" />
				<table id="demandList" class="grid_table">
					<tbody>
						<tr>
							<th>&nbsp;</th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="orderStatus">当前状态</page:pagingSort></th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="signCode">签办单编号<br/><span style="font-size:11px;color:red;">(点击查看详细)</span></page:pagingSort></th>
							<%-- <th><page:pagingSort pagingInfo="${dw }" orderBy="code">字号</page:pagingSort></th> --%>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="summary">事由</page:pagingSort></th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="applyUserName">申请人</page:pagingSort></th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="companyCode">公司</page:pagingSort></th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="createTime">申请时间</page:pagingSort></th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="currentOperatorName">当前<br/>处理人</page:pagingSort></th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="completeTime">完成日期</page:pagingSort></th>
						</tr>
						<c:forEach items="${dw.resultList}" var="d" varStatus="index">
							<tr>
								<td style="text-align: center;">
									<c:if test="${d.orderStatus gt 3}">
										<input type="checkbox" id="checkbox_${d.id}" name="check_id">
									</c:if>
								</td>
								<td style="text-align: center;">
									<c:if test="${d.orderStatus > -200 && d.orderStatus <= -100 }">会签中--${flowMap[d.orderStatus].FLAG}</c:if>
									<c:if test="${d.orderStatus == -200 }">会签中 -- ${d.currentCountersignCodeOrderName }</c:if>
									<c:if test="${d.orderStatus < -200 || d.orderStatus > -100}">${flowMap[d.orderStatus].FLAG}</c:if>
									&nbsp;
								</td>
								<td style="text-align: center;"><a href="../servlet/defaultDispatcher?__action=signOrderCommand.getSignOrderById&signOrderId=${d.id}&urlParam=${urlParam}">${d.signCode}&nbsp;</a></td>
								<%-- <td style="text-align: center;">${d.code }&nbsp;</td> --%>
								<td style="text-align: left;">${d.summary }&nbsp;</td>
								<td style="text-align: center;">${d.applyUserName }&nbsp;</td>
								<td style="text-align: center;">${d.companyCode == "1"?"裕融":"裕国" }&nbsp;</td>
								<td style="text-align: center;">
									<fmt:formatDate pattern="yyyy-MM-dd HH:mm" type="both" value="${d.createTime}" />&nbsp;
								</td>
								<td style="text-align: center;">${d.currentOperatorName}
								<c:if test="${d.agentUserName ne '' && d.agentUserName != null }"><span style="color:red;">(${d.agentUserName}&nbsp;代)</span></c:if>&nbsp;</td>
								<td style="text-align: center;">
									<fmt:formatDate pattern="yyyy-MM-dd HH:mm" type="both" value="${d.completeTime}" />
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<page:pagingToolbar pagingInfo="${dw }" />
			</div>
		</div>
	</form>
	<div id="dialog" title="提示"><p id="dialogContent"></p></div>
</body>
</html>