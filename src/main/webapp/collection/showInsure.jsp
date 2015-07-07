<%@ page language="java" pageEncoding="utf-8"%>
<script type="text/javascript" src="${ctx }/collection/js/selectInsureItem.js"></script>
<script type="text/javascript">
$(function(){
	
	$("#insureTotalSpan").html(atoc(${insureTotal}));
});
var insureTypeData = ${insureTypeJsonList}

</script>
<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="insureTab">
	<tr>
		<td colspan="4" style="text-align: left;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head">
			<strong>保险费</strong>
		</td>
		<td colspan="2" style="text-align: left;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head">
			&nbsp;
		</td>
	</tr>
	<tr>
		<th width="20%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			保险项目
		</th>
		<th width="20%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			保险期间
		</th>
		<th width="10%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			保险费率
		</th>
		<th width="18%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			保险费用
		</th>
		<th width="27%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			备注
		</th>
	</tr>
	<c:set  var="insureTotal" value="0"></c:set>
	<c:forEach items="${paylist.payInusres }" var="item">
		<tr>
			<td style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
					<c:forEach items="${insureTypeList }" var="insureTypeList">
					 <c:if test="${insureTypeList.INTP_ID eq item.INSURE_ITEM }">${insureTypeList.INTP_NAME }</c:if>
					 </c:forEach>
			</td>
			<td style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				 ${item.START_DATE } 
				到
				 ${item.END_DATE }
			</td>
			<td style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				${item.INSURE_RATE }%
			</td>
			<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
				 <fmt:formatNumber value="${item.INSURE_PRICE }" type="currency" /> 
			</td>
			<td style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				 ${item.MEMO } 
			</td>
		</tr>
		<c:set  var="insureTotal" value="${insureTotal + item.INSURE_PRICE}"></c:set>
	</c:forEach>
	<tr>
		<td style="text-align: left;height: 24px;" colspan="4" class="ui-widget-content jqgrow ui-row-ltr">
			合计（大写）：<!--  <script type="text/javascript">document.write(atoc(${insureTotal}));</script>-->
			<span id="insureTotalSpan"></span>
		</td>
		<td style="text-align: left;height: 24px;" colspan="2" class="ui-widget-content jqgrow ui-row-ltr">
			（小写：<fmt:formatNumber type="currency" value="${insureTotal }" />）
		</td>
	</tr>

</table>
