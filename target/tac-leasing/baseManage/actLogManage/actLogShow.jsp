<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
	<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
		<title>活动日志管理</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>	
		<script type="text/javascript" src="tab_data/tab.js"></script>
        <script type="text/javascript" src="${ctx }/baseManage/actLogManage/js/actLogManage.js"></script>
</head>
	<body>
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;查看活动日志信息</span>
	   	</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
		<div class="ui-state-default ui-jqgrid-hdiv ">
	            <table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">				
									    <tr>
									        <td colspan="5"  class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: left ;height: 24px;"><strong>活动日志基本信息</strong></td>
									    </tr>
									  <tr >
									    <td rowspan="5" align="center" class="ui-state-default ui-th-ltr zc_grid_head">查<br>看<br>日<br>志</td>
									    <td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">日志名称：</td>
									    <td class="ui-widget-content jqgrow ui-row-ltr">${actlog.ACTLOG_NAME}&nbsp;</td>								    
									  </tr>
									  <tr class="ui-widget-content jqgrow ui-row-ltr" >
									    <td  style="text-align: center;">日志类型：</td>
									    <td><c:forEach items="${dataType}" var="type" varStatus="status"><c:if test="${type.CODE eq actlog.ACTLOG_TYPE}">${type.FLAG}</c:if></c:forEach>&nbsp;</td>	  				    
									  </tr>
									  <tr class="ui-widget-content jqgrow ui-row-ltr" >
									    <td  style="text-align: center;">级别：</td>
									    <td>${actlog.LEVEL_NUM}&nbsp;</td>
									  </tr>
									</table>

			<div align="center">
				<input type="button" class="ui-state-default ui-corner-all" name="back" value="返  回" onclick="javascript:history.go(-1)">
			</div>
			</div>
			</div>
			</div>
			
		
	</body></html>