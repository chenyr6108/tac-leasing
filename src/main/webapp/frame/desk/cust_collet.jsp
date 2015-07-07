<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<div id="${divName }" class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all">
	<div class="portlet-header ui-widget-header ui-corner-all">
		<span class="ui-icon ui-icon-closethick" onclick="deleteDIV(this,'${divName }');" title="点击删除导航"></span>應收統計(${descr })
	</div>
	<div class="portlet-content">
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
       			<div class="zc_grid_body jqgrowleft">
       			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">客戶數量</td>
					<td style="text-align: right;width: 130px;">${result.CUST_COUNT }&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">合同數量</td>
					<td style="text-align: right;">${result.PRJT_COUNT }&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">總本金</td>
					<td style="text-align: right;"><fmt:formatNumber type="currency" value="${result.LOSS_OWN_PRICE }"/>&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">總利息</td>
					<td style="text-align: right;"><fmt:formatNumber type="currency" value="${result.LOSS_REN_PRICE }"/>&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">總應收租金</td>
					<td style="text-align: right;"><fmt:formatNumber type="currency" value="${result.LOSS_PRICE }"/>&nbsp;</td>
				</tr>
			</table>
		</div>
		</div>
		<span name="clock"></span>
		<br><font color="red">*</font><font>應收統計不包含企金委贷</font>
		<br><font color="red">*</font><font>合同数量:包含${result.PRJT_COUNT_OTHER }件已交完租金，但未交留購款或罰息，而未辦理結清之案件。</font>
		</div>
	</div>
</div>
