<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
	<script type="text/javascript">
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
	    
	    var loop=document.getElementsByName("clock");
	    for(var i=0;i<loop.length;i++) {
	    	loop[i].innerHTML='<font color="#FF0000">*</font>'+d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate()+" "+hour+":"+min+":"+sec+"之数据";
	    }
	});
	</script>
</head>
<div id='${divName }' class='portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all'>
	<div class="portlet-header ui-widget-header ui-corner-all">
		<span class="ui-icon ui-icon-closethick" onclick="deleteDIV(this,'${divName }');" title="点击删除导航"></span>目标额度(${descr })
	</div>
	<div class="portlet-content">
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
       			<div class="zc_grid_body jqgrowleft">
       			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center; width: 4%;">月份</td>
					<td style="text-align: center; width: 4%;">目標額度</td>
					<td style="text-align: center; width: 4%;">累積撥款</td>
					<td style="text-align: center; width: 4%;">平均單價</td>
					<td style="text-align: center; width: 4%;">平均TR</td>				
					<td style="text-align: center; width: 4%;">平均租期</td>
					<td style="text-align: center; width: 3%;">達成率</td>
					<td style="text-align: center; width: 3%;">剩餘時間</td>
				</tr>
				<c:forEach var="item"  items="${dataList}" varStatus="status"> 
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: center;font-size: 11px;">${item.title }</td>
						<td style="text-align: right;font-size: 11px;"><fmt:formatNumber type="currency" value="${item.targetAmount * 1000}"></fmt:formatNumber>&nbsp;</td>
						<td style="text-align: right;font-size: 11px;"><fmt:formatNumber type="currency" value="${item.payMoney }"></fmt:formatNumber>&nbsp;</td>
						<td style="text-align: right;font-size: 11px;"><fmt:formatNumber type="currency" value="${item.avgUnitPrice }"/>&nbsp;</td>						
						<td style="text-align: right;font-size: 11px;"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${item.avgTr }"/>%&nbsp;</td>
						<td style="text-align: right;font-size: 11px; width: 4%">${item.avgPeriod }&nbsp;</td>
						<td style="text-align: right;font-size: 11px;"><fmt:formatNumber type="number" value="${item.finishPercent }" maxFractionDigits="2" minFractionDigits="2"/>%&nbsp;</td>
						<td style="text-align: right;font-size: 11px;">${item.dayDiff < 0 ? 0 : item.dayDiff }日&nbsp;</td>
					</tr>
				</c:forEach>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td colspan="2" style="text-align: center;<c:if test="${divName eq 'target_limit_motor'}">font-size: 11px;</c:if>">當日撥款：</td>
					<td colspan="6" style="text-align: center;"><fmt:formatNumber type="currency" value="${sumLeaseToday }"/></td>
				</tr>
			</table>
		</div>
		</div>
		<span name="clock"></span>
		<br><font <c:if test="${divName eq 'target_limit_motor'}">style="font-size: 11px;"</c:if>><c:if test="${divName eq 'target_limit'}"><font style="color:#FF0000;">*</font>目标额度不包含企金委贷<br></c:if></font>
		</div>
	</div>
</div>