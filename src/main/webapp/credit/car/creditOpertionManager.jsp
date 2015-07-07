<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>现场调查管理</title>
		 
	<script type="text/javascript" src="${ctx }/credit/car/js/creditScheme.js"></script>
	<script type="text/javascript" src="${ctx }/credit/car/js/creditLog.js"></script>
	<script type="text/javascript">	
	$(function (){
		$("#datebegin").datepicker($.datepicker.regional['zh-CN']);
		$("#dateend").datepicker($.datepicker.regional['zh-CN']);
	});
	  
	</script>
	<style type="text/css">
		.tb_return{border: 1px solid #A6C9E2; width: 200px; height: 22px; text-align: left;}
	</style>
	</head>
	<body>
		
		<form action="../servlet/defaultDispatcher" name="form1" id="form1"
			method="post">
			<input type="hidden" name="__action" id="__action"
				value="creditReport.creditOperationManage">
			<input type="hidden" id="credit_id" name="credit_id">	
			<input type="hidden" id="commit_flag" name="commit_flag">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;业务副总审批</span>
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
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>状态 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>标签 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>资信类型 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="CREDIT_RUNCODE" pagingInfo="${pagingInfo }"><strong>案件号</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="CUST_NAME" pagingInfo="${pagingInfo }"><strong>客户名称 </strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="PROVINCE" pagingInfo="${pagingInfo }"><strong>区域 </strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="DECP_NAME_CN" pagingInfo="${pagingInfo }"><strong>办事处</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="CLERK_NAME" pagingInfo="${pagingInfo }"><strong>办事处主管 </strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="SENSOR_NAME" pagingInfo="${pagingInfo }"><strong>客户经理 </strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="WIND_STATE" pagingInfo="${pagingInfo }"><strong>风控纪要 </strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="CREATE_DATE" pagingInfo="${pagingInfo }"><strong>生成时间 </strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="VISIT_DATE" pagingInfo="${pagingInfo }"><strong>访厂时间 </strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>操作 </strong>
					</th>
				</tr>
				<c:forEach items="${pagingInfo.resultList}" var="item">
					<tr class="ui-widget-content jqgrow ui-row-ltr">   
						<td style="text-align: center;"><c:if test="${item.STATE eq 5}"><img src="${ctx }/images/u620.gif" title="提交副总审批"></c:if></td>
						<td style="text-align: center;padding-top: 4px;">
							<c:forEach  items="${item.TAGS }" var="tag">
								&nbsp;<img title="${tag.tagName}" src="${ctx}/images/tags/${tag.tagColor}.png">	
							</c:forEach>&nbsp;						
						</td>
						<td style="text-align: center;">${item.TYPE }&nbsp;</td>
						<td style="text-align: center;">${item.CREDIT_RUNCODE }&nbsp;</td>
						<td style="text-align: center;">${item.CUST_NAME }&nbsp;</td>
						<td style="text-align: center;">${item.PROVINCE }&nbsp;</td>
						<td style="text-align: center;">${item.DECP_NAME_CN }&nbsp;</td>
						<td style="text-align: center;">${item.CLERK_NAME }&nbsp;</td>
						<td style="text-align: center;">${item.SENSOR_NAME }&nbsp;</td>
						<td style="text-align: center;">&nbsp;<c:if test="${empty item.WIND_STATE and empty item.CREDIT_ID}">未提案</c:if><c:if test="${empty item.WIND_STATE and not empty item.CREDIT_ID}"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.watchRiskControlMemo&credit_id=${item.ID }'">已提交</a></c:if><c:if test="${ item.WIND_STATE eq 1 and not empty item.CREDIT_ID}"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.watchRiskControlMemo&credit_id=${item.ID }'">无条件通过</a></c:if><c:if test="${ item.WIND_STATE eq 3 and not empty item.CREDIT_ID}"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.watchRiskControlMemo&credit_id=${item.ID }'">不通过附条件</a></c:if><c:if test="${ item.WIND_STATE eq 4 and not empty item.CREDIT_ID}"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.watchRiskControlMemo&credit_id=${item.ID }'">不通过</a></c:if><c:if test="${item.WIND_STATE eq 4 and empty item.CREDIT_ID}">不通过</c:if></td>
						<td style="text-align: center;">${item.CREATE_DATE }&nbsp;</td>
						<td style="text-align: center;"><c:choose><c:when test="${not empty item.NONE_VISIT_REASON }">${item.NONE_VISIT_REASON }</c:when><c:otherwise>${item.VISIT_DATE }</c:otherwise></c:choose>&nbsp;</td>
						<td style="text-align: center;"><a href="javaScript:void(0)"	onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.selectCreditForShow&credit_id=${item.ID }&examineFlag=1'">审批</a></td>
					</tr>
					<tr>
						<td style="text-align: center;" colspan="9" align="center">
						<div id="pactCorp${item.ID}" align="center"
						style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
						<img src="${ctx }/images/loading.gif">
						</div>
						</td>
					</tr>
				</c:forEach>
			</table>
			<page:pagingToolbar pagingInfo="${pagingInfo }"/>
			<table class="STYLE2" width="100%" border="0" cellpadding="0"
				cellspacing="0">
				<tbody>
					<tr>
						<td align="right">
							<img src="${ctx }/images/u620.gif">
							提交副总审批&nbsp;
						</td>
					</tr>
					<tr>
						<td align="right">
								<c:forEach items="${tags}" var="tag" varStatus="position">
									<img src="${ctx }/images/tags/${tag.tagColor }.png" style="position:relative;top:4px;" title="${tag.comments}"/>			
									${tag.tagName } &nbsp;
								</c:forEach>
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