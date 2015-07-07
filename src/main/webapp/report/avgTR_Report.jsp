<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
	
	<title>平均TR图</title>
		<script type="text/javascript">
			$(function (){
				compileOptions();
				var now = new Date();
				var currentYear = now.getFullYear();
				for(var i = 2010; i <= currentYear; i ++){
					var o = new Option(i, i);
					if (i == currentYear) {
						o.selected = true;
					}
					$("#yyyy").get(0).add(o);
				}
			});
			
			function compileOptions(){
				$("th[id^='option_']").hide();
				var year = $("#year").val();
				if($.trim(year) == ""){
					return;
				}
				var y = year.split(",");
				var decp = $("#decp").val();
				var d = decp.split(",");
				for(i = 0; i < y.length; i++){
					$("#option_" + (i + 1)).html(d[i] + y[i] + "年" + "&nbsp;&nbsp;&nbsp;&nbsp;" + 
						"<img style='cursor: pointer;' onclick='deleteOption(\"" + y[i] + "\", \"" + d[i] + "\");' src='${ctx }/images/u103.gif' />");
					$("#option_" + (i + 1)).show();
				}
			}
			
			function deleteOption(y, d){
				var year = $("#year").val();
				var decp = $("#decp").val();
				if (year.indexOf(y + ",") != -1) {
					year = year.replace(y + ",", "");
					decp = decp.replace(d + ",", "");
					$("#year").val(year);
					$("#decp").val(decp);
				} else if (year.indexOf("," + y) != -1) {
					year = year.replace("," + y, "");
					decp = decp.replace("," + d, "");
					$("#year").val(year);
					$("#decp").val(decp);
				} else {
					$("#year").val("");
					$("#decp").val("");
				}
				compileOptions();
			}
			
			function addOption(){
				var yyyy = $("#yyyy").val();
				var dddd = $("#dddd").val();
				var year = $("#year").val();
				var decp = $("#decp").val();
				if(year.split(",").length == 5){
					alert("最多只能显示5条曲线！");
					return;
				}
				if($.trim(year) == ""){
					$("#year").val(yyyy);
					$("#decp").val(dddd);
				} else {
					year += "," + yyyy;
					decp += "," + dddd;
					$("#year").val(year);
					$("#decp").val(decp);
				}
				compileOptions();
			}
		</script>
	</head>
	<body >
		<form id="addform" name="addform" action="../servlet/defaultDispatcher" method="post">
			<input type="hidden" name="__action" value="avgTrCommand.getReport">
			<input type="hidden" name="year" id="year" value="${year }">
			<input type="hidden" name="decp" id="decp" value="${decp }">
			<div style="margin:1%;">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;平均TR图</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			<div class="zc_grid_body jqgrowleft">
	  		<div class="ui-state-default ui-jqgrid-hdiv ">
	  			<table class="grid_table">
					<tr>
						<th style="width: 10%;">年份：</th>
						<th style="width: 10%;">
							<select id="yyyy" style="width: 100px; height: 22px;">
							</select>
						</th>
						<th style="width: 10%;">办事处：</th>
						<th style="width: 10%;">
							<select id="dddd" style="width: 100px; height: 22px;">
								<option value="全公司">全公司</option>
								<c:forEach items="${office }" var="s">
									<option value="${s.display_name }">${s.display_name }</option>
								</c:forEach>
							</select>
						</th>
						<th style="width: 60%;"><input type="button" value="添加" onclick="addOption();" class="panel_button"/></th>
					</tr>
				</table>
				<table class="grid_table">
					<tr>
						<th style="width: 15%;" id="option_1">&nbsp;</th>
						<th style="width: 15%;" id="option_2">&nbsp;</th>
						<th style="width: 15%;" id="option_3">&nbsp;</th>
						<th style="width: 15%;" id="option_4">&nbsp;</th>
						<th style="width: 15%;" id="option_5">&nbsp;</th>
						<th style="width: 25%;">&nbsp;<input type="submit" value="生成图表" class="panel_button"> </th>
					</tr>
				</table>
	  			<div align="center">
					<chart:chartTag chartResult="${chartResult }"/>
				</div>
	  			<table class="grid_table">
	  				<tr>
	  					<th style="width: 16%">
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
	  				</tr>
	  				<c:forEach items="${chartInfo.chartDataList }" var="r" varStatus="i">
	  					<tr>
	  						<td>${r.title }平均TR</td>
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
	<p align="right" style="font-weight:bolder;">编号：IT-RPT-7</p>
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
