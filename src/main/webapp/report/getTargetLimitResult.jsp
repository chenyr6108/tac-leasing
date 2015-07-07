<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
	
	<title>目标额度</title>
		<script type="text/javascript">
			function doQuery() {
				$("#form").submit();
			}
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
			    var selectedYear = ${year};
				var now = new Date();
				var currentYear = now.getFullYear();
				for(var i = 2010; i <= currentYear; i ++){
					var o = new Option(i, i);
					if (i == selectedYear) {
						o.selected = true;
					}
					$("#year").get(0).add(o);
				}
			});
		</script>
	</head>
	<body >
		<form id="form" name="form" action="../servlet/defaultDispatcher" method="post">
		<input type="hidden" name="__action" value="show.target_limitResultForReport">
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" style="width: 600px;">
			<div class="zc_grid_body jqgrowleft" style="width: 600px;">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px;width: 595px;">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;目标额度(<c:if test="${empty productionType }">全部</c:if><c:if test="${productionType==1 }">设备</c:if><c:if test="${productionType==2 }">商用车</c:if><c:if test="${productionType==3 }">乘用车</c:if>)</span>
		   	</div>
	          	<table width="600px" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      	<td width="8">&nbsp;</td>
				        <td width="40" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="center">
				          <table>
							<tr>
								<td>年份：</td>
								<td>
									<select id="year" name="year" style="width: 100px; height: 22px;">
									</select>
								</td>
								<td>类型：</td>
								<td>
									<tac:dropdownListTag name="productionType" item="${productionTypeList }" displayValue="${productionType }"/>
								</td>
							</tr>
						  </table>
			            </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" onclick="doQuery();" class="blue_button">搜 索</a></td>
				      </tr>
			    </table>
				<table class="grid_table" style="width: 600px;">
					<tr class="ui-state-default zc_grid_head">
						<td style="text-align: center;">月份</td>
						<td style="text-align: center;">目標額度</td>
						<td style="text-align: center;">累積撥款</td>
						<td style="text-align: center;">平均單價</td>
						<c:if test="${productionType!=3 }"><td style="text-align: center;">平均TR</td></c:if>
						<td style="text-align: center;">達成率</td>
					</tr>
					<c:forEach var="item"  items="${dataList}" varStatus="status"> 
						<tr>
							<td style="text-align: center;">${item.title }</td>
							<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.targetAmount * 1000}"></fmt:formatNumber></td>
							<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.payMoney }"></fmt:formatNumber></td>
							<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.avgUnitPrice }"/></td>
							<c:if test="${productionType!=3 }"><td style="text-align: right;"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${item.avgTr }"/>%</td></c:if>
							<td style="text-align: right;"><fmt:formatNumber type="number" value="${item.finishPercent }" maxFractionDigits="2" minFractionDigits="2"/>%</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<span id="clock"></span>
		</div>
		</form>
		<br>
		<font style="color:#FF0000;">*</font>目标额度不包含企金委托<br>
		<p align="right" style="font-weight:bolder;">编号：IT-RPT-20</p>
	</body>
</html>
