<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
	$(function(){
		$R1 = {
			initChart : function(){
				var chart1 = new FusionCharts("charts/MSColumn3D.swf", "ChartId", "100%", "300");
				chart1.setDataURL("data/dunStatistics.xml");
				chart1.render("dunStatistics");
			}
		};
		$R1.initChart();
	});
//-->
</script>
<div id='dun_statistics' class='portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all'>
	<div class="portlet-header ui-widget-header ui-corner-all">
		<span class="ui-icon ui-icon-closethick" onclick="deleteDIV(this,'dun_statistics');" title="点击删除导航"></span>逾期统计
	</div>
	<div class="portlet-content" id="dunStatistics"></div>
</div>