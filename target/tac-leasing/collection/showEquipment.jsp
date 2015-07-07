<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript">
$(function(){
	$("#equipmentTotalMoneySpan").html(atoc(${paylist.LEASE_TOPRIC }));
});

</script>
<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
	<tr>
		<td colspan="11" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: left ;height: 24px;"> 
			<b>设备列表</b>
		</td>
	</tr>
	<tr >
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			序号
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			产品厂牌
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			设备名称
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			设备型号
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			供应商
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			含税单价
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			单价
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			数量
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			单位
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			锁码方式
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			备注			
		</td>
	</tr>
	<c:forEach items="${paylist.payEquipments}" var="item" varStatus="status">
		<tr>
			<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				<input type="hidden" name="RECD_ID" value="${item.RECD_ID }">
				${status.count }
			</td>
			<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				${item.THING_KIND }
			</td>
			<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				${item.THING_NAME }
			</td>
			<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				${item.MODEL_SPEC }
			</td>
			<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				${item.BRAND }
			</td>
			<td style="text-align: right ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber type="currency" value="${item.SHUI_PRICE }" />&nbsp;
			</td>
			<td style="text-align: right ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber type="currency" value="${item.UNIT_PRICE }" />
			</td>
			<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				${item.AMOUNT }
			</td>
			<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				${item.UNIT }
			</td>
			<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				<c:forEach items="${lockList}" var="items">${item.LOCK_CODE == items.CODE ? items.FLAG : ""}</c:forEach>&nbsp; 
			</td>
			<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				${item.memo }&nbsp;
			</td>
		</tr>
	</c:forEach>
	<tr>
		<td style="text-align: left ;height: 24px;" colspan="5" class="ui-widget-content jqgrow ui-row-ltr">
			(大写：<!--  <script type="text/javascript">document.write(atoc(${paylist.LEASE_TOPRIC }))</script>)-->
			<span id="equipmentTotalMoneySpan"></span>)
		</td>
		<td style="text-align: left ;height: 24px;" colspan="6" class="ui-widget-content jqgrow ui-row-ltr">
			合计（小写）：<fmt:formatNumber type="currency" value="${paylist.LEASE_TOPRIC }" />
		</td>
	</tr>
</table>