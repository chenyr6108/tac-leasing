<%@ page language="java" pageEncoding="UTF-8"%>
<html>
	<head>
	<script type="text/javascript">
		$(function(){
			$R0 = {
				initCharts : function(){
					var chart1 = new FusionCharts("charts/Pie3D.swf", "ChartId", "100%", "300");
					chart1.setDataURL("data/accountReceivable.xml");
					chart1.render("accountReceivable");
					}
			};
			$R0.initCharts();
		});
	</script>
</head>
	<body>
<div id='receivable_credit' class='portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all'>
	<div class="portlet-header ui-widget-header ui-corner-all">
		<span class="ui-icon ui-icon-closethick" onclick="deleteDIV(this,'receivable_credit');" title="点击删除导航"></span>应收账款
	</div>
	<div class="portlet-content" id="accountReceivable"></div>
</div>
</body>
</html>