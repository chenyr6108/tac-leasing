<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.text.NumberFormat" %>
<html>
<head>
		<script type="text/javascript">
			function doQuery() {
				var year = $("#s_year").val();
				var month = $("#s_month").val();
				if(month!="" && year==""){
					alert("请选择年份！");
					return;
				}
				
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
			});
		</script>
</head>
<body>
<form id="form" name="form" action="../servlet/defaultDispatcher" method="post">
		<input type="hidden" name="__action" value="achievementCaseCommand.getAchievementCaseReport">
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" style="width: ${size*250+400}px;">
			<div class="zc_grid_body jqgrowleft" style="width: 600px;">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px;width: ${size*250+395}px;">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;专案办事处业绩统计表</span>
		   	</div>
	          	<table width="${size*250+400}px" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      	<td width="8">&nbsp;</td>
				        <td width="40" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="center">
				          <table>
							<tr>
								<td>年份：</td>
								<td><select name="year" id="s_year"><option value="" 	<c:if test="${empty year }">selected="selected"</c:if>>-请选择-</option><c:forEach items="${yearList}" var="item"><option value="${item }" <c:if test="${item==year }">selected="selected"</c:if>>${item }</option></c:forEach></select></td>
						  		<td>月份：</td>
						  		<td>
						  			<select name="month" id="s_month">
						  				<option value="" 	<c:if test="${empty month }">selected="selected"</c:if>>-请选择-</option>
							  			<option value="1" 	<c:if test="${month==1 }">selected="selected"</c:if>>1</option>
							  			<option value="2" 	<c:if test="${month==2 }">selected="selected"</c:if>>2</option>
							  			<option value="3" 	<c:if test="${month==3 }">selected="selected"</c:if>>3</option>
							  			<option value="4" 	<c:if test="${month==4 }">selected="selected"</c:if>>4</option>
							  			<option value="5" 	<c:if test="${month==5 }">selected="selected"</c:if>>5</option>
							  			<option value="6" 	<c:if test="${month==6 }">selected="selected"</c:if>>6</option>
							  			<option value="7" 	<c:if test="${month==7 }">selected="selected"</c:if>>7</option>
							  			<option value="8" 	<c:if test="${month==8 }">selected="selected"</c:if>>8</option>
							  			<option value="9" 	<c:if test="${month==9 }">selected="selected"</c:if>>9</option>
							  			<option value="10" 	<c:if test="${month==10 }">selected="selected"</c:if>>10</option>
							  			<option value="11" 	<c:if test="${month==11 }">selected="selected"</c:if>>11</option>
							  			<option value="12" 	<c:if test="${month==12 }">selected="selected"</c:if>>12</option>
						  			</select>						  		
						  		</td>
						  		<td>专案：</td>
						  		<td>
						  			<select name="code">
						  				<option value="null" 	<c:if test="${'null'eq code}">selected="selected"</c:if>>-请选择-</option>
						  				<c:forEach var="item" items="${codeList }">
						  				<option value="${item.CREDIT_SPECIAL_CODE }" 	<c:if test="${item.CREDIT_SPECIAL_CODE eq code }">selected="selected"</c:if>>${item.CREDIT_SPECIAL_NAME }</option>
						  				</c:forEach>
						  			</select>
						  		</td>
						  	</tr>
						  </table>
			            </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" onclick="doQuery();" class="blue_button">搜 索</a></td>
				      </tr>
			    </table>
				<table class="grid_table" style="width: ${size*250+400}px;">
					<tr class="ui-state-default zc_grid_head">
						<td>&nbsp;</td>
						<td colspan="2" style="text-align: center;">合計</td>
						<c:forEach items="${codeList}" var="item">
							<c:if test="${'null'eq code || item.CREDIT_SPECIAL_CODE eq code}">
								<td colspan="2" style="text-align: center;">${item.CREDIT_SPECIAL_NAME}</td>
							</c:if>		
						</c:forEach>
					</tr>
					<tr class="ui-state-default zc_grid_head">
						<td style="text-align: center;">办事处</td>
						<td style="text-align: center;">件数</td>
						<td style="text-align: center;">业绩总额</td>
						<c:forEach items="${codeList}" var="item">
							<c:if test="${'null'eq code || item.CREDIT_SPECIAL_CODE eq code}">
							<td style="text-align: center;">件数</td>
							<td style="text-align: center;">业绩总额</td>
							</c:if>	
						</c:forEach>
					</tr>
					<%
						NumberFormat nf = NumberFormat.getCurrencyInstance() ;
						nf.setMaximumFractionDigits(2);
						nf.setMinimumFractionDigits(2);
						List<Map> results=  (List<Map>)request.getAttribute("resultList");
						List<Map> codes = (List<Map>)request.getAttribute("codeList");
						String credit_special_code =  (String)request.getAttribute("code");
						for(Map result:results)	{
					%>
						<tr>
							<td style="text-align: center;"><%= result.get("decp_name") %></td>
							<td style="text-align: right;"><%= result.get("pay_count") %>&nbsp;</td>
							<td style="text-align: right;"><%= nf.format(result.get("pay_money"))%></td>
							<%
								for(Map code:codes){
									if(!"null".equals(credit_special_code) && !credit_special_code.equals(code.get("CREDIT_SPECIAL_CODE"))){
										continue;
									}
									String key  = (String)code.get("CREDIT_SPECIAL_CODE");
							%>
							<td style="text-align: right;"><%=result.get(key+"_pay_count")!=null?result.get(key+"_pay_count"):"-" %>&nbsp;</td>
							<td style="text-align: right;"><%=result.get(key+"_pay_money")!=null?nf.format(result.get(key+"_pay_money")):"-"  %></td>
							<%
								}
							%>
						</tr>
					<%
						}
					%>
				</table>
		<span id="clock"></span>
		</div>
		</form>
		<br>
		<p align="right" style="font-weight:bolder;">编号：IT-RPT-38</p>
</body>
</html>