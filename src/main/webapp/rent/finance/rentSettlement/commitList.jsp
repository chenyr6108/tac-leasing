<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<style type="text/css">
			.redBold { color:red; font-weight: bold;}
		</style>
		<script type="text/javascript">
			function expSettleTransferProvePDF() {
	  			var chk_value=[];
				$('input[name="ids"]:checked').each(function() {   
			  		chk_value.push($(this).val());   
				});   
			    if(chk_value.length==0) {
		  		  	alert("请选择一条记录!");
			  		return;
			  	};
				$("#__action").val("settleManage.SettleTransferProvePDF");
				$("#form1").submit();
				$("#__action").val("rentFinanceCommand.queryCommitList");
			}
			
			function showSettlement(id,recpId) {
				window.location = '../servlet/defaultDispatcher?__action=rentFinanceCommand.viewSettlementDetail&recpId='+recpId+'&id='+id;
			}
			
			function selectAll() {
				if($("#selAll").attr("checked")) {
					$("input[name=ids]").each(function() {
						if(!$(this).attr("disabled")) {
							$(this).attr("checked","checked");
						}
				   	});
				} else {
					$("input[name=ids]").each(function() {
						if(!$(this).attr("disabled")) {
							$(this).attr("checked",false);
						}
				   	});
				}
			}
			function doSearch1(){
				window.location = '../servlet/defaultDispatcher?__action=rentFinanceCommand.qianYiSettlement&state=-2';
			}
		</script>
	</head>
	<body>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
			<form name="form1" id="form1" action="${ctx}/servlet/defaultDispatcher" method="post">
				<input type="hidden" id="__action" name="__action" value="rentFinanceCommand.queryCommitList" />
				<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
			   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;结清审批</span>
			   	</div>
			   	<br>
			   	<table width="1000" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				        <td width="8" >&nbsp;</td>
						<td width="60" class="ss_o" >&nbsp;</td>
						<td class="ss_t" >
					         <table>
					         	<tr>
					         		<td style="text-align: right;">查询内容:</td>
					         		<td colspan="3"><input id="content" name="content" value="${content }" style="width: 100%;"></td>
					         		<td style="text-align: right;">&nbsp;&nbsp;减免金额:</td>
					         		<td><input name="fromMoney" value="${fromMoney }" style="width: 60px;" onkeyup="value=value.replace(/[^\d]/g,'')">-<input name="toMoney" value="${toMoney }" style="width: 60px;" onkeyup="value=value.replace(/[^\d]/g,'')"></td>
					         	</tr>
					         	<tr>
					         		<td style="text-align: right;">&nbsp;&nbsp;结清单状态:</td>
					         		<td>
						         		<select name="state">
											<option value="-2" <c:if test="${state eq -2}">selected='selected'</c:if>>
												全部
											</option>
											<option value="0" <c:if test="${state eq 0}">selected='selected'</c:if>>
												审批中
											</option>
											<option value="1" <c:if test="${state eq 1}">selected='selected'</c:if>>
												通过
											</option>
											<option value="-1" <c:if test="${state eq -1}">selected='selected'</c:if> style="color: red">
												驳回
											</option>
										</select>
					         		</td>
					         		<td style="text-align: right;">&nbsp;&nbsp;结清单类型:</td>
					         		<td><select name="type">
					         				<option value="-2" <c:if test="${type eq -2}">selected='selected'</c:if>>
					         					全部
				         					</option>
				         					<option value="1" <c:if test="${type eq 1}">selected='selected'</c:if>>
					         					正常结清单
				         					</option>
				         					<option value="2" <c:if test="${type eq 2}">selected='selected'</c:if>>
					         					提前结清单
				         					</option>
					         			</select>
				         			</td>
				         			<td align="right">待签核人:</td>
				         			<td>
				         				<select name="isMy">
					         				<option value="0" <c:if test="${isMy eq 0}">selected='selected'</c:if>>
					         					全部
				         					</option>
				         					<option value="1" <c:if test="${isMy eq 1 || isMy == null}">selected='selected'</c:if>>
					         					自己
				         					</option>
					         			</select>
				         			</td>
				         			<td>
									公司别：
									<select name="companyCode">
										<option value="">全部</option>
										<c:forEach items="${companys}" var="item">
											<option value="${item.code}"<c:if test="${item.code eq companyCode }">selected</c:if>>${item.name}</option>
										</c:forEach>
									</select>			          
									</td>
					         	</tr>
			       			 </table>
	   					</td>
	   					<td width="55" class="ss_th" valign="top" >&nbsp;</td>
			            <td width="20%">
			       		 	<a href="javaScript:void(0)" id="search" onclick="doSearch()" class="blue_button">搜 索</a>
			       		 	<!-- <a href="javaScript:void(0)" id="search" onclick="doSearch1()" class="blue_button">迁移数据</a> -->
				        </td>
				      </tr>
			    </table>
					<div class="ui-state-default ui-jqgrid-hdiv">
						<div class="zc_grid_body" style="background: white">
							<table cellspacing="0" cellpadding="0" border="0" class="panel_table">
								<tr>
									<td style="border-right: 0px;"><input type="button" class="ui-state-default ui-corner-all" value="导出移转证明书" name="But" onclick="expSettleTransferProvePDF();"></td>
									<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
								</tr>
							</table>
							<table class="grid_table">
									<tr>
										<th>
											序号
										</th>
										<th style="font-size: 11px">
											<input type="checkbox" id="selAll" onclick="selectAll()" style="cursor: pointer;">
										</th>
										<th style="font-size: 11px">
											<page:pagingSort pagingInfo="${dw }" orderBy="STATE_CODE">结清单状态</page:pagingSort>
										</th>
										<th style="font-size: 11px">
											<page:pagingSort pagingInfo="${dw }" orderBy="SETTLE_DATE">结清时间</page:pagingSort>
										</th>
										<%-- <th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px">
											结清单类型
										</th>
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											<page:pagingSort pagingInfo="${dw }" orderBy="CREDIT_RUNCODE">案件号</page:pagingSort>
										</th> --%>
										<th>
											<page:pagingSort pagingInfo="${dw }" orderBy="LEASE_CODE">合同号</page:pagingSort>
										</th>
										<th>
											<page:pagingSort pagingInfo="${dw }" orderBy="CUST_NAME">客户名称</page:pagingSort>
										</th>
										<th>
											<page:pagingSort pagingInfo="${dw }" orderBy="DECP_NAME_CN">办事处</page:pagingSort>
										</th>
										<th>
											<page:pagingSort pagingInfo="${dw }" orderBy="NAME">业务员</page:pagingSort>
										</th>
										<th>
											<page:pagingSort pagingInfo="${dw }" orderBy="UP_NAME">业务主管</page:pagingSort>
										</th>
										<th>
											<page:pagingSort pagingInfo="${dw }" orderBy="CURRENT_USER_NAME">当前处理人</page:pagingSort>
										</th>
										<th>
											<page:pagingSort pagingInfo="${dw }" orderBy="SHOULD_FINE">总金额</page:pagingSort>
										</th>
										<th>
											<page:pagingSort pagingInfo="${dw }" orderBy="REDUCTION_PRICE">减免金额</page:pagingSort>
										</th>
										<th>
											操作
										</th>
									</tr>
									<c:forEach items="${dw.resultList }" var="item" varStatus="status">
											<tr>
												<td style="text-align: center">
													${status.count }
												</td>
												<td style="text-align: center">
													<input type="checkbox" name="ids" value="${item.RECP_ID }" <c:if test="${item.STATE ne -1 }">style="cursor: pointer;"</c:if> <c:if test="${item.STATE eq -1 or item.STATE eq 0}">disabled="disabled"</c:if>>
												</td>
												<td style="text-align: center;">
													<c:if test="${item.STATE eq 0 }">审批中 -- ${states[item.STATE_CODE].chsName }</c:if>
													<c:if test="${item.STATE eq 1 }">通过</c:if>
													<c:if test="${item.STATE eq -1 }"><font color="red">驳回</font></c:if>
												</td>
												<td style="text-align: center;">
													<fmt:formatDate value="${item.SETTLE_DATE }" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;
												</td>
												<%-- <td style="text-align: center;">
													${item.DESCR }&nbsp;
												</td>
												<td style="text-align: center">
													${item.CREDIT_RUNCODE }&nbsp;
												</td> --%>
												<td style="text-align: center">
													<a onclick="javascript:location.href='../servlet/defaultDispatcher?__action=collectionManage.showPaylist&RECP_ID=${item.RECP_ID}&FLAG=1'" href="javascript:void(0);">${item.LEASE_CODE }</a>&nbsp;
												</td>
												<td style="text-align: center">
													${item.CUST_NAME }&nbsp;
												</td>
												<td style="text-align: center">
													${item.DECP_NAME_CN }&nbsp;
												</td>
												<td style="text-align: center">
													${item.NAME }&nbsp;
												</td>
												<td style="text-align: center">
													${item.UP_NAME }&nbsp;
												</td>
												<td style="text-align: center">
													${item.CURRENT_USER_NAME }&nbsp;
												</td>
												<td style="text-align: right;">
													￥<fmt:formatNumber pattern="#,##0.00" value="${item.TOTAL_PRICE }"/>&nbsp;
												</td>
												<td style="text-align: right;<c:if test='${item.TOTAL_PRICE != item.TOTAL_PAY_PRICE }'>color:red; font-weight:bold;</c:if>">
													￥<fmt:formatNumber pattern="#,##0.00" value="${item.REDUCTION_PRICE }"/>&nbsp;
												</td>
												<td style="text-align: center">
													<c:if test="${item.IS_MY eq 0 }">
														<a href="javascript:void(0)" onclick="showSettlement('${item.ID }','${item.RECP_ID }')">查看结清单</a>&nbsp;&nbsp;
													</c:if>
													<c:if test="${item.IS_MY eq 1 }">
														<a href="javascript:void(0)" onclick="showSettlement('${item.ID }','${item.RECP_ID }')">审批</a>
													</c:if>
												</td>
											</tr>
									</c:forEach>
							</table>
							<table class="panel_table">
								<tr>
									<td><page:pagingToolbar pagingInfo="${dw }"/></td>
								</tr>
							</table>
						</div>
					</div>
			</form>
		</div>
		<font color="red">*</font>
		流程备注：<br/>
		a. 减免金额500元（含）以下<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;会计专员-->单位主管-->区域主管-->业务副总-->业管处-->财务专员-->财管部<br/>
		b. 减免金额500元以上<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;会计专员-->单位主管-->区域主管-->业务副总-->总经理-->业管处-->财务专员-->财管部-->经管处<br/>
	</body>
</html>