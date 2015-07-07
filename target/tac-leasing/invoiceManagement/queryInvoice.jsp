<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript">
		$(function() {
			//添加选项卡
			$("#tabs").tabs();
			$("#tabs").tabs('select',${cardFlag });
			$("#tabs").tabs('disable',4);
			$("#fromDate").datepicker($.datepicker.regional['zh-CN']);
			$("#toDate").datepicker($.datepicker.regional['zh-CN']);
		});
		
		function selectCard(cardFlag) {
			$("#cardFlag").val(cardFlag);
			$("#form1").submit();
		}
		
		function exportOpenInvoice() {//直租,增值税,售后回租税费方案导出开票资料
			var taxPlanCode="";
			if($("#cardFlag").val()==3) {
				taxPlanCode=$("#taxPlanCode").val();
			}
			window.parent.callBirt("birtReport/invoiceManagement/openInvoice.rptdesign",
								   "xls",
								   {"cardFlag":$("#cardFlag").val(),
									"financeDate":$("#financeDate").val(),
									"companyCode":$("#companyCode").val(),
									"caseType":$("#caseType").val(),
									"content":encodeURI($("#content").val()),
									"taxPlanCode":taxPlanCode,
									"employeeId":$("#employeeId").val()});
		}
		
		function exportCarOpenInvoice() {//乘用车委贷税费方案导出开票资料
			window.parent.callBirt("birtReport/invoiceManagement/openCarInvoice.rptdesign",
					   "xls",
					   {"cardFlag":$("#cardFlag").val(),
						"financeDate":$("#financeDate").val(),
						"companyCode":$("#companyCode").val(),
						"caseType":$("#caseType").val(),
						"content":encodeURI($("#content").val()),
						"employeeId":$("#employeeId").val()});
		}
		
		function exportPostAddress() {
			var taxPlanCode="";
			if($("#cardFlag").val()==3) {
				taxPlanCode=$("#taxPlanCode").val();
			}
			window.parent.callBirt("birtReport/invoiceManagement/postAddress.rptdesign",
					   "xls",
					   {"cardFlag":$("#cardFlag").val(),
						"financeDate":$("#financeDate").val(),
						"companyCode":$("#companyCode").val(),
						"caseType":$("#caseType").val(),
						"content":encodeURI($("#content").val()),
						"taxPlanCode":taxPlanCode});
		}
		
		function showResult(id) {//显示开票结果memo
			$.ajax({
				type:"post",
				url:'../servlet/defaultDispatcher',
				data:'__action=invoiceManagementCommand.getResult&id='+id,
				dataType:'json',
				success: function(outputMap){
					alert("开票结果：开票"+outputMap.RESULT_DESCR+"\n发票回传方式："+outputMap.RESULT_MEMO);
				}
			});
		}
		</script>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<title></title>
	</head>
	<body>
		<div id="tabs">
		<ul>
			<li style="width: 110px;text-align: center;"><a href="#tabs-1" onclick="selectCard(0)">直接租赁税费方案</a></li>
			<li style="width: 110px;text-align: center;"><a href="#tabs-2" onclick="selectCard(1)">增值税税费方案</a></li>
			<li style="width: 110px;text-align: center;"><a href="#tabs-3" onclick="selectCard(2)">乘用车委贷方案</a></li>
			<li style="width: 110px;text-align: center;"><a href="#tabs-4" onclick="selectCard(3)">售后回租方案</a></li>
			<li style="width: 110px;text-align: center;"><a href="#tabs-5">营业税税费方案</a></li>
		</ul>
		<form name="form1" id="form1" action="${ctx}/servlet/defaultDispatcher" method="post">
			<input type="hidden" id="cardFlag" name="cardFlag" value="${cardFlag }" />
			<input type="hidden" id="__action" name="__action" value="${__action }" />
			<input type="hidden" id="employeeId" name="employeeId" value="${s_employeeId }" />
				<br>	    
					<table width="800" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				        <td width="54" class="ss_bigo">&nbsp;</td>
				        <td width="600" class="ss_bigt" valign="center">
				         <table>
				         	<tr>
				         		<td>结账周期:</td>
				         		<td>
				         			<select id="financeDate" name="financeDate" style="width: 80px;"	>
				         				<c:forEach items="${financeDateList }" var="item">
				         					<option value="${item.FINANCE_DATE }" <c:if test="${item.FINANCE_DATE eq financeDate }">selected="selected"</c:if>>
				         						${item.FINANCE_DATE }
				         					</option>
				         				</c:forEach>
				         			</select>
				         		</td>
				         		<td style="text-align: right;">公司别:</td>
				         		<td>
				         			<select id="companyCode" name="companyCode" style="width: 80px;">
				         				<option value="1" <c:if test="${companyCode == 1 }">selected="selected"</c:if>>
				         					裕融
				         				</option>
				         				<option value="2" <c:if test="${companyCode == 2 }">selected="selected"</c:if>>
				         					裕国
				         				</option>
				         			</select>
			         			</td>
			         			<td style="text-align: right;">新/旧案:</td>
				         		<td>
				         			<select id="caseType" name="caseType" style="width: 80px;">
				         				<option value="NEW" <c:if test="${caseType eq 'NEW' }">selected="selected"</c:if>>
				         					新案
				         				</option>
				         				<option value="OLD" <c:if test="${caseType eq 'OLD' }">selected="selected"</c:if>>
				         					旧案
				         				</option>
				         			</select>
			         			</td>
			         			<c:if test="${cardFlag == 3}">
				         			<td style="text-align: right;">售后回租类型:</td>
					         		<td>
					         			<select id="taxPlanCode" name="taxPlanCode" style="width: 100px;">
					         				<option value="0" <c:if test="${taxPlanCode eq '0' }">selected="selected"</c:if>>
					         					全部
					         				</option>
					         				<option value="6" <c:if test="${taxPlanCode eq '6' }">selected="selected"</c:if>>
					         					设备售后回租
					         				</option>
					         				<option value="7" <c:if test="${taxPlanCode eq '7' }">selected="selected"</c:if>>
					         					乘用车售后回租
					         				</option>
					         				<option value="8" <c:if test="${taxPlanCode eq '8' }">selected="selected"</c:if>>
					         					商用车售后回租
					         				</option>
					         			</select>
				         			</td>
				         		</c:if>
				         	</tr>
				         	<tr>
				         		<td style="text-align: right;">开票情况:</td>
			         			<td>
				         			<select id="result" name="result" style="width: 80px;">
				         				<option value="2" <c:if test="${result == 2 }">selected="selected"</c:if>>
				         					全部
				         				</option>
				         				<option value="-1" <c:if test="${result == -1 }">selected="selected"</c:if>>
				         					未开票
				         				</option>
				         				<option value="1" <c:if test="${result == 1 }">selected="selected"</c:if>>
				         					开票完成
				         				</option>
				         				<option value="0" <c:if test="${result == 0 }">selected="selected"</c:if>>
				         					开票失败
				         				</option>
				         			</select>
			         			</td>
			         			<td>租金缴款:</td>
			         			<td>
			         				<select id="hasPay" name="hasPay" style="width: 80px;">
			         					<option value="0" <c:if test="${hasPay == 0 }">selected="selected"</c:if>>
				         					全部
				         				</option>
				         				<option value="1" <c:if test="${hasPay == 1 }">selected="selected"</c:if>>
				         					已缴完
				         				</option>
				         				<option value="-1" <c:if test="${hasPay == -1 }">selected="selected"</c:if>>
				         					未缴完
				         				</option>
			         				</select>
			         			</td>
			         			<td>查询内容:</td>
				         		<td colspan="3"><input id="content" name="content" value="${content }" style="width: 263px;"></td>
				         	</tr>
		       			 </table>
       					</td>
			            <td width="100" class="ss_bigt">
			       		 <a href="javaScript:void(0)" id="search" onclick="doSearch()" class="blue_button">搜 索</a>
				        </td>
		         	    <td width="13" class="ss_bigth" valign="top">&nbsp;
		         	    </td>
				      </tr>
				    </table>
		    	<br>
				<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
					<div class="ui-state-default ui-jqgrid-hdiv">
						<div class="zc_grid_body" style="background: white">
						<table cellspacing="0" cellpadding="0" border="0" class="panel_table">
							<tr>
								<td style="border-right: 0;">
									<c:if test="${cardFlag == 0 or cardFlag == 1 or cardFlag == 3}">
										<input type="button" value="导出开票资料" class="panel_button" onclick="exportOpenInvoice()" id="button_1">
									</c:if>
									<c:if test="${cardFlag == 2}">
										<input type="button" value="导出开票资料" class="panel_button" onclick="exportCarOpenInvoice()" id="button_2">
									</c:if>
										<input type="button" value="导出邮寄地址" class="panel_button" onclick="exportPostAddress()" id="button_3">
								</td>
								<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
							</tr>
						</table>
							<div id="tabs-1">
								<%@ include file="/invoiceManagement/invoiceType/invoice_1.jsp"%>
							</div>
							<div id="tabs-2">
								<%@ include file="/invoiceManagement/invoiceType/invoice_2.jsp"%>
							</div>
							<div id="tabs-3">
								<%@ include file="/invoiceManagement/invoiceType/invoice_3.jsp"%>
							</div>
							<div id="tabs-4">
								<%@ include file="/invoiceManagement/invoiceType/invoice_4.jsp"%>
							</div>
							<div id="tabs-5">
								<%@ include file="/invoiceManagement/invoiceType/invoice_5.jsp"%>
							</div>
						<table cellspacing="0" cellpadding="0" border="0" class="panel_table">
							<tr>
								<td style="border-right: 0;color: red;">&nbsp;&nbsp;&nbsp;* 导出开票资料功能只能导出未开票和开票失败的数据</td>
								<td><page:pagingToolbar pagingInfo="${dw }"/></td>
							</tr>
						</table>
						</div>
					</div>
				</div>
			</form>
		</div>
	</body>
</html>