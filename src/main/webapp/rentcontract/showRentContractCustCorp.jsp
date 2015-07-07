<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<table  width="92%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
	<tr>
		<td colspan="10" class="ui-state-default ui-th-ltr zc_grid_head" >
			<b>融资租赁合同(法人)</b>
		</td>
	</tr>
	<tr>
		<td width="15%" class="ui-widget-content jqgrow ui-row-ltr">
			融资租赁合同编号
		</td>
		<td width="25%" class="ui-widget-content jqgrow ui-row-ltr">
			${rentContract.LEASE_CODE } &nbsp; 
		</td>
		<td width="17%" class="ui-widget-content jqgrow ui-row-ltr">
			客户编号
		</td>
		<td width="43%" class="ui-widget-content jqgrow ui-row-ltr">
			${rentContract.CUST_CODE } &nbsp; 
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			客户名称
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			${rentContract.CUST_NAME } &nbsp; 
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			组织机构代码证
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			${rentContract.CORP_ORAGNIZATION_CODE } &nbsp; 
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			开户银行
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			${rentContract.OPEN_BANK } &nbsp; 
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			银行帐号
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			${rentContract.BANK_ACCOUNTS } &nbsp; 
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			电话
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			${rentContract.CUST_PHONE } &nbsp; 
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			传真
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			${rentContract.CUST_FAX } &nbsp; 
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			联系人
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			${rentContract.CUST_LINKMAN } &nbsp; 
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			邮编
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			${rentContract.CUST_ZIP } &nbsp; 
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			地址
		</td>
		<td colspan="3" class="ui-widget-content jqgrow ui-row-ltr">
			${rentContract.CUST_ADDRESS } &nbsp; 
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			公司
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<c:forEach items="${companyList}" var="item">
				<c:if test="${rentContract.DECP_ID eq item.DECP_ID}">${item.DECP_NAME_CN }</c:if>
			</c:forEach> &nbsp; 
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			合同所属省市
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<c:forEach items="${provinces}" var="item">
				<c:if test="${rentContract.PROVINCE_ID eq item.ID}">${item.NAME }</c:if>
			</c:forEach>
			&nbsp;
			<c:forEach items="${citys}" var="item">
				<c:if test="${rentContract.CITY_ID eq item.ID}">${item.NAME }</c:if>
			</c:forEach> &nbsp; 
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			合同类型
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<c:forEach items="${contractType}" var="item">
				<c:if test="${rentContract.RECT_TYPE eq item.CODE }">${item.FLAG }</c:if>
			</c:forEach> &nbsp; 
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;
		</td>
	</tr>
</table>
