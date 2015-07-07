<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>付款信息管理</title>
		<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">		
			//弹出日志的层
			function openAddInsureType(divName){
				$("#"+divName).dialog({
					modal:true,
					autoOpen: false,
					width: 970
				});
				$("#"+divName).dialog('open');
			}
			function closeDialog(msg){
				$(msg).dialog('close');
			}

		function checkAll(e, itemName)
		{
		  var aa = document.getElementsByName(itemName);
		  for (var i=0; i<aa.length; i++)
		   aa[i].checked = e.checked;
		}

		function showEditPayMoneyReviewRecord(id,payee,amount,bank_account,bank_name,application_date,po_id,pay_way){
			$("#payee").val(payee);
			$("#amount").val(amount);
			$("#bank_account").val(bank_account);
			$("#application_date").val(application_date);
			$("#remark").val("");
			$("#bank_name").val(bank_name);
			$("#pay_type").val(pay_way);
			$("#reason").val("");
			$("#ID").val(id);
			$("#PO_ID").val(po_id);
			$("#PK").val(id);
			$("#fundsReturn").dialog({modal:true, autoOpen:false, width:600});
			$("#fundsReturn").dialog("open");
		}
		
		function payMoneyPass(num){
			$("#num").val(num);
			$("#funds_return_form").submit();
		}
		</script>		
	</head>
	<body>
		<form id="form1" name="form1" method="POST"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" id="__action" value="payMoney.queryPayMoney" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;乘用车佣金付款管理</span>
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
					      <td>拨款类别：</td>
				          <td><select id="BACKSTATE" name="BACKSTATE" style=" width: 80px; height: 18px;">
								<option value="0" <c:if test="${BACKSTATE eq 0 }">selected='selected'</c:if>>设备款</option>
								<option value="1" <c:if test="${BACKSTATE eq 1 }">selected='selected'</c:if>>保证金拨款</option>
								<option value="2" <c:if test="${BACKSTATE eq 2 }">selected='selected'</c:if>>奖金拨款</option>
								<option value="3" <c:if test="${BACKSTATE eq 3 }">selected='selected'</c:if>>保险费</option>
								<option value="4" <c:if test="${BACKSTATE eq 4 }">selected='selected'</c:if>>法务费用</option>
								<option value="5" <c:if test="${BACKSTATE eq 5 }">selected='selected'</c:if>>退款</option>
								<option value="9" <c:if test="${BACKSTATE eq 9 }">selected='selected'</c:if>>手续费</option>
								<option value="10" <c:if test="${BACKSTATE eq 10 }">selected='selected'</c:if>>佣金</option>
							</select>
					      </td>
					      <td>状态：</td>
				          <td><select id="shen_pi_STATE" name="shen_pi_STATE" style=" width: 80px; height: 18px;">
				                <option value="9" <c:if test="${shen_pi_STATE eq 9 }">selected='selected'</c:if>>全部</option>   
								<option value="0" <c:if test="${shen_pi_STATE eq 0 }">selected='selected'</c:if>>审核中</option>
								<option value="1" <c:if test="${shen_pi_STATE eq 1 }">selected='selected'</c:if>>完成拨款</option>
								<option value="2" <c:if test="${shen_pi_STATE eq 2 }">selected='selected'</c:if>>驳回</option>
							</select>
					      </td>
				          </tr>
				          <tr>
				          <td>查询内容：</td>
				          <td colspan="3"><input type="text" name="QSEARCH_VALUE" value="${QSEARCH_VALUE }" 
				          style=" width:250px;height:18px; font-size: 12px;">
				          </td>
				          <td>&nbsp;</td>
					      <td>&nbsp;</td>
				          </tr>
				          </table>
				          
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width=""><a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
	          		</div>
				<div class="ui-state-default ui-jqgrid-hdiv ">
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr >
						<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
						</tr>
					</table>
						<table class="grid_table">
							<thead>
								<tr>
									<th>
										状态
									</th>
									<th>
										拨款流水号
									</th>
									<th>
										请款单位
									</th>
									<th>
										开户行
									</th>
									<th>
										账号
									</th>
									<th>
										拨款金额
									</th>
									<th>
										申请日期
									</th>
									<th>
										申请人
									</th>
									<th>
										操作
									</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${dw.resultList}" var="item" varStatus="status">												
									<tr>
										<td style="cursor: pointer;text-align: center;"><c:if test="${item.STATUS==0 and item.STATE==3 }"><img src="${ctx }/images/u611.gif" title="完成拨款"></c:if><c:if test="${item.STATUS==0 and (item.STATE==0 or item.STATE==1)}"><img src="${ctx }/images/u608.gif" title="审核中"></c:if><c:if test="${item.STATUS==1 }"><img src="${ctx }/images/u622.gif" title="驳回"></c:if></td>
										<td style="text-align: center;">${item.ORDER_CODE }&nbsp;</td>
										<td style="text-align: center;">${item.BACKCOMP }&nbsp;</td>
										<td style="text-align: center;">${item.BANK_NAME }</td>
										<td style="text-align: center;">${item.BANK_ACCOUNT }</td>
										<td style="text-align: center;">￥<fmt:formatNumber value="${item.PAY_MONEY }" pattern="#,###,##0.00"/>&nbsp;</td>
										<td style="text-align: center;"><fmt:formatDate value="${item.APPLICATION_DATE }" pattern="yyyy-MM-dd"/>&nbsp;</td>
										<td style="text-align: right;">${item.NAME }&nbsp;</td>
									    <td style="text-align: center;">
									    	<c:if test="${item.STATE==1 and auditPayMoney}">
									    		<a href="javaScript:void(0);" onclick="showEditPayMoneyReviewRecord('${item.ID }','${item.BACKCOMP }','${item.PAY_MONEY }','${item.BANK_ACCOUNT }','${item.BANK_NAME }','<fmt:formatDate value="${item.APPLICATION_DATE }" pattern="yyyy-MM-dd"/>','${item.PO_ID }','${item.PAY_WAY }');">审批</a>&nbsp;
									    	</c:if>
									    	<c:if test="${item.STATE==3 }">已通过</c:if>
									    	<c:if test="${item.STATE==4 }">已驳回</c:if>
									    </td>
									</tr>
								</c:forEach>
								
							</tbody>
						</table>
						<page:pagingToolbar pagingInfo="${dw }"/>
						<table class="STYLE2" width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="right">
										<img src="${ctx }/images/u608.gif">
										审核中
										<img src="${ctx }/images/u611.gif">
										完成拨款&nbsp;
										<img src="${ctx }/images/u622.gif">
										驳回
									</td>
								</tr>
							</tbody>
						</table>
				</div>
			</div>
		</div>
		</form>
