<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>报告删除</title>
		<script type="text/javascript">
			$(function (){
				$("#datebegin").datepicker($.datepicker.regional['zh-CN']);
				$("#dateend").datepicker($.datepicker.regional['zh-CN']);
			});
		</script>		
	<script type="text/javascript" src="${ctx }/support/js/supportCreditReportDelete.js"></script>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" name="__action" id="__action" value="supportCreditReportDelete.creditManage">
			<input type="hidden" id="credit_id" name="credit_id">	
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;报告删除</span>
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
					<c:if test="${credit_type eq 2}">
						<c:set var="type2" value="selected='selected'"></c:set>
					</c:if>
					<c:if test="${credit_type eq 3}">
						<c:set var="type3" value="selected='selected'"></c:set>
					</c:if>
					<c:if test="${credit_type eq '-1'}">
						<c:set var="type4" value="selected='selected'"></c:set>
					</c:if>
					<select name="credit_type" style=" height: 18px;">
						<option value="-2">
							全部
						</option>
						<option value="0"${ type0}>
							调查中
						</option>
						<option value="3"${ type3}>
							已提交
						</option>
						<option value="1"${ type1}>
							审批通过
						</option>
						<option value="2"${ type2}>
							审批驳回
						</option>
						<option value="-1"${ type4}>
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
				<tr>
					<td><%@ include file="/common/pageControlTop.jsp"%></td>
				</tr>
			</table>

			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>状态 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>资信类型 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>客户类型 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>案件号</strong>
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
						<td style="text-align: center;"><c:if test="${item.STATE eq 0}"><img src="${ctx }/images/u608.gif" title="调查中"></c:if><c:if test="${item.STATE eq 3}"><img src="${ctx }/images/u611.gif" title="已提交"></c:if><c:if test="${item.STATE eq 2}"><img src="${ctx }/images/u614.gif" title="审批驳回"></c:if><c:if test="${item.STATE eq 1}"><img src="${ctx }/images/u622.gif" title="审批通过"></c:if><c:if test="${item.STATE eq -1}"><img src="${ctx }/images/u617.gif" title="项目撤销"></c:if></td>
						<td style="text-align: center;">${item.TYPE }</td>
						<td style="text-align: center;"><c:if test="${item.CUST_TYPE eq 0 }">自然人</c:if><c:if test="${item.CUST_TYPE eq 1 }">法人</c:if></td>
						<td style="text-align: center;">${item.CREDIT_RUNCODE }</td>
						<td style="text-align: center;">${item.CUST_NAME }</td>
						<td style="text-align: center;">${item.PROVINCE }</td>
						<td style="text-align: center;">${item.CLERK_NAME }</td>
						<td style="text-align: center;">${item.SENSOR_NAME }</td>
						<td style="text-align: center;"><c:if test="${empty item.WIND_STATE}">未上会</c:if><c:if test="${ item.WIND_STATE eq 1}">无条件通过</c:if><c:if test="${ item.WIND_STATE eq 2}">有条件通过</c:if><c:if test="${ item.WIND_STATE eq 3}">补充调查</c:if><c:if test="${ item.WIND_STATE eq 4}">不通过</c:if></td>
						<td style="text-align: center;">${item.CREATE_DATE }</td>
						<td style="text-align: center;"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.selectCreditForShow&credit_id=${item.ID }'">查看</a>|<a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.selectCreditForUpdate&credit_id=${item.ID }'">修改</a>|<c:if test="${item.HAS_LEASE eq 'Y' }"><a href="#" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditPaylistService.createCreditPaylist&credit_id=${item.ID }&showFlag=4&word=up&functionFrom=Y'">更新支付表</a></c:if><c:if test="${item.HAS_LEASE ne 'Y' }">更新支付表</c:if></td>
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
		<div id="rentDiv" style="display: none;" title="风控情况">
				   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
				            <div class="zc_grid_body jqgrowleft">
								<div class="ui-state-default ui-jqgrid-hdiv ">			
									<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="table1">
										<tr class="ui-widget-content jqgrow ui-row-ltr">
											<td align="center">风控编号</td>
											<td align="center">是否生成风控意见</td>
											<td align="center">是否生成综合意见</td>
											<td align="center">是否生成总经理批准</td>
											<td align="center">是否生成会议结果</td>						
										</tr>
									</table>
									<div align="center">		
										<input type="button" class="ui-state-default ui-corner-all" value="删 除" name="sub" id="sub">
										<input type="button" class="ui-state-default ui-corner-all" value="关 闭" name="but"onclick="closeDialog(rentDiv);">		
									</div>	
								</div>
							</div>
					</div>
		</div>			
	</body>
</html>