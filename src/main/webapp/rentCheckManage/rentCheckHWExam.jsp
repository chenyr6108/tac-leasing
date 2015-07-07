<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<script type="text/javascript" >

	$(function (){
		$(".DATE_SPI").datepicker($.datepicker.regional["zh-CN"]);
	});
	
	function subCheckPayLines(){
		var form = document.checkPayForm;

	    var checkMoneys = document.getElementsByName("CHECK_MONEY");
	    for (var i=0;i<checkMoneys.length;i++){
	   	 	if (positive(form.CHECK_MONEY[i], '每期支票金额')) {
	            return false;
	        }
	    }  

/* 	    var checkOutDates = document.getElementsByName("CHECKOUT_DATE");
	    for (var i=0;i<checkOutDates.length;i++){
	   	 	if (checkCheckPayBlank(form.CHECKOUT_DATE[i].value)) {
	   	 		alert("出票日期不能为空！");
	            return false;
	        }
	   	 	if (checkCheckPayBlank(form.CHECK_NUM[i].value)) {
	   	 		alert("支票号码不能为空！");
	            return false;
	        }
	   	 	if (checkCheckPayBlank(form.CHECK_MONEY[i].value)) {
	   	 		alert("支票号码不能为空！");
	            return false;
	        }
	    } */

		var check_ids="";
		$('input[name="check_ids"]:checked').each(function(){   
			if (check_ids!=""){
				check_ids=check_ids+","+$(this).val();
			}else{
				check_ids=check_ids+$(this).val();
			}
		});
		form.all_check_ids.value=check_ids;

		document.getElementById("buttonAdd").disabled=true;
		$("#checkPayForm").submit();
	}
	
	function positive(field, name) {
		if(typeof(field) != "undefined"){
		    var value = field.value;
		    value = value.trim();
		    value = value.replace(/[-￥,]/g, '');
		    if (value==""){
		    	value=0;
		    }
			if(value==0){
				 field.value = value; 
		    }else if (!checkNumber(value)) {
		        alert(name + '只能输入数字！');
		        field.focus();
		        return true;
		    } else if (checkNegative(value)) {
		        alert(name + '必须是一个正数！');
		        field.focus();
		        return true;
		    } else {
		        if (value.substring(0,2) != '0.') {
		            value = value.replace(/^0+/g, '');
		        }
		        field.value = value;
		        return false;
		    }
		}
	}
	function checkNegative(checkStr)
	{
	    var regex = /^\-\d+(\.\d+)?$/;

	    return regex.test(checkStr);
	}
	
	function checkNumber(checkStr)
	{
	    var regex = /^[\+\-]?\d+(\.\d+)?$/;

	    return regex.test(checkStr);
	}
	
