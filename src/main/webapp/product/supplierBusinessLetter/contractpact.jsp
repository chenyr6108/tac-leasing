<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
</script>
<div>
	<input type="hidden" name="PRCD_ID" id="PRCD_ID" value="" />
	<input type="hidden" name="RECT_ID" id="RECT_ID" value="" />
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" align="center">
		<div class="zc_grid_body ">
			<table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td  style="background-color: #e8e8e8;" width="100" rowspan="2"><strong>&nbsp;&nbsp;合同号</strong></td>
						<td align="center" style="background-color: #e8e8e8;" width="80" rowspan="2"><strong>&nbsp;&nbsp;客户名称</strong></td>
						<td align="center" style="background-color: #e8e8e8;" width="70" rowspan="2"><strong>&nbsp;&nbsp;净拨款金额</strong></td>
						<td align="center" style="background-color: #e8e8e8;" width="70" rowspan="2"><strong>&nbsp;&nbsp;净本金余额</strong></td>
						<td align="center" style="background-color: #e8e8e8;" width="80" rowspan="2"><strong>&nbsp;&nbsp;租期/剩余</strong></td>
						<td align="center" style="background-color: #e8e8e8;" width="70" colspan="2"><strong>&nbsp;&nbsp;逾期状况</strong></td>
						<td align="center" style="background-color: #e8e8e8;" width="70" rowspan="2"><strong>&nbsp;&nbsp;连保状态</strong></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td align="center" style="background-color: #e8e8e8;" width="70"><strong>&nbsp;&nbsp;15~30天</strong></td>
						<td align="center" style="background-color: #e8e8e8;" width="70"><strong>&nbsp;&nbsp;30天以上</strong></td>
					</tr>
					<c:forEach items="${contractlists}" var="items" >
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="background-color: #e8e8e8;text-align: right;" width="100">&nbsp;<a href="#" onclick="window.parent.openTab({tabName:'支付表浏览',location:'${ctx }/servlet/defaultDispatcher?__action=collectionManage.showPaylist&FLAG=1&RECP_ID=${items.contractlist.RECP_ID }&RECT_ID=${items.contractlist.RECT_ID }'});">${items.contractlist.LEASE_CODE }</a></td>
						<td style="background-color: #e8e8e8;" width="80">&nbsp;${items.contractlist.CUST_NAME }</td>
						<td style="background-color: #e8e8e8;text-align: right;" width="70">&nbsp;<fmt:formatNumber value="${items.contractlist.LEASE_RZE }" type="currency" /></td>
						<td style="background-color: #e8e8e8;text-align: right;" width="70">&nbsp;<fmt:formatNumber value="${items.paylinesum.LASTPRICE }" type="currency" /></td>
						<td style="background-color: #e8e8e8;text-align: center;" width="70">&nbsp;${items.paylinesum.ZONGQISHU }/${empty items.paylinesum.WEIJIAOQISHU ? 0:items.paylinesum.WEIJIAOQISHU}</td>
						<td style="background-color: #e8e8e8;text-align: center;" width="70">&nbsp;<a href="#" onclick="window.parent.openTab({tabName:'客户逾期浏览',location:'${ctx }/servlet/defaultDispatcher?__action=dunTask.getDunDetailByCustIdAndDate&RECP_CODE=${items.contractlist.RECP_CODE }&RECP_ID=${items.contractlist.RECP_ID }&CUST_NAME=${items.contractlist.CUST_NAME }'});" >${items.fifteenDay}</a></td>
						<td style="background-color: #e8e8e8;text-align: center;" width="70">&nbsp;<a href="#" onclick="window.parent.openTab({tabName:'客户逾期浏览',location:'${ctx }/servlet/defaultDispatcher?__action=dunTask.getDunDetailByCustIdAndDate&RECP_CODE=${items.contractlist.RECP_CODE }&RECP_ID=${items.contractlist.RECP_ID }&CUST_NAME=${items.contractlist.CUST_NAME }'});" >${items.thirtyDay}</a></td>
						<td style="background-color: #e8e8e8;" width="70">&nbsp;<c:choose><c:when test="${items.paylineState.FLAG eq null }">无</c:when><c:otherwise>${items.paylineState.FLAG }</c:otherwise></c:choose></td>											
					</tr>
					</c:forEach>
				</table>	
				<table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td align="center" style="background-color: #e8e8e8;" width="100"><strong>&nbsp;&nbsp;合作方式</strong></td>
						<td align="center" style="background-color: #e8e8e8;" width="80"><strong>&nbsp;&nbsp;授信总额</strong></td>
						<td align="center" style="background-color: #e8e8e8;" width="70"><strong>&nbsp;&nbsp;授信余额</strong></td>
						<td align="center" style="background-color: #e8e8e8;" width="70"><strong>&nbsp;&nbsp;合同笔数</strong></td>
						<td align="center" style="background-color: #e8e8e8;" width="80"><strong>&nbsp;&nbsp;设备数量</strong></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td align="center" style="background-color: #e8e8e8;" width="100"><strong>&nbsp;&nbsp;回购</strong></td>
						<td align="center" style="background-color: #e8e8e8;" width="80"><strong>&nbsp;&nbsp;${ SuplGrantPrice.REPURCH_GRANT_PRICE}</strong></td>
						<td align="center" style="background-color: #e8e8e8;" width="70"><strong>&nbsp;&nbsp;${ RepurchLastPrice}</strong></td>
						<td align="center" style="background-color: #e8e8e8;" width="70"><strong>&nbsp;&nbsp;${ rentCountRepurch}</strong></td>
						<td align="center" style="background-color: #e8e8e8;" width="80"><strong>&nbsp;&nbsp;${ eqmtCountRepurch}</strong></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td align="center" style="background-color: #e8e8e8;" width="100"><strong>&nbsp;&nbsp;连保</strong></td>
						<td align="center" style="background-color: #e8e8e8;" width="80"><strong>&nbsp;&nbsp;${ SuplGrantPrice.LIEN_GRANT_PRICE}</strong></td>
						<td align="center" style="background-color: #e8e8e8;" width="70"><strong>&nbsp;&nbsp;${ LienLastPrice}</strong></td>
						<td align="center" style="background-color: #e8e8e8;" width="70"><strong>&nbsp;&nbsp;${rentCountLien }</strong></td>
						<td align="center" style="background-color: #e8e8e8;" width="80"><strong>&nbsp;&nbsp;${eqmtCountLien}</strong></td>
					</tr>
				</table>
		</div>
	</div>
</div>

