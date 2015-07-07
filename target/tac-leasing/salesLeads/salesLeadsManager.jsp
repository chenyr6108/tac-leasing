<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>销售机会管理</title>
		<script type="text/javascript">
			$(function (){
				$("#datebegin").datepicker($.datepicker.regional['zh-CN']);
				$("#dateend").datepicker($.datepicker.regional['zh-CN']);
			});
		</script>
		<script type="text/javascript" src="${ctx }/salesLeads/js/salesLeads.js"></script>	
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" name="__action" id="__action" value="salesLeads.querySalesLeads">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;销售机会管理</span>
		   	</div>
		   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
		   	<div style="margin: 6 0 6 0px;">
	          	<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="top">
				          <table style="margin-left: 10px;">
				          <tr>
				          <td>起始日期：</td>
				          <td><input type="text" name="start_date" style="width:80px; height:18px;" readonly="readonly"
							id="datebegin" value="${start_date }">
				          <td>
				          结束日期：</td>
				          <td><input type="text" name="end_date" id="dateend" style="width:80px; height:18px;" readonly="readonly"
							value="${end_date }">
					</td>
					<td>
					机会阶段：
					</td>
					<td>
						<select name="chance_stage_id" style="border: #03515d solid 1px;">
						<option value="">--请选择--</option>
						<c:forEach items="${chanceStageList}" var="item">
							<c:choose>
								<c:when test="${item.CODE eq chance_stage_id}">
									<option value="${item.CODE }" selected='selected'>${item.FLAG }</option>
								</c:when>
								<c:otherwise>
									<option value="${item.CODE }">${item.FLAG }</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						</select>
					</td>
				          </tr>
				          <tr>
				          <td>查询内容：</td>
				          <td colspan="5"><input type="text" name="content" value="${content }" style=" width:395px;height:18px; font-size: 12px;">
				          </td>
				          </tr>
				          </table>
				          
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
	          		</div>
		   	
				<div class="ui-state-default ui-jqgrid-hdiv ">
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr >
							<td><input type="button" onclick="funnelSales();" class="ui-state-default ui-corner-all" value="销售漏斗"></td>
							<td><input type="button" onclick="goAddSales();" class="ui-state-default ui-corner-all" value="新增销售机会"></td>
							<td><%@ include file="/common/pageControlTop.jsp"%></td>
						</tr>
					</table>
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
							<tr class="ui-jqgrid-labels">
								<th class="ui-state-default ui-th-ltr zc_grid_head" >
									<strong>序号</strong>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<strong>主题 </strong>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<strong>客户 </strong>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<strong>来源 </strong>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<strong>机会阶段 </strong>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<strong>预期金额 </strong>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<strong>预期收益 </strong>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<strong>负责人 </strong>
								</th>								
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<strong>操作 </strong>
								</th>								
							</tr>
							<c:forEach items="${dw.rs}" var="item" varStatus="status">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td style="text-align: center;">${status.count }</td>
									<td style="text-align: center;">${item.THEME }</td>
									<td style="text-align: center;">${item.CUST_NAME }</td>
									<td style="text-align: center;"><c:forEach items="${sourcesList}" var="it"><c:if test="${it.CODE == item.SOURCES_ID}">${it.FLAG}</c:if></c:forEach>&nbsp;</td>
									<td style="text-align: center;"><c:forEach items="${chanceStageList}" var="it"><c:if test="${it.CODE == item.CHANCE_STAGE_ID}">${it.FLAG}</c:if></c:forEach>&nbsp;</td>
									<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.EXPECT_MONEY }"></fmt:formatNumber>&nbsp;</td>
									<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.EXPECT_INCOME_MONEY }"></fmt:formatNumber>&nbsp;</td>
									<td style="text-align: center;">${item.PRINCIPAL }&nbsp;</td>
									<td style="text-align: center;"><a href="javaScript:void(0)" onclick="querySales(${item.SALES_ID });">查看</a> | <a href="javaScript:void(0)" onclick="goupSales(${item.SALES_ID });">修改</a> | <a href="javascript:void(0)" onclick="delSales('${item.SALES_ID }');">删除</a></td>
								</tr>
							</c:forEach>
						</table>
						<%@ include file="/common/pageControl.jsp"%>
				</div>
				</div>
			</div>	
		</form>
	</body>
</html>