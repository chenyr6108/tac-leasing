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
		<title>逾期情况</title>
	</head>
	<body>
		<div id="tabs" style="width:1500px;">
		<ul>
			<li style="width: 100px;text-align: center;"><a href="#tabs-1" onclick="selectCardForDun(0)">逾期情况</a></li>
			<li style="width: 100px;text-align: center;"><a href="#tabs-2" onclick="selectCardForDun(1)">逾期情况（一）</a></li>
			<li style="width: 100px;text-align: center;"><a href="#tabs-3" onclick="selectCardForDun(2)">逾期情况（二）</a></li>
		</ul>
		<div id="main" class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" style="width:1500px;">
				<div class="ui-state-default ui-jqgrid-hdiv">
					<div class="zc_grid_body ">
						<div id="tabs-1">
							<%@ include file="/report/dunCondition.jsp"%>
						</div>
						<!-- endone -->
						<div id="tabs-2">
							<%@ include file="/report/dunOne.jsp"%>
						</div>
						<!-- endone -->
						<div id="tabs-3">
							<%@ include file="/report/dunTwo.jsp"%>
						</div>
						<!-- endone -->
					</div>
				</div>
			</div>
		</div>
	</body>
</html>