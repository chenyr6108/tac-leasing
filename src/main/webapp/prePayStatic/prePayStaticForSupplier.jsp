<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <script type="text/javascript">
	$(function() {
		$("#start").datepicker($.datepicker.regional['zh-CN']);
		$("#end").datepicker($.datepicker.regional['zh-CN']);
	});
	
 	function doQuery(){
		var begin=document.getElementById("start").value;
		var end=document.getElementById("end").value;
		var startDate=new Date(begin.replace("-", "/").replace("-", "/"));  
		var endDate=new Date(end.replace("-", "/").replace("-", "/"));  
		if(begin==""){
			alert('起始日期不能为空!');
			return;
		}else if(end==""){
			alert('终止日期不能为空!');
			return;
		}else if(startDate>endDate){
			alert('起始日期不能大于终止日期!');
			return;
		}else{
			$("#form1").submit();
		}
		
	} 


  </script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>供应商交机前拨款统计表</title>
</head>
<body>
<form action="../servlet/defaultDispatcher" name="form1" id="form1"
		method="post">
		<input type="hidden" name="__action" id="__action"
			value="prePayStaticForSupplier.query">
		<div
			class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
			style="height: 30px">
			<span class="ui-jqgrid-title"
				style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;供应商交机前拨款统计表</span>
		</div>
		<div
			class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
			style="background: white">
			<table width="70%" border="0" cellspacing="0" cellpadding="0"
				bgcolor="#ffffff">
				
				<tr>
					<td width="8">&nbsp;</td>
					<td width="60" class="ss_o"></td>
					<td width="40%" class="ss_t">
						<table style="margin-left: 10px;">
							<tr>
								<td colspan="5">&nbsp;
								    起始日期:<input type="text" name="startDate" id="start" readonly="readonly" value="${begin}">&nbsp;&nbsp;
								    终止日期:<input type="text" name="endDate" id="end" value="${end}" readonly="readonly">
								</td>
							</tr>
						</table>
					</td>
					<td width="55" class="ss_th" valign="top">&nbsp;</td>
					<td width="30%"><a href="#" name="search" id="search"
						onclick="doQuery();" class="blue_button">搜 索</a>
						<strong style="color:red;">(*默认查询最近一个月)</strong></td>
				</tr>
			</table>
			<br><br><br>
			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr >
					<td><%@ include file="/common/pageControlTop.jsp"%></td>
				</tr>
			</table>
		
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="tableForColor" 
		       style="width:100%">
		        <thead>
				<tr class="ui-jqgrid-labels">
                     <th class="ui-state-default ui-th-ltr zc_grid_head">序号</th>  
                     <th class="ui-state-default ui-th-ltr zc_grid_head">供应商</th>
                     <th class="ui-state-default ui-th-ltr zc_grid_head">拨款件数</th>
                     <th class="ui-state-default ui-th-ltr zc_grid_head">金额</th>
                     <th class="ui-state-default ui-th-ltr zc_grid_head">拨款日期</th>
				</tr>
			    </thead>
			<tbody>
			<c:forEach items="${dataList}" var="item" varStatus="status">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
				         <td style="text-align: center;">${status.count}</td>
				         <td style="text-align: center;">${item.BACKCOMP}</td>
				         <td style="text-align: right;">${item.COUNT}</td>
				         <td style="text-align: right;"><fmt:formatNumber
							value="${item.PAY}" type="currency"></fmt:formatNumber></td>
				         <td style="text-align: center;">${item.EXPECTEDDATE}</td>
					</tr>
			</c:forEach>
			</tbody>
		</table>
		<%@ include file="/common/pageControl.jsp"%>
		</div>
			</div>
			</form>
			<div>
			  <span style="color: red">*</span>&nbsp;${backDate }之数据
			</div>
			<p align="right" style="font-weight:bolder;">编号：IT-RPT-37</p>
</body>
</html>