<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>现场调查授权管理</title>
		 
	<script type="text/javascript" src="${ctx }/credit/js/creditScheme.js"></script>
	<script type="text/javascript" src="${ctx }/credit/js/manage.js"></script>
	<script type="text/javascript" src="${ctx }/credit/js/power.js"></script>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1"	method="post">
			<input type="hidden" name="__action" id="__action" value="creditReport.creditPowerManage">
			<input type="hidden" id="credit_id" name="credit_id">	
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;现场调查授权管理</span>
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
				          <td>
				          <input type="text" name="start_date" style=" width: 80px; height: 18px;" readonly="readonly"
										id="datebegin" value="${start_date }"></td>
				          <td>
				          结束日期：</td>
				          <td>
				          <input type="text" name="end_date" id="dateend" style=" width: 80px; height: 18px;" readonly="readonly"
								value="${end_date }">
					</td>
					<td>
					类型：
					</td>
					<td>
						<c:set var="type0" value=""></c:set>
					<c:set var="type1" value=""></c:set>
					<c:set var="type2" value=""></c:set>
					<c:if test="${credit_type eq 0}">
						<c:set var="type0" value="selected='selected'"></c:set>
					</c:if>
					<c:if test="${credit_type eq 1}">
						<c:set var="type1" value="selected='selected'"></c:set>
					</c:if>
					<c:if test="${credit_type eq -1}">
						<c:set var="type2" value="selected='selected'"></c:set>
					</c:if>
					<select name="credit_type" style=" height: 18px;">
						<option value="-2"${ type0}>
							全部
						</option>
						<option value="0"${ type0}>
							调查中
						</option>
						<option value="3"${ type0}>
							已提交
						</option>
						<option value="1"${ type1}>
							审批通过
						</option>
						<option value="2"${ type1}>
							审批驳回
						</option>
						<option value="-1"${ type2}>
							项目撤销
						</option>
					</select>
					</td>
				          </tr>
				          <tr>
				          <td>查询内容：</td>
				          <td colspan="5"><input type="text" name="content" value="${content }" 
				          style=" width:395px;height:18px; font-size: 12px;">
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
					<td><%@ include file="/common/pageControlTop.jsp"%></td>
				</tr>
			</table>

			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<!--<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
						<input type="checkbox">
					</th>
					--><th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>状态 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>资信类型 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>客户类型 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>客户名称 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>区域 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>办事处主管 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>客户经理 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>风控纪要 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>生成时间 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>操作 </strong>
					</th>
				</tr>
				<c:forEach items="${dw.rs}" var="item">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<!--<td style="text-align: center;"><input type="checkbox" value="${item.ID }"></td>-->
						<td style="text-align: center;"><c:if test="${item.STATE eq 0}"><img src="${ctx }/images/u608.gif" title="调查中"></c:if><c:if test="${item.STATE eq 3}"><img src="${ctx }/images/u611.gif" title="已提交"></c:if><c:if test="${item.STATE eq 2}"><img src="${ctx }/images/u614.gif" title="审批驳回"></c:if><c:if test="${item.STATE eq 1}"><img src="${ctx }/images/u622.gif" title="审批通过"></c:if><c:if test="${item.STATE eq -1}"><img src="${ctx }/images/u617.gif" title="项目撤销"></c:if></td>
						<td style="text-align: center;">${item.TYPE }&nbsp;</td>
						<td style="text-align: center;">&nbsp;<c:if test="${item.CUST_TYPE eq 0 }">自然人</c:if><c:if test="${item.CUST_TYPE eq 1 }">法人</c:if></td>
						<td style="text-align: center;">${item.CUST_NAME }&nbsp;</td>
						<td style="text-align: center;">${item.PROVINCE }&nbsp;</td>
						<td style="text-align: center;">${item.CLERK_NAME }&nbsp;</td>
						<td style="text-align: center;">${item.SENSOR_NAME }&nbsp;</td>
						<td style="text-align: center;">&nbsp;<c:if test="${empty item.WIND_STATE}">未上会</c:if><c:if test="${ item.WIND_STATE eq 1}">无条件通过</c:if><c:if test="${ item.WIND_STATE eq 2}">有条件通过</c:if><c:if test="${ item.WIND_STATE eq 3}">补充调查</c:if><c:if test="${ item.WIND_STATE eq 4}">不通过</c:if></td>
						<td style="text-align: center;">${item.CREATE_DATE }&nbsp;</td>
						<td style="text-align: center;"><a href="javaScript:void(0)" onclick="addPower('${item.ID }');">授权</a>|<a href="javaScript:void(0)" onclick="upPower('${item.ID }');">撤销授权</a></td>
					</tr>
				</c:forEach>
			</table>
			<%@ include file="/common/pageControl.jsp"%>
			<table class="STYLE2" width="100%" border="0" cellpadding="0"
				cellspacing="0">
				<tbody>
					<tr>
						<td align="right">
							<img src="${ctx }/images/u608.gif">
							调查中
							<img src="${ctx }/images/u611.gif">
							已提交
							<img src="${ctx }/images/u614.gif">
							审批驳回
							<img src="${ctx }/images/u622.gif">
							审批通过
							<img src="${ctx }/images/u617.gif">
							项目撤销&nbsp;
						</td>
					</tr>
				</tbody>
			</table>
			</div>
				</div>
			</div>		
		</form>
		
		<div id="addPower" style="display: none;" title="授权管理">
				<form action="../servlet/defaultDispatcher" id="form2" name="form2" method="post">
					<input type="hidden" name="crId" id="crId">
					<input type="hidden" name="__action" id="action" value="creditReport.addPower">
				   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			           <div class="zc_grid_body jqgrowleft">
						<div class="ui-state-default ui-jqgrid-hdiv ">
					
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="table1">
						<tbody id="headtr"></tbody>
						<tr>
							<td style="text-align: center;" colspan="5">
								<input type="button" class="ui-state-default ui-corner-all" onclick="submitButt();" value="提 交">
								<input type="reset" class="ui-state-default ui-corner-all" value="重 置">
								<input type="button" class="ui-state-default ui-corner-all" value="关 闭" onclick="closeDialog('addPower');">
							</td>
						</tr>
					</table>
								</div>
				</div>
				</div>
				</form>
		</div>
		
	</body>
</html>