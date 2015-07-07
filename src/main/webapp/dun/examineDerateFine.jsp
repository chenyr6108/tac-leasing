<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>罚息减免审批1</title> 
		<script type="text/javascript" src="${ctx }/dun/js/dunCheck.js"></script>
	</head>
	<body>  
	<form action="../servlet/defaultDispatcher" name="form1" id="form1"
			method="post"> 
				<input type="hidden" id="__action" name="__action"
					value="dunTask.examine" />   
				<input type="hidden" id="dufd_id" name="dufd_id"
					value="${derateFineInfo.DUFD_ID }" /> 	
			<div>
			<div
				class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
				style="height: 30px">
				<span class="ui-jqgrid-title"
					style="line-height: 30px; font-size: 15px;">&nbsp;审查部审核</span>
			</div>  
			<div
				class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
				id="main">
				<div class="zc_grid_body ">
					<table cellspacing="0" cellpadding="0" border="0"
						class="ui-jqgrid-htable zc_grid_title"> 
						<tbody> 
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: left; height: 26px; width: 20%;">承租人：</td>
								<td style="text-align: left;"  colspan="3">${derateFineInfo.CUST_NAME }</td>
							</tr>  
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: left; height: 26px;">融资租赁合同号：</td>
								<td style="text-align: left;  width: 30%;">${derateFineInfo.LEASE_CODE }</td>
								<td style="text-align: left; height: 26px;  width: 20%;">支付表号：</td>
								<td style="text-align: left; width: 30%;">${derateFineInfo.RECP_CODE }</td>
							</tr>  
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: left; height: 26px; width: 20%;">应付日期：</td>
								<td style="text-align: left; width: 30%;"><fmt:formatDate value="${derateFineInfo.PAY_DATE }" pattern="yyyy-MM-dd" /></td>
								<td style="text-align: left; height: 26px;  width: 20%;">应付金额：</td>
								<td style="text-align: left; width: 30%;"><fmt:formatNumber value="${derateFineInfo.DUN_TOTALPRICE }" type="currency"/></td>
							</tr>  
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: left; height: 26px; width: 20%;">逾期天数：</td>
								<td style="text-align: left; width: 30%;">${derateFineInfo.DUN_DAY }</td>
								<td style="text-align: left; height: 26px;  width: 20%;">逾期金额：</td>
								<td style="text-align: left; width: 30%;"><fmt:formatNumber value="${derateFineInfo.DUN_MONTHPRICE }" type="currency"/></td>
							</tr>  
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: left; height: 26px; width: 20%;">减免日期：</td>
								<td style="text-align: left;"  colspan="3"><fmt:formatDate value="${derateFineInfo.DERATE_DATE }" pattern="yyyy-MM-dd"/></td>
							</tr>  
								<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: left; height: 26px; width: 20%;">罚息金额：</td>
								<td style="text-align: left; width: 30%;" colspan="3"><fmt:formatNumber value="${derateFineInfo.FINE  }" type="currency"/><input type="hidden" id="derateFineDunFine" value="${derateFineInfo.FINE  }"> </td>
							</tr>  
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: left; height: 26px; width: 20%;">减免罚息比例：</td>
								<td style="text-align: left; width: 30%;"><input type="text" name="dunFine_rate" size="4" value="${derateFineInfo.DERATE_FINE_RATE  }" onchange="updateDunFine_rate(this.value);"/> %<input type="hidden" name="dunFineRate_rate" size="4" value="${derateFineInfo.DERATE_FINEINTEREST_RATE  }"   onchange="updateDunFineRate_rate(this.value);"/></td>
								<td style="text-align: left; height: 26px; width: 20%;">减免罚金金额：</td>
								<td style="text-align: left; width: 30%;"> <input type="text" name="dunFine" size="8" value="${derateFineInfo.DERATE_FINE  }"   onchange="updateDunFine(this.value);"/> <input type="hidden" name="dunFineRate"  size="8" value="${derateFineInfo.DERATE_FINEINTEREST }" onchange="updateDunFineRate(this.value);"/> </td>
							</tr>     
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: left; height: 26px; width: 20%;">申请人：</td>
								<td style="text-align: left; width: 30%;">${derateFineInfo.APPLY_USER_NAME  }</td>
								<td style="text-align: left; height: 26px;  width: 20%;">申请时间：</td>
								<td style="text-align: left; width: 30%;"><fmt:formatDate value="${derateFineInfo.APPLY_DATE }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							</tr>  
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: left; height: 80px; width: 20%;">申请内容：</td>
								<td style="text-align: left;"  colspan="3"><pre>${derateFineInfo.APPLY_CONTET }</pre>&nbsp;</td>
							</tr> 
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: left; height: 26px; width: 20%;">审批结果：</td>
								<td style="text-align: left;"  colspan="3"> <select name="state"><option value="4">通过</option><option value="2">不通过</option></select></td>
							</tr>  
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: left; height: 26px; width: 20%;">审批人：</td>
								<td style="text-align: left; width: 30%;">&nbsp;${s_employeeName}<input type="hidden" name="examine_user_id" value="${s_employeeName}"></td>
								<td style="text-align: left; height: 26px;  width: 20%;">审批时间：</td>
								<td style="text-align: left; width: 30%;">&nbsp;<jsp:useBean id="now" class="java.util.Date"></jsp:useBean><fmt:formatDate value="${now }" pattern="yyyy-MM-dd HH:mm:ss"/><input type="hidden" name="examine_date" value="${s_employeeName}"></td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: left; height: 80px; width: 20%;">审批内容：</td>
								<td style="text-align: left;"  colspan="3"><textarea name="examine_content" style="font-size: 12px;height: 75px;width: 90%"></textarea></td>
							</tr>  
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center; height: 26px;" colspan="4"><input name="sub"  class="ui-state-default ui-corner-all" style="height: 20px;" type="button" onclick="checkForsub();" value="提  交"/> <input name="res"  class="ui-state-default ui-corner-all" style="height: 20px;"  type="reset" value="重  置"/></td>
							</tr>  
						</tbody>
					</table>
				</div>
			</div> 
			</div>
		</form>	
	</body>
</html>