</script>
</head>
<body>
	<center>
		<form name="checkPayForm" id="checkPayForm" method="POST"  action="../servlet/defaultDispatcher?__action=rentContract.createRentCheckPayLines">
			<br>
			<table width="800" cellpadding="0" cellspacing="0" border="0"
				align="center">
				<tr>
					<td>
						<div
							class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
							style="height: 30px">
							<span class="ui-jqgrid-title"
								style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;支票支付明细</span>
						</div>
						<div
							class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
							id="main">
							<div class="zc_grid_body jqgrowleft">
								<table cellspacing="0" cellpadding="0" border="0"
									class="ui-jqgrid-htable zc_grid_title" id="checkPayTab">
									<tr style="height: 30px">
										<td style="text-align: left;" colspan="8" class="ui-widget-content jqgrow ui-row-ltr">客户名称：${CUST_NAME }</td>
									</tr>	
									<tr style="height: 30px">
										<td style="text-align: left;" colspan="8" class="ui-widget-content jqgrow ui-row-ltr">合同号：${LEASE_CODE }</td>&nbsp;&nbsp;<%-- 增加支票</b>&nbsp;<img src="${ctx }/images/u100.gif"><a href="javascript:void(0)" style="cursor: pointer;" onclick="addCheckPayDetail();">添加 --%>
									</tr>																		
									<tr>
										<td style="text-align: center;"
											class="ui-state-default ui-th-ltr zc_grid_head">租金期数</td>
										<td style="text-align: center; height: 20px;"
											class="ui-state-default ui-th-ltr zc_grid_head">租金金额</td>
										<td style="text-align: center; height: 20px;"
											class="ui-state-default ui-th-ltr zc_grid_head">出票人</td>				
										<td style="text-align: center;"
											class="ui-state-default ui-th-ltr zc_grid_head">出票日期</td>
										<td style="text-align: center;"
											class="ui-state-default ui-th-ltr zc_grid_head">支票号码</td>
										<td style="text-align: center;"
											class="ui-state-default ui-th-ltr zc_grid_head">金额</td>
										<td style="text-align: center;"
											class="ui-state-default ui-th-ltr zc_grid_head">备注</td>
										<td style="text-align: center;"
											class="ui-state-default ui-th-ltr zc_grid_head">业管确认</td>																						
									</tr>
									<input type="hidden" id="credit_id" name="credit_id" value="${credit_id }" />
									<input type="hidden" id="TYPE" name="TYPE" value="${TYPE }" />
									<input type="hidden" id="LEASE_TERM" name="LEASE_TERM" value="${schemeMap.LEASE_TERM }" />
									<c:choose>
										<c:when test="${not empty checkManagePayLines}">
									<c:forEach items="${checkManagePayLines }" var="item"
											varStatus="status">
											<input type="hidden" id="MONTH_PRICE_TAX" name="MONTH_PRICE_TAX" value="${item.MONTH_PRICE_TAX}" <c:if test="${item.FINANCE_CHECK_STATE eq 1 or item.HW_CHECK_STATE eq 1}">disabled</c:if>/>
											<tr>
												<td style="text-align: center"
													class="ui-widget-content jqgrow ui-row-ltr">第${item.PERIOD_NUM}期&nbsp;<input type="hidden" id="PERIOD_NUM" name="PERIOD_NUM" value="${item.PERIOD_NUM}" <c:if test="${item.FINANCE_CHECK_STATE eq 1 or item.HW_CHECK_STATE eq 1}">disabled</c:if>/><input type="hidden" id="ID" name="ID" value="${item.ID}" <c:if test="${item.FINANCE_CHECK_STATE eq 1 or item.HW_CHECK_STATE eq 1}">disabled</c:if>/></td>
												<td style="text-align: right; height: 24px;"
													class="ui-widget-content jqgrow ui-row-ltr">
													<fmt:formatNumber
														value="${item.MONTH_PRICE_TAX }" type="currency" />&nbsp;</td>
												<td style="text-align: center;"class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="DRAWER" value="${item.DRAWER}" <c:if test="${item.FINANCE_CHECK_STATE eq 1 or item.HW_CHECK_STATE eq 1}">disabled</c:if>/>&nbsp;</td>							
												<td style="text-align: center;"class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="CHECKOUT_DATE" class="DATE_SPI" style=" width: 80px; height: 18px;" readonly="readonly" value="<c:choose><c:when test="${item.CHECK_OUT_DATE eq '1900-01-01'}"></c:when><c:otherwise>${item.CHECK_OUT_DATE}</c:otherwise></c:choose>" <c:if test="${item.FINANCE_CHECK_STATE eq 1 or item.HW_CHECK_STATE eq 1}">disabled</c:if>>&nbsp;</td>
												<td style="text-align: center;"class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="CHECK_NUM" value="${item.CHECK_NUM}" <c:if test="${item.FINANCE_CHECK_STATE eq 1 or item.HW_CHECK_STATE eq 1}">disabled</c:if>/>&nbsp;</td>
												<td style="text-align: center;"class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="CHECK_MONEY" value="${item.CHECK_MONEY}" <c:if test="${item.FINANCE_CHECK_STATE eq 1 or item.HW_CHECK_STATE eq 1}">disabled</c:if>/>&nbsp;</td>
												<td style="text-align: center;"class="ui-widget-content jqgrow ui-row-ltr"><select name="MEMO" id="MEMO" <c:if test="${item.FINANCE_CHECK_STATE eq 1 or item.HW_CHECK_STATE eq 1}">disabled</c:if>>
													<c:forEach items="${memoList}" var="item1">
																<option value="${item1.FLAG }" <c:if test="${item1.FLAG eq item.MEMO}">selected="selected"</c:if>>
																	${item1.FLAG }
																</option>
													</c:forEach></select>&nbsp;</td>
												<td style="text-align: center;"class="ui-widget-content jqgrow ui-row-ltr"><INPUT TYPE="checkbox" NAME="check_ids" id="check_ids" value="${item.ID}" style="width:100%;" <c:if test="${not empty item.HW_CHECK_STATE and item.HW_CHECK_STATE eq 1}">checked</c:if> <c:if test="${item.FINANCE_CHECK_STATE eq 1 or item.HW_CHECK_STATE eq 1}">disabled</c:if>/></td>
											</tr>
										</c:forEach> 
											<input name="all_check_ids" type="hidden"/>
										<tr>
											<td colspan="8" align="center"
												class="ui-widget-content jqgrow ui-row-ltr"><input class="ui-state-default ui-corner-all" id="buttonAdd" type="button" value="保存数据" onclick="subCheckPayLines();" style="cursor: pointer;"/></td>
										</tr>
									</c:when> 
										<c:otherwise>
											<tr>
												<td style="text-align: center;"class="ui-widget-content jqgrow ui-row-ltr" colspan="8">无支票录入数据！&nbsp;</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</table>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>