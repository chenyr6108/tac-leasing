<%@ page language="java" pageEncoding="utf-8"%>

<table align="center" width="92%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" >
	<tr>
		<td align="left" colspan="4"   class="ui-state-default ui-th-ltr zc_grid_head">
			<strong>保险费</strong>
		</td>
		<td align="left" colspan="2"   class="ui-state-default ui-th-ltr zc_grid_head">
			 &nbsp; 
		</td>
	</tr>
	<tr>
		<th width="20%" class="ui-widget-content jqgrow ui-row-ltr">
			保险项目
		</th>
		<th width="20%" class="ui-widget-content jqgrow ui-row-ltr">
			保险期间
		</th>
		<th width="10%" class="ui-widget-content jqgrow ui-row-ltr">
			保险费率
		</th>
		<th width="18%" class="ui-widget-content jqgrow ui-row-ltr">
			保险费用
		</th>
		<th width="27%" class="ui-widget-content jqgrow ui-row-ltr">
			备注
		</th>
	</tr>
	<c:set var="insureTotal" value="0"></c:set>
	<c:forEach items="${insureList }" var="item" varStatus="status">
		<c:set var="insureTotal" value="${insureTotal + item.INSURE_PRICE}"></c:set>
		<tr>
			<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
				<c:forEach items="${insureTypeList }" var="insureTypeList">
					<c:if test="${insureTypeList.INTP_ID eq item.INSURE_ITEM }">${insureTypeList.INTP_NAME }</c:if>
				</c:forEach> &nbsp; 
			</td>
			<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
				${item.START_DATE } 到 ${item.END_DATE } &nbsp; 
			</td>
			<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
				${item.INSURE_RATE } % &nbsp; 
			</td>
			<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.INSURE_PRICE }" type="currency" /> &nbsp; 
			</td>
			<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
				 ${item.MEMO } &nbsp; 
			</td>
		</tr>
	</c:forEach>
	<tr>
		<td align="left" colspan="4" class="ui-widget-content jqgrow ui-row-ltr">
			合计（大写）：
			<span id="showInsureTotalSpanUpper"> <script
					type="text/javascript">document.write(atoc(${insureTotal}));</script>
			</span>
		</td>
		<td align="left" colspan="2" class="ui-widget-content jqgrow ui-row-ltr">
			（小写：
			<span id="showInsureTotalSpan"> <fmt:formatNumber
					type="currency" value="${insureTotal }" /> </span> ）
		</td>
	</tr>
</table>
