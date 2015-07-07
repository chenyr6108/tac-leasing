<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<script src="${ctx }/rentcontract/js/area.js" type="text/javascript"></script>
<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
           				<div class="zc_grid_body jqgrowleft">
        <div class="ui-state-default ui-jqgrid-hdiv ">
<table width="982" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
	<tr>
		<td colspan="10" style="height: 26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
			<b>&nbsp;&nbsp;融资租赁合同录入(自然人)</b>
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
			<select id="id_card_type" name="id_card_type">
									<option value="1" <c:if test="${cust.ID_CARD_TYPE eq 1 }">selected='selected'</c:if>>身份证号码</option>
		                    		<option value="2" <c:if test="${cust.ID_CARD_TYPE eq 2 }">selected='selected'</c:if>>港澳台通行证</option>
		                    		<option value="3" <c:if test="${cust.ID_CARD_TYPE eq 3 }">selected='selected'</c:if>>护照</option>
		                    		<option value="4" <c:if test="${cust.ID_CARD_TYPE eq 4 }">selected='selected'</c:if>>其他</option>
								</select>
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<input name="NATU_IDCARD" id="NATU_IDCARD"  style="width: 200px;" value="${cust.NATU_IDCARD }">
		</td>		
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			电话
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<input name="CUST_PHONE"  style="width: 200px;"  id="CUST_PHONE" onblur="if(!checkPhone(this.value)){alert('电话格式不正确！');this.value='';};"
				value="${cust.NATU_MOBILE }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			传真
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<input name="CUST_FAX"  style="width: 200px;" id="CUST_FAX" onblur="if(!checkPhone(this.value)){alert('传真格式不正确！');this.value='';};"
				value="${cust.NATU_FAX }"><font color="red"> 例：(010)-82899093或01082899093 </font>
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			配偶
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<input name="NATU_MATE_NAME" id="NATU_MATE_NAME" style="width: 200px;" value="${cust.NATU_MATE_NAME }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			配偶身份证号
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<input name="NATU_MATE_IDCARD" id="NATU_MATE_IDCARD"  style="width: 200px;"  value="${cust.NATU_MATE_IDCARD }">
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			联系人
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<input name="CUST_LINKMAN" id="CUST_LINKMAN" style="width: 200px;" value="${cust.CUST_LINKMAN }">
		</td>
	</tr>	
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			地址
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<input name="CUST_ADDRESS" id="CUST_ADDRESS" value="${cust.NATU_HOME_ADDRESS }" style="width: 200px;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			邮编
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<input name="CUST_ZIP" id="CUST_ZIP"  style="width: 200px;"  value="${cust.NATU_ZIP }">
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