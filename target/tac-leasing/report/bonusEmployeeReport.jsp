<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
	
	<title>业务员奖金报表</title>
		<script type="text/javascript">
			function exportThis(year){
				window.parent.callBirt("birtReport/bonusReport/empBonusReport.rptdesign", "xls", {"year" : year});
			}
			
			function changeData(e, reportId, data, dataName){
				$(e).html("<input type='text' id='MONTH_" + dataName + "' " +
						"name='MONTH_" + dataName + "' class='" + reportId + "' " + 
						"value='" + data + "' style='width:60px;height:20px;'/>");
				$("#MONTH_" + dataName).bind('keydown', function(event){
					if(event.keyCode == 13){
						doChangeData($(this));
					}
				});
			}
			
			function doChangeData(e){
				if(confirm("确定要保存吗？")){
					var url = "../servlet/defaultDispatcher";
					var inputName = $(e).attr("name");
					var param = {
							"__action" : "bonusManage.changeDataForEmpReport",
							"reportId" : $(e).attr("className"),
							"inputName" : $(e).attr("name"),
							"dataValue" : $(e).val()
					};
					$.getJSON(url, param, function (data){
						if(data){
							$(e).parent().html($(e).val());
						} else {
							alert("更新失败！");
						}
					});
				}
			}
		</script>
	</head>
	<body >
		<form id="reportForm" name="reportForm" action="../servlet/defaultDispatcher" method="post">
			<input type="hidden" name="__action" value="bonusManage.getReportByEmp">
			<div style="margin:1%;">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;业务员奖金报表</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			<div class="zc_grid_body jqgrowleft">
	  		<div class="ui-state-default ui-jqgrid-hdiv ">
	  			<table class="grid_table" cellspacing="1" cellpadding="0">
	  				<tr>
	  					<th style="width: 9%">
	  						<input type="text" name="year" value="${year }" style="width: 70px; height: 25px; text-align: center;">
	  						<input type="button" value="Go.." onclick="$('#reportForm').submit();" style="height: 25px; font-size: 12px;" />
	  						<input type="button" value="导出" style="height: 25px; font-size: 12px;" onclick="exportThis('${year }');"/>
	  					</th>
	  					<th style="width: 7%">1月</th>
	  					<th style="width: 7%">2月</th>
	  					<th style="width: 7%">3月</th>
	  					<th style="width: 7%">4月</th>
	  					<th style="width: 7%">5月</th>
	  					<th style="width: 7%">6月</th>
	  					<th style="width: 7%">7月</th>
	  					<th style="width: 7%">8月</th>
	  					<th style="width: 7%">9月</th>
	  					<th style="width: 7%">10月</th>
	  					<th style="width: 7%">11月</th>
	  					<th style="width: 7%">12月</th>
	  					<th style="width: 7%">合计</th>
	  				</tr>
	  				<c:forEach items="${bonusList }" var="r" varStatus="i">
	  					<tr>
	  						<td align="right">${r.EMP }</td>
	  						<td align="right" ondblclick="changeData(this, '${r.ID }', '${r.MONTH_1 == null ? 0 : r.MONTH_1 }', 1);"><fmt:formatNumber type="currency" value="${r.MONTH_1 == null ? 0 : r.MONTH_1 }"/>&nbsp;</td>
	  						<td align="right" ondblclick="changeData(this, '${r.ID }', '${r.MONTH_2 == null ? 0 : r.MONTH_2 }', 2);"><fmt:formatNumber type="currency" value="${r.MONTH_2 == null ? 0 : r.MONTH_2 }"/>&nbsp;</td>
	  						<td align="right" ondblclick="changeData(this, '${r.ID }', '${r.MONTH_3 == null ? 0 : r.MONTH_3 }', 3);"><fmt:formatNumber type="currency" value="${r.MONTH_3 == null ? 0 : r.MONTH_3 }"/>&nbsp;</td>
	  						<td align="right" ondblclick="changeData(this, '${r.ID }', '${r.MONTH_4 == null ? 0 : r.MONTH_4 }', 4);"><fmt:formatNumber type="currency" value="${r.MONTH_4 == null ? 0 : r.MONTH_4 }"/>&nbsp;</td>
	  						<td align="right" ondblclick="changeData(this, '${r.ID }', '${r.MONTH_5 == null ? 0 : r.MONTH_5 }', 5);"><fmt:formatNumber type="currency" value="${r.MONTH_5 == null ? 0 : r.MONTH_5 }"/>&nbsp;</td>
	  						<td align="right" ondblclick="changeData(this, '${r.ID }', '${r.MONTH_6 == null ? 0 : r.MONTH_6 }', 6);"><fmt:formatNumber type="currency" value="${r.MONTH_6 == null ? 0 : r.MONTH_6 }"/>&nbsp;</td>
	  						<td align="right" ondblclick="changeData(this, '${r.ID }', '${r.MONTH_7 == null ? 0 : r.MONTH_7 }', 7);"><fmt:formatNumber type="currency" value="${r.MONTH_7 == null ? 0 : r.MONTH_7 }"/>&nbsp;</td>
	  						<td align="right" ondblclick="changeData(this, '${r.ID }', '${r.MONTH_8 == null ? 0 : r.MONTH_8 }', 8);"><fmt:formatNumber type="currency" value="${r.MONTH_8 == null ? 0 : r.MONTH_8 }"/>&nbsp;</td>
	  						<td align="right" ondblclick="changeData(this, '${r.ID }', '${r.MONTH_9 == null ? 0 : r.MONTH_9 }', 9);"><fmt:formatNumber type="currency" value="${r.MONTH_9 == null ? 0 : r.MONTH_9 }"/>&nbsp;</td>
	  						<td align="right" ondblclick="changeData(this, '${r.ID }', '${r.MONTH_10 == null ? 0 : r.MONTH_10 }', 10);"><fmt:formatNumber type="currency" value="${r.MONTH_10 == null ? 0 : r.MONTH_10 }"/>&nbsp;</td>
	  						<td align="right" ondblclick="changeData(this, '${r.ID }', '${r.MONTH_11 == null ? 0 : r.MONTH_11 }', 11);"><fmt:formatNumber type="currency" value="${r.MONTH_11 == null ? 0 : r.MONTH_11 }"/>&nbsp;</td>
	  						<td align="right" ondblclick="changeData(this, '${r.ID }', '${r.MONTH_12 == null ? 0 : r.MONTH_12 }', 12);"><fmt:formatNumber type="currency" value="${r.MONTH_12 == null ? 0 : r.MONTH_12 }"/>&nbsp;</td>
	  						<td align="right">
	  							<fmt:formatNumber type="currency" value="${
	  								(r.MONTH_1 == null ? 0 : r.MONTH_1) +
	  								(r.MONTH_2 == null ? 0 : r.MONTH_2) +
	  								(r.MONTH_3 == null ? 0 : r.MONTH_3) +
	  								(r.MONTH_4 == null ? 0 : r.MONTH_4) +
	  								(r.MONTH_5 == null ? 0 : r.MONTH_5) +
	  								(r.MONTH_6 == null ? 0 : r.MONTH_6) +
	  								(r.MONTH_7 == null ? 0 : r.MONTH_7) +
	  								(r.MONTH_8 == null ? 0 : r.MONTH_8) +
	  								(r.MONTH_9 == null ? 0 : r.MONTH_9) +
	  								(r.MONTH_10 == null ? 0 : r.MONTH_10) +
	  								(r.MONTH_11 == null ? 0 : r.MONTH_11) +
	  								(r.MONTH_12 == null ? 0 : r.MONTH_12) }"
	  							/>&nbsp;
	  						</td>
		  				</tr>
	  				</c:forEach>
	  			</table>
			</div>
			</div>
			</div>
			</div>
		</form>
		
		
		<br>
	<span id="clock"></span>
	<p align="right" style="font-weight:bolder;">编号：IT-RPT-42</p>
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
			    document.getElementById("clock").innerHTML='<font color="#FF0000">*</font>'+d.getFullYear()+"-"+(d.getMonth()+1)+"-"+(d.getDate()-1)+"  "+"20:00之数据";
			});
	</script>
	</body>
</html>
