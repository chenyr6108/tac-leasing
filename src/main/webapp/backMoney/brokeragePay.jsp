<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>乘用车佣金请款</title>
		<script type="text/javascript">
			$(function (){
			});
		
			function checkAll(e){
				$("input[type='checkbox'][name='credit_ids']").each(function (){
					$(this).attr("checked", $(e).attr("checked"));
				});
			}
			
			function addSelectedItems(){
				var credit_ids = "";
				$("input[type='checkbox'][name='credit_ids']:checked").each(function (){
					credit_ids += $.trim($(this).val()) + ",";
				});
				addItems(credit_ids);
			}
			
			function addToCart(credit_ids){
				addItems(credit_ids);
			}
			
			function addItems(addStr){
				var url = "../servlet/defaultDispatcher";
				var param = {
						"__action" : "backMoney.addItemToCart"
						,"addStr" : addStr
						,"items" : $("#items").val()
						,"item_type" : "2"
						,"user_id" : $("#user_id").val()
				};
				$.getJSON(url, param, function (data){
					$("#form1").submit();
				});
			}
			
			function showCart(){
				$("#__action").val("backMoney.showCartForBrokerage");
				$("#form1").submit();
			}
			
			function showDetail(po_id){
				$("#pactAffix_" + po_id).toggle(function(){
			        $(this).load("../servlet/defaultDispatcher?__action=backMoney.getBrokerageDetail&po_id=" + po_id);
			    });
			}
			
			
			
		</script>		
	</head>
	<body>
		<form id="form1" name="form1" method="POST"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" id="__action" value="backMoney.queryBrokerage" />
			<input type="hidden" name="user_id" id="user_id" value="${sessionScope.s_employeeId }" />
			<input type="hidden" name="items" id="items" value="${cart.items }" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;乘用车佣金请款</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
	          <div style="margin: 6 0 6 0px;">
	          	<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="middle">
				          <table style="margin-left: 10px;">
				          		<tr>
						          <td>状态：</td>
						          <td>
						          	<select name="search_status" class="panel_select">
						          		<option value="-1" <c:if test="${search_status eq '-1' }">selected="selected"</c:if>>未拨款</option>
						          		<option value="1" <c:if test="${search_status eq '1' }">selected="selected"</c:if>>拨款中</option>
						          		<option value="3" <c:if test="${search_status eq '3' }">selected="selected"</c:if>>已拨款</option>
						          		<option value="2" <c:if test="${search_status eq '2' }">selected="selected"</c:if>>驳回</option>
						          	</select>
						          </td>
						          <td>查询内容：</td>
						          <td>
						          	<input type="text" name="search_value" value="${search_value }" class="panel_text" style="width: 300px;" />
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
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();"  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
	          		</div>
				
				<div class="ui-state-default ui-jqgrid-hdiv ">
					<table style="width: 100%;" cellpadding="0" cellspacing="0">
						<tr>
							<c:if test="${search_status eq '-1' }">
							<td>
								<input type="button" value="添加选择" class="panel_button" onclick="addSelectedItems();"/>
							</td>
							<td>
								<a href="javascript:void(0);" class="panel_a" onclick="showCart();">已选择（<font style="color: red;" id="item_count">${cart.item_count }</font>）</a>
							</td>
							</c:if>
							<td align="right">
								<page:pagingToolbarTop pagingInfo="${dw }"/>
							</td>
						</tr>
					</table>
					
					<c:choose>
						<c:when test="${search_status eq '-1' }">
							<table class="grid_table">
								<tr>
									<th>
										<input type="checkbox" onclick="checkAll(this);"/>
									</th>
									<th>
										状态
									</th>
									<th>
										案件号
									</th>
									<th>
										合同编号
									</th>
									<th>
										客户名称
									</th>
									<th>
										办事处
									</th>
									<th>
										办事处主管
									</th>
									<th>
										客户经理
									</th>
									<th>
										案件拨款日期
									</th>
									<th>
										佣金
									</th>
									<th>
										操作
									</th>
								</tr>
								<c:forEach items="${dw.resultList}" var="item" varStatus="status">	
									<tr>
										<td>
											<c:choose>
												<c:when test="${fn:contains(cart.items, item.CREDIT_ID) }"></c:when>
												<c:otherwise>
													<input type="checkbox" name="credit_ids" value="${item.CREDIT_ID}">
												</c:otherwise>
											</c:choose>
										</td>
										<td style="text-align: center; cursor: pointer;" >
											<c:if test="${empty item.PAY_STATUS}">
												<img src="${ctx }/images/u608.gif" title="未拨款">
											</c:if>
											<c:if test="${item.PAY_STATUS == 0 and (item.PAY_STATE == 0 or item.PAY_STATE == 1)}">
												<img src="${ctx }/images/u622.gif" title="拨款中">
											</c:if>
											<c:if test="${item.PAY_STATE == 3}">
												<img src="${ctx }/images/u611.gif" title="已付款">
											</c:if>
											<c:if test="${item.PAY_STATUS == 1}">
												<img src="${ctx }/images/u617.gif" title="驳回">
											</c:if>
										</td>
										<td style="text-align: center;">${item.CREDIT_RUNCODE }&nbsp;</td>
										<td style="text-align: center;">${item.LEASE_CODE }&nbsp;</td>
										<td style="text-align: center;">${item.CUST_NAME }</td>
										<td style="text-align: center;">${item.DECP_NAME_CN }</td>
										<td style="text-align: center;">${item.UU_NAME }&nbsp;</td>
										<td style="text-align: center;">${item.U_NAME }&nbsp;</td>
										<td style="text-align: center;">${item.PAY_DATE }&nbsp;</td>
										<td style="text-align: right;">￥<fmt:formatNumber value="${item.SALES_PAY }" pattern="#,###,##0.00"/> &nbsp;</td>
										<td style="text-align: center;">
											<c:choose>
												<c:when test="${fn:contains(cart.items, item.CREDIT_ID) }"></c:when>
												<c:otherwise>
													<a href="javascript:void(0);" onclick="addToCart('${item.CREDIT_ID}');">添加</a>
												</c:otherwise>
											</c:choose>
											&nbsp;
										</td>
									</tr>
								</c:forEach>
							</table>
						</c:when>
						<c:otherwise>
							<table class="grid_table">
								<tr>
									<th>
										状态
									</th>
									<th>
										拨款流水号
									</th>
									<th>
										请款单位
									</th>
									<th>
										开户行
									</th>
									<th>
										账号
									</th>
									<th>
										拨款金额
									</th>
									<th>
										申请日期
									</th>
									<th>
										拨款日期
									</th>
									<th>
										申请人
									</th>
									<th>
										操作
									</th>
								</tr>
								<c:forEach items="${dw.resultList}" var="item" varStatus="status">	
									<tr>
										<td style="text-align: center; cursor: pointer;" >
											<c:if test="${item.PAY_STATUS == 0 and (item.PAY_STATE == 0 or item.PAY_STATE == 1)}">
												<img src="${ctx }/images/u622.gif" title="拨款中">
											</c:if>
											<c:if test="${item.PAY_STATE == 3}">
												<img src="${ctx }/images/u611.gif" title="已付款">
											</c:if>
											<c:if test="${item.PAY_STATUS == 1}">
												<img src="${ctx }/images/u617.gif" title="驳回">
											</c:if>
										</td>
										<td style="text-align: center;">${item.ORDER_CODE }&nbsp;</td>
										<td style="text-align: center;">${item.BACKCOMP }&nbsp;</td>
										<td style="text-align: center;">${item.BANK_NAME }</td>
										<td style="text-align: center;">${item.BANK_ACCOUNT }</td>
										<td style="text-align: center;">￥<fmt:formatNumber value="${item.PAY_MONEY }" pattern="#,###,##0.00"/>&nbsp;</td>
										<td style="text-align: center;"><fmt:formatDate value="${item.APPLICATION_DATE }" pattern="yyyy-MM-dd"/>&nbsp;</td>
										<td style="text-align: center;"><fmt:formatDate value="${item.PAY_DATE }" pattern="yyyy-MM-dd"/>&nbsp;</td>
										<td style="text-align: right;">${item.NAME }&nbsp;</td>
										<td style="text-align: center;">
											<a href="javascript:void(0);" onclick="showDetail('${item.PO_ID}');">查看明细</a>
											&nbsp;
										</td>
									</tr>
									
									<tr>
										<th class="pact" colspan="11">
											<div id="pactAffix_${item.PO_ID}" align="center"
												style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
												<img src="${ctx }/images/loading.gif">
											</div>
										</th>
									</tr>
								</c:forEach>
							</table>
						</c:otherwise>
					</c:choose>
					<page:pagingToolbar pagingInfo="${dw }"/>
					<table class="STYLE2" width="100%" border="0" cellpadding="0" cellspacing="0">
						<tbody>
							<tr>
								<td align="right">
									<img src="${ctx }/images/u608.gif">
									未拨款
									<img src="${ctx }/images/u622.gif">
									拨款中
									<img src="${ctx }/images/u611.gif">
									已拨款&nbsp;
									<img src="${ctx }/images/u617.gif">
									驳回&nbsp;
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				</div>
				</div>
			
		</form>
			
	</body>
</html>