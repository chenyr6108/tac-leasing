<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>	
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<form id="" name="" method="POST" action="#">
<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
				id="main">
				<div class="zc_grid_body jqgrowleft">
					<div class="ui-state-default ui-jqgrid-hdiv ">
	<table border="0" align="center" class="ui-jqgrid-htable zc_grid_title" id="CuExpense1">
		<thead>
		<tr class="ui-jqgrid-labels"> 
				<th colspan="8" align="right" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right">
					操作：<a href="javascript:void(0)" onclick="showDivAddCustLinkExpense();">添加</a>
				</th>
			</tr>
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
				<td  style="width:11%; text-align:center" class="ui-state-default ui-th-ltr zc_grid_head">
					负责人
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
				<tr id="CustLinkExpense${item.CULE_ID }" >
					<td  class="ui-widget-content jqgrow ui-row-ltr" >${status.count }<input type="hidden" value="${status.count }" name="statusnumCount"></td>
					<td  class="ui-widget-content jqgrow ui-row-ltr"  >${item.INVOICE_CODE }&nbsp;</td>
					<td class="ui-widget-content jqgrow ui-row-ltr">${item.LINK_PURPOSE }&nbsp;</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">${item.LINK_MONEY }&nbsp;</td>
					<td   class="ui-widget-content jqgrow ui-row-ltr"><c:if test="${item.LINK_TYPE eq 1}">餐饮</c:if><c:if test="${item.LINK_TYPE eq 2}">交通</c:if><c:if test="${item.LINK_TYPE eq 3}">住宿</c:if><c:if test="${item.LINK_TYPE eq 4}">通讯</c:if><c:if test="${item.LINK_TYPE eq 5}">礼品</c:if><c:if test="${item.LINK_TYPE eq 6}">办公</c:if><c:if test="${item.LINK_TYPE eq 7}">其他</c:if></td>
					<td class="ui-widget-content jqgrow ui-row-ltr">${item.LINK_PRINCIPAL }&nbsp;</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" >${item.LINK_DATE }&nbsp;</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr"> <c:if test="${item.STATUS eq 0}"><a href="javascript:void(0)" onclick="deleteLinkExpense('${item.CULE_ID }')">删除</a></c:if> &nbsp;</td>
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
						<td><input type="text" name="ExLINK_PRINCIPAL" id="ExLINK_PRINCIPAL"></td>
						<td>单据编号</td>
						<td><input type="text" name="ExINVOICE_CODE" id="ExINVOICE_CODE"></td>
						
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>用途</td>
						<td><input type="text" name="ExLINK_PURPOSE" id="ExLINK_PURPOSE"></td>
						<td>类型</td> 
						<td ><select id="ExLINK_TYPE"><option value="1">餐饮</option><option value="2">交通</option><option value="3">住宿</option><option value="4">通讯</option><option value="5">礼品</option><option value="6">办公</option><option value="7">其他</option></select></td>
				</tr >
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>客户</td>
						<td><input type="text" name="CARELINK_CUSTOMER" id="CARELINK_CUSTOMER"  value="${cust.CUST_NAME }" readonly="readonly"></td>
						<td>日期</td>
						<td><input type="text" name="ExLINK_DATE" id="ExLINK_DATE"></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>金额</td>
						<td><input type="text" name="ExLINK_MONEY" id="ExLINK_MONEY"></td>
						<td>货币</td>
						<td><select id="ExCURRENCY" ><option value="0">人民币</option><option value="1">美元</option></select></td>
				  </tr>
				  <tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>经手人</td>
						<td><input type="text" name="ExpenseHANDLE_MAN" id="ExpenseHANDLE_MAN"></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
				  </tr>
				  
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>备注</td>
						<td colspan="3"><textarea name="ExLINK_MEMO" id="ExLINK_MEMO" cols="80" rows="3"></textarea></td>
				</tr>
							</table>
							<center>
							<input type="button" value="保存" class="ui-state-default ui-corner-all"  onclick="submitAddCustLinkExpense()">
							<input type="button" value="取消" class="ui-state-default ui-corner-all"  onclick="closeAddCustLinkExpense()">
							<input type="reset" value="重置" class="ui-state-default ui-corner-all" id="LinkExpense_reset" >
							</center>
							</div>
							</div>
							</div>
	</form>
</div>
