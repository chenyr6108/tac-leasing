<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%> 
	<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript" src="${ctx }/baseManage/actLogManage/js/actLogManage.js"></script>
		<title>活动日志管理</title>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" id="__action" name="__action" value="activityLogging.queryActLog" /> 
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;活动日志配置</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		          <div class="zc_grid_body jqgrowleft">
				<div>
					<table width="750" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o">&nbsp;</td>
				        <td width="300" class="ss_t">&nbsp;&nbsp;
				          <table style="margin-left: 10px;">
				          <input type="text" name="content" value="${content }" style="width:295px; height:18px;"><td></td>	          
					<td>
					日志类型：
					</td>
					<td><select name="searchActLogType" style="border: #03515d solid 1px;">
							<option value="">全部</option>
							<c:forEach items="${dataType}" var="type">
								<c:if test="${searchActLogType == type.CODE}">
									<option value="${type.CODE}" selected>${type.FLAG}</option>
								</c:if>
								<c:if test="${searchActLogType != type.CODE}">
									<option value="${type.CODE}" >${type.FLAG}</option>
								</c:if>
							</c:forEach>
							</select>
					</td>
					</table>				          
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td><a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
				    </div>
				<div class="ui-state-default ui-jqgrid-hdiv ">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr >
						<td><input type="button" onclick="addActLog();" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="添加资料"></td>
						<td><%@ include file="/common/pageControlTop.jsp"%></td>
					</tr>
				</table>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr class="ui-jqgrid-labels">
						<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
							序号
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							日志名称
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							日志类型
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							级别
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							操作
						</th>
					</tr>
					<tbody>
						<c:forEach items="${dw.rs}" var="actLog" varStatus="status">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;">${status.count }&nbsp;</td>
								<td style="text-align: center;">${actLog.ACTLOG_NAME}&nbsp;</td>
								<td style="text-align: center;"><c:forEach items="${dataType}" var="type">${actLog.ACTLOG_TYPE == type.CODE ? type.FLAG : ''}</c:forEach>&nbsp;</td>
								<td style="text-align: center;">${actLog.LEVEL_NUM }&nbsp;</td>
								<td style="text-align: center;"><a href="javaScript:void(0);" onclick="showActLog(${actLog.ACTLOG_ID});">查看</a> <a href="javaScript:void(0);" onclick="preUpdateActLog(${actLog.ACTLOG_ID});">更新</a> <a href="javaScript:void(0);" onclick="deleteActLog(${actLog.ACTLOG_ID});">删除</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<%@ include file="/common/pageControl.jsp"%>
				</div>
				</div>
			</div>				
		</form> 	
	</body>
</html>