<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title>财务结清</title>
<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript" src="${ctx }/collection/js/remark.js"></script>
<script type="text/javascript">
	$(function() {
		$.datepicker.setDefaults($.datepicker.regional['zh-CN']);
		$("#datebegin").datepicker({
			onClose : function(selectedDate) {
				$("#dateend").datepicker("option", "minDate", selectedDate);
			}
		});
		$("#dateend").datepicker({
			onClose : function(selectedDate) {
				$("#datebegin").datepicker("option", "maxDate", selectedDate);
			}
		});
		$("#QUERY_DATE").datepicker({
			minDate : 0
		});
	});

	//弹出备注的层
	function openChangePassDiv(divName) {
		$("#" + divName).dialog({
			modal : true,
			autoOpen : false,
			width : 670
		});
		$("#" + divName).dialog('open');
	}
	function closeDialog(msg) {
		$("#" + msg).dialog('close');
	}

	function expSettleTransferProvePDF() {
		var chk_value = [];
		$('input[name="ids"]:checked').each(function() {
			chk_value.push($(this).val());
		});
		if (chk_value.length == 0) {
			alert("你还没有选择结清单！");
			return false;
		}
		$("#__action").val("settleManage.SettleTransferProvePDF");
		$("#form1").submit();
		$("#__action").val("settleManage.querySettleList");
	}
	function expZulwToPdf() {
		var chk_value = [];
		$('input[name="ids"]:checked').each(function() {
			chk_value.push($(this).val());
		});
		if (chk_value.length == 0) {
			alert("你还没有选择支付表！");
			return false;
		}
		$("#__action").val("expQuoToPdf.expCollectionZulwToPdf");
		$("#form1").submit();
		$("#__action").val("settleManage.querySettleList");
	}
	//结清数据明细
	function exSettleDetail(id, recp_id, type) {
		if (type == 'manage') {
			$("#" + id).toggle(
					function() {
						$(this).load(
								"../servlet/defaultDispatcher?__action=settleManage.querySettleDetail&recp_id="
										+ recp_id);
					});
		}
	}
	function expCustStatementPDF() {
		var chk_value = [];
		$('input[name="ids"]:checked').each(function() {
			chk_value.push($(this).val());
		});
		if (chk_value.length == 0) {
			alert("你还没有选择支付表！");
			return false;
		}
		$("#__action").val("statement.expCustStatementPDF");
		$("#form1").submit();
		$("#__action").val("settleManage.querySettleList");
	}

	/*2012/02/01 Yang Yun 新增导出空白明细 */
	function expBlankTable() {
		var checkedCount = 0;
		var recpId = null;
		$("input[name='ids']").each(function() {
			if ($(this).attr("checked")) {
				recpId = $(this).val();
				checkedCount += 1;
			}
		});
		if (checkedCount == 0) {
			alert("请选择一条记录进行导出！");
		} else if (checkedCount == 1) {
			location.href = '${ctx }/servlet/defaultDispatcher?__action=rentFinanceCommand.expAdvanceSettlePDF&type=out&RECP_ID='
					+ recpId;
		} else {
			alert("一次只能导出一个明细表！");
		}
	}

	function expSettlePayNote() {
		var checkedCount = 0;
		var recpId = null;
		$("input[name='ids']").each(function() {
			if ($(this).attr("checked")) {
				recpId = $(this).val();
				checkedCount += 1;
			}
		});
		if (checkedCount == 0) {
			alert("请选择一条记录进行导出！");
		} else if (checkedCount == 1) {
			location.href = '${ctx }/servlet/defaultDispatcher?__action=rentFinanceCommand.expSettlePayNote&RECP_ID='
					+ recpId;
		} else {
			alert("一次只能导出一个明细表！");
		}
	}

	function showForcastSettle(RECP_ID, LEASE_PERIOD, RECP_CODE, CUST_NAME) {
		document.getElementById("subUpload").disabled = false;
		$("#forcastSettle").toggle(function() {
			document.forcastSettleForm.RECP_ID.value = RECP_ID;
			document.forcastSettleForm.LEASE_PERIOD.value = LEASE_PERIOD;
			document.forcastSettleForm.RECP_CODE.value = RECP_CODE;
			document.forcastSettleForm.CUST_NAME.value = CUST_NAME;

			$("#forcastSettle").dialog({
				modal : true,
				autoOpen : false,
				width : 450
			});
			$("#forcastSettle").dialog('open');

		});
	}

	function forcastSettle() {
		var myDate = new Date();
		var myDateStr = new Date(myDate.getFullYear(), myDate.getMonth(),
				myDate.getDate());

		var paramDate = new Date(document.forcastSettleForm.QUERY_DATE.value);
		var paramDateStr = new Date(paramDate.getFullYear(), paramDate
				.getMonth(), paramDate.getDate());

		if (myDateStr > paramDateStr) {
			alert("必须选择今天及以后的预估日期！");
			return false;
		}
		if (document.forcastSettleForm.QUERY_DATE.value == "") {
			alert("请选择预估结清日期");
			return false;
		}
		document.getElementById("subUpload").disabled = true;
		$("#forcastSettleForm").submit();
	}
