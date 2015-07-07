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
		<span class="ui-icon ui-icon-closethick" onclick="deleteDIV(this,'${divName }');" title="点击删除导航"></span>${result.year }年委贷目标额度
	</div>
	<div class="portlet-content">
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
       			<div class="zc_grid_body jqgrowleft">
       			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center; width: 4%">目標額度</td>
					<td style="text-align: center; width: 4%">件数</td>
					<td style="text-align: center; width: 4%">累積撥款</td>
					<td style="text-align: center; width: 4%">達成率</td>
					<td style="text-align: center; width: 4%">剩餘時間</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: right;">
						<fmt:formatNumber value="${result.target }" type="currency" pattern="#,##0.00"/>&nbsp;
					</td>
					<td style="text-align: right;">
						${result.count }&nbsp;
					</td>
					<td style="text-align: right;">
						<fmt:formatNumber value="${result.payMoney }" type="currency" pattern="#,##0.00"/>&nbsp;
					</td>
					<td style="text-align: right;">
						<fmt:formatNumber value="${result.achievePer }" pattern="0.00"/>%&nbsp;
					</td>
					<td style="text-align: right;">
						<fmt:formatNumber value="${result.limitMonth }" pattern="0"/>月&nbsp;
					</td>
				</tr>
			</table>
		</div>
		</div>
		<span name="clock"></span>
		</div>
	</div>
</div>