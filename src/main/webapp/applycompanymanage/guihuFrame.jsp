<%@ page language="java" pageEncoding="utf-8"%>

<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
	<title>归户管理</title> 
	<link rel="stylesheet" type="text/css" href="${ctx}/common/css/tab.css">
	<script type="text/javascript"> 
    	$(function() {
			//添加选项卡
			$("#tabs").tabs();
			$("#tabs").tabs('select',${guihutype});
		});								
    </script>

	</head>
	<body>
	<form id="form1" name="form1" method="POST"  action="${ctx}/servlet/defaultDispatcher">
	<table width="100%" align="center">
		<tr>
			<td>
				<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   				<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;归户管理</span>
	   			</div>
				<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
        		<div class="zc_grid_body jqgrowleft">		
				<div id="tabs">
					<ul>
						<li>
						<a href="#tabs-1" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=applyCompanyManage.findAllApplyCompany&guihutype=0'">供应商归户</a>
						</li>
						<li>
							<a href="#tabs-2" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=applyCompanyManage.findAllApplyCompany&guihutype=1'">客户归户</a>
						</li>  
						
						<li>
							<a href="#tabs-3" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=applyCompanyManage.findAllApplyCompany&guihutype=2'">担保人归户</a>
						</li> 
					</ul> 
					

					<div id="tabs-1">
							<%@ include file="findAllApplyCompany.jsp"%>
							<br/>
					</div>
					<div id="tabs-2">
							<%@ include file="findAllCustomer.jsp"%>
							<br/>
					</div> 
					<div id="tabs-3">
							<%@ include file="findAllDanBaoRen.jsp"%>
							<br/>
					</div>
					
				</div>
				</div>
				</div>
				</td>
				</tr>
			</table>
			</form>
	</body>
</html>
