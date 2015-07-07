<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript" src="${ctx }/ichartJs/js/lineBasic.js"></script>
<html>
<head>
<script>
		//查询
		function doQuery() {
			$("#form").submit();
		}
		//图表
		 $(function(){
			showLine();
			
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
			    
			    var day=d.getDay();  
			    
			    document.getElementById("clock").innerHTML='<font color="#FF0000">*</font>'+d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate()+" "+hour+":"+min+":"+sec+"之数据";
		}); 
		//图表
		function showLine(){
			 var chk_value =[];   
			  $('input[name="ids"]:checked').each(function(){   
			   chk_value.push($(this).val()); 
			  });  
			  var date =$("#date").val();
			$.ajax({
				type:'post',
				url:'../servlet/defaultDispatcher',
				data:'__action=avgPayMoneyReportCommand.queryIchart&chk_value='+chk_value+'&DATE=' + date,
				dataType:'json',
				success:function(ichartList) {
					var labels = ["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"];
					//封装参数
					var val = [{
			         			title : '各区平均单价图', //主标题
			         			childTitle:"平均单价:", //折点显示小标题
			         			yIsFormat:true ,  //y轴是否格式化 000,00
			         			tipIsFormat:true   //显示小框是否格式化 000,00
			         			}]
		        	 		   ;
					//(div名,数据源,x轴)
					lineBasic('canvasDiv',ichartList,labels,val);
				}
			});
		}
</script>
</head>
<body>
	<form action="../servlet/defaultDispatcher" name="form" id="form"
		method="post">
		<input type="hidden" name="__action" id="__action"
			value="avgPayMoneyReportCommand.query">
		<div
			class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
			style="height:30px;">
			<span class="ui-jqgrid-title"
				style="line-height:30px;font-size:15px;">&nbsp;&nbsp;各区平均单价图表(单位:RMB)</span>
		</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		<table width="80%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
			<tr>
				<td width="8">&nbsp;</td>
				<td width="60" class="ss_o"></td>
				<td width="40%" class="ss_t">
					<table style="margin-left: 10px;">
						<tr>
							<td colspan="5">&nbsp;时间：<select name="DATE" id="date">
							<c:forEach var="item" items="${dateList }">
								<option value="${item }" <c:if test="${DATE eq item }">selected="selected"</c:if>>
									${item }
								</option>
							</c:forEach>
							</select>&nbsp;
							</td>
						</tr>
					</table></td>
				<td width="55" class="ss_th" valign="top">&nbsp;</td>
				<td width="20%"><a href="#" name="search" id="search"
					onclick="doQuery();" class="blue_button">搜 索</a>
				</td>
			</tr>
		</table>
		办事处：
			<INPUT TYPE="checkbox" NAME="ids" id="ids${dept.DECP_ID}" value="true" onclick="showLine()" checked="checked" >全区
	  <%@ include file="../ichartJs/ichartDept.jsp"%>
		<div id="canvasDiv"></div>
		<br><br><br>
		<div class="ui-state-default ui-jqgrid-hdiv" style="background:#FFFFFF;">
		<table cellspacing="0" cellpadding="0" border="0">
			<tr>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:30px;">序号</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:100px;">办事处</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:100px;">1月</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:100px;">2月</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:100px;">3月</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:100px;">4月</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:100px;">5月</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:100px;">6月</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:100px;">7月</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:100px;">8月</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:100px;">9月</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:100px;">10月</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:100px;">11月</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:100px;">12月</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:100px;">全年</th>
			</tr>
			<c:forEach items="${resultList}" var="item" varStatus="status">
				<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${status.count }</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.deptName }</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;"><fmt:formatNumber value="${item.avgMoney_1}" type="currency" pattern="#,###"/></td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;"><fmt:formatNumber value="${item.avgMoney_2}" type="currency" pattern="#,###"/></td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;"><fmt:formatNumber value="${item.avgMoney_3}" type="currency" pattern="#,###"/></td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;"><fmt:formatNumber value="${item.avgMoney_4}" type="currency" pattern="#,###"/></td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;"><fmt:formatNumber value="${item.avgMoney_5}" type="currency" pattern="#,###"/></td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;"><fmt:formatNumber value="${item.avgMoney_6}" type="currency" pattern="#,###"/></td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;"><fmt:formatNumber value="${item.avgMoney_7}" type="currency" pattern="#,###"/></td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;"><fmt:formatNumber value="${item.avgMoney_8}" type="currency" pattern="#,###"/></td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;"><fmt:formatNumber value="${item.avgMoney_9}" type="currency" pattern="#,###"/></td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;"><fmt:formatNumber value="${item.avgMoney_10}" type="currency" pattern="#,###"/></td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;"><fmt:formatNumber value="${item.avgMoney_11}" type="currency" pattern="#,###"/></td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;"><fmt:formatNumber value="${item.avgMoney_12}" type="currency" pattern="#,###"/></td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
					<c:forEach items="${avgYearList}" var="yearAvg"><c:if test="${item.deptId eq yearAvg.deptId}"><fmt:formatNumber value="${yearAvg.payMoney}" type="currency" pattern="#,###"/></c:if></c:forEach>
					</td>
				<tr>
			</c:forEach>
				<tr>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;" colspan="2">全区</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right;"><fmt:formatNumber value="${avgTotal.avgMoney_1}" type="currency" pattern="#,###"/></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right;"><fmt:formatNumber value="${avgTotal.avgMoney_2}" type="currency" pattern="#,###"/></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right;"><fmt:formatNumber value="${avgTotal.avgMoney_3}" type="currency" pattern="#,###"/></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right;"><fmt:formatNumber value="${avgTotal.avgMoney_4}" type="currency" pattern="#,###"/></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right;"><fmt:formatNumber value="${avgTotal.avgMoney_5}" type="currency" pattern="#,###"/></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right;"><fmt:formatNumber value="${avgTotal.avgMoney_6}" type="currency" pattern="#,###"/></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right;"><fmt:formatNumber value="${avgTotal.avgMoney_7}" type="currency" pattern="#,###"/></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right;"><fmt:formatNumber value="${avgTotal.avgMoney_8}" type="currency" pattern="#,###"/></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right;"><fmt:formatNumber value="${avgTotal.avgMoney_9}" type="currency" pattern="#,###"/></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right;"><fmt:formatNumber value="${avgTotal.avgMoney_10}" type="currency" pattern="#,###"/></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right;"><fmt:formatNumber value="${avgTotal.avgMoney_11}" type="currency" pattern="#,###"/></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right;"><fmt:formatNumber value="${avgTotal.avgMoney_12}" type="currency" pattern="#,###"/></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right;"><fmt:formatNumber value="${avgYear.payMoney}" type="currency" pattern="#,###"/></td>
				</tr>
		</table>
		</div>
		<span id="clock"></span>
		</div>
	</form>
	<c:if test="${showButtonFlag==true }">
		<br>
		<font style="color:#FF0000;">*</font>${currentYear }年${currentMonth }月${currentDay }日止全区平均单件金额为<fmt:formatNumber value="${avgMoneyTotal }" type="currency" pattern="#,###"/>元(${currentMonth }月总拨款件数${currentEquCount }件;总额<fmt:formatNumber value="${currentEquMoney }" type="currency" pattern="#,###"/>元.重车拨款件数${currentMotorCount }件;拨款金额<fmt:formatNumber value="${currentMotorMoney }" type="currency" pattern="#,###"/>元)
		<br>
		</c:if>
		<font style="color:#FF0000;">*</font>平均单价计算不含企金委贷
		<p align="right" style="font-weight:bolder;">编号：IT-RPT-6</p>
</body>
</html>