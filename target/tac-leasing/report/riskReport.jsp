<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
		<script type="text/javascript" src="${ctx }/decompose/js/tab.js"></script>
		<script type="text/javascript" src="${ctx }/receivables/js/showreport.js"></script>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<title>评审统计</title>
		
		<script type="text/javascript">
			function reportExcel(differentReport)
			{
				location.href='../servlet/defaultDispatcher?__action=differentReport.reportExcel';
			}
		</script>
	</head>
	<body>
		<div id="main" class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" style="width:1500px;">
				<div class="ui-state-default ui-jqgrid-hdiv">
					<div class="zc_grid_body ">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >评审统计</span>
		   	</div>			
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;" rowspan="2">公司名称</td>
					<td colspan="5" style="text-align: center;">报告（未提交）</td>
					<td colspan="2" style="text-align: center;">报告审批</td>
					<td colspan="6" style="text-align: center;">评审</td>
					<td style="text-align: center;" rowspan="2">完成合计</td>
					<td style="text-align: center;" rowspan="2">总计</td>
					<td style="text-align: center;" rowspan="2">完成率</td>
					<td style="text-align: center;" rowspan="2">最长耗时</td>
					<td style="text-align: center;" rowspan="2">最短耗时</td>
					<td style="text-align: center;" rowspan="2">平均耗时</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">
					
					<td style="text-align: center;">1天以内</td>
					<td style="text-align: center;">1－2天</td>
					<td style="text-align: center;">2－3天</td>
					<td style="text-align: center;">3天以上</td>
					<td style="text-align: center;">合计</td>
					<td style="text-align: center;">已审批</td>
					<td style="text-align: center;">未审批</td>
					<td style="text-align: center;">未评审</td>
					<td style="text-align: center;">评审中</td>
					<td style="text-align: center;">评审通过</td>
					<td style="text-align: center;">不通过附条件</td>
					<td style="text-align: center;">不通过</td>
					<td style="text-align: center;">通过率</td>		
				</tr>	
				<c:forEach items="${list}" var="list">		
					<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td style="text-align: center;">${list.DECP_NAME_CN }&nbsp;</td>
							<td style="text-align: center;">${list.BAOGAO_ONE }&nbsp;</td>
							<td style="text-align: center;">${list.BAOGAO_ONETOTWO }&nbsp;</td>
							<td style="text-align: center;">${list.BAOGAO_TWOTOTHREE }&nbsp;</td>
							<td style="text-align: center;">${list.BAOGAO_THREE }&nbsp;</td>
							<td style="text-align: center;">${list.BAOGAO_SUM }&nbsp;</td>
							<td style="text-align: center;">${list.SHENPI_YES }&nbsp;</td>
							<td style="text-align: center;">${list.SHENPI_NO }&nbsp;</td>
							<td style="text-align: center;">${list.PINGSHEN_UN }&nbsp;</td>
							<td style="text-align: center;">${list.PINGSHEN_ZHONG}&nbsp;</td>
							<td style="text-align: center;">${list.PINGSHEN_GUO }&nbsp;</td>
							<td style="text-align: center;">${list.PINGSHEN_BUTONGFU}&nbsp;</td>
							<td style="text-align: center;">${list.PINGSHEN_BUTONG}&nbsp;</td>
							<td style="text-align: center;"><fmt:formatNumber value="${list.PINGSHEN_LV }" pattern="#,##0.00#" />%&nbsp;</td>
							<td style="text-align: center;">${list.PINGSHEN_YES }&nbsp;</td>
							<td style="text-align: center;">${list.BAO_TIJIAO }&nbsp;</td>
							<td style="text-align: center;"><fmt:formatNumber value="${list.WANCHENG_LV }" pattern="#,##0.00#" />%&nbsp;</td>
							<td style="text-align: center;">${list.MAX_HCONTEXT }&nbsp;</td>
							<td style="text-align: center;">${list.MIN_HCONTEXT }&nbsp;</td>
							<td style="text-align: center;">${list.AVG_HCONTEXT }&nbsp;</td>																	
					</tr>
				</c:forEach>	
				<tr>
					<td colspan="20"><div align="center"><input class="ui-state-default ui-corner-all" type="button" id="buttonAdd" value="导出Excel" onclick="reportExcel()"></input></div></td>
				</tr>
			</table>
		</div>
			<br>
	<span id="clock"></span>
	<p align="right" style="font-weight:bolder;color: black;">编号：IT-RPT-41</p>
	<script>
	$(function () {
			var d=new Date();
		    var sec=d.getSeconds();
		    var min=d.getMinutes();
		    var hour=d.getHours();
		    if(sec<10) {
		    	sec="0"+sec;
		    }
		    if(min<10) {
		    	min="0"+min;
		    }
		    if(hour<10) {
		    	hour="0"+hour;
		    }
		    document.getElementById("clock").innerHTML='<font color="#FF0000">*</font>'+d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate()+" "+hour+":"+min+":"+sec+"之数据";
		});
	</script>
	</body>
</html>	