</script>
</head>
<body>
	<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
		<input type="hidden" id="__action" name="__action" value="rentFinanceCommand.queryAdvanceSettleList" />
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
			<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;财务结清</span>
		</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			<div class="zc_grid_body jqgrowleft">
				<div style="margin: 6 0 6 0px;">
					<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
						<tr>
							<td width="8">&nbsp;</td>
							<td width="60" class="ss_o"></td>
							<td width="60%" class="ss_t" valign="top">
								<table style="margin-left: 10px;">
									<tr>
										<td>起始日期：</td>
										<td>
											<input type="text" name="QSTART_DATE" style="width: 80px; height: 18px;" readonly="readonly" id="datebegin" value="${QSTART_DATE }">
										</td>
										<td align="right">结束日期：</td>
										<td>
											<input type="text" name="QEND_DATE" id="dateend" style="width: 80px; height: 18px;" readonly="readonly" value="${QEND_DATE }">
										</td>
									</tr>
									<tr>
										<td>查询内容：</td>
										<td colspan="3">
											<input type="text" name="content" value="${content }" style="width: 395px; height: 18px; font-size: 12px;">
										</td>
									</tr>
								</table>

							</td>
							<td width="55" class="ss_th" valign="top">&nbsp;</td>
							<td width="20%">
								<a href="#" name="search" id="search" onclick="doSearch();" "  class="blue_button">搜 索</a>
							</td>
						</tr>
					</table>
				</div>
				<div class="ui-state-default ui-jqgrid-hdiv ">
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr>
							<td>
								<c:if test="${applySettle}">
									<input type="button" class="ui-state-default ui-corner-all" id="But" value="导出客户对账单(PDF)" name="But" onclick="expCustStatementPDF();">
								</c:if>&nbsp;&nbsp;
								 <c:if test="${applySettle}">
									<input type="button" class="ui-state-default ui-corner-all" value="导出空白结清明细表" onclick="expBlankTable();" />
								</c:if> 
								<c:if test="${applySettle}">
									<input type="button" class="ui-state-default ui-corner-all" value="导出结清金额通知函" onclick="expSettlePayNote();" />
								</c:if>
							</td>
							<td><page:pagingToolbar pagingInfo="${dw }" /></td>
						</tr>

					</table>
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
						<tr class="ui-jqgrid-labels">
							<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
								&nbsp;</th>
							<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
								序号</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head">状态</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head">支付表号</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head">客户名称</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head">客户经理</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head">办事处主管</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head">创建日期</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head">起租日期</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head">操作</th>
							<!-- Add by Michael 2012/02/22 增加导出转移单证明书 -->
							<th class="ui-state-default ui-th-ltr zc_grid_head">导出转移单</th>
						</tr>
						<c:forEach items="${dw.resultList}" var="item" varStatus="status">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;"><INPUT TYPE="checkbox"
									NAME="ids" id="ids" value="${item.RECP_ID}"
									onclick="checkItem(this,'all')"></td>
								<td style="text-align: center;">${status.count }</td>
								<td style="text-align: center;cursor: pointer;"
									onClick="exSettleDetail('settleDetail${status.count}','${item.RECP_ID}','manage');">
									<c:if test="${item.RECP_STATUS==0 }">
										<img src="${ctx }/images/u608.gif" alt="正常" />
									</c:if> 
									<c:if test="${item.RECP_STATUS==1 }">
										<img src="${ctx }/images/u622.gif" alt="正常结清" />
									</c:if> 
									<c:if test="${item.RECP_STATUS==3 }">
										<img src="${ctx }/images/u611.gif" alt="提前结清" />
									</c:if>
								</td>
								<td style="text-align: center;">
									<a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=collectionManage.showPaylist&FLAG=1&RECP_ID=${item.RECP_ID }'">${item.RECP_CODE}</a>
								</td>
								<td style="text-align: center;">${item.CUST_NAME }</td>
								<td style="text-align: center;">${item.NAME }</td>
								<td style="text-align: center;">${item.UP_NAME }</td>
								<td style="text-align: center;"><fmt:formatDate
										pattern="yyyy-MM-dd" value="${item.CREATE_TIME }" /></td>
								<td style="text-align: center;">${item.HIRE_DATE }</td>
								<td style="text-align: center">
									<a href="javascript:void(0)" onclick="showForcastSettle('${item.RECP_ID }','${item.LEASE_PERIOD}','${item.RECP_CODE}','${item.CUST_NAME }')">预估结清</a>
								</td>
								<%--2011/12/12 Yang Yun Add--%>
								<!-- Add by Michael 2012/02/22 增加导出转移单证明书  只有正常结清和提前结清的案件才可以导出 -->
								<td><c:if
										test="${(item.RECP_STATUS eq 1 || item.RECP_STATUS eq 3) && applySettle}">
										<input type="button" class="ui-state-default ui-corner-all"
											id="But" value="导出移转证明书" name="But"
											onclick="expSettleTransferProvePDF();" />
									</c:if>&nbsp;</td>
							</tr>
							<td align="center" colspan="11">
								<div id="settleDetail${status.count }" align="center"
									style="margin-left: 15px; margin-right: 15px; margin-top: 10px; margin-bottom: 20px; display: none; width: 97%">
									<img src="${ctx }/images/loading.gif">
								</div>
							</td>
						</c:forEach>
					</table>
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
						<tr>
							<td><page:pagingToolbar pagingInfo="${dw }" /></td>
						</tr>
						<tr>
							<td style="text-align: right;">
								<img src="${ctx }/images/u608.gif">&nbsp;正常&nbsp;&nbsp;
								<img src="${ctx }/images/u622.gif">&nbsp;正常结清&nbsp;&nbsp;
								<img src="${ctx }/images/u611.gif">&nbsp;提前结清&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		</div>
	</form>

	<!------------弹出层:预估结清管理------------>
	<div style="display: none;" id="forcastSettle" title="您当前的位置:预估结清测算">
		<div
			class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
			id="main">
			<div class="zc_grid_body jqgrowleft">
				<div class="ui-widget-content jqgrow ui-row-ltr ">
					<form name="forcastSettleForm" id="forcastSettleForm" action="../servlet/defaultDispatcher?__action=rentFinanceCommand.estimateAdvanceSettleList" method="post">
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="checkDeliveryPayTableID">
							<input type="hidden" name="RECP_ID" size="30" />
							<input type="hidden" name="LEASE_PERIOD" size="30" />
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: left; height: 20;">客户名称:</td>
								<td><input type="text" id="CUST_NAME" name="CUST_NAME"
									size="40" readonly="readonly" /></td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: left; height: 20;">支付表号:</td>
								<td><input type="text" id="RECP_CODE" name="RECP_CODE"
									size="30" readonly="readonly" /></td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: left; height: 20;">预估结清日期:<font
									color="red">*</font></td>
								<td><input type="text" id="QUERY_DATE" name="QUERY_DATE"
									size="30" readonly="readonly" /></td>
							</tr>

							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center; height: 20;" colspan="2">
									<input type="button" id="subUpload" value="确&nbsp;定" onclick="forcastSettle();" class="ui-state-default ui-corner-all" style="cursor: pointer;"></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>