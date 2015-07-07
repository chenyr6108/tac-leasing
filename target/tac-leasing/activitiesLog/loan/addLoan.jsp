<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<script>

	$(function (){
		$("#APPROVE_DATE").datepicker($.datepicker.regional['zh-CN']);
		$("#EXP_DATE").datepicker($.datepicker.regional['zh-CN']);
		$("#PAY_DATE").datepicker($.datepicker.regional['zh-CN']);
		$("#FIRST_ACCESS_DATE").datepicker($.datepicker.regional['zh-CN']);
		$("#START_DATE").datepicker($.datepicker.regional['zh-CN']);
	});
	
	function back() {
		$("#__action").val("loanCommand.query");
		$("#form").submit();
	}
	
	function save() {

		if($("#COST_MONEY").val()=="") {
			alert("成本栏位不能为空!");
			return;
		}
		if($("#CAUTION_MONEY").val()=="") {
			alert("保证金栏位不能为空!");
			return;
		}
		if($("#ACCRUAL").val()=="") {
			alert("利息栏位不能为空!");
			return;
		}
		if($("#APPROVE_MONEY").val()=="") {
			alert("核准额度栏位不能为空!");
			return;
		}
		if($("#PAY_MONEY").val()=="") {
			alert("起租额度栏位不能为空!");
			return;
		}
		
		if(isNaN($("#COST_MONEY").val())) {
			alert("成本栏位请录入数字!");
			return;
		}
		if(isNaN($("#CAUTION_MONEY").val())) {
			alert("保证金栏位请录入数字!");
			return;
		}
		if(isNaN($("#APPROVE_MONEY").val())) {
			alert("核准额度栏位请录入数字!");
			return;
		}
		if(isNaN($("#PAY_MONEY").val())) {
			alert("起租额度栏位请录入数字!");
			return;
		}
		if($("#COST_MONEY").val()-$("#CAUTION_MONEY").val()<0) {
			alert("成本不能小于保证金!");
			return;
		}
		if($("#COST_MONEY").val()<0||$("#CAUTION_MONEY").val()<0||$("#APPROVE_MONEY").val()<0||$("#PAY_MONEY").val()<0||$("#ACCRUAL").val()<0) {
			alert("金额不能小于0!");
			return;
		}
		
		$("#form").submit();
	}
