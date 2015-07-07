<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>资讯需求单监控</title>
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

	var projects = eval("(" + '${users}' + ")");
	var options = {
		minChars : 1,
		max : 20,
		mustMatch: true,
		matchContains: true,
		formatItem : function(row, i, max) {
			var rs = row.name;
			if (row.email != null && row.email.length > 0) {
				rs += "【" + row.email + "】";
			}
			return rs;
		},
		formatMatch : function(row, i, max) {
			return row.email + " " + row.name + " " +row.id;
		},
		formatResult : function(row) {
			return row.name;
		}
	};
	
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
		$("#newOpUserName").autocomplete(projects, options).result(function(event, data, formatted) {
			$('#newOpUser').val(data.id);
		});
		$("#newOpUserName").blur(function (e) {
			$('.ac_over').click();
		} );
		$("#newState").change(function(){
			$.post("../servlet/defaultDispatcher?__action=modifyOrderCommand.getOpUserId&demandId="+$('#demandId').val()+"&stateCode="+$('#newState').val(), function(data){
				var d = eval("(" + data + ")");
				$("#newOpUserName").val(getUserNameById(d.userId));
				$('#newOpUser').val(d.userId);
			});
		});
	});
	
	function doQuery() {
		$("#form1").submit();
	}
	
	function updateDemandState(demandId,demandCode,orderState,opUserId){
		$("#devAlterReason").val("");
		$("#oldState").val(orderState);
		$("#demandId").val(demandId);
		$("#demandOrderState").html(demandCode);
		$("#demandSummary").html($("#summary"+demandCode).html());
		$("#currentUserName").html($("#currentUserName"+demandCode).html());
		$('#newOpUser').val(opUserId);
		$("#newOpUserName").val($("#currentUserName"+demandCode).html().replace(/&nbsp;/g,''));
		$("#stateName").html($("#stateName"+demandCode).html());
		$.post("../servlet/defaultDispatcher?__action=modifyOrderCommand.getProcessByDemandId&demandId="+demandId,function(data){
			var d = eval("(" + data + ")");
			var optionText = "";
			$("#newState").html("");
			for(var i = 0; i < d.process.length; i++){
				optionText = optionText + "<option value='" + d.process[i].code + "' id='" + i + "'>";
				if(d.process[i].code > 300 && d.process[i].code < 350){
					optionText += "会签中--";
				}
				optionText = optionText + d.process[i].name +"</option>";
			}
			$("#newState").html(optionText);
			$("#newState").val(orderState);
			var index = $("#newState > option[value='"+orderState+"']").attr("id");
			$("#newState > option:gt("+index+")").attr("disabled","disabled");
			$("#devTransDiv").dialog({
				modal : true,
				autoOpen : true,
				width : 600
			});
		});
	}
	
	function devNewOpDivBtn(){
		if($("#devAlterReason").val().trim() == ""){
			alert("更新状态原因不能为空！");
			$("#devAlterReason").focus();
			return false;
		}
		$.ajax({ 
			url: "../servlet/defaultDispatcher?__action=modifyOrderCommand.updateDemandState"
					+ "&demandId=" + $("#demandId").val() 
					+ "&newState=" + $("#newState").val()
					+ "&oldState=" + $("#oldState").val()
					+ "&newOpUser=" + $("#newOpUser").val() 
					+ "&newOpUserName=" + $("#newOpUserName").val()
					+ "&newStateName=" + $("#newState").find('option:selected').text()
					+ "&devAlterReason=" + $("#devAlterReason").val(), 
			type: "post", 
			dataType: "json", 
			success: function(data){
				if(data == "1"){
					$("#dialogContent").html("更新成功！");
					$("#dialog").dialog({
						modal : true,
						autoOpen : true,
						buttons: {
					        "确定": function() {
					          $(this).dialog("close");
					          $("#devTransDiv").dialog("close");
					          doQuery();
					        }
					      }
					});
				}
			} 
		});
	}
	
	function getUserNameById(id){
		if(id == 0){
			return "";
		}
		for(var i = 0; i < projects.length; i++){
			if(id == projects[i].id){
				return projects[i].name;
			}
		}
	}
