<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<form id="" name="" method="POST" action="#">
<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
				id="main">
				<div class="zc_grid_body jqgrowleft">
					<div class="ui-state-default ui-jqgrid-hdiv ">
	<table border="0" align="center" class="ui-jqgrid-htable zc_grid_title">
		<thead>
			<tr>
				<td style="width:4%" class="ui-state-default ui-th-ltr zc_grid_head">
					&nbsp;
				</td>
				<td  style="width:14%;text-align:center " class="ui-state-default ui-th-ltr zc_grid_head">
					单据编号
				</td >
				<td style=" text-align:center"  class="ui-state-default ui-th-ltr zc_grid_head">
					用途
				</td>
				<td style="width:11%; text-align:center" class="ui-state-default ui-th-ltr zc_grid_head"> 
					金额
				</td>
				<td  style="width:11%; text-align:center" class="ui-state-default ui-th-ltr zc_grid_head">
					类型
				</td>
				<td  style="width:10%; text-align:center" class="ui-state-default ui-th-ltr zc_grid_head">
					时间
				</td>
				<td style="width:4%;text-align:center" class="ui-state-default ui-th-ltr zc_grid_head">
					操作
				</td>
				
			</tr>
		</thead>
		<tbody >
			<c:forEach items="${custLinkExpense}" var="item" varStatus="status">
				<tr id="CustLinkExpense${item.CULE_ID }" class="ui-widget-content jqgrow ui-row-ltr">
					<td style=" text-align:center" >${status.count }</td>
					<td style=" text-align:center"  >${item.INVOICE_CODE }&nbsp;</td>
					<td >${item.LINK_PURPOSE }&nbsp;</td>
					<td style=" text-align:right" >${item.LINK_MONEY }&nbsp;</td>
					<td style=" text-align:center"  class="ui-widget-content jqgrow ui-row-ltr"><c:if test="${item.LINK_TYPE eq 1}">餐饮</c:if><c:if test="${item.LINK_TYPE eq 2}">交通</c:if><c:if test="${item.LINK_TYPE eq 3}">住宿</c:if><c:if test="${item.LINK_TYPE eq 4}">通讯</c:if><c:if test="${item.LINK_TYPE eq 5}">礼品</c:if><c:if test="${item.LINK_TYPE eq 6}">办公</c:if><c:if test="${item.LINK_TYPE eq 7}">其他</c:if></td>
					<td style=" text-align:center" >${item.LINK_DATE }&nbsp;</td>
					<td  style="width:4%; text-align:center"> <c:if test="${item.STATUS eq 0}"><a href="javascript:void(0)" onclick="readLinkExpense('${item.CULE_ID }')">查看详细</a></c:if> &nbsp;</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	</div>
	</div>
</form>
<div id="AddCustLinkExpense" style="display: none" title="添加联系人">
	<form action="#" method="post" id="DivAddCustLinkExpenseForm">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
    <div class="zc_grid_body jqgrowleft">
	<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title"  >
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>负责人</td>
						<td id="ExLINK_PRINCIPAL">&nbsp;</td>
						<td>单据编号</td>
						<td id="ExINVOICE_CODE">&nbsp;</td>
						
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>用途</td>
						<td id="ExLINK_PURPOSE">&nbsp;</td>
						<td>类型</td> 
						<td  id="ExLINK_TYPE">&nbsp;</td>
				</tr >
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>客户</td>
						<td>${cust.CUST_NAME }</td>
						<td>日期</td>
						<td id="ExLINK_DATE">&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>金额</td>
						<td  id="ExLINK_MONEY" >&nbsp;</td>
						<td>货币</td>
						<td id="ExCURRENCY" >&nbsp;</td>
				  </tr>
				  <tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>经手人</td>
						<td colspan="3" id="ExpenseHANDLE_MAN">&nbsp;</td>
						 
				  </tr>
				  
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>备注</td>
						<td colspan="3"   id="ExLINK_MEMO">&nbsp;</td>
				</tr>
							</table>
							<center>
							<input type="button" value="关闭" class="ui-state-default ui-corner-all"  onclick="closeAddCustLinkExpense()">
							<input type="reset" value="重置" class="ui-state-default ui-corner-all" id="LinkExpense_reset" style="display:none" >
							</center>
							</div>
							</div>
							</div>
	</form>
</div>