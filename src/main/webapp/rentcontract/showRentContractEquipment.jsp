<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<table id="equipmentTab" align="center"  width="92%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
	<tr>
		<td colspan="8"  class="ui-state-default ui-th-ltr zc_grid_head">
			<strong>客户购买意向</strong>
		</td>
		<td colspan="3"  class="ui-state-default ui-th-ltr zc_grid_head">
			&nbsp;
		</td>
	</tr>
	<tr>
		<th align="center" width="10%"class="ui-widget-content jqgrow ui-row-ltr">
			<strong>制造商</strong>
		</th>
		<th align="center" width="10%"class="ui-widget-content jqgrow ui-row-ltr">
			<strong>厂牌</strong>
		</th>
		<th align="center" width="10%"class="ui-widget-content jqgrow ui-row-ltr">
			<strong>产品名称</strong>
		</th>
		<th align="center" width="6%"class="ui-widget-content jqgrow ui-row-ltr">
			<strong>规格型号</strong>
		</th>
		<th align="center" width="5%"class="ui-widget-content jqgrow ui-row-ltr">
			<strong>机号</strong>
		</th>
		<th align="center" width="10%"class="ui-widget-content jqgrow ui-row-ltr">
			<strong>供应商</strong>
		</th>
		<th align="center" width="10%"class="ui-widget-content jqgrow ui-row-ltr">
			<strong>留购价(元)</strong>
		</th>
		<th align="center" width="10%"class="ui-widget-content jqgrow ui-row-ltr">
			<strong>含税单价(元)</strong>
		</th>
		<th align="center" width="10%"class="ui-widget-content jqgrow ui-row-ltr">
			<strong>单价(元)</strong>
		</th>
		<th align="center" width="4%"class="ui-widget-content jqgrow ui-row-ltr">
			<strong> 数量</strong>
		</th>
		<th align="center" width="5%"class="ui-widget-content jqgrow ui-row-ltr">
			<strong> 单位</strong>
		</th>
		<th align="center" width="10%"class="ui-widget-content jqgrow ui-row-ltr">
			<strong> 合计</strong>
		</th>
		<th align="center" width="10%"class="ui-widget-content jqgrow ui-row-ltr">
			<strong>备注</strong>
		</th>
	</tr>
	<c:set value="0" var="euqipTotal"></c:set>
	<c:forEach items="${equipmentList }" var="item" varStatus="status">
		<c:set value="${euqipTotal + item.UNIT_PRICE * item.AMOUNT}"
			var="euqipTotal"></c:set>
		<tr>
			<td align="center"class="ui-widget-content jqgrow ui-row-ltr">
				${item.MANUFACTURER } &nbsp; 
			</td>
			<td align="center"class="ui-widget-content jqgrow ui-row-ltr">
				${item.THING_KIND } &nbsp; 
			</td>
			<td align="center"class="ui-widget-content jqgrow ui-row-ltr">
				${item.THING_NAME } &nbsp; 
			</td>
			<td align="center"class="ui-widget-content jqgrow ui-row-ltr">
				${item.MODEL_SPEC } &nbsp; 
			</td>
			<td align="center"class="ui-widget-content jqgrow ui-row-ltr">
				${item.THING_NUMBER } &nbsp; 
			</td>
			
			<td align="center"class="ui-widget-content jqgrow ui-row-ltr">
				${item.BRAND } &nbsp; 
			</td>
			<td align="right"class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.STAYBUY_PRICE }" type="currency" /> &nbsp; 
			</td>
			<td align="right"class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.SHUI_PRICE }" type="currency" /> &nbsp; 
			</td>
			<td align="right"class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.UNIT_PRICE }" type="currency" /> &nbsp; 
			</td>
			<td align="center"class="ui-widget-content jqgrow ui-row-ltr">
				${item.AMOUNT } &nbsp; 
			</td>
			<td align="center"class="ui-widget-content jqgrow ui-row-ltr">
				<c:if test="${item.UNIT eq '台' }">台</c:if>
				<c:if test="${item.UNIT eq '辆' }">辆</c:if>
				<c:if test="${item.UNIT eq '套' }">套</c:if>
				<c:if test="${item.UNIT eq '件' }">件</c:if> &nbsp; 
			</td>
			<td align="right"class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.UNIT_PRICE * item.AMOUNT}" type="currency" /> &nbsp; 
			</td>
			<td align="center"class="ui-widget-content jqgrow ui-row-ltr">
				${item.MEMO } &nbsp; 
			</td>
		</tr>

	</c:forEach>

	<tr>
		<td colspan="8"class="ui-widget-content jqgrow ui-row-ltr">
			合计（大写）：
			<span id="totalUpper"><script type="text/javascript">document.write(atoc(${euqipTotal }));</script>
			</span>
		</td>
		<td colspan="5"class="ui-widget-content jqgrow ui-row-ltr">
			（小写：￥）
			<fmt:formatNumber value="${euqipTotal}" type="currency" />
		</td>
	</tr>
</table>