</script>
</head>
<body>
	<form action="${ctx}/servlet/defaultDispatcher" name="form1" id="form1"	method="post">
		<input type="hidden" name="__action" id="__action" value="modifyOrderCommand.getDemandOrderAdmin"> 
		<input type="hidden" name="EMPLOYEEID" id="EMPLOYEEID" value="${EMPLOYEEID}">
		<input type="hidden" name="urlParam" id="urlParam" value="${urlParam}">

		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px;">
			<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;资讯需求单监控</span>
		</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" style="min-width:1100px;">
			<div style="margin: 6 0 6 0px;">
				<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
					<tr>
						<td width="8">&nbsp;</td>
						<td width="60" class="ss_o"></td>
						<td width="60%" class="ss_t" valign="top">
							<table style="margin-left: 10px;">
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
									<td align="right">类型:</td>
									<td>
										<select name="demandType" style="height: 18px;" id="demandType">
											<option value="-1" <c:if test="${demandType eq '-1' || empty demandType}">selected='selected'</c:if>>查询全部</option>
											<option value="0" <c:if test="${demandType eq '0' }">selected='selected'</c:if>>内部申请</option>
											<option value="1" <c:if test="${demandType eq '1' }">selected='selected'</c:if>>正常申请</option>
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
				<page:pagingToolbarTop pagingInfo="${dw }" />
				<table id="demandList" class="grid_table">
					<tbody>
						<tr>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="orderStatus">当前状态</page:pagingSort></th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="demandCode">资讯单编号</page:pagingSort></th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="summary">摘要<span style="color:green;">(绿色为内部申请)</span></page:pagingSort></th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="applyUserName">申请人</page:pagingSort></th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="companyName">办事处</page:pagingSort></th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="createTime">申请时间</page:pagingSort></th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="currentOperatorName">当前<br/>处理人</page:pagingSort></th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="responsibleUserName">开发<br/>负责人</page:pagingSort></th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="hours">预计<br/>工时<br/>(小时)</page:pagingSort></th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="predictDate">预计<br/>完成日期</page:pagingSort></th>
							<th>操作</th>
						</tr>
						<c:forEach items="${dw.resultList}" var="d" varStatus="index">
							<tr>
								<td style="text-align: center;" id="stateName${d.demandCode }">
									<c:if test="${d.orderStatus >= 300 && d.orderStatus < 350}">会签中--</c:if>${stateMap[d.orderStatus]}&nbsp;
								</td>
								<td style="text-align:center;">${d.demandCode}&nbsp;</td>
								<td id="summary${d.demandCode }" style="text-align: left; <c:if test="${d.demandType eq 0 }">color:green;font-weight:bold;</c:if>">${d.summary }&nbsp;</td>
								<td style="text-align: center;">${d.applyUserName }&nbsp;</td>
								<td style="text-align: center;">${d.companyName }&nbsp;</td>
								<td style="text-align: center;">
									<fmt:formatDate pattern="yyyy-MM-dd HH:mm" type="both" value="${d.createTime}" />&nbsp;
								</td>
								<td id="currentUserName${d.demandCode }" style="text-align: center;">${d.currentOperatorName}&nbsp;</td>
								<td style="text-align: center;"><c:if test="${d.orderStatus >= 450 }">${d.responsibleUserName}</c:if>&nbsp;</td>
								<td style="text-align: center;"><c:if test="${d.orderStatus >= 500 }">${d.hours}</c:if>&nbsp;</td>
								<td style="text-align: center; <c:if test="${d.dunDays < 0 && d.orderStatus != -1 && d.orderStatus != -2 && d.orderStatus != 990}">color:red; font-weight:bold;</c:if>">
									<c:if test="${d.orderStatus >= 500 }">
										<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${d.predictDate}" />
									</c:if>&nbsp;
								</td>
								<td>
									<c:if test="${d.orderStatus > 0 && d.orderStatus != 990 }">
										<a href="javascript:void(0)" onclick="updateDemandState(${d.id },'${d.demandCode}',${d.orderStatus },${d.currentOperatorId });">更新状态</a>
									</c:if>
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
	
	<div title="更新状态" style="display: none" id="devTransDiv">
		<form id="devTransDivForm" name="devTransDivForm" method="POST" action="${ctx }/servlet/defaultDispatcher?__action=modifyOrderCommand.updateDemandState">
			<input type="hidden" name="demandId" id="demandId"/> 
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
				<div class="zc_grid_body jqgrowleft">
					<div class="ui-state-default ui-jqgrid-hdiv ">
						<table cellspacing="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align:right;width:100px;">资讯需求单编号：</td>
								<td id="demandOrderState" style="padding-left:4px;"></td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align:right;width:100px;">概述：</td>
								<td id="demandSummary" style="padding-left:4px;"></td>
							</tr>
						</table>
						<table cellspacing="0" class="ui-jqgrid-htable zc_grid_title">
							<tr>
								<th style="text-align: center" width="35%">当前状态</th>
								<th style="text-align: center" width="65%">当前处理人</th>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center" id="stateName">&nbsp;</td>
								<td style="text-align: center" id="currentUserName">&nbsp;</td>
							</tr>
							<tr>
								<th style="text-align: center">新状态</th>
								<th style="text-align: center">新处理人</th>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center">
									<select name="newState" style="height: 18px;" id="newState" ></select>
								</td>
								<td style="text-align: center; height: 40px;">
									<input type="text" id="newOpUserName" style="width:80%;" />
									<input type="hidden" id="newOpUser" name="newOpUser" />
									<input type="hidden" id="oldState" name="oldState" />
									<input type="text" id="existForStopSubmit" style="width:0; border:0;" disabled="disabled" />
								</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr" id="devReason">
								<td style="text-align: center" width="10%">更新状态原因:<br/><font color="red" style="font-weight:bold;" size="-2">(必填)</font></td>
								<td><textarea rows="5" cols="55" style="width:100%;" id="devAlterReason" name="devAlterReason"></textarea></td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td colspan="2" style="text-align: center; height: 30px;" width="100%">
									<input type="button" class="ui-state-default ui-corner-all" value="提交" onclick="devNewOpDivBtn()" />
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>