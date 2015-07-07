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
<div id='delay_pay' class='portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all'>
	<div class="portlet-header ui-widget-header ui-corner-all">
		<span class="ui-icon ui-icon-closethick" onclick="deleteDIV(this,'delay_pay');" title="点击删除导航"></span>缓拨案件统计(单位K)
	</div>
	<div class="portlet-content">
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
   			<div class="zc_grid_body jqgrowleft">
   			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">办事处</td>
					<td style="text-align: center;">缓拨件数/比</td>
					<td style="text-align: center;">缓拨金额/比</td>
					<td style="text-align: center;">过期件数/比</td>
					<td style="text-align: center;">过期金额/比</td>
					<td style="text-align: center;">总件数</td>
					<td style="text-align: center;">总金额</td>
				</tr>
				<c:set value="0" var="totalcount_sum"/>
				<c:set value="0" var="pay_money_sum"/>
				<c:set value="0" var="dunCount_sum"/>
				<c:set value="0" var="lease_rze_sum"/>
				<c:set value="0" var="total_count_sum"/>
				<c:set value="0" var="total_rze_sum"/>
				<c:forEach items="${resultList }" var="i">
				<c:if test="${i.TOTAL_COUNT != 0 }">
				<c:set value="${i.TOTALCOUNT + totalcount_sum}" var="totalcount_sum"/>
				<c:set value="${i.PAY_MONEY + pay_money_sum}" var="pay_money_sum"/>
				<c:set value="${i.DUNCOUNT + dunCount_sum}" var="dunCount_sum"/>
				<c:set value="${i.LEASE_RZE + lease_rze_sum}" var="lease_rze_sum"/>
				<c:set value="${i.TOTAL_COUNT + total_count_sum}" var="total_count_sum"/>
				<c:set value="${i.TOTAL_RZE + total_rze_sum}" var="total_rze_sum"/>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: center;">${i.DECP_NAME_CN }</td>
						<td style="text-align: right;">${i.TOTALCOUNT }&nbsp;/&nbsp;<fmt:formatNumber value="${i.TOTALCOUNT / i.TOTAL_COUNT * 100 }" pattern="##0.00"/>%&nbsp;</td>
						<td style="text-align: right;"><fmt:formatNumber pattern="#,###,##0" value="${i.PAY_MONEY / 1000 }"/>&nbsp;/&nbsp;<fmt:formatNumber value="${i.PAY_MONEY / i.TOTAL_RZE * 100 }" pattern="##0.00"/>%&nbsp;</td>
						<td style="text-align: right;">${i.DUNCOUNT }&nbsp;/&nbsp;<fmt:formatNumber value="${i.DUNCOUNT / i.TOTAL_COUNT * 100 }" pattern="##0.00"/>%</td>
						<td style="text-align: right;"><fmt:formatNumber pattern="#,###,##0" value="${i.LEASE_RZE / 1000 }"/>&nbsp;/&nbsp;<fmt:formatNumber value="${i.LEASE_RZE / i.TOTAL_RZE * 100 }" pattern="##0.00"/>%&nbsp;</td>
						<td style="text-align: right;">${i.TOTAL_COUNT }&nbsp;</td>
						<td style="text-align: right;"><fmt:formatNumber pattern="#,###,##0" value="${i.TOTAL_RZE / 1000 }"/>&nbsp;</td>
					</tr>
				</c:if>
				</c:forEach>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">合计：&nbsp;</td>
					<td style="text-align: right;">${totalcount_sum }&nbsp;/&nbsp;<fmt:formatNumber value="${totalcount_sum / total_count_sum * 100 }" pattern="##0.00"/>%&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber pattern="#,###,##0" value="${pay_money_sum / 1000 }"/>&nbsp;/&nbsp;<fmt:formatNumber value="${pay_money_sum / total_rze_sum * 100 }" pattern="##0.00"/>%&nbsp;</td>
					<td style="text-align: right;">${dunCount_sum }&nbsp;/&nbsp;<fmt:formatNumber value="${dunCount_sum / total_count_sum * 100 }" pattern="##0.00"/>%&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber pattern="#,###,##0" value="${lease_rze_sum / 1000 }"/>&nbsp;/&nbsp;<fmt:formatNumber value="${lease_rze_sum / total_rze_sum * 100 }" pattern="##0.00"/>%&nbsp;</td>
					<td style="text-align: right;">${total_count_sum }&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber pattern="#,###,##0" value="${total_rze_sum / 1000 }"/>&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td colspan="7"><span name="clock"></span><br><font color="red">*</font>缓拨案件只計算未过期案件<br><font color="red">*</font>过期案件只计算当年案件(核准日為当年)</td>
				</tr>
			</table>
		</div>
		</div>
		</div>
	</div>
</div>