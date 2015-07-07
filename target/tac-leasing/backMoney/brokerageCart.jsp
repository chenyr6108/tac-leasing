<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>乘用车佣金请款</title>
		<script type="text/javascript">
			$(function (){
			});
		
			function checkAll(e){
				$("input[type='checkbox'][name='credit_ids']").each(function (){
					$(this).attr("checked", $(e).attr("checked"));
				});
			}
			
			function delSelectedItems(){
				var credit_ids = "";
				$("input[type='checkbox'][name='credit_ids']:checked").each(function (){
					credit_ids += $.trim($(this).val()) + ",";
				});
				if(credit_ids.length > 0){
					if(confirm("确定要删除所选项吗？")){
						delItems(credit_ids);
					}
					
				} else {
					alert("请至少选择一项。");
				}
				
			}
			
			function delFromCart(credit_ids){
				if(confirm("确定要删除吗？")){
					delItems(credit_ids);
				}
			}
			
			function delItems(delStr){
				$("#delStr").val(delStr);
				$("#form1").submit();
			}
			
			function delAllItems(){
				if(confirm("确定要清空吗？")){
					var delItems = "${cart.items}";
					$("#delStr").val(delItems);
					$("#form1").submit();
				}
			}
			
			function backPage(){
				$("#__action").val("backMoney.queryBrokerage");
				$("#form1").submit();
			}
			
			function doPay(){
				$("#__action").val("backMoney.doPayBrokerage");
				$("#form1").submit();
			}
			
		</script>		
	</head>
	<body>
		<form id="form1" name="form1" method="POST"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" id="__action" value="backMoney.delItemFromCartForBrokerage" />
			<input type="hidden" name="delStr" id="delStr" />
			<input type="hidden" name="allItems" id="allItems" value="${cart.items}" />
		</form>
	
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;乘用车佣金请款</span>
	   	</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	         <div class="zc_grid_body jqgrowleft">
			<div class="ui-state-default ui-jqgrid-hdiv ">
				<table style="width: 100%;" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<input type="button" value="删除选择" class="panel_button" onclick="delSelectedItems();"/>
							&nbsp;
							<input type="button" value="清空" class="panel_button" onclick="delAllItems();"/>
						</td>
					</tr>
				</table>
				<table class="grid_table">
					<tr>
						<th>
							<input type="checkbox" onclick="checkAll(this);"/>
						</th>
						<th>
							序号
						</th>
						<th>
							案件号
						</th>
						<th>
							合同编号
						</th>
						<th>
							客户名称
						</th>
						<th>
							办事处
						</th>
						<th>
							办事处主管
						</th>
						<th>
							客户经理
						</th>
						<th>
							佣金
						</th>
						<th>
							操作
						</th>
					</tr>
					<c:set var="outPayTotal" value="0"/>
					<c:forEach items="${resultList}" var="item" varStatus="status">	
						<tr>
							<td>
								<input type="checkbox" name="credit_ids" value="${item.CREDIT_ID}">
							</td>
							<td style="text-align: center;">${status.count }&nbsp;</td>
							<td style="text-align: center;">${item.CREDIT_RUNCODE }&nbsp;</td>
							<td style="text-align: center;">${item.LEASE_CODE }&nbsp;</td>
							<td style="text-align: center;">${item.CUST_NAME }</td>
							<td style="text-align: center;">${item.DECP_NAME_CN }</td>
							<td style="text-align: center;">${item.UU_NAME }&nbsp;</td>
							<td style="text-align: center;">${item.U_NAME }&nbsp;</td>
							<td style="text-align: right;">￥<fmt:formatNumber value="${item.SALES_PAY }" pattern="#,###,##0.00"/> &nbsp;</td>
							<td style="text-align: center;">
								<a href="javascript:void(0);" onclick="delFromCart('${item.CREDIT_ID}');">删除</a>
								&nbsp;
							</td>
						</tr>
						<c:set var="outPayTotal" value="${outPayTotal + item.SALES_PAY }"/>
					</c:forEach>
					<tr>
						<th colspan="8" style="text-align: right;">
							合计金额：
						</th>
						<td style="text-align: right; font-weight: bold;">￥<fmt:formatNumber value="${outPayTotal }" pattern="#,###,##0.00"/> &nbsp;</td>
						<th>&nbsp;</th>
					</tr>
					<tr>
						<th colspan="8" style="text-align: left; border: 0px;">
							<input type="button" value="继续选择" class="panel_button" onclick="backPage();"/>
						</th>
						<th style="text-align: right; border: 0px;">
							<input type="button" value="申请拨款" class="panel_button" onclick="doPay();"/>
						</th>
						<th style="text-align: right; border: 0px;">&nbsp;</th>
					</tr>
				</table>
			</div>
			</div>
			</div>
			
	</body>
</html>