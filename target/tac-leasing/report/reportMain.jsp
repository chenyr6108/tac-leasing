<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
		<script type="text/javascript" src="${ctx }/decompose/js/tab.js"></script>
		<script type="text/javascript" src="${ctx }/receivables/js/showreport.js"></script>
		<script type="text/javascript">
			$(function() {
				//添加选项卡
				$("#tabs").tabs();
				$("#tabs").tabs('select',${cardFlag});
			});
		</script>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<title>应收账款</title>
	</head>
	<body>
		<div id="tabs">
		<ul>
			<li style="width: 100px;text-align: center;"><a href="#tabs-1" onclick="selectCard(0)">构成分析</a></li>
			<li style="width: 100px;text-align: center;"><a href="#tabs-2" onclick="selectCard(1)">时间段分析</a></li>
			<li style="width: 100px;text-align: center;"><a href="#tabs-3" onclick="selectCard(2)">分解执行率</a></li>
		</ul>
		<div id="main" class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
				<div class="ui-state-default ui-jqgrid-hdiv">
					<div class="zc_grid_body ">
						<div id="tabs-1">
							<%@ include file="/report/noDecomposeConstruct.jsp"%>
						</div>
						<!-- endone -->
						<div id="tabs-2">
							<%@ include file="/report/noDecomposeTimes.jsp"%>
						</div>
						<!-- endone -->
						<div id="tabs-3">
							<%@ include file="/report/noDecomposePercent.jsp"%>
						</div>
						<!-- endone -->
					</div>
				</div>
			</div>
		</div>
	</body>
</html>