<div style="display:none;" id="fundsReturn" title="当前位置——乘用车佣金付款审批">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
			<div class="ui-widget-content jqgrow ui-row-ltr ">
				<form action="${ctx }/servlet/defaultDispatcher?__action=payMoney.updateHandlingChargePass" id="funds_return_form" method="post">
				<input type="hidden" id="PK" name="PK" />
				<input type="hidden" id="PO_ID" name="PO_ID" />
				<input type="hidden" id="ID" name="ID" />
				<input type="hidden" id="num" name="num" />
				<input type="hidden" name="BACKSTATE" value="10" />
				<table class="panel_table">
					<tr>
						<th align="right">受款人:</th>
						<td><input type="text" name="payee" id="payee" class="tb_return" readonly="readonly" size="40"/></td>
						<th align="right">申请日期</th>
						<td><input type="text" id="application_date" name="application_date" class="tb_return" readonly="readonly"/></td>
					</tr>
					<tr>
						<th align="right">金额:</th>
						<td><input type="text" name="amount" id="amount" class="tb_return" readonly="readonly"/></td>
						<th align="right">支付方式:<font style="color: red;">*</font></th>
						<td>
							<input type="text" name="pay_type" id="pay_type" class="tb_return" readonly="readonly"/>
						</td>
					</tr>
					<tr>
						<th align="right">银行名称:</th>
						<td><input type="text" id="bank_name" name="bank_name" class="tb_return" readonly="readonly" size="40"/></td>
						<th align="right">银行账号:</th>
						<td><input type="text" name="bank_account" id="bank_account" class="tb_return" readonly="readonly"/></td>
					</tr>
					<tr>
						<th colspan="4" id="button_flag" style="text-align: center;">
							<input class="panel_button" type="button" id="buttonAdd" value="通过" onclick="payMoneyPass('0')" style="cursor:pointer"></input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input class="panel_button" type="button" value="驳回" onclick="payMoneyPass('1')" style="cursor:pointer"></input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" value="关&nbsp;闭" onclick="$('#fundsReturn').dialog('close');" class="panel_button" style="cursor:pointer">
						</th>
					</tr>
				</table>
				</form>
			</div>
		</div>
	</div>
</div>					
	</body>
</html>