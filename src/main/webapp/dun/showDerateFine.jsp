<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>罚息减免</title> 
	</head>
	<body>  
			<div>
			<div
				class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
				style="height: 30px">
				<span class="ui-jqgrid-title"
					style="line-height: 30px; font-size: 15px;">&nbsp;罚息减免</span>
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
								<td style="text-align: left; width: 30%;" colspan="3"><fmt:formatNumber value="${derateFineInfo.FINE  }" type="currency"/></td>
							</tr>  
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: left; height: 26px; width: 20%;">减免罚息比例：</td>
								<td style="text-align: left; width: 30%;">${derateFineInfo.DERATE_FINE_RATE  } %</td>
								<td style="text-align: left; height: 26px; width: 20%;">减免罚息金额：</td>
								<td style="text-align: left; width: 30%;"><fmt:formatNumber value="${derateFineInfo.DERATE_FINE  }" type="currency"/></td>
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
							<c:choose>    <c:when test="${derateFineInfo.STATE eq 0}"></c:when>
											<c:when test="${derateFineInfo.STATE eq 3}">
											<tr class="ui-widget-content jqgrow ui-row-ltr">
												<td style="text-align: left;"  colspan="4">&nbsp; <font color="red" >该申请已被撤销!</font> </td>
												</tr>  
											</c:when>
										 <c:otherwise>
										 <tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: left; height: 26px; width: 20%;">审查部审核结果：</td>
								<td style="text-align: left;"  colspan="3">&nbsp;<c:if test="${derateFineInfo.STATE eq 1  or derateFineInfo.STATE eq 4 }">通过</c:if><c:if test="${derateFineInfo.STATE eq 2}"><font color="red"> 不通过</font></c:if><c:if test="${derateFineInfo.STATE eq 3}"> 撤销 </c:if></td>
							</tr>  
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: left; height: 26px; width: 20%;">审核人：</td>
								<td style="text-align: left; width: 30%;">&nbsp;${derateFineInfo.EXAMINE_USER_NAME  }</td>
								<td style="text-align: left; height: 26px;  width: 20%;">审核时间：</td>
								<td style="text-align: left; width: 30%;">&nbsp;<fmt:formatDate value="${derateFineInfo.EXAMINE_DATE }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: left; height: 80px; width: 20%;">审核内容：</td>
								<td style="text-align: left;"  colspan="3"><pre>${derateFineInfo.EXAMINE_CONTENT }</pre>&nbsp;</td>
							</tr>  
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: left; height: 26px; width: 20%;">经理审批结果：</td>
								<td style="text-align: left;"  colspan="3"><c:if test="${derateFineInfo.STATE eq 1}">通过</c:if><c:if test="${derateFineInfo.STATE eq 5}"><font color="red"> 不通过</font> </c:if> </td>
							</tr>  
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: left; height: 26px; width: 20%;">审批人：</td>
								<td style="text-align: left; width: 30%;">&nbsp;  ${derateFineInfo.EXAMINE_BOSS_NAME}    </td>
								<td style="text-align: left; height: 26px;  width: 20%;">审批时间：</td>
								<td style="text-align: left; width: 30%;">&nbsp;${derateFineInfo.BOSS_EXAMINE_DATE}    </td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: left; height: 80px; width: 20%;">审批内容：</td>
								<td style="text-align: left;"  colspan="3"> ${derateFineInfo.EXAMINE_BOSS } </td>
							</tr>  
										 </c:otherwise>
							
							   </c:choose>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center; height: 26px;" colspan="4"><input name="res"  class="ui-state-default ui-corner-all" style="height: 20px;"  type="button" value="返  回" onclick="javascript:history.go(-1)"/></td>
							</tr>
							 
						</tbody>
					</table>
				</div>
			</div> 
			</div>
	</body>
</html>