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
						<td  style="background-color: #e8e8e8;" width="100"><strong>&nbsp;&nbsp;合同号</strong></td>
						<td align="center" style="background-color: #e8e8e8;" width="80"><strong>&nbsp;&nbsp;承租人</strong></td>
						<td align="center" style="background-color: #e8e8e8;" width="70"><strong>&nbsp;&nbsp;合同租金总额</strong></td>
						<td align="center" style="background-color: #e8e8e8;" width="70"><strong>&nbsp;&nbsp;实际剩余本金</strong></td>
						<td align="center" style="background-color: #e8e8e8;" width="80"><strong>&nbsp;&nbsp;合同剩余租金</strong></td>
						<td align="center" style="background-color: #e8e8e8;" width="70"><strong>&nbsp;&nbsp;实际剩余租金</strong></td>
						<td align="center" style="background-color: #e8e8e8;" width="70"><strong>&nbsp;&nbsp;租金期间</strong></td>
						<td align="center" style="background-color: #e8e8e8;" width="80"><strong>&nbsp;&nbsp;剩余期数</strong></td>
						<td align="center" style="background-color: #e8e8e8;" width="70"><strong>&nbsp;&nbsp;实际TR</strong></td>
						<td align="center" style="background-color: #e8e8e8;" width="70"><strong>&nbsp;&nbsp;状态</strong></td>
					</tr>
					<c:forEach items="${contractlists}" var="items" >
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="background-color: #e8e8e8;text-align: right;" width="100">&nbsp;<a href="#" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=collectionManage.showPaylist&FLAG=1&RECP_ID=${items.contractlist.RECP_ID }&RECT_ID=${items.contractlist.RECT_ID }'">${items.contractlist.LEASE_CODE }</a></td>
						<td style="background-color: #e8e8e8;" width="80">&nbsp;${items.contractlist.CUST_NAME }</td>
						<td style="background-color: #e8e8e8;text-align: right;" width="70">&nbsp;<fmt:formatNumber value="${items.contractlist.SUMMONTH_PRICE }" type="currency" /></td>
						
						<%-- <td style="background-color: #e8e8e8;text-align: right;" width="70">&nbsp;<fmt:formatNumber value="${items.paylinesum.LASTPRICE }" type="currency" /></td> --%>
						<td style="background-color: #e8e8e8;text-align: right;" width="70">&nbsp;<fmt:formatNumber value="${items.remainingPrincipal }" type="currency" /></td>
						
						<td style="background-color: #e8e8e8;text-align: right;" width="80">&nbsp;<fmt:formatNumber value="${empty items.paylinesum.SHENGYUZUJIN ? 0: items.paylinesum.SHENGYUZUJIN}" type="currency" /></td>
						<td style="background-color: #e8e8e8;text-align: right;" width="70">&nbsp;<fmt:formatNumber value="${empty items.paylinesum.SHIJISHENGYUZUJIN ? 0:items.paylinesum.SHIJISHENGYUZUJIN}" type="currency" /></td>
						<td style="background-color: #e8e8e8;text-align: center;" width="70">&nbsp;${items.paylinesum.ZONGQISHU }</td>
						<td style="background-color: #e8e8e8;text-align: center;" width="80">&nbsp;${empty items.paylinesum.WEIJIAOQISHU ? 0:items.paylinesum.WEIJIAOQISHU}</td>
						<td style="background-color: #e8e8e8;text-align: center;" width="70">&nbsp;${items.sjTR }</td>
						<td style="background-color: #e8e8e8;" width="70">&nbsp;<c:choose><c:when test="${items.paylineState.FLAG eq null }">无</c:when><c:otherwise>${items.paylineState.FLAG }</c:otherwise></c:choose></td>											
					</tr>
					</c:forEach>
				</table>		
		</div>
	</div>
</div>

