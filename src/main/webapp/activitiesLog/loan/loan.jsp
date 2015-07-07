<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript" src="${ctx}/common/js/jquery.autocomplete.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/jquery.autocomplete.css"/>
<html>
<head>
<script>

	$(function (){
		$("#datebegin").datepicker($.datepicker.regional['zh-CN']);
		$("#dateend").datepicker($.datepicker.regional['zh-CN']);
		$("#FIRST_DATE").datepicker($.datepicker.regional['zh-CN']);
		$("#EXP_DATE").datepicker($.datepicker.regional['zh-CN']);
		$("#PAY_DATE").datepicker($.datepicker.regional['zh-CN']);
		$("#START_DATE").datepicker($.datepicker.regional['zh-CN']);
		$("#APPLY_DATE").datepicker($.datepicker.regional['zh-CN']);
		var d=new Date();
		$("#APPLY_DATE").val((d.getYear()+1900)+'-'+(d.getMonth()+1)+'-'+d.getDate());
	});
	
	function doQuery() {
		$("#form1").submit();
	}
	
	function openModifyDiv(param) {
			$.ajax({
				type:"post",
				url:'../servlet/defaultDispatcher',
				data:'__action=loanCommand.initModify&LOAN_ID='+param,
				dataType:'json',
				success: function(dataBack)	{
					
					$("#LOAN_ID").val(dataBack.loanTo.loanId);
					$("#INTRODUCER").val(dataBack.loanTo.introducer);
					$("#USER_NAME").val(dataBack.loanTo.userName);
					$("#FIRST_DATE").val(dataBack.loanTo.firstAccessDescr);
					$("#EXP_DATE").val(dataBack.loanTo.expDateDescr);
					$("#PAY_DATE").val(dataBack.loanTo.payDateDescr);
					$("#START_DATE").val(dataBack.loanTo.startDateDescr);
					$("#PAY_MONEY").val(dataBack.loanTo.payMoney);
					
					var loanMode=dataBack.loanTo.loanMode;
					var loanStatus=dataBack.loanTo.caseStatusId;
					
					$.ajax({
						type:"post",
						url:'../servlet/defaultDispatcher',
						data:'__action=loanCommand.getLoanModeList&LOAN_ID='+param,
						dataType:'json',
						success: function(dataBack)	{
							var loan_mode=$("#LOAN_MODE");
							var loan_mode_option="";
							$.each(dataBack,function(i) {
								if(loanMode==dataBack[i].CODE) {
									loan_mode_option+="<option selected='selected' value=\"" + dataBack[i].CODE + "\">" + dataBack[i].FLAG + "</option>";
								} else {
									loan_mode_option+="<option value=\"" + dataBack[i].CODE + "\">" + dataBack[i].FLAG + "</option>";
								}
							});
							
							loan_mode.html(loan_mode_option);
						}	
						});
					
 					$.ajax({
						type:"post",
						url:'../servlet/defaultDispatcher',
						data:'__action=loanCommand.getLoanStatusList&LOAN_ID='+param,
						dataType:'json',
						success: function(dataBack)	{
							var loan_status=$("#LOAN_STATUS");
							var loan_status_option="";
							$.each(dataBack,function(i) {
								if(loanStatus==dataBack[i].CODE) {
									loan_status_option+="<option selected='selected' value=\"" + dataBack[i].CODE + "\">" + dataBack[i].FLAG + "</option>";
								} else {
									loan_status_option+="<option value=\"" + dataBack[i].CODE + "\">" + dataBack[i].FLAG + "</option>";
								}
							});
							
							loan_status.html(loan_status_option);
						}	
						}); 
					
					$("#modifyDiv").dialog({modal:true,autoOpen:false,width:600,hide:'slide', show:'slide'});
			        $("#modifyDiv").dialog("open");
				}	
				});
	}
	
	function openAddPage() {
		
		$("#saveBtn").hide();
		$.ajax({
			type:"post",
			url:'../servlet/defaultDispatcher',
			data:'__action=loanCommand.initLoanInfo',
			dataType:'json',
			success: function(dataBack)	{
				//客户信息
				var options1 = {
					minChars : 1,
					max : 30,
					mustMatch: true,
					matchContains : true,
					formatItem : function(row, i, max) {
						var rs = row.custCodeDescr;
						return rs;
					},
					formatMatch : function(row, i, max) {
						return row.custCode + " " + row.custCodeDescr;
					},
					formatResult : function(row) {
						return row.custCodeDescr;
					}
				};
				$("#CUST_1").autocomplete(dataBack.custList, options1);
				$("#CUST_1").result(function (event, data, formatted) {
					$("#CUST_CODE_1").val(data.custCode);
				});
				
				//供应商
				var options2 = {
					minChars : 1,
					max : 30,
					mustMatch: true,
					matchContains : true,
					formatItem : function(row, i, max) {
						var rs = row.supName;
						return rs;
					},
					formatMatch : function(row, i, max) {
						return row.supCode + " " + row.supName;
					},
					formatResult : function(row) {
						return row.supName;
					}
				};
				$("#SUP_1").autocomplete(dataBack.supList, options2);
				$("#SUP_1").result(function (event, data, formatted) {
					$("#SUP_CODE_1").val(data.supCode);
				});
				
				//租赁方式
				var loan_mode=$("#LOAN_MODE_1");
				var loan_mode_option="";
				$.each(dataBack.loanModeList,function(i) {
					loan_mode_option+="<option value=\"" + dataBack.loanModeList[i].CODE + "\">" + dataBack.loanModeList[i].FLAG + "</option>";
				});
				loan_mode.html(loan_mode_option);
				
				//案件状况
				var loan_status=$("#CASE_STATUS_ID_1");
				var loan_status_option="";
				$.each(dataBack.caseStatusList,function(i) {
					loan_status_option+="<option value=\"" + dataBack.caseStatusList[i].CODE + "\">" + dataBack.caseStatusList[i].FLAG + "</option>";
				});
				loan_status.html(loan_status_option);
				
				//经办人
				var user_id=$("#USER_ID_1");
				var user_id_option="";
				$.each(dataBack.userList,function(i) {
					user_id_option+="<option value=\"" + dataBack.userList[i].userId + "\">" + dataBack.userList[i].userName + "</option>";
				});
				user_id.html(user_id_option);
				
				//办事处
				var dept=$("#DEPT_ID_1");
				var dept_option="";
				$.each(dataBack.deptList,function(i) {
					dept_option+="<option value=\"" + dataBack.deptList[i].DECP_ID + "\">" + dataBack.deptList[i].DECP_NAME_CN + "</option>";
				});
				dept.html(dept_option);
				
				$("#saveBtn").show();
			}	
			});
		/* $("#__action").val("loanCommand.toAddPage");
		$("#form").submit(); */
		$("#FIRST_ACCESS_DATE_1").datepicker($.datepicker.regional['zh-CN']);
		$("#EXP_DATE_1").datepicker($.datepicker.regional['zh-CN']);
		$("#PAY_DATE_1").datepicker($.datepicker.regional['zh-CN']);
		$("#START_DATE_1").datepicker($.datepicker.regional['zh-CN']);
		$("#APPROVE_DATE_1").datepicker($.datepicker.regional['zh-CN']);
		
		$("#addDiv").dialog({modal:true,autoOpen:false,width:300,hide:'slide', show:'slide'});
        $("#addDiv").dialog("open");
	}
	
    function modifyLoan() {
		$("#modifyForm").submit();
	}
    
    function applyDiv(id,descr) {
    	$("#APPLY_ID").val(id);
    	$("#LOAN_NAME").val(descr);
    	$("#applyDiv").dialog({modal:true,autoOpen:false,width:600,hide:'slide', show:'slide'});
        $("#applyDiv").dialog("open");
    }
    
    function applyPay() {
    	$("#payForm").submit();
    }
    
    function approveDiv(id,name,descr,date) {
    	$("#APPROVE_ID").val(id);
    	$("#APPROVE_NAME").val(name);
    	$("#REMARK").val(descr);
    	$("#APPROVE_DATE").val(date);
    	$("#approveDiv").dialog({modal:true,autoOpen:false,width:600,hide:'slide', show:'slide'});
        $("#approveDiv").dialog("open");
    }
    
    function approvePay(status) {
    	$("#APPROVE_STATUS").val(status);
    	$("#approveForm").submit();
    }
    
    function save() {

    	if($("#CUST_CODE_1").val()=="") {
			alert("客户名称不能为空!");
			return;
		}
		if($("#COST_MONEY_1").val()=="") {
			alert("成本栏位不能为空!");
			return;
		}
		if($("#CAUTION_MONEY_1").val()=="") {
			alert("保证金栏位不能为空!");
			return;
		}
		if($("#ACCRUAL_1").val()=="") {
			alert("利息栏位不能为空!");
			return;
		}
		if($("#APPROVE_MONEY_1").val()=="") {
			alert("核准额度栏位不能为空!");
			return;
		}
		if($("#PAY_MONEY_1").val()=="") {
			alert("拨款额度栏位不能为空!");
			return;
		}
		
		
		if($("#APPROVE_DATE_1").val()=="") {
			alert("核准日期不能为空!");
			return;
		}
		if($("#EXP_DATE_1").val()=="") {
			alert("预拨款日期不能为空!");
			return;
		}
		if($("#PAY_DATE_1").val()=="") {
			alert("拨款日期不能为空!");
			return;
		}
		if($("#START_DATE_1").val()=="") {
			alert("起租日期不能为空!");
			return;
		}
		
		
		
		if(isNaN($("#COST_MONEY_1").val())) {
			alert("成本栏位请录入数字!");
			return;
		}
		if(isNaN($("#CAUTION_MONEY_1").val())) {
			alert("保证金栏位请录入数字!");
			return;
		}
		if(isNaN($("#APPROVE_MONEY_1").val())) {
			alert("核准额度栏位请录入数字!");
			return;
		}
		if(isNaN($("#PAY_MONEY_1").val())) {
			alert("拨款额度栏位请录入数字!");
			return;
		}
		if($("#COST_MONEY_1").val()-$("#CAUTION_MONEY_1").val()<0) {
			alert("成本不能小于保证金!");
			return;
		}
		if($("#COST_MONEY_1").val()<0||$("#CAUTION_MONEY_1").val()<0||$("#APPROVE_MONEY_1").val()<0||$("#PAY_MONEY_1").val()<0||$("#ACCRUAL_1").val()<0) {
			alert("金额不能小于0!");
			return;
		}
		$("#addForm").submit();
	}
