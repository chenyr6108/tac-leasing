<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
	
	<title>平均TR表</title>
		<script type="text/javascript">
			$(function (){
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
		<form id="addform" name="addform" action="../servlet/defaultDispatcher" method="post">
			<input type="hidden" name="__action" value="avgTrCommand.getReportForTable">
			<div style="margin:1%;">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;平均TR表</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			<div class="zc_grid_body jqgrowleft">
	  		<div class="ui-state-default ui-jqgrid-hdiv ">
	  			<table class="grid_table">
					<tr>
						<th style="width: 10%;">年份：</th>
						<th style="width: 10%;">
							<select id="year" name="year" style="width: 100px; height: 22px;">
							</select>
						</th>
						<th style="width: 10%;">业务类别：</th>
						<th style="width: 10%;">
							<select id="busi_type" name="busi_type" style="width: 100px; height: 22px;">
								<option value="" <c:if test="${empty busi_type}">selected="selected"</c:if>>全部</option>
								<option value="1" <c:if test="${busi_type eq '1' }">selected="selected"</c:if>>设备</option>
								<option value="2" <c:if test="${busi_type eq '2' }">selected="selected"</c:if>>商用车</option>
								<option value="3" <c:if test="${busi_type eq '3' }">selected="selected"</c:if>>乘用车</option>
							</select>
						</th>
						<th style="width: 10%;">类型：</th>
						<th style="width: 10%;">
							<select id="code_type" name="code_type" style="width: 100px; height: 22px;">
								<option value="1" <c:if test="${code_type eq '1' }">selected="selected"</c:if>>拨款日</option>
								<option value="2" <c:if test="${code_type eq '2' }">selected="selected"</c:if>>生成日</option>
								<option value="3" <c:if test="${code_type eq '3' }">selected="selected"</c:if>>核准日</option>
							</select>
						</th>
						<th style="width: 80%;"><input type="submit" value="查询" style="width: 80px; height: 25px;"/></th>
					</tr>
				</table>
	  			<table class="grid_table">
	  				<tr>
	  					<th style="width: 9%">
	  						&nbsp;
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
	  					<th style="width: 7%">小计</th>
	  				</tr>
	  				<c:forEach items="${dataSets }" var="r" varStatus="i">
	  					<tr>
	  						<td>${r.title }&nbsp;</td>
	  						<td>${r.yData[0] }&nbsp;</td>
	  						<td>${r.yData[1] }&nbsp;</td>
	  						<td>${r.yData[2] }&nbsp;</td>
	  						<td>${r.yData[3] }&nbsp;</td>
	  						<td>${r.yData[4] }&nbsp;</td>
	  						<td>${r.yData[5] }&nbsp;</td>
	  						<td>${r.yData[6] }&nbsp;</td>
	  						<td>${r.yData[7] }&nbsp;</td>
	  						<td>${r.yData[8] }&nbsp;</td>
	  						<td>${r.yData[9] }&nbsp;</td>
	  						<td>${r.yData[10] }&nbsp;</td>
	  						<td>${r.yData[11] }&nbsp;</td>
	  						<td>${r.yData[12] }&nbsp;</td>
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
	<p align="right" style="font-weight:bolder;">编号：IT-RPT-8</p>
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
