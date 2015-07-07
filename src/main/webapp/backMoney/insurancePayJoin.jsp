<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="/common/taglibs.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="">
					<tr class="ui-jqgrid-labels">
						<th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
							序号
						</th>
						<th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
							保险公司
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							保单号
						</th>
						<th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
							保险开始日期
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							保险终止日期
						</th>
     				    <th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							总保费</th>
			           <th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							缴费凭证号
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							被保险人
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							投保人
						</th>
					</tr>
					<tbody>
					<c:forEach items="${list }" var="item" varStatus="status">
					<tr  class="ui-widget-content jqgrow ui-row-ltr" id="trForColor">
						<td style='text-align: center;height: 25px;'>${status.count}&nbsp;</td>
						<td style='text-align: center;height: 25px;'>${item.INCP_NAME }&nbsp;</td>
						<td style='text-align: center;height: 25px;'>${item.INCU_CODE }&nbsp;</td>
						<td style='text-align: center;height: 25px;'>${item.INSU_START_DATE }&nbsp;</td>	
						<td style='text-align: center;height: 25px;'>${item.INSU_END_DATE }&nbsp;</td>
					 	<td style='text-align: center;height: 25px;'>${item.INSU_PRICE }&nbsp;</td> 
						<td style='text-align: center;height: 25px;'>${item.CHARGE_CODE }&nbsp;</td>
						<td style='text-align: center;height: 25px;'>${item.INSU_NAME }&nbsp;</td>
						<td style='text-align: center;height: 25px;'>${item.TO_INSU_NAME }&nbsp;</td>
					</tr>
					</c:forEach>         
				</tbody>