</script>
</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1"
			method="post">
			<input type="hidden" name="__action" id="__action"
				value="loanCommand.query">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
				 style="text-align:left;height:30px">
				<span class="ui-jqgrid-title"
					style="line-height:30px;font-size:15px;">&nbsp;&nbsp;委贷信息录入</span>
			</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			<table width="80%" border="0" cellspacing="0" cellpadding="0"
			bgcolor="#ffffff">
			<tr>
				<td width="8">&nbsp;</td>
				<td width="60" class="ss_o"></td>
				<td width="40%" class="ss_t">
					<table style="margin-left: 10px;">
						<tr>
							<td colspan="5">
							客户名称：<input type="text" id="CUST_NAME" name="CUST_NAME" value="${CUSTOMER_NAME }">&nbsp;&nbsp;&nbsp;
							租赁方式：
							<select name="LEASE_WAY">
								<option value="">--所有--</option>
								<c:forEach var="item" items="${loanModeList }">
									<option <c:if test="${LEASE_WAY eq item.CODE }">selected="selected"</c:if> value="${item.CODE }">${item.FLAG }</option>
								</c:forEach>
							</select>&nbsp;&nbsp;&nbsp;
							拨款日期：<input type="text" id="datebegin" name="PAY_DATE_BEGIN" value="${PAY_DATE_BEGIN }" readonly="readonly" style="width: 78px;">到
							<input type="text" id="dateend" name="PAY_DATE_END" value="${PAY_DATE_END }" readonly="readonly" style="width: 78px;">
							</td>
						</tr>
					</table>
				</td>
				<td width="55" class="ss_th" valign="top">&nbsp;</td>
				<td width="20%"><a href="#" name="search" id="search"
					onclick="doQuery();" class="blue_button">搜 索</a></td>
			</tr>
			</table>
			<br>
			<div class="ui-state-default ui-jqgrid-hdiv" style="background:#FFFFFF;">
			<table style="width: 100%;margin-left: 2px"><tr><td><input type="button" value="新建委贷" class="ui-state-default ui-corner-all" onclick="openAddPage()" style="cursor:pointer;"></td><td style="text-align: right;"><page:pagingToolbarTop pagingInfo="${pagingInfo }"/></td></tr></table>
			<table cellspacing="0" cellpadding="0" border="0" class="grid_table">
							<tr>
								<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:16px;">
									序号
								</td>
								<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:200px;">
									<page:pagingSort orderBy="custCodeDescr" pagingInfo="${pagingInfo }">客户名称</page:pagingSort>
								</td>
								<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
									介绍人
								</td>
								<!-- <td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:200px;">
									供货商
								</td> -->
								<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
									<page:pagingSort orderBy="loanModeDescr" pagingInfo="${pagingInfo }">租赁方式</page:pagingSort>
								</td>
								<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:110px;">
									申请额度<br>(成本-保证金)
								</td>
								<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
									利息
								</td>
								<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
									<page:pagingSort orderBy="userName" pagingInfo="${pagingInfo }">经办人</page:pagingSort>
								</td>
								<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
									核准额度
								</td>
								<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
									<page:pagingSort orderBy="payMoney" pagingInfo="${pagingInfo }">拨款额度</page:pagingSort>
								</td>
								<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:70px;">
									核准日期
								</td>
								<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:70px;">
									预估拨款日
								</td>
								<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:70px;">
									拨款日期
								</td>
								<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:70px;">
									起租日期
								</td>
								<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:70px;">
									合同号
								</td>
								<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:90px;">
									<page:pagingSort orderBy="caseStatusDescr" pagingInfo="${pagingInfo }">案件状况</page:pagingSort>
								</td>
								<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:70px;">
									<page:pagingSort orderBy="payCloseStatus" pagingInfo="${pagingInfo }">结清状态</page:pagingSort>
								</td>
								<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:200px;">
									操作
								</td>
							</tr>
					<c:forEach items="${pagingInfo.resultList }" var="item" varStatus="index">
							<tr>
								<td style="text-align:center;">
									${index.count }
								</td>
								<td style="text-align:center;">
									<c:if test="${item.payCloseStatus == 0 or item.payCloseStatus == -1}"><a href="javaScript:void(0);" onclick="openModifyDiv(${item.loanId });" style="text-decoration:none;color:#2E6E9E;">${item.custCodeDescr }</a></c:if><c:if test="${item.payCloseStatus != 0 and item.payCloseStatus != -1}">${item.custCodeDescr }</c:if>
								</td>
								<td style="text-align:center;">
									${item.introducer }
								</td>
								<%-- <td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">
									${item.supName }
								</td> --%>
								<td style="text-align:center;">
									${item.loanModeDescr }
								</td>
								<td style="text-align:right;">
									<fmt:formatNumber value="${item.costMoney-item.cautionMoney }" type="currency" pattern="#,##0.00"/>
								</td>
								<td style="text-align:right;">
									<fmt:formatNumber value="${item.accrual }" type="currency" pattern="#,##0.00"/>
								</td>
								<td style="text-align:center;">
									${item.userName }
								</td>
								<td style="text-align:right;">
									<fmt:formatNumber value="${item.approveMoney }" type="currency" pattern="#,##0.00"/>
								</td>
								<td style="text-align:right;">
									<fmt:formatNumber value="${item.payMoney }" type="currency" pattern="#,##0.00"/>
								</td>
								<td style="text-align:center;">
									${item.approveDateDescr }
								</td>
								<td style="text-align:center;">
									${item.expDateDescr }
								</td>
								<td style="text-align:center;">
									${item.payDateDescr }
								</td>
								<td style="text-align:center;">
									${item.startDateDescr }
								</td>
								<td style="text-align:center;">
									${item.loanCode }
								</td>
								<td style="text-align:center;<c:if test='${item.caseStatusDescr eq "未拨款"}'>color:red;</c:if>">
									${item.caseStatusDescr }
								</td>
								<td style="text-align:center;">
									<c:if test="${item.payCloseStatus == -1}">结清驳回</c:if>
									<c:if test="${item.payCloseStatus == 2}">已结清<br>(${item.payCloseDate })</c:if>
									<c:if test="${item.payCloseStatus == 1}">申请结清中</c:if>
									<c:if test="${item.payCloseStatus == 0}">未结清</c:if>
								</td>
								<td style="text-align:center;">
									<c:if test="${apply == true }"><c:if test="${item.payCloseStatus == -1 or item.payCloseStatus == 0}"><a href="javascript:void(0)" onclick="applyDiv('${item.loanId }','${item.custCodeDescr }')">结清申请</a></c:if><c:if test="${item.payCloseStatus == 1 or item.payCloseStatus == 2}">结清申请</c:if></c:if>&nbsp;|&nbsp;<c:if test="${approve == true }"><c:if test="${item.payCloseStatus == 1 }"><a href="javascript:void(0)" onclick="approveDiv('${item.loanId }','${item.custCodeDescr }','${item.remark }','${item.payCloseDate }')">确认结清</a></c:if><c:if test="${item.payCloseStatus != 1 }">确认结清</c:if></c:if>
								</td>
							</tr>
					</c:forEach>
			</table>
			<page:pagingToolbar pagingInfo="${pagingInfo }"/>
			</div>
			</div>
		</form>
		
		<div id="applyDiv" style="display:none;" title="结清申请">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
		          <div class="zc_grid_body jqgrowleft">
					<div class="ui-widget-content jqgrow ui-row-ltr "><!-- 申请结清  0未申请,-1驳回,1是申请中,2是通过 -->
						<form action="../servlet/defaultDispatcher?__action=loanCommand.applyPayClose" id="payForm" method="post">
							<input type="hidden" id="APPLY_ID" name="APPLY_ID"><br>
							<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
								<tr>
									<td align="right">
										结清申请日期：
									</td>
									<td>
										<input id="APPLY_DATE" name="APPLY_DATE" readonly="readonly">
									</td>
									<td align="right">
										备注：
									</td>
									<td>
										<textarea id="APPLY_REMARK" name="APPLY_REMARK" cols="30" rows="2"></textarea><input type="hidden" name="LOAN_NAME" id="LOAN_NAME">
									</td>
								</tr>
								<tr>
									<td colspan="4" align="center">
										<input type="button" value="保&nbsp;存" onclick="applyPay()" class="ui-state-default ui-corner-all" style="cursor:pointer;">
									</td>
								</tr>
							</table>
						</form>
					</div>
				  </div>
			</div>
		</div>
		<div id="approveDiv" style="display:none;" title="结清审批">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
		          <div class="zc_grid_body jqgrowleft">
					<div class="ui-widget-content jqgrow ui-row-ltr"><!-- 申请结清  0未申请,-1驳回,1是申请中,2是通过 -->
						<form action="../servlet/defaultDispatcher?__action=loanCommand.approvePayClose" id="approveForm" method="post">
							<input type="hidden" id="APPROVE_ID" name="APPROVE_ID">
							<input type="hidden" id="APPROVE_STATUS" name="APPROVE_STATUS">
							<input type="hidden" name="APPROVE_NAME" id="APPROVE_NAME">
							<br>							
							<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
								<tr>
									<td align="right">
										申请结清备注：
									</td>
									<td>
										<textarea id="REMARK" readonly="readonly"></textarea>
									</td>
									<td align="right">
										申请结清日期：
									</td>
									<td>
										<input id="APPROVE_DATE" readonly="readonly">
									</td>
								</tr>
								<tr>
									<td colspan="4" align="center">
										<input type="button" value="通&nbsp;过" onclick="approvePay(2)" class="ui-state-default ui-corner-all" style="cursor:pointer;">&nbsp;<input type="button" value="驳&nbsp;回" onclick="approvePay(-1)" class="ui-state-default ui-corner-all" style="cursor:pointer;">
									</td>
								</tr>
							</table>
						</form>
					</div>
				  </div>
			</div>
		</div>
		<div id="modifyDiv" style="display:none;" title="修改委贷信息">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
		          <div class="zc_grid_body jqgrowleft">
					<div class="ui-widget-content jqgrow ui-row-ltr">
						<form action="../servlet/defaultDispatcher?__action=loanCommand.updateLoan" id="modifyForm" method="post">
						<input type="hidden" id="LOAN_ID" name="LOAN_ID">
							<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
								<tr>
									<td align="right" class="ui-widget-content jqgrow ui-row-ltr">介绍人：</td>
									<td>
										<input type="text" value="" id="INTRODUCER" name="INTRODUCER">
									</td>
									<td align="right" class="ui-widget-content jqgrow ui-row-ltr">拨款额度</td>
									<td>
										<input type="text" value="" id="PAY_MONEY" name="PAY_MONEY">
									</td>
								</tr>
								<tr>
									<td align="right" class="ui-widget-content jqgrow ui-row-ltr">首次拜访日：</td>
									<td>
										<input type="text" value="" id="FIRST_DATE" name="FIRST_DATE" readonly="readonly">
									</td>
									<td align="right" class="ui-widget-content jqgrow ui-row-ltr">预估拨款日：</td>
									<td>
										<input type="text" value="" id="EXP_DATE" name="EXP_DATE" readonly="readonly">
									</td>
								</tr>
								<tr>
									<td align="right" class="ui-widget-content jqgrow ui-row-ltr">拨款日期：</td>
									<td>
										<input type="text" value="" id="PAY_DATE" name="PAY_DATE" readonly="readonly">
									</td>
									<td align="right" class="ui-widget-content jqgrow ui-row-ltr">租赁方式：</td>
									<td>
										<select id="LOAN_MODE" name="LOAN_MODE"></select>
									</td>
								</tr>
								<tr>
									<td align="right" class="ui-widget-content jqgrow ui-row-ltr">起租日期：</td>
									<td>
										<input type="text" value="" id="START_DATE" name="START_DATE" readonly="readonly">
									</td>
									<td align="right" class="ui-widget-content jqgrow ui-row-ltr">案件状况：</td>
									<td>
										<select id="LOAN_STATUS" name="LOAN_STATUS"></select>
									</td>
								</tr>
								<tr>
									<td colspan="4" id="button_flag" style="text-align:center;">
									<br>
										<input type="button" value="保&nbsp;存" onclick="modifyLoan()" class="ui-state-default ui-corner-all" style="cursor:pointer;">
										<input type="button" value="关&nbsp;闭" onclick="$('#modifyDiv').dialog('close');" class="ui-state-default ui-corner-all" style="cursor:pointer;">
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div id="addDiv" style="display:none;" title="新建委贷">
						<form action="../servlet/defaultDispatcher?__action=loanCommand.save" id="addForm" method="post">
							<table cellspacing="0" cellpadding="0" border="0" class="grid_table">
								<tr>
								<td style="text-align:right;width:100px;font-weight:normal;">
									<font color="#E83038;">*</font>客户名称：
								</td>
								<td>
									 <input style="width:150px;" id="CUST_1" onchange="$('#CUST_CODE_1').val('');">
									 <input type="hidden" style="width:150px;" id="CUST_CODE_1" name="CUST_CODE">
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:100px;font-weight:normal;">
									供应商：
								</td>
								<td>
									 <input style="width:150px;" id="SUP_1">
									 <input type="hidden" style="width:150px;" id="SUP_CODE_1" name="SUP_CODE">
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:100px;font-weight:normal;">
									介绍人：
								</td>
								<td>
									<input type="text" id="INTRODUCER_1" name="INTRODUCER" style="width:150px;">
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:100px;font-weight:normal;">
									租赁方式：
								</td>
								<td>
									<select style="width:150px;" id="LOAN_MODE_1" name="LOAN_MODE">
									
						  			</select>
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:100px;font-weight:normal;">
									合同号：
								</td>
								<td>
									<input type="text" id="LOAN_CODE" name="LOAN_CODE" style="width:150px;">
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:100px;font-weight:normal;">
									<font color="#E83038;">*</font>成本：
								</td>
								<td>
									<input type="text" id="COST_MONEY_1" name="COST_MONEY" style="width:150px;">
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:100px;font-weight:normal;">
									<font color="#E83038;">*</font>保证金：
								</td>
								<td>
									<input type="text" id="CAUTION_MONEY_1" name="CAUTION_MONEY" style="width:150px;">
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:100px;font-weight:normal;">
									<font color="#E83038;">*</font>利息：
								</td>
								<td>
									<input type="text" id="ACCRUAL_1" name="ACCRUAL" style="width:150px;">
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:100px;font-weight:normal;">
									案件状况：
								</td>
								<td>
									<select style="width:150px;" id="CASE_STATUS_ID_1" name="CASE_STATUS_ID">
									
						  			</select>
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:100px;font-weight:normal;">
									经办人：
								</td>
								<td>
									<select style="width:150px;" id="USER_ID_1" name="USER_ID">
									
						  			</select>
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:100px;font-weight:normal;">
									办事处：
								</td>
								<td>
									<select style="width:150px;" id="DEPT_ID_1" name="DEPT_ID">
									
						  			</select>
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:100px;font-weight:normal;">
									<font color="#E83038;">*</font>核准额度：
								</td>
								<td>
									<input type="text" id="APPROVE_MONEY_1" name="APPROVE_MONEY" style="width:150px;">
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:100px;font-weight:normal;">
									<font color="#E83038;">*</font>拨款额度：
								</td>
								<td>
									<input type="text" id="PAY_MONEY_1" name="PAY_MONEY" style="width:150px;">
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:100px;font-weight:normal;">
									<font color="#E83038;">*</font>核准日期：
								</td>
								<td>
									<input type="text" id="APPROVE_DATE_1" name="APPROVE_DATE" style="width:150px;" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:100px;font-weight:normal;">
									<font color="#E83038;">*</font>预拨款日期：
								</td>
								<td>
									<input type="text" id="EXP_DATE_1" name="EXP_DATE" style="width:150px;" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:100px;font-weight:normal;">
									<font color="#E83038;">*</font>拨款日期：
								</td>
								<td>
									<input type="text" id="PAY_DATE_1" name="PAY_DATE" style="width:150px;" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:100px;font-weight:normal;">
									首次拜访日：
								</td>
								<td>
									<input type="text" id="FIRST_ACCESS_DATE_1" name="FIRST_ACCESS_DATE" style="width:150px;" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:100px;font-weight:normal;">
									<font color="#E83038;">*</font>起租日期：
								</td>
								<td>
									<input type="text" id="START_DATE_1" name="START_DATE" style="width:150px;" readonly="readonly">
								</td>
							</tr>
								<tr>
									<td colspan="4" align="center">
										<input id="saveBtn" type="button" value="保&nbsp;存" onclick="save()" class="ui-state-default ui-corner-all" style="cursor:pointer;">&nbsp;<input type="button" value="关&nbsp;闭" onclick="$('#addDiv').dialog('close');" class="ui-state-default ui-corner-all" style="cursor:pointer;">
									</td>
								</tr>
							</table>
						</form>
					</div>
	</body>
</html>