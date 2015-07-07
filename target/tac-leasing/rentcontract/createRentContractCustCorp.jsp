<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<script src="${ctx }/rentcontract/js/area.js" type="text/javascript"></script>
<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
           				<div class="zc_grid_body jqgrowleft">
        <div class="ui-state-default ui-jqgrid-hdiv ">
<table width="982" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
	<tr>
		<td colspan="10" style="height: 26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
			<b>&nbsp;&nbsp;融资租赁合同录入(法人)</b>
		</td>
	</tr>
	<tr>
		<td width="15%" class="ui-widget-content jqgrow ui-row-ltr">
			融资租赁合同编号
		</td>
		<td width="25%" class="ui-widget-content jqgrow ui-row-ltr">
			<input type="text" style="width: 200px;" name="LEASE_CODE" readonly="readonly"
				id="LEASE_CODE" value="${cust.LEASE_CODE }">
		</td>
		<td width="17%" class="ui-widget-content jqgrow ui-row-ltr">
			客户编号
		</td>
		<td width="43%" class="ui-widget-content jqgrow ui-row-ltr">
			${cust.CUST_CODE }
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			客户名称
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<input name="CUST_NAME" id="CUST_NAME"  style="width: 200px;" readonly="readonly" value="${cust.CUST_NAME }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			组织机构代码证
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<input name="CORP_ORAGNIZATION_CODE" id="CORP_ORAGNIZATION_CODE"  style="width: 200px;"
				value="${cust.CORP_ORAGNIZATION_CODE }">
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			开户银行
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<input name="OPEN_BANK" id="OPEN_BANK" value="${cust.OPEN_BANK }" style="width: 200px;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			银行帐号
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<input name="BANK_ACCOUNTS"  style="width: 200px;" id="BANK_ACCOUNTS" onblur="if(checkNumber(this.value)){}else{alert('银行帐号不正确！');this.value='';}"
				value="${cust.BANK_ACCOUNTS }">
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			电话
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<input name="CUST_PHONE"  style="width: 200px;"  id="CUST_PHONE" onblur="if(!checkPhone(this.value)){alert('电话格式不正确！');this.value='';};"
				value="${cust.CORP_COMPANY_PHONE }"> 
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			传真
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<input name="CUST_FAX"  style="width: 200px;" id="CUST_FAX" onblur="if(!checkPhone(this.value)){alert('传真格式不正确！');this.value='';};"
				value="${cust.CORP_COMPANY_FAX }"><font color="red"> 例：(010)-82899093或01082899093 </font>
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			联系人
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<input name="CUST_LINKMAN" id="CUST_LINKMAN" style="width: 200px;" value="${cust.CUST_LINKMAN }${cust.LINK_MAN }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			邮编
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<input name="CUST_ZIP" id="CUST_ZIP"  style="width: 200px;"  value="${cust.CORP_COMPANY_ZIP }${cust.LINK_POSTCODE }">
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			注册地址
		</td>
		<td colspan="3" class="ui-widget-content jqgrow ui-row-ltr">
			<input name="CORP_REGISTE_ADDRESS" id="CORP_REGISTE_ADDRESS"
				value="${cust.CORP_REGISTE_ADDRESS}" style="width: 550px;">
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			实际经营地
		</td>
		<td colspan="3" class="ui-widget-content jqgrow ui-row-ltr">
			<input name="CORP_WORK_ADDRESS" id="CORP_WORK_ADDRESS"
				value="${cust.CORP_WORK_ADDRESS}" style="width: 550px;">
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			公司
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<select name="DECP_ID" id="DECP_ID">
				<option value="-1">
					--请选择--
				</option>
				<c:forEach items="${companyList}" var="item">
					<option value="${item.DECP_ID }" <c:if test="${cust.DECP_ID eq item.DECP_ID}">selected="selected"</c:if>>${item.DECP_NAME_CN }</option>
				</c:forEach>
			</select>
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			合同所属省市
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<select id="PROVINCE_ID" name="PROVINCE_ID" onchange="getCitys();">
				<option value="-1" selected="selected">
					-请选择省份-
				</option>
				<c:forEach items="${provinces}" var="item">
					<option value="${item.ID }" <c:if test="${cust.PROVINCE_ID eq item.ID}">selected="selected"</c:if>>${item.NAME }</option>
				</c:forEach>
			</select>
			<select id="CITY_ID" name="CITY_ID" onchange="getArea();">
				<option value="-1" selected="selected">
					-请选择市区-
				</option>
				<c:forEach items="${citys}" var="item">
					<option value="${item.ID }" <c:if test="${cust.CITY_ID eq item.ID}">selected="selected"</c:if>>${item.NAME }</option>
				</c:forEach>
			</select>
			<select id="AREA_ID" name="AREA_ID">
				<option value="-1" selected="selected">
					-请选择区-
				</option>
				<c:forEach items="${area}" var="item">
					<option value="${item.ID }" <c:if test="${cust.AREA_ID eq item.ID}">selected="selected"</c:if>>${item.NAME }</option>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			合同类型
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<select name="RECT_TYPE" id="RECT_TYPE">
				<option value="-1">
					--请选择--
				</option>
				<c:forEach items="${contractType}" var="item">
					<option value="${item.CODE }" <c:if test="${cust.CONTRACT_TYPE eq item.CODE }">selected="selected"</c:if>>${item.FLAG }</option>
				</c:forEach>
			</select>
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;
		</td>
	</tr>
</table>
</div>
</div>
</div>