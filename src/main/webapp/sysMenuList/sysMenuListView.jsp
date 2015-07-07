<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="../resources/jquery/plugins/css-dock-menu/style.css"></link>
<!--[if IE 7]><link type="text/css" rel="stylesheet" href="../resources/jquery/plugins/css-dock-menu/ie7.css"></link><![endif]-->
<script type="text/javascript" src="../resources/jquery/plugins/jquery.contextmenu.r2.js"></script>
<script type="text/javascript" src="../resources/jquery/plugins/bean.jquery.auto-windows.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx }/common/css/navy.css">
<link type="text/css" rel="stylesheet" href="../frame/style/style.css"></link>
<link type="text/css" rel="stylesheet" href="../frame/style/tab-button.css"></link>
<link type="text/css" rel="stylesheet" href="../frame/style/menu.css"></link>
<script type="text/javascript" src="../frame/script/script.js"></script>
<script type="text/javascript" src="../frame/script/tab-manager.js"></script>
<script type="text/javascript">
	function expandAll(){
		$('.collapsed:not([class*="expanded"])').click();
	}
	function closeAll(){
		$('.expanded').click();
	}
</script>
<title>系统功能列表浏览</title>
</head>
<body>
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
  		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;系统功能列表浏览</span>
  	</div>
	<div style="height:590px; width:620px; margin:auto">
		<input type="button" value="展开所有" onclick="expandAll()" class="ui-state-default ui-corner-all" style="margin:10px 20px 0 60px;" />
		<input type="button" value="收起所有" onclick="closeAll()" class="ui-state-default ui-corner-all" />
		&nbsp;&nbsp;&nbsp;&nbsp;(说明：<span style="width:90px;color:#317fd4;">蓝色：有权限访问</span>&nbsp;&nbsp;,&nbsp;&nbsp;<span style="color:#666666;">灰色：无权限访问</span>)
		<div id="page_menu" style="height:580px; width:600px; margin-top:2px; padding:4px 2px;" class="ui-state-default">
			<div id="menu_container" style="height:100%; max-height:590px; width:98%;">
				<c:forEach items="${allMenuList}" var="item">
					<div>
						<div class="item type">
							<span class="collapsed"></span><b style="font-family:微软雅黑;color:#317fd4;font-size:12px;font-weight:bold;<c:if test="${item.valid1 != '1'}">color:#666666;</c:if>">${item.first_name }</b>
						</div>
						<div class="childs">
							<c:forEach items="${item.secondMenuView}" var="item2">
								<c:if test="${item2.second_level_num != '-1'}">
									<div class="item" style="font-family:微软雅黑;color:#317fd4;font-size:12px;<c:if test="${item2.valid2 != '1'}">color:#666666;</c:if> font-weight:normal;">${item2.second_name }</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>