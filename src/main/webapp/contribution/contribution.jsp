<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>贡献度</title>
<style type="text/css">
.tdb{background-color: #99CCFF; text-align: center;}
.tdh{background-color: #E0EFFC; text-align: center;}
.tdl{background-color: #A7A7A7; text-align: center;}
.tds{background-color: #FFFF99; text-align: center;}
.tbw{background-color: #FFFFFF; width: 100%}

body,h1,h2,h3,h4,h5,h6,p,ul,ol,li,form,img,table,th,td,blockquote,fieldset,div,strong,label,em{margin:0;padding:0;border:0;}
ul,ol,li{list-style:none;}
input{margin:0;font-size:12px;vertical-align:middle;}
table{border-collapse:collapse;border-spacing:1;}
p{line-height:24px}
#n{margin:10px auto; width:920px; border:1px solid #CCC;font-size:12px; line-height:30px;}
#n a{ padding:0 4px; color:#333}
.clearfloat{height:0;font-size:1px;clear:both;line-height:0;}

#container{  width:1003px; text-align:left; margin:0 auto; }
a{color:#333;text-decoration:none;}
a:hover{color:#ef9b11; text-decoration:underline;}
/*导出EXCEL按钮样式*/
#site-nav {z-index: 10000; line-height:27px; position: relative; }
#site-nav .menu {margin:1px 0 0 10px; position: relative;}
#site-nav .menu-hd {color:#2e6e9e;font-weight:bold;border:1px solid #c5dbec;background: #e1effb; display: block; text-align:center; z-index: 10002; cursor: pointer; position: relative; height: 26px}
#site-nav .menu-hd b {border-right: #e1effb 4px solid; border-top: #666 4px solid; font-size: 0px; right: 10px; border-left: #e1effb 4px solid; width: 0px; line-height: 0; border-bottom: #e1effb 4px solid; position: absolute; top: 12px; height: 0px; -webkit-transition: -webkit-transform .2s ease-in; -moz-transition: -webkit-transform .2s ease-in; -o-transition: -webkit-transform .2s ease-in; transition: -webkit-transform .2s ease-in}
#site-nav .menu-bd {border:1px solid #c5dbec; padding:10px; display: none; z-index: 10001; left: 0px; background: #e1effb; position: absolute; top:26px;width: 320px; height: 100px;}
#site-nav .menu:hover .menu-hd { background: #e1effb; margin: 0px; border:1px solid #c5dbec; border-bottom: 0px;}
#site-nav .menu:hover .menu-bd {display: block}
#site-nav .menu:hover .menu-hd b {filter: progid:dximagetransform.microsoft.basicimage(rotation=2);  top:10px;  -moz-transform: rotate(180deg); -moz-transform-origin: 50% 30%; -webkit-transform: rotate(180deg); -webkit-transform-origin: 50% 30%; -o-transform: rotate(180deg); -o-transform-origin: 50% 30%; transform: rotate(180deg); transform-origin: 50% 30%}
#site-nav .hover .menu-hd b {border-left-color: #fff; filter: progid:dximagetransform.microsoft.basicimage(rotation=2); border-bottom-color: #fff; border-top-color: #666; top: 5px; border-right-color: #fff; -moz-transform: rotate(180deg); -moz-transform-origin: 50% 30%; -webkit-transform: rotate(180deg); -webkit-transform-origin: 50% 30%; -o-transform: rotate(180deg); -o-transform-origin: 50% 30%; transform: rotate(180deg); transform-origin: 50% 30%}
</style>
<script type="text/javascript">
$(function (){
	$("#DATE").datepicker($.datepicker.regional['zh-CN']);
	$("#type").buttonset();
	$("#days").buttonset();
	makeYearsOption();
	$('input:radio').click(function(){
		checkExportOption();
	});
	checkExportOption();
});
function makeYearsOption(){
	var checkedYear = $('#currentYear').val();
	var currentYear = new Date().getFullYear();
	var beginYear = 2010;
	var selected = (i == checkedYear?"selected=selected":"");
	var optionHtml = '<option ' + selected + ' value="-1">查看全部</option>';
	for(var i = currentYear; i >= beginYear; i--){
		selected = (i == checkedYear?"selected=selected":"");
		optionHtml = optionHtml + '<option ' + selected + ' value="' + i + '">' + i + '年</option>';
	}
	$('#YEAR').html(optionHtml);
}
function exportExcel(){
	var option = 'pType=';
	var item = $(":checkbox[name=pType]:checked");
	$('#err_message').stop(true,true)
	if(item.length == 0){
		$('#err_message').text('未选择分类');
		$('#err_message').slideToggle('slow',function(){
			setTimeout("$('#err_message').slideToggle('slow')",1000);			
		});
		return false;
	}
	item.each(function(){
		option = option + $(this).val() + ',';
	});
	option = option.substring(0,option.length - 1) + '&dType=';
	item = $(":checkbox[name=dType]:checked");
	if(item.length == 0){
		$('#err_message').text('未选择逾期天数');
		$('#err_message').slideToggle('slow',function(){
			setTimeout("$('#err_message').slideToggle('slow')",1000);	
		});
		return false;
	}
	item.each(function(){
		option = option + $(this).val() + ',';
	});
	option = option.substring(0,option.length - 1);
	window.open('../servlet/defaultDispatcher?__action=contributionCommand.exportExcel'+'&' + option + '&YEAR=' + $('#YEAR').val());
}
function checkExportOption(){
	$('input:checkbox').removeAttr('checked');
	var index = $('input[name="type"]:checked').attr('id');
	index = index[index.length - 1];
	$('#check'+index).attr('checked','checked');
	index = $('input[name="days"]:checked').attr('id');
	index = index[index.length - 1];
	$('#check_days'+index).attr('checked','checked');
	$("#pType").buttonset();
	$("#dType").buttonset();
}
</script>
</head>
<body>
	<form action="../servlet/defaultDispatcher" method="post">
		<input type="hidden" name="__action"  value="contributionCommand.getContributions" />
		<input type="hidden" id="currentYear"  value="${YEAR }" />
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
			<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;贡献度</span>
		</div>
		<table border="1" style="margin-left:6px;">
			<tr>
				<td>年份
					<select id="YEAR" name="YEAR">
					</select>
				</td>
				<td style="padding-left:20px;">
					<div id="type" style="margin-top:4px;">分类
						<input type="radio" value="upUser" id="radio1" name="type" <c:if test="${type=='upUser'||(type!='user'&&type!='appUser') }">checked="checked"</c:if> /><label for="radio1">主管</label>
						<input type="radio" value="user" id="radio2" name="type" <c:if test="${type=='user' }">checked="checked"</c:if> /><label for="radio2">業務員</label>
						<input type="radio" value="appUser" id="radio3" name="type" <c:if test="${type=='appUser' }">checked="checked"</c:if> /><label for="radio3">核准人</label>
						<input type="radio" value="auUser" id="radio4" name="type" <c:if test="${type=='auUser' }">checked="checked"</c:if> /><label for="radio4">评审人</label>
					</div>
				</td>
				<td style="padding-left:20px;">
					<div id="days" style="margin-top:4px;">逾期天数
						<input type="radio" value="31" id="radio_days1" name="days" <c:if test="${days=='31'||(type!='90'&&type!='180') }">checked="checked"</c:if> /><label for="radio_days1">31天</label>
						<input type="radio" value="90" id="radio_days2" name="days" <c:if test="${days=='90' }">checked="checked"</c:if> /><label for="radio_days2">90天</label>
						<input type="radio" value="180" id="radio_days3" name="days" <c:if test="${days=='180' }">checked="checked"</c:if> /><label for="radio_days3">180天</label>
					</div>
				</td>
				<td>
					<input type="submit" value="查询" style="width:50px; height:29px; margin:2px 0 0 10px; pointer;" class="ui-state-default ui-corner-all"/>
				</td>
				<td id="site-nav" width="120px">
					<div class="menu">
						<span class="menu-hd" onclick="exportExcel()">导出EXCEL<b></b></span> 
						<div class="menu-bd">
							<span style="width:60px; float:left; text-align:right; padding-right:10px;">分类:</span>
							<div id="pType" style="float:left;">
								<input type="checkbox" name="pType" value="upUser" id="check1"><label for="check1">主管</label>
								<input type="checkbox" name="pType" value="user" id="check2"><label for="check2">業務員</label>
								<input type="checkbox" name="pType" value="appUser" id="check3"><label for="check3">核准人</label>
								<input type="checkbox" name="pType" value="auUser" id="check4"><label for="check4">评审人</label>
							</div>
							<span style="width:60px; float:left;clear:left;text-align:right; padding-right:10px; margin-top:10px;">逾期天数:</span>
							<div id="dType" style="float:left;margin-top:10px;">
								<input type="checkbox" name="dType" value="31" id="check_days1"><label for="check_days1">31天</label>
								<input type="checkbox" name="dType" value="90" id="check_days2"><label for="check_days2">90天</label>
								<input type="checkbox" name="dType" value="180" id="check_days3"><label for="check_days3">180天</label>
							</div>
							<div id="err_message" style="display:none;position: absolute;color:#FF0000; clear:left; float:left;top:84px;">111</div>
							<input type="button" onclick="exportExcel()" value="确定导出" style="width:70px; left:140px; margin:10px 0 0 100px; height:24px; float: left;" class="ui-state-default ui-corner-all"/>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</form>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" style="margin-top:4px;">
		<div class="ui-state-default ui-jqgrid-hdiv" style="background:#FFFFFF;">
			<table class="grid_table">
				<tr class="ui-jqgrid-labels">
					<th>
						<c:if test="${type=='upUser'}">主管</c:if>
						<c:if test="${type=='user'}">業務員</c:if>
						<c:if test="${type=='appUser'}">核准人</c:if>
						<c:if test="${type=='auUser'}">评审人</c:if>
					</th>
					<th>
						合同筆數
					</th>
					<th>
						淨撥款金額
					</th>
					<th>
						利息總額
					</th>
					<th>
						利差總額
					</th>
					<th>
						平均TR
					</th>
					<th>
						逾期合同數<br/>（${days}天以上）
					</th>
					<th>
						逾期合同百分比<br/>（${days}天以上）
					</th>
					<th>
						逾期金額<br/>（${days}天以上）
					</th>
					<th>
						逾期金額百分比<br/>（${days}天以上）
					</th>
				</tr>
				<tbody>
				<c:forEach items="${resultList }" var="item" varStatus="index">
					<tr>
						<td> 
							${item.NAME }
						</td>
						<td> 
							${item.TOTAL_COUNT }
						</td>
						<td width="120px;" style="text-align:right;"> 
							<fmt:formatNumber type="currency" value="${item.LEASE_RZE }"/>&nbsp;&nbsp;
						</td>
						<td width="120px;" style="text-align:right;"> 
							<fmt:formatNumber type="currency" value="${item.REN_PRICE }"/>&nbsp;&nbsp;
						</td>
						<td width="120px;" style="text-align:right;"> 
							<fmt:formatNumber type="currency" value="${item.RATE_DIFF }"/>&nbsp;&nbsp;
						</td>
						<td> 
							<fmt:formatNumber type="number" value="${item.TR/item.LEASE_RZE }" minFractionDigits="2" maxFractionDigits="2"/>%
						</td>
						<td> 
							${item.DUN_COUNT }
						</td>
						<td> 
							<fmt:formatNumber type="number" value="${item.DUN_COUNT/item.TOTAL_COUNT * 100 }" minFractionDigits="2" maxFractionDigits="2"/>%
						</td>
						<td width="120px;" style="text-align:right;"> 
							<fmt:formatNumber type="currency" value="${item.DUN_PRICE }"/>&nbsp;&nbsp;
						</td>
						<td> 
							<fmt:formatNumber type="number" value="${item.DUN_PRICE/item.LEASE_RZE * 100 }" minFractionDigits="2" maxFractionDigits="2"/>%
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<br>
	<div id="clock" style="color:#FF0000; padding-left:6px;">*${YEAR=="-1"?"全部":YEAR }年度数据</div>
	<div id="clock" style="color:#FF0000; padding-left:6px;">*<fmt:formatDate type="date" pattern="yyyy-MM-dd HH:mm:ss" value="${dataTime }" />之数据</div>
	<p align="right" style="font-weight:bolder;">编号：IT-RPT-28&nbsp;&nbsp;</p>
</body>
</html>