</script>
</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form" id="form"
			method="post">
			<input type="hidden" name="__action" id="__action"
				value="loanCommand.save">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
				 style="text-align:left;height:30px">
				<span class="ui-jqgrid-title"
					style="line-height:30px;font-size:15px;">&nbsp;&nbsp;委贷信息录入</span>
			</div>
			<br><br>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			<table cellspacing="0" cellpadding="0" border="0">
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:100px;font-weight:normal;">
									客户名称：
								</td>
								<td class="ui-state-default ui-th-ltr zc_grid_head">
									 <select style="width:150px;" id="CUST_CODE" name="CUST_CODE">
											<c:forEach items="${custList}" var="item">
												<option value="${item.custCode }">${item.custCodeDescr }</option>	
							  			    </c:forEach>
						  			 </select>
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:100px;font-weight:normal;">
									供货商：
								</td>
								<td class="ui-state-default ui-th-ltr zc_grid_head">
									 <select style="width:150px;" id="SUP_CODE" name="SUP_CODE">
									 			<option value="无">无</option>	
											<c:forEach items="${supList}" var="item">
												<option value="${item.supCode }">${item.supName }</option>	
							  			    </c:forEach>
						  			 </select>
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:100px;font-weight:normal;">
									介绍人：
								</td>
								<td class="ui-state-default ui-th-ltr zc_grid_head">
									<input type="text" id="INTRODUCER" name="INTRODUCER" style="width:150px;">
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:100px;font-weight:normal;">
									租赁方式：
								</td>
								<td class="ui-state-default ui-th-ltr zc_grid_head">
									<select style="width:150px;" id="LOAN_MODE" name="LOAN_MODE">
											<c:forEach items="${loanModeList}" var="item">
												<option value="${item.CODE }">${item.FLAG }</option>	
							  			    </c:forEach>
						  			</select>
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:100px;font-weight:normal;">
									合同号：
								</td>
								<td class="ui-state-default ui-th-ltr zc_grid_head">
									<input type="text" id="LOAN_CODE" name="LOAN_CODE" style="width:150px;">
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:100px;font-weight:normal;">
									成本：
								</td>
								<td class="ui-state-default ui-th-ltr zc_grid_head">
									<input type="text" id="COST_MONEY" name="COST_MONEY" style="width:150px;"><font color="#E83038;">*</font>
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:100px;font-weight:normal;">
									保证金：
								</td>
								<td class="ui-state-default ui-th-ltr zc_grid_head">
									<input type="text" id="CAUTION_MONEY" name="CAUTION_MONEY" style="width:150px;"><font color="#E83038;">*</font>
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:100px;font-weight:normal;">
									利息：
								</td>
								<td class="ui-state-default ui-th-ltr zc_grid_head">
									<input type="text" id="ACCRUAL" name="ACCRUAL" style="width:150px;"><font color="#E83038;">*</font>
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:100px;font-weight:normal;">
									案件状况：
								</td>
								<td class="ui-state-default ui-th-ltr zc_grid_head">
									<select style="width:150px;" id="CASE_STATUS_ID" name="CASE_STATUS_ID">
											<c:forEach items="${caseStatusList}" var="item">
												<option value="${item.CODE }">${item.FLAG }</option>	
							  			    </c:forEach>
						  			</select>
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:100px;font-weight:normal;">
									经办人：
								</td>
								<td class="ui-state-default ui-th-ltr zc_grid_head">
									<select style="width:150px;" id="USER_ID" name="USER_ID">
											<c:forEach items="${userList}" var="item">
												<option value="${item.userId }">${item.userName }</option>	
							  			    </c:forEach>
						  			</select>
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:100px;font-weight:normal;">
									办事处：
								</td>
								<td class="ui-state-default ui-th-ltr zc_grid_head">
									<select style="width:150px;" id="DEPT_ID" name="DEPT_ID">
											<c:forEach items="${deptList}" var="item">
												<option value="${item.DECP_ID }">${item.DECP_NAME_CN }</option>	
							  			    </c:forEach>
						  			</select>
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:100px;font-weight:normal;">
									核准额度：
								</td>
								<td class="ui-state-default ui-th-ltr zc_grid_head">
									<input type="text" id="APPROVE_MONEY" name="APPROVE_MONEY" style="width:150px;"><font color="#E83038;">*</font>
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:100px;font-weight:normal;">
									拨款额度：
								</td>
								<td class="ui-state-default ui-th-ltr zc_grid_head">
									<input type="text" id="PAY_MONEY" name="PAY_MONEY" style="width:150px;"><font color="#E83038;">*</font>
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:100px;font-weight:normal;">
									核准日期：
								</td>
								<td class="ui-state-default ui-th-ltr zc_grid_head">
									<input type="text" id="APPROVE_DATE" name="APPROVE_DATE" style="width:150px;" readonly="readonly"><font color="#E83038;">*</font>
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:100px;font-weight:normal;">
									预拨款日期：
								</td>
								<td class="ui-state-default ui-th-ltr zc_grid_head">
									<input type="text" id="EXP_DATE" name="EXP_DATE" style="width:150px;" readonly="readonly"><font color="#E83038;">*</font>
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:100px;font-weight:normal;">
									拨款日期：
								</td>
								<td class="ui-state-default ui-th-ltr zc_grid_head">
									<input type="text" id="PAY_DATE" name="PAY_DATE" style="width:150px;" readonly="readonly"><font color="#E83038;">*</font>
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:100px;font-weight:normal;">
									首次拜访日：
								</td>
								<td class="ui-state-default ui-th-ltr zc_grid_head">
									<input type="text" id="FIRST_ACCESS_DATE" name="FIRST_ACCESS_DATE" style="width:150px;" readonly="readonly"><font color="#E83038;">*</font>
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:100px;font-weight:normal;">
									起租日期：
								</td>
								<td class="ui-state-default ui-th-ltr zc_grid_head">
									<input type="text" id="START_DATE" name="START_DATE" style="width:150px;" readonly="readonly"><font color="#E83038;">*</font>
								</td>
							</tr>
							<tr>
								<td colspan="2" style="text-align:center;"><br>
									<input type="button" value="保存" class="ui-state-default ui-corner-all" onclick="save()">&nbsp;&nbsp;<input type="button" value="返回" class="ui-state-default ui-corner-all" onclick="back()"><br>
								</td>
							</tr>
			</table>
			</div>
		</form>
	</body>
</html>