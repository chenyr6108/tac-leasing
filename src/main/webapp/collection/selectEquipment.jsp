<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>

		<title>生成支付明细表</title>
		<script type="text/javascript">
			$selectEquipment = {
				allOrNot : function (obj) {
								$("input[name='RECD_ID']").attr("checked",obj.checked);
							},
				submitVilidate : function () {
						var boxs = $("input[name='RECD_ID']:checked")
						if (boxs.length == 0 ){
							alert("请选择设备！");
							return ;
						} else {
							var flag = $("#EQUIP_TYPE"+boxs[0].value).val();
							for (var i=0;i<boxs.length;i++) {
								equip_type = $("#EQUIP_TYPE"+boxs[i].value).val();
								if (flag != equip_type){
									alert("机动车和非机动车不可生成在同一张支付表！");
									return ;
								} 
								var lastLockCode = $("#LAST_LOCK_CODE" + boxs[i].value.toString()).val() ;
								var lockCode = $("#LOCK_CODE" + boxs[i].value.toString()).val() ;
								if(lastLockCode != lockCode){
									if(confirm("是否要修改锁码方式？")){
										break ;
									} else {
										for (var j=0;j<boxs.length;j++) {
											$("#LOCK_CODE" + boxs[j].value + " [value='"+lastLockCode+"']").attr("selected","selected") ;
										}
										return ;
									}
								}
							}
							$("#form1").submit();
						}
					}
			};
		</script>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1"
			method="post">
			<input type="hidden" name="__action"
				value="collectionManage.createCollection">
			<input type="hidden" name="RECT_ID" value="${RECT_ID }">
			<input type="hidden" name="DEAL_TYPE" value="0">
			<input type="hidden" name="TAX_PLAN_CODE" value="${rentContract.TAX_PLAN_CODE }">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;生成支付明细表-选择设备</span>
		   	</div>
		   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	           <div class="zc_grid_body jqgrowleft">
	           <div class="ui-state-default ui-jqgrid-hdiv ">
									<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
										<tr>
											<td colspan="4" style="text-align: left ;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head">
												<strong>选择设备</strong>
											</td>
										</tr>
										<tr>
											<td width="12%" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
												合同号:
											</td>
											<td width="40%" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
												${rentContract.LEASE_CODE }
											</td>
											<td width="10%" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
												客户名称:
											</td>
											<td width="38%" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
												${rentContract.CUST_NAME }
											</td>
										</tr>
										<tr>
											<td colspan="4">
												<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
													<thead>
														<tr height="25">
															<th class="ui-widget-content jqgrow ui-row-ltr">
																<input type="checkbox" name="boxs" value="0"
																	onchange="$selectEquipment.allOrNot(this);" checked>
															</th>
															<th class="ui-widget-content jqgrow ui-row-ltr">
																产品厂牌
															</th>
															<th class="ui-widget-content jqgrow ui-row-ltr"> 
																设备名称
															</th>
															<th class="ui-widget-content jqgrow ui-row-ltr">
																设备型号
															</th>
															<th class="ui-widget-content jqgrow ui-row-ltr">
																供应商
															</th>
															<th class="ui-widget-content jqgrow ui-row-ltr">
																含税单价
															</th>
															<th class="ui-widget-content jqgrow ui-row-ltr">
																单价
															</th>
															<th class="ui-widget-content jqgrow ui-row-ltr">
																数量
															</th>
															<th class="ui-widget-content jqgrow ui-row-ltr">
																单位
															</th>
															<th class="ui-widget-content jqgrow ui-row-ltr">
																锁码方式
															</th>
															<th class="ui-widget-content jqgrow ui-row-ltr">
																备注
															</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${equipList}" var="item">
															<tr>
																<td style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
																<!-- Modify by Michael 2012 5-17 默认为设备全选 -->
																	<input type="checkbox" name="RECD_ID" value="${item.RECD_ID }" checked>
																	<input type="hidden" name="EQUIP_TYPE" id="EQUIP_TYPE${item.RECD_ID }" value="${item.EQUIP_TYPE }">
																</td>
																<td style="text-align: center;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
																	${item.THING_KIND }
																</td>
																<td style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
																	${item.THING_NAME }
																</td>
																<td style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
																	${item.MODEL_SPEC }
																</td>
																<td style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
																	${item.BRAND }
																</td>
																<td  style="text-align: right ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
																	<fmt:formatNumber type="currency" value="${item.SHUI_PRICE }" />&nbsp;
																</td>
																<td  style="text-align: right ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
																	<fmt:formatNumber type="currency" value="${item.UNIT_PRICE }" />
																</td>
																<td style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
																	${item.AMOUNT }
																</td>
																<td style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
																	${item.UNIT }
																</td>
																<td style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
																		<select name="LOCK_CODE${item.RECD_ID}" id="LOCK_CODE${item.RECD_ID}">
																		<c:forEach items="${lockList}" var="items">
																			<c:choose>
																				<c:when test="${items.CODE eq item.LOCK_CODE}">
																					<option value="${items.CODE }" selected="selected">${items.FLAG }</option>
																				</c:when>
																				<c:otherwise>
																					<option value="${items.CODE }">${items.FLAG }</option>
																				</c:otherwise>
																			</c:choose>
																		</c:forEach>
																		</select>
																		<input type="hidden" name="LAST_LOCK_CODE${item.RECD_ID}" id="LAST_LOCK_CODE${item.RECD_ID}" value="${item.LOCK_CODE }">
																</td>
																<td style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
																	${item.memo }&nbsp;
																</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</td>
										</tr>
										<tr>
										<td colspan="11" align="right"><br/>
																	含税单价总计:<fmt:formatNumber type="currency" value="${taxPrice }" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																	单价总计:<fmt:formatNumber type="currency" value="${unitPrice }" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																	数量总计:${amount }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										</tr>
										<tr>
											<td colspan="4">
												<table width="100%" border="0" cellspacing="2"
													cellpadding="0">
													<tr>
														<td align="right">
															<input type="button" name="sureBut" onclick="$selectEquipment.submitVilidate();"
																value="确  定" class="ui-state-default ui-corner-all">
														</td>
														<td>
															<input type="button" name="resetBut" onclick="history.go(-1)"
																value="返  回" class="ui-state-default ui-corner-all">
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
					
					</div>
				</div>
			</div>			
		</form>
		<br />
	</body>
</html>