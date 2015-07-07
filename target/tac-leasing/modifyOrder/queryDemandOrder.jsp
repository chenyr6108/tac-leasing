<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>资讯需求单</title>
<%@ include file="/common/taglibs.jsp"%>
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
	function addDemand(type){
		if(type == 'private'){
			location.href="../servlet/defaultDispatcher?__action=modifyOrderCommand.addDemand" + "&addType=" + type;
		} else if(type == '1'){
			location.href="../servlet/defaultDispatcher?__action=modifyOrderCommand.addDemand" + "&addType=";
		} else {
			$.post("../servlet/defaultDispatcher?__action=modifyOrderCommand.getCheckDemandCount", function(data){
				var d = eval("(" + data + ")");
				if(d.count > 0){
					$("#dialogContent").html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当前还有" 
											+ d.count 
											+ "张资讯需求单等待您验收，在验收完成之前，您不能再申请新的资讯需求单！<br/>"
											+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;您可以点击“查看详细”查看相关资讯需求单,进行「验收」操作。<br/>"
											+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;如有疑问，请致电资讯部！");
					$("#dialog").dialog({
						modal: true,
						buttons: {
					        '确定': function() {
					          	$(this).dialog("close");
					        },
							'查看详细':function(){
								$("#qSelectStatus").removeAttr("disabled");
								$("#qSelectStatus").val(900);
								$("#isMy").val(1);
								$("#selectAlter").val("");
								$("#datebegin").val("");
								$("#dateend").val("");
								$("#QSEARCH_VALUE").val("");
								doQuery();
								$(this).dialog("close");
							}
						}	
					});
					return false;
				}
				location.href="../servlet/defaultDispatcher?__action=modifyOrderCommand.addDemand" + "&addType=" + type;
			});
		}
	}

	function doQuery() {
		$("#form1").submit();
	}

</script>
</head>
<body>
	<form action="${ctx}/servlet/defaultDispatcher" name="form1" id="form1"	method="post">
		<input type="hidden" name="__action" id="__action" value="modifyOrderCommand.getDemandOrder"> 
		<input type="hidden" name="EMPLOYEEID" id="EMPLOYEEID" value="${EMPLOYEEID}">
		<input type="hidden" name="urlParam" id="urlParam" value="${urlParam}">

		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px;">
			<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;资讯需求单</span>
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
									<td align="right">资讯单状态:</td>
									<td colspan="2">
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
									<td align="right">负责人员:</td>
									<td>
										<select name="current_it" style="height: 18px;" id="selectAlter">
											<option value="" <c:if test="${current_it eq ''}">selected='selected'</c:if>>查询全部</option>
											<c:forEach items="${its}" var="it">
												<option value="${it.ID}" <c:if test="${current_it eq it.ID}">selected='selected'</c:if>>${it.NAME}</option>
											</c:forEach>
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
											<option value="0" <c:if test="${isMy eq '0' || empty isMy}">selected='selected'</c:if>>查询全部</option>
											<option value="1" <c:if test="${isMy eq '1' }">selected='selected'</c:if>>自己</option>
											<c:if test="${IAmIT eq 'Y' }">
												<option value="2" <c:if test="${isMy eq '2' }">selected='selected'</c:if>>自己+分配中</option>
											</c:if>
										</select>
									</td>
									<c:if test="${demandPrivateApply=='Y'}">
										<td align="right">类型:</td>
										<td>
											<select name="demandType" style="height: 18px;" id="demandType">
												<option value="-1" <c:if test="${demandType eq '-1' || empty demandType}">selected='selected'</c:if>>查询全部</option>
												<option value="0" <c:if test="${demandType eq '0' }">selected='selected'</c:if>>内部申请</option>
												<option value="1" <c:if test="${demandType eq '1' }">selected='selected'</c:if>>正常申请</option>
											</select>
										</td>
									</c:if>
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
					<input type="button" name="addbutton" onclick="addDemand('');" style="padding: 1px 10px;" class="ui-state-default ui-corner-all" value="新增资讯需求单" />
					<c:if test="${demandPrivateApply=='Y'}">
						<input type="button" name="addbutton" onclick="addDemand('private');" style="padding:1px 10px; color:red;" class="ui-state-default ui-corner-all" value="资讯需求单内部申请" />
					</c:if>
				</div>
				<page:pagingToolbarTop pagingInfo="${dw }" />
				<table id="demandList" class="grid_table">
					<tbody>
						<tr>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="orderStatus">当前状态</page:pagingSort></th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="demandCode">资讯单编号<br/><span style="font-size:11px;color:red;">(点击查看详细)</span></page:pagingSort></th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="summary">摘要<c:if test="${demandPrivateApply=='Y'}"><span style="color:green;">(绿色为内部申请)</span></c:if></page:pagingSort></th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="applyUserName">申请人</page:pagingSort></th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="companyName">办事处</page:pagingSort></th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="createTime">申请时间</page:pagingSort></th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="currentOperatorName">当前<br/>处理人</page:pagingSort></th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="responsibleUserName">开发<br/>负责人</page:pagingSort></th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="hours">预计<br/>工时<br/>(小时)</page:pagingSort></th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="predictDate">预计<br/>完成日期</page:pagingSort></th>
						</tr>
						<c:forEach items="${dw.resultList}" var="d" varStatus="index">
							<tr>
								<td style="text-align: center;">
									<c:if test="${d.orderStatus >= 300 && d.orderStatus < 350}">会签中--</c:if>${stateMap[d.orderStatus]}&nbsp;
								</td>
								<td style="text-align:center;"><a href="../servlet/defaultDispatcher?__action=modifyOrderCommand.getDemandById&demandId=${d.id}&urlParam=${urlParam}">${d.demandCode}&nbsp;</a></td>
								<td style="text-align: left; <c:if test="${d.demandType eq 0 }">color:green;font-weight:bold;</c:if>">${d.summary }&nbsp;</td>
								<td style="text-align: center;">${d.applyUserName }&nbsp;</td>
								<td style="text-align: center;">${d.companyName }&nbsp;</td>
								<td style="text-align: center;">
									<fmt:formatDate pattern="yyyy-MM-dd HH:mm" type="both" value="${d.createTime}" />&nbsp;
								</td>
								<td style="text-align: center;">${d.currentOperatorName}&nbsp;</td>
								<td style="text-align: center;"><c:if test="${d.orderStatus >= 450 }">${d.responsibleUserName}</c:if>&nbsp;</td>
								<td style="text-align: center;"><c:if test="${d.orderStatus >= 500 }">${d.hours}</c:if>&nbsp;</td>
								<td style="text-align: center; <c:if test="${d.dunDays < 0 && d.orderStatus != -1 && d.orderStatus != -2 && d.orderStatus != 990}">color:red; font-weight:bold;</c:if>">
									<c:if test="${d.orderStatus >= 500 }">
										<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${d.predictDate}" />
									</c:if>&nbsp;
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