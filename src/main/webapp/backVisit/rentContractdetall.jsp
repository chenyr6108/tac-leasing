<%@ page contentType="text/html;charset=GBK" pageEncoding="GBK"%>
<%@ include file="/common/taglibs.jsp"%>

	
			<div
				class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
				id="main">
				<div class="zc_grid_body jqgrowleft">
					<div class="ui-state-default ui-jqgrid-hdiv ">

						<table cellspacing="0" cellpadding="0" border="0"
							class="ui-jqgrid-htable zc_grid_title" width="80%">
							<tr class="ui-jqgrid-labels">
								<td style="width:12%" class="ui-state-default ui-th-ltr zc_grid_head" >
									产品厂牌
								</td>
								<td style="width:13%" class="ui-state-default ui-th-ltr zc_grid_head">
									产品名称
								</td>
								<td style="width:8%" class="ui-state-default ui-th-ltr zc_grid_head">
									规格型号
								</td>
								<td style="width:18%" class="ui-state-default ui-th-ltr zc_grid_head">
									供应商
								</td>
								<td style="width:9%" class="ui-state-default ui-th-ltr zc_grid_head">
									留购价（元）
								</td>
								<td style="width:10%" class="ui-state-default ui-th-ltr zc_grid_head">
									单价（元）
								</td>
								<td style="width:5%" class="ui-state-default ui-th-ltr zc_grid_head">
									数量
								</td>
								<td style="width:5%" class="ui-state-default ui-th-ltr zc_grid_head">
									单位
								</td>
								<td style="width:10%" class="ui-state-default ui-th-ltr zc_grid_head">
									合计
								</td>
								<td style="width:11%" class="ui-state-default ui-th-ltr zc_grid_head">
									备注
								</td>
							</tr>
								<c:set value="0" var="leasecode"></c:set>
								<c:set value="0" var="euqipTotal"></c:set>
								<c:forEach items="${dw}" var="contractdetall" varStatus="status">
									<c:set value="${contractdetall.AMOUNT*contractdetall.UNIT_PRICE+euqipTotal }" var="euqipTotal"></c:set>
									<c:set value="${contractdetall.LEASE_CODE }" var="leasecode"></c:set>
									<tr  class="ui-widget-content ui-row-ltr">
										<td style="text-align: center;"   class="ui-widget-content ui-row-ltr" >
											${contractdetall.THING_KIND}&nbsp;
										</td>
										<td style="text-align: center;"   class="ui-widget-content ui-row-ltr" >
											${contractdetall.THING_NAME }&nbsp;
										</td>
										<td style="text-align: center;"   class="ui-widget-content ui-row-ltr" >
											${contractdetall.MODEL_SPEC }&nbsp;
										</td>
										<td style="text-align: center;"   class="ui-widget-content ui-row-ltr" >
											${contractdetall.BRAND }&nbsp;
										</td>
										<td style="text-align: center;"  class="ui-widget-content ui-row-ltr" >
											${contractdetall.STAYBUY_PRICE }&nbsp;
										</td>
										<td style="text-align: center;"   class="ui-widget-content ui-row-ltr" >
											${contractdetall.UNIT_PRICE }&nbsp;
										</td>
										<td style="text-align: center;"    class="ui-widget-content ui-row-ltr" >
											${contractdetall.AMOUNT }&nbsp;
										</td>
										<td style="text-align: center;"   class="ui-widget-content ui-row-ltr" >
											${contractdetall.UNIT }
										</td>
										<td style="text-align: center;"  class="ui-widget-content ui-row-ltr" >
											<fmt:formatNumber value="${contractdetall.AMOUNT * contractdetall.UNIT_PRICE }" type="currency" />
											&nbsp;
										</td>
										<td style="text-align: center;"  class="ui-widget-content ui-row-ltr" >
											${contractdetall.MEMO }&nbsp;
										</td>
									</tr>
								</c:forEach>
								<tr  class="ui-widget-content ui-row-ltr">
									<td style="text-align: left;" colspan="8"   class="ui-widget-content ui-row-ltr"  >
										合计（大写）：
										<script type="text/javascript">document.getElementById("euqipTo${leasecode }").innerHTML=(atoc(${euqipTotal }));</script>
										<span id="euqipTo${leasecode }"></span>
									</td>
									<td style="text-align: left;" colspan="2"    class="ui-widget-content ui-row-ltr" >
										合计（￥）：&nbsp;
										<fmt:formatNumber value="${euqipTotal}" type="currency" />
									</td>
								</tr>
							
						</table>
					</div>

				</div>
			</div>
	
