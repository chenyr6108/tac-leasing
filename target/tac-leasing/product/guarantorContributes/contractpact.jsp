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
						<td align="center" style="background-color: #e8e8e8;text-align: center" width="100"><strong>&nbsp;&nbsp;合同号</strong></td>
						<td align="center" style="background-color: #e8e8e8;text-align: center" width="80"><strong>&nbsp;&nbsp;承租人</strong></td>
						<td align="center" style="background-color: #e8e8e8;text-align: center" width="70"><strong>&nbsp;&nbsp;合同额</strong></td>
						<!--  <td align="center" style="background-color: #e8e8e8;" width="70"><strong>&nbsp;&nbsp;剩余本金余额</strong></td>
						<td align="center" style="background-color: #e8e8e8;" width="80"><strong>&nbsp;&nbsp;合同剩余租金</strong></td>
						<td align="center" style="background-color: #e8e8e8;" width="70"><strong>&nbsp;&nbsp;实际剩余租金</strong></td>
						<td align="center" style="background-color: #e8e8e8;" width="70"><strong>&nbsp;&nbsp;租金期间</strong></td>
						<td align="center" style="background-color: #e8e8e8;" width="80"><strong>&nbsp;&nbsp;剩余期数</strong></td>
						<td align="center" style="background-color: #e8e8e8;" width="70"><strong>&nbsp;&nbsp;实际TR</strong></td>
						<td align="center" style="background-color: #e8e8e8;" width="70"><strong>&nbsp;&nbsp;状态</strong></td>
					-->
						<td align="center" style="background-color: #e8e8e8;text-align: center" width="70"><strong>&nbsp;&nbsp;实际起租日期</strong></td>
					</tr>
					<c:forEach items="${contractlists}" var="items" >
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="background-color: #e8e8e8;text-align: center" width="100">&nbsp;${items.contractlist.LEASE_CODE }</td>
						<td style="background-color: #e8e8e8;text-align: center" width="80">&nbsp;${items.contractlist.CUST_NAME }</td>
						<td style="background-color: #e8e8e8;text-align: right;" width="70">&nbsp;<fmt:formatNumber value="${items.contractlist.LEASE_TOPRIC }" type="currency" /></td>
						<!-- <td style="background-color: #e8e8e8;text-align: right;" width="70">&nbsp;<fmt:formatNumber value="${items.paylinesum.LASTPRICE }" type="currency" /></td>
						<td style="background-color: #e8e8e8;text-align: right;" width="80">&nbsp;<fmt:formatNumber value="${items.paylinesum.SHENGYUZUJIN }" type="currency" /></td>
						<td style="background-color: #e8e8e8;text-align: right;" width="70">&nbsp;<fmt:formatNumber value="${items.paylinesum.SHIJISHENGYUZUJIN }" type="currency" /></td>
						<td style="background-color: #e8e8e8;text-align: center;" width="70">&nbsp;${items.paylinesum.ZONGQISHU }</td>
						<td style="background-color: #e8e8e8;text-align: center;" width="80">&nbsp;${items.paylinesum.WEIJIAOQISHU }</td>
						<td style="background-color: #e8e8e8;text-align: center;" width="70">&nbsp;${items.sjTR }</td>
						<td style="background-color: #e8e8e8;" width="70">&nbsp;无</td>
						-->	
						<td style="background-color: #e8e8e8;text-align: center;" width="70">&nbsp;<fmt:formatDate value="${items.contractlist.START_DATE }" pattern="yyyy-MM-dd" /></td>										
					</tr>
					</c:forEach>
				</table>		
		</div>
	</div>